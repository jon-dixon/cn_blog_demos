create or replace PACKAGE BODY CN_MSGRAPH_REST_PLUGIN_PK AS

-- Inspect the Response to see how many records were returned.
-- Also check to see if the @odata.nextLink attribute exists.
--  This indicates if there are more records to fetch.
PROCEDURE response_info
  (p_response   IN CLOB,
   x_more_rows OUT NOCOPY VARCHAR2,
   x_row_count OUT NOCOPY PLS_INTEGER) IS

  l_json_obj       JSON_OBJECT_T;
  lt_rows          JSON_ARRAY_T;

BEGIN
  l_json_obj  := JSON_OBJECT_T.PARSE(p_response);
  lt_rows     := l_json_obj.get_Array('value');
  x_row_count := lt_rows.get_size;
  IF l_json_obj.has('@odata.nextLink') THEN
    x_more_rows := 'Y';
  ELSE
    x_more_rows := 'N';
  END IF;
END response_info;

--==============================================================================
-- REST Source Capabilities Procedure
--
-- This procedure tells APEX whether the Plug-In (and the REST API) supports
-- pagination (large result sets come as multiple pages), server-side filtering
-- and server-side ordering. 
--
-- The procedure implementation simply sets the "filtering", "pagination" or
-- "order_by" members of the apex_plugin.t_web_source_capabilities record type
-- to either true or false.
--
--==============================================================================
PROCEDURE capabilities_calendar
 (p_plugin  in            apex_plugin.t_plugin,
  p_result  in out nocopy apex_plugin.t_web_source_capabilities) IS
BEGIN
    p_result.filtering  := false;
    p_result.pagination := true;
    p_result.order_by   := false;
END capabilities_calendar;

--==============================================================================
-- REST Source Discovery Procedure
-- This procedure is called by APEX during the REST Data Source creation, when 
-- the "Discover" button is clicked. This procedure can:
-- * return structured information about the columns, data types and 
--   JSON or XML selectors
-- * return a JSON example which APEX then will sample to derive columns and
--   data types
--==============================================================================
PROCEDURE discover_calendar
 (p_plugin         in            wwv_flow_plugin_api.t_plugin,
  p_web_source     in            wwv_flow_plugin_api.t_web_source,
  p_params         in            wwv_flow_plugin_api.t_web_source_discover_params,
  p_result         in out nocopy wwv_flow_plugin_api.t_web_source_discover_result) IS

  l_web_source_operation          apex_plugin.t_web_source_operation;
  l_dummy_parameters              apex_plugin.t_web_source_parameters;
  l_in_parameters                 apex_plugin.t_web_source_parameters;
  l_time_budget                   number;
  l_param_idx                     pls_integer := 0;

BEGIN

  --
  -- discovery is based on the "fetch rows" operation of a REST Data Source; this is typically
  -- a GET operation. This gets all meta data on the REST Operation as an instance of APEX_PLUGIN.T_WEB_SOURCE_OPERATION.
  -- The P_PERFORM_INIT parameter determines whether APEX should compute the URL and initialize all 
  -- HTTP Headers and parameters with their default values. The "l_web_source_operation" represents
  -- all attributes of the HTTP operation to be made.
  -- 
  l_web_source_operation := apex_plugin_util.get_web_source_operation(
      p_web_source   => p_web_source,
      p_db_operation => apex_plugin.c_db_operation_fetch_rows,
      p_perform_init => true);

  -- This section copies the parameters, which we receive from the Create REST data source
  -- wizard, to the "l_in_parameters" array. These parameters are setup for the new REST source.
  FOR i IN 1 .. l_web_source_operation.parameters.count LOOP
    l_param_idx := l_param_idx + 1;
    l_in_parameters(l_param_idx) := l_web_source_operation.parameters(i);
  END LOOP;

  -- Add the $select MS Graph API Parameter to the REST Source Definition when created using this plugin.
  l_param_idx := l_param_idx + 1;
  l_in_parameters(l_param_idx).name       := '$select';
  l_in_parameters(l_param_idx).param_type := wwv_flow_plugin_api.c_web_src_param_query;
  l_in_parameters(l_param_idx).direction  := wwv_flow_plugin_api.c_direction_in;
  l_in_parameters(l_param_idx).value      := 'id,subject,showAs,isOnlineMeeting,body,start,end,location';

  -- This section fetches a sample payload from the REST API.
  -- I am using the same $select parametyers as abive to fetch specific fields from the MS Graph API during discovery.
  -- This will result in these fields being used in the REST Source Data Profile.
  l_web_source_operation.query_string := '$select' || '=' || sys.utl_url.escape('id,subject,showAs,isOnlineMeeting,body,start,end,location');

  -- Call the MS Graph API to get the Discovery Sample JSON.
  BEGIN
    apex_plugin_util.make_rest_request
     (p_web_source_operation => l_web_source_operation,
      p_bypass_cache         => false,
      p_time_budget          => l_time_budget,
      p_response             => p_result.sample_response,
      p_response_parameters  => l_dummy_parameters);
  EXCEPTION WHEN OTHERS THEN
    apex_debug.error('XX Error [%1], [%s]', SQLERRM, apex_web_service.g_status_code);
    RAISE;
  END;

  -- set the response headers received by the REST API for display in the Discovery Results screen
  p_result.response_headers := apex_web_service.g_headers;
  -- Set the 'Fixed Page Size' property. In this case we are going to fetch 100 rows per page. 
  p_result.fixed_page_size  := GC_CALENDAR_FIXED_PAGE_SIZE;
  -- Computed Parameters to pass back to APEX
  p_result.parameters := l_in_parameters;

END discover_calendar;

--==============================================================================
-- REST Source Fetch Procedure
-- This procedure does the actual "Fetch" operation when rows are being 
-- requested from the REST Data Source. When an APEX component is about to
-- render, APEX computes the first row and the amount of rows required. This
-- and all dynamic filter and order by information is passed to the 
-- procedure as the "p_params" parameter. 
--==============================================================================
PROCEDURE fetch_calendar
 (p_plugin     in            apex_plugin.t_plugin,
  p_web_source in            apex_plugin.t_web_source,
  p_params     in            apex_plugin.t_web_source_fetch_params,
  p_result     in out nocopy apex_plugin.t_web_source_fetch_result) IS

  l_web_source_operation apex_plugin.t_web_source_operation;
  l_time_budget          number;
  c_page_size            pls_integer := COALESCE(p_params.fixed_page_size, GC_CALENDAR_FIXED_PAGE_SIZE);
  c_dflt_time_budget     constant number := 45;  -- 45 Seconds to fetch all pages.
  l_query_string         varchar2(32767);
  l_skip                 pls_integer;
  l_more_rows            varchar2(1);
  l_row_count            pls_integer;
  l_total_row_count      pls_integer := 0;
  l_iteration            pls_integer := 0;
  l_fetch_all_rows       VARCHAR2(1);

BEGIN

  -- Convert the fetch_all_rows to a Boolean to Y/N so we can show it in the debug message.
  IF p_params.fetch_all_rows THEN
    l_fetch_all_rows := 'Y';
  ELSE
    l_fetch_all_rows := 'N';
  END IF;

  -- Get the details of the operation being called [URL, Query String, Method, Timeout, etc.]
  l_web_source_operation := apex_plugin_util.get_web_source_operation
                             (p_web_source   => p_web_source,
                              p_db_operation => apex_plugin.c_db_operation_fetch_rows,
                              p_perform_init => true);

  -- Initialize a table of CLOBS that will be returned to APEX.
  p_result.responses := apex_t_clob();

  -- Save the query string passed in by the APEX component.
  l_query_string := l_web_source_operation.query_string;

  -- Set the Max Time in Seconds to allow for Fetch All
  l_time_budget := COALESCE(l_web_source_operation.fetch_all_rows_timeout, c_dflt_time_budget);
  apex_debug.info('XX **START** fetch_all [%0] first_row [%1] max_rows [%2] fixed_page_size [%3] timeout [%4] time_budget[%5]', 
                   l_fetch_all_rows, p_params.first_row, p_params.max_rows, p_params.fixed_page_size, l_web_source_operation.timeout, l_time_budget);

  -- Set initial rows to skip value, used for $skip MS Graph Parameter.
  -- This is the first row calculated by APEX minus 1.
  l_skip := p_params.first_row -1;

  -- Loop a maximum of 20 times to guard against an infinite loop.
  FOR l_iteration IN 1..20 LOOP
    -- Calculate the value for the $skip MS Graph Parameter for this iteration.
    l_skip := l_skip + CASE l_iteration
                WHEN  1 THEN 0
                ELSE (l_iteration * c_page_size)
              END;

    -- Add an empty CLOB to the array of CLOBs. This will hold the MS Graph API response for this iteration/page.
    p_result.responses.extend(1);

    -- Build the query string by using the values passed by APEX, and append
    --  the calculated $skip and $top parameters for this iteration/page.
    l_web_source_operation.query_string := l_query_string || '$skip=' || l_skip || 
                                           chr(38) || '$top=' || c_page_size;
    apex_debug.info('  XX [%0] l_skip [%1] c_page_size [%2]', l_iteration, l_skip, c_page_size);

    -- Call the MS Graph API passing in the calculated parameters.
    apex_plugin_util.make_rest_request
     (p_web_source_operation => l_web_source_operation,
      p_bypass_cache         => false,
      p_time_budget          => l_time_budget,
      p_response             => p_result.responses(l_iteration),
      p_response_parameters  => p_result.out_parameters);

    -- Inspect the response. Get the number of rows returned from MS Graph and check if there are more rows.
    response_info
      (p_response  => p_result.responses(l_iteration),
       x_more_rows => l_more_rows,
       x_row_count => l_row_count);
    l_total_row_count := l_total_row_count + l_row_count;
    apex_debug.info('  XX more_rows [%0] row_count [%1] total_rows [%2] time_budget [%3]', l_more_rows, l_row_count, l_total_row_count, l_time_budget);

    -- Check to see if we need to stop iterating/paging.
    IF NOT p_params.fetch_all_rows THEN
      EXIT;
    END IF;
    IF p_params.fetch_all_rows AND l_more_rows = 'N' THEN
      EXIT;
    END IF;
  END LOOP;

  -- Let APEX know how many rows were fetched and whether there are more to fetch.
  IF p_params.fetch_all_rows THEN
      -- if APEX requested (and our logic fetched) all rows, then there are no more rows to fetch
      p_result.has_more_rows := false;
      -- the JSON responses contains the total amount of rows
      p_result.response_row_count  := l_total_row_count;
      -- the first row is 1
      p_result.response_first_row  := 1;
  ELSE
    -- APEX did _not_ request all rows, so there might be another page.
    IF l_more_rows = 'Y' then
      p_result.has_more_rows := true;
    ELSE
      p_result.has_more_rows := false;
    END IF;
    p_result.response_row_count := l_total_row_count;
    -- The first row in the JSON response depends on the input parameter from APEX.
    p_result.response_first_row := p_params.first_row;
  END IF;
END fetch_calendar;

END CN_MSGRAPH_REST_PLUGIN_PK;
/
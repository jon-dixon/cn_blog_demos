SET DEFINE OFF;
CREATE OR REPLACE PACKAGE BODY ARCS_UTL_PK AS

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE upload_file
 (p_base_url  IN VARCHAR2,
  p_file_name IN VARCHAR2,
  p_file_path IN VARCHAR2,
  p_file_blob IN BLOB) IS

  l_response_clob    CLOB;
  l_complete_url     VARCHAR2(500);
  lc_interop_path    CONSTANT VARCHAR2(100) := 'interop/rest/11.1.2.3.600/applicationsnapshots/';
  l_status           NUMBER;
  l_details          VARCHAR2(1000);

BEGIN

  -- Set the HTTP Headers for uploading a binary file.
  apex_web_service.g_request_headers.DELETE;
  apex_web_service.g_request_headers(1).NAME := 'Content-Type';
  apex_web_service.g_request_headers(1).VALUE := 'application/octet-stream';
  
  -- Build complete URL to REST Service including parameter to set file path. URL Encode the filename.  
  l_complete_url := p_base_url || lc_interop_path || 
                    apex_util.url_encode(p_url => p_file_name) || '/contents'||
                    CASE WHEN p_file_path IS NULL THEN NULL ELSE '?extDirPath='||p_file_path END;

  -- Call REST Service to Delete the File.
  l_response_clob := apex_web_service.make_rest_request
    (p_url                  => l_complete_url,
     p_http_method          => 'POST',
     p_transfer_timeout     => GC_REST_TIMEOUT_SECS,
     p_body_blob            => p_file_blob,
     p_credential_static_id => GC_APEX_WEB_CREDENTIAL_ARCS);

  IF apex_web_service.g_status_code = 200 THEN
    -- Check the status field in the JSON response.
    apex_json.parse(l_response_clob);
    l_status  := apex_json.get_number(p_path => 'status');
    IF l_status <> 0 THEN
      l_details := apex_json.get_varchar2(p_path => 'details');
      raise_application_error(-20001, 'Failed to Upload File ['||l_details||']');
    END IF;
  ELSE
    raise_application_error(-20002, 'Error from Upload File API ['||apex_web_service.g_status_code||']');
  END IF;

END upload_file;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE delete_file
 (p_base_url  IN VARCHAR2,
  p_file_name IN VARCHAR2,
  p_file_path IN VARCHAR2) IS

  l_payload_json     CLOB;
  l_response_clob    CLOB;
  l_complete_url     VARCHAR2(500);
  lc_interop_path    CONSTANT VARCHAR2(100) := 'interop/rest/v3/files/delete';
  l_status           NUMBER;
  l_details          VARCHAR2(1000);

BEGIN

  -- Set the HTTP Headers for uploading a binary file.
  apex_web_service.g_request_headers.DELETE;
  apex_web_service.g_request_headers(1).NAME := 'Content-Type';
  apex_web_service.g_request_headers(1).VALUE := 'application/json';
  
  -- Build complete URL to REST API.  
  l_complete_url := p_base_url || lc_interop_path;
  apex_debug.info('XX Delete API URL [%s]', l_complete_url);
  
  -- Build JSON Payload
  l_payload_json := '{' || 
                    '"fileName": '|| apex_json.stringify(p_file_path||'/'||p_file_name)||
                    '}';
  apex_debug.info('XX JSON Payload [%s]', l_payload_json);

  -- Call the REST API to Delete the File.
  l_response_clob := apex_web_service.make_rest_request
    (p_url                  => l_complete_url,
     p_http_method          => 'POST',
     p_transfer_timeout     => GC_REST_TIMEOUT_SECS,
     p_body                 => l_payload_json,
     p_credential_static_id => GC_APEX_WEB_CREDENTIAL_ARCS);

  apex_debug.info('XX HTTP Response [%s], Payload [%s]', apex_web_service.g_status_code, l_response_clob);

  IF apex_web_service.g_status_code = 200 THEN
    -- Check the status field in the JSON response.
    apex_json.parse(l_response_clob);
    l_status  := apex_json.get_number(p_path => 'status');
    IF l_status <> 0 THEN
      l_details := apex_json.get_varchar2(p_path => 'details');
      apex_debug.error('XX API Status [%s], Details [%s]', apex_json.get_number(p_path => 'status'), l_details);
      raise_application_error(-20001, 'Failed to Delete File ['||l_details||']');
    END IF;
  ELSE
    apex_debug.error('XX HTTP Error [%s], Payload [%s]', apex_web_service.g_status_code, l_response_clob);
    raise_application_error(-20002, 'Error from Delete File API ['||apex_web_service.g_status_code||']' || l_response_clob);
  END IF;

END delete_file;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE start_job
 (p_base_url        IN VARCHAR2,
  p_job_name        IN VARCHAR2,
  p_params_json     IN VARCHAR2,
  x_job_status_url OUT NOCOPY VARCHAR2) IS

  l_complete_url     VARCHAR2(500);
  lc_job_path        CONSTANT VARCHAR2(100) := 'arm/rest/v1/jobs';
  l_payload_json     VARCHAR2(4000);
  l_response_clob    CLOB;
  l_response_obj     JSON_OBJECT_T;
  l_links_array      JSON_ARRAY_T;

BEGIN

  -- Set the HTTP Headers.
  apex_web_service.clear_request_headers;
  apex_web_service.g_request_headers(1).NAME  := 'Content-Type';
  apex_web_service.g_request_headers(1).VALUE := 'application/json';
  
  -- Build complete URL to the jobs REST API. 
  l_complete_url := p_base_url || lc_job_path;
  apex_debug.info('XX Complete URL [%s]', l_complete_url);
  
  -- Build the complete JSON Payload, including the passed in parameters object.
  l_payload_json := '{' || 
                    ' "jobName": '|| apex_json.stringify(p_job_name) || ',' ||
                    ' "parameters": '|| p_params_json ||
                    '}';
  apex_debug.info('XX Payload JSON [%s]', l_payload_json);

  -- Call REST API to Start the ESS Job.
  l_response_clob := apex_web_service.make_rest_request
    (p_url                  => l_complete_url,
     p_http_method          => 'POST',
     p_transfer_timeout     => GC_REST_TIMEOUT_SECS,
     p_body                 => l_payload_json,
     p_credential_static_id => GC_APEX_WEB_CREDENTIAL_ARCS);
  apex_debug.info('XX g_status_code: [%s]', apex_web_service.g_status_code);
  apex_debug.info('XX Response: [%s]', l_response_clob);

  IF apex_web_service.g_status_code = 200 THEN
    -- Parse the JSON Response.
    l_response_obj := json_object_t.parse(l_response_clob);

    -- Get the status.
    IF l_response_obj.get_number('status') <> -1 THEN
      apex_debug.error('XX Job Completed in Error: [%s]', l_response_obj.get_number('status'), l_response_obj.get_string('details'));
      raise_application_error(-20001, 'Job Completed in Error ['||l_response_obj.get_string('details')||']');
    END IF;

    -- Build an array of from the 'links' array in the response.
    l_links_array := l_response_obj.get_Array('links');
    -- Loop through the array to get the URL to the job status API.
    FOR i IN 0..l_links_array.get_size -1 LOOP
      IF JSON_OBJECT_T(l_links_array.get(i)).get_string('rel') = 'self' THEN
        x_job_status_url := JSON_OBJECT_T(l_links_array.get(i)).get_string('href');
      END IF;
    END LOOP;

    IF x_job_status_url IS NOT NULL THEN
      apex_debug.info('XX Success, URL: [%s]', x_job_status_url);
    ELSE
      -- Could not find a 'self' link in the 'links' array.
      apex_debug.error('XX Link to Job Status API not found');
      raise_application_error(-20002, 'Failed to Start Job (link not found)');
    END IF;

  ELSE
    apex_debug.error('XX HTTP Status Error [%s]', apex_web_service.g_status_code);
    raise_application_error(-20003, 'HTTP Error from jobs API ['||apex_web_service.g_status_code||']');
  END IF;

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('XX Unhandled Error [%s]', SQLERRM);
  RAISE;
END start_job;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE job_status
 (p_job_status_url      IN VARCHAR2,
  x_job_complete       OUT NOCOPY VARCHAR2,
  x_job_status_code    OUT NOCOPY NUMBER,
  x_job_status_details OUT NOCOPY VARCHAR2) IS

  l_response_clob    CLOB;
  l_response_obj     JSON_OBJECT_T;

BEGIN

  -- Set the HTTP Headers.
  apex_web_service.clear_request_headers;
  apex_web_service.g_request_headers(1).NAME  := 'Content-Type';
  apex_web_service.g_request_headers(1).VALUE := 'application/json';
  

  -- Call REST API to Start the ESS Job.
  l_response_clob := apex_web_service.make_rest_request
    (p_url                  => p_job_status_url,
     p_http_method          => 'GET',
     p_transfer_timeout     => GC_REST_TIMEOUT_SECS,
     p_credential_static_id => GC_APEX_WEB_CREDENTIAL_ARCS);
  apex_debug.info('XX [%s] - g_status_code: [%s]', utl_call_stack.subprogram(1)(2), apex_web_service.g_status_code);
  apex_debug.info('XX [%s] - Response: [%s]', utl_call_stack.subprogram(1)(2), l_response_clob);

  IF apex_web_service.g_status_code = 200 THEN
    -- Parse the JSON Response and Return the Status Code and Details.
    l_response_obj       := json_object_t.parse(l_response_clob);
    x_job_status_code    := l_response_obj.get_number('status');
    x_job_status_details := l_response_obj.get_string('details');
    IF x_job_status_code = -1 AND x_job_status_details = 'Job Still Running..' THEN 
      x_job_complete := 'N';
    ELSE
      x_job_complete := 'Y';
    END IF;
    apex_debug.info('XX [%s] - Job Complete [%], Status Code: [%s], Details [%s]', utl_call_stack.subprogram(1)(2), x_job_complete,  x_job_status_code, x_job_status_details);

  ELSE
    apex_debug.error('XX [%s] - HTTP Status Error [%s]', utl_call_stack.subprogram(1)(2), apex_web_service.g_status_code);
    raise_application_error(-20003, 'HTTP Error from jobs API ['||apex_web_service.g_status_code||']');
  END IF;

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('XX [%s] - Unhandled Error [%s]', utl_call_stack.subprogram(1)(2), SQLERRM);
  RAISE;
END job_status;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE run_csv_report
  (p_base_url    IN VARCHAR2,
   p_group_name  IN VARCHAR2,
   p_report_name IN VARCHAR2,
   p_params_json IN VARCHAR2,
   p_module      IN VARCHAR2,
   p_run_async   IN BOOLEAN,
   x_file_url   OUT NOCOPY VARCHAR2,
   x_status_rec OUT NOCOPY status_rec) IS

  l_report_file_name     VARCHAR2(500);
  l_complete_url         VARCHAR2(500);
  l_payload              CLOB;
  l_response_clob        CLOB;
  l_response_obj         JSON_OBJECT_T;
  l_links_array          JSON_ARRAY_T;

BEGIN

  -- Build the complete file name of the CSV that will be generated on the ARCS 
  --  file system, and make sure it is unique.
  l_report_file_name := LOWER(REPLACE(p_report_name,' ','_')) || '_' || TO_CHAR(SYSDATE,'YYYYMMDD_HH24MISS') || '.csv';

  -- Build the payload for the Run Custom Report REST API.
  l_payload := '{' ||
        '"groupName":'                || apex_json.stringify(p_group_name) ||
        ',"reportName":'              || apex_json.stringify(p_report_name) ||
        ',"generatedReportFileName":' || apex_json.stringify(l_report_file_name) ||
        ',"format":'                  || '"CSV"' ||
        ',"module":'                  || apex_json.stringify(p_module) ||
        ',"runAsync":'                || apex_json.stringify(p_run_async);

  -- Append the parameters JSON object if provided.
  IF p_params_json IS NOT NULL THEN
    l_payload := l_payload || ',"parameters":'||p_params_json;
  END IF;
  l_payload := l_payload || '}';
  
  -- Set the HTTP Headers for the REST API Call.
  apex_web_service.g_request_headers.DELETE;
  apex_web_service.g_request_headers(1).NAME := 'Content-Type';
  apex_web_service.g_request_headers(1).VALUE := 'application/json';
  
  -- Build complete URL to REST Service.  
  l_complete_url := p_base_url || 'arm/rest/fcmapi/v1/report';
  apex_debug.info('XX [%s] - URL [%s], Payload [%s]', utl_call_stack.subprogram(1)(2),l_complete_url,l_payload);

  -- Call REST Service to run the custom Report.
  l_response_clob := apex_web_service.make_rest_request
    (p_url                  => l_complete_url,
     p_http_method          => 'POST',
     p_transfer_timeout     => GC_REST_TIMEOUT_SECS,
     p_body                 => l_payload,
     p_credential_static_id => GC_APEX_WEB_CREDENTIAL_ARCS);
  apex_debug.info('XX [%s] - REST API Response Code [%s], Body [%s]', utl_call_stack.subprogram(1)(2),apex_web_service.g_status_code,l_response_clob);

  IF apex_web_service.g_status_code = 200 THEN

    -- Parse the JSON Response.
    l_response_obj := json_object_t.parse(l_response_clob);

    -- Get the status returned from the REST API.
    IF l_response_obj.get_number('status') <> 0 THEN
      apex_debug.error('XX Job Completed in Error: [%s]', l_response_obj.get_number('status'), l_response_obj.get_string('details'));
      raise_application_error(-20001, 'Job Completed in Error ['||l_response_obj.get_string('details')||']');
    END IF;

    -- Build a JSON array object from the 'links' array in the JSON response.
    l_links_array := l_response_obj.get_Array('links');
    -- Loop through the array to get the URL to the job status API.
    FOR i IN 0..l_links_array.get_size -1 LOOP
      IF JSON_OBJECT_T(l_links_array.get(i)).get_string('rel') = 'report-content' THEN
        x_file_url := JSON_OBJECT_T(l_links_array.get(i)).get_string('href');
      END IF;
    END LOOP;

    -- Make sure we found the URL for the report-content
    IF x_file_url IS NULL THEN
      x_status_rec.status_code := 'E';
      x_status_rec.status_msg  := 'REST Service Did not return report content link. Status ['||apex_web_service.g_status_code||']'||
                                  ', Response [' || l_response_clob ||']';
      apex_debug.error('XX [%s] - [%s]', utl_call_stack.subprogram(1)(2), x_status_rec.status_msg);
    END IF;
  ELSE
    -- We received a response other than 200 from the REST API
    x_status_rec.status_code := 'E';
    x_status_rec.status_msg  := 'REST Service Call Failed. Status ['||apex_web_service.g_status_code||']'||
                                ', Response [' || l_response_clob ||']';
    apex_debug.error('XX [%s] - [%s]', utl_call_stack.subprogram(1)(2), x_status_rec.status_msg);
  END IF;

  apex_debug.info('XX [%s] - Complete', utl_call_stack.subprogram(1)(2));
  
EXCEPTION WHEN OTHERS THEN
  x_status_rec.status_code := 'E';
  x_status_rec.status_msg  := 'Unhandled Error ['||SQLERRM||']';
  apex_debug.error('XX [%s] - Unhandled Error [%s]', utl_call_stack.subprogram(1)(2), SQLERRM);
  RAISE;
END run_csv_report;

END ARCS_UTL_PK;
/
SHOW ERR;
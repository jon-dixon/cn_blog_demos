SET DEFINE OFF;
CREATE OR REPLACE PACKAGE BODY CNDEMO_TEAMS_BOT_PK AS
-------------------------------------------------------------------------------
-- NAME        : CNDEMO_TEAMS_BOT_PK
-- FILE NAME   : CNDEMO_TEAMS_BOT_PKB.sql
-- REVISION    : $2022.1.0$
-- PURPOSE     : Package containing code for the MS Teams Outbound Webhook Demo.
--
-- DELIVERED BY: $jdixon$
--               
-- Revision History:
-- VER        DATE         AUTHOR           DESCRIPTION
-- ========   ===========  ================ =======================================
-- 2022.1.0   10-JUL-2022  jdixon           Created.
-------------------------------------------------------------------------------

  GC_SCOPE_PREFIX  CONSTANT VARCHAR2(100) := 'demo.'||LOWER($$plsql_unit) || '.';

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
PROCEDURE call_elocation
  (x_elocation_rec IN OUT NOCOPY elocation_rec,
   x_status_rec    OUT status_rec) IS

  CURSOR cr_xml (cp_xml IN XMLTYPE) IS
    SELECT  xt.*
    FROM    XMLTABLE('/geocode_response/geocode'
              PASSING cp_xml
              COLUMNS 
                address_id          NUMBER         PATH '@id',
                longitude           NUMBER         PATH './match[1]/@longitude[1]',
                latitude            NUMBER         PATH './match[1]/@latitude[1]',
                error_message       VARCHAR2(20)   PATH './match[1]/@error_message[1]',
                name                VARCHAR2(100)  PATH './match[1]/output_address/@name[1]',
                builtup_area        VARCHAR2(100)  PATH './match[1]/output_address/@builtup_area[1]',
                order1_area         VARCHAR2(100)  PATH './match[1]/output_address/@order1_area[1]'
              ) xt
    FETCH FIRST 1 ROW ONLY;

  l_logger_scope        logger_logs.SCOPE%TYPE := GC_SCOPE_PREFIX || utl_call_stack.subprogram(1)(2);
  l_logger_params       logger.tab_param;
  l_payload_xml         VARCHAR2(32000);
  l_response_clob       CLOB;
  l_response_xml        XMLTYPE;
  http_request_failed   exception;
  pragma exception_init (http_request_failed, -29273); 

BEGIN

  -- Finalize urlencoded Payload.
  l_payload_xml := 'xml_request='||REPLACE(GC_XML_REQUEST,'#CITY#',APEX_UTIL.URL_ENCODE(x_elocation_rec.city_in));
  l_payload_xml := REPLACE(l_payload_xml,'#STATE#', APEX_UTIL.URL_ENCODE(x_elocation_rec.state_in));
  l_payload_xml := l_payload_xml || chr(38) || 'format=XML';

  -- Set the HTTP Headers.
  apex_web_service.g_request_headers.DELETE;
  apex_web_service.g_request_headers(1).NAME := 'Content-Type';
  apex_web_service.g_request_headers(1).VALUE := 'application/x-www-form-urlencoded';
 
  -- Call the eLocation Web Service.
  BEGIN
    l_response_clob := apex_web_service.make_rest_request
      (p_url              => GC_ELOCATION_URL,
       p_http_method      => 'POST',
       p_transfer_timeout => GC_ADDR_WS_TIMEOUT_SECS,
       p_body             => l_payload_xml);
  EXCEPTION WHEN http_request_failed THEN
    logger.append_param(l_logger_params, 'payload_xml', l_payload_xml);
    logger.append_param(l_logger_params, 'response', l_response_clob);
    logger.log_error('eLocation Web Service Call Timed out', l_logger_scope, NULL, l_logger_params);
    x_status_rec.status_code := 'E';
    x_status_rec.status_msg  := GC_ERR_ELOCATION;
    RETURN;
  END;

  -- Check if the call was sucessful.
  IF apex_web_service.g_status_code != 200 THEN
    logger.append_param(l_logger_params, 'payload_xml', l_payload_xml);
    logger.append_param(l_logger_params, 'response_code', apex_web_service.g_status_code);
    logger.append_param(l_logger_params, 'response', l_response_clob);
    logger.log_error('Error from eLocation Web Service', l_logger_scope, NULL, l_logger_params);
    x_status_rec.status_code := 'E';
    x_status_rec.status_msg  := GC_ERR_ELOCATION;
    RETURN;
  END IF;

  -- If we got this far then all is OK. Parse the response into an XML object.
  l_response_xml := XMLTYPE(l_response_clob);

  -- Fetch the first record from the response and assign fields to the outbound PL/SQL record.
  FOR r_xml IN cr_xml (cp_xml => l_response_xml) LOOP
    -- Get the Latitude and Longitude of the First Record.
    x_elocation_rec.latitude    := r_xml.latitude;
    x_elocation_rec.longitude   := r_xml.longitude;
    x_elocation_rec.found_city  := r_xml.builtup_area;
    x_elocation_rec.found_state := r_xml.order1_area;
    x_elocation_rec.extra_info  := r_xml.error_message;
  END LOOP;

  -- If we didn't get a longitude and latitude then return an error.
  IF x_elocation_rec.latitude IS NULL THEN
    logger.append_param(l_logger_params, 'payload_xml', l_payload_xml);
    logger.append_param(l_logger_params, 'xml_response', l_response_clob);
    logger.log_error('No eLocation Records Returned', l_logger_scope, NULL, l_logger_params);
    x_status_rec.status_code := 'E';
    x_status_rec.status_msg  := GC_ERR_ELOCATION;
    RETURN;
  END IF;

  logger.log('End', l_logger_scope, NULL, l_logger_params);

EXCEPTION WHEN OTHERS THEN
  logger.append_param(l_logger_params, 'response_xml', SUBSTR(l_response_clob,1,1000));
  logger.log_error('Unhandled Error ('||SQLERRM||')', l_logger_scope, NULL, l_logger_params);
  x_status_rec.status_code := 'E';
  x_status_rec.status_msg  := GC_ERR_ELOCATION;
END call_elocation;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE parse_teams_msg
  (x_teams_msg_rec IN OUT NOCOPY teams_msg_rec,
   x_status_rec       OUT status_rec) IS

  l_logger_scope        logger_logs.SCOPE%TYPE := GC_SCOPE_PREFIX || utl_call_stack.subprogram(1)(2);
  l_logger_params       logger.tab_param;
  l_items_object        JSON_OBJECT_T;
  l_clean_text          VARCHAR2(32767);
  lt_city_state         apex_t_varchar2;

BEGIN

  -- Parse the JSON CLOB sent by MS Teams.
  l_items_object := JSON_OBJECT_T.PARSE(x_teams_msg_rec.json_payload);
  -- Assign fields to the outbound PL/SQL record.
  x_teams_msg_rec.type               := l_items_object.get_String('type');
  x_teams_msg_rec.channel_id         := l_items_object.get_String('channelId');
  x_teams_msg_rec.text_format        := l_items_object.get_String('textFormat');
  x_teams_msg_rec.text               := l_items_object.get_String('text');
  x_teams_msg_rec.from_id            := l_items_object.get_Object('from').get_String('id');
  x_teams_msg_rec.from_name          := l_items_object.get_Object('from').get_String('name');
  x_teams_msg_rec.from_aad_object_id := l_items_object.get_Object('from').get_String('aadObjectId');
  x_teams_msg_rec.tenant_id          := l_items_object.get_Object('channelData').get_Object('tenant').get_String('id');
  x_teams_msg_rec.teams_channel_id   := l_items_object.get_Object('channelData').get_String('teamsChannelId');
  x_teams_msg_rec.teams_team_id      := l_items_object.get_Object('channelData').get_String('teamsTeamId');

  -- Do some basic cleanup of the tect entered by the user in the Teams message.
  IF x_teams_msg_rec.text_format = 'plain' THEN
    x_teams_msg_rec.text := REPLACE(x_teams_msg_rec.text, GC_BOT_NAME_RAW, NULL);
    x_teams_msg_rec.text := REPLACE(x_teams_msg_rec.text, '&nbsp;', NULL);
    x_teams_msg_rec.text := TRIM(x_teams_msg_rec.text);
    x_teams_msg_rec.text := TRIM(x_teams_msg_rec.text);
  END IF;
  logger.append_param(l_logger_params, 'clean_text', x_teams_msg_rec.text);

  -- Split City and State into two distinct fields.
  lt_city_state := apex_string.split(p_str => x_teams_msg_rec.text, p_sep => ',');
  -- Check that we get two records.
  IF lt_city_state.COUNT() = 2 THEN
    x_teams_msg_rec.city  := TRIM(lt_city_state(1));
    x_teams_msg_rec.state := TRIM(lt_city_state(2));
    logger.append_param(l_logger_params, 'city', x_teams_msg_rec.city);
    logger.append_param(l_logger_params, 'state', x_teams_msg_rec.state);
  ELSE
    -- If we did not get two records then return an error.
    x_status_rec.status_code := 'E';
    x_status_rec.status_msg  := GC_ERR_INVALID_CITY_STATE;
    RETURN;
  END IF;

  logger.log('End', l_logger_scope, NULL, l_logger_params);
  
EXCEPTION WHEN OTHERS THEN
  logger.log_error('Unhandled Error ['||SQLERRM||']', l_logger_scope, NULL, l_logger_params);
  x_status_rec.status_code := 'E';
  x_status_rec.status_code := GC_ERR_PARSE_TEAMS_JSON;
END parse_teams_msg;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE get_weather_forcast
  (x_weather_rec  IN OUT NOCOPY weather_rec,
   x_status_rec      OUT status_rec) IS

  CURSOR cr_get_forecast_url (cp_json IN CLOB) IS
    SELECT jt.*
    FROM   JSON_TABLE(cp_json, '$.properties'
             COLUMNS (forecast_utl VARCHAR2(500) PATH  '$.forecast')) jt; 

  l_logger_scope        logger_logs.SCOPE%TYPE := GC_SCOPE_PREFIX || utl_call_stack.subprogram(1)(2);
  l_logger_params       logger.tab_param;
  l_points_url          VARCHAR2(1000);
  l_points_json         CLOB;
  l_forecast_url        VARCHAR2(1000);
  http_request_failed   exception;
  pragma exception_init (http_request_failed, -29273); 

BEGIN

  -- Set HTTP Headers. The weather.gov API requires you send a User-Agent to identify yourself.
  apex_web_service.g_request_headers.DELETE;
  apex_web_service.g_request_headers(1).name  := 'User-Agent';
  apex_web_service.g_request_headers(1).value := GC_WEATHER_API_USER_AGENT;

  -- Build the URL to get the weather station co-ordinates.
  l_points_url := GC_POINTS_URL || x_weather_rec.latitude||','||x_weather_rec.longitude;
  logger.append_param(l_logger_params, 'points_url', l_points_url);
  -- Get JSON with details of Weather Station and the URL to get the Forecast.
  BEGIN
    l_points_json := apex_web_service.make_rest_request
      (p_url              => l_points_url,
       p_http_method      => 'GET',
       p_transfer_timeout => GC_WEATHER_TIMEOUT_SECS);
  EXCEPTION WHEN http_request_failed THEN
    logger.append_param(l_logger_params, 'points_response', l_points_json);
    logger.log_error('Weather Points Web Service Call Timed out', l_logger_scope, NULL, l_logger_params);
    x_status_rec.status_code := 'E';
    x_status_rec.status_msg  := GC_ERR_WEATHER;
    RETURN;
  END;

  -- Check if the call was sucessful.
  IF apex_web_service.g_status_code != 200 THEN
    logger.append_param(l_logger_params, 'response_code', apex_web_service.g_status_code);
    logger.append_param(l_logger_params, 'points_json_response', l_points_json);
    logger.log_error('Error from Weather Points API', l_logger_scope, NULL, l_logger_params);
    x_status_rec.status_code := 'E';
    x_status_rec.status_msg  := GC_ERR_WEATHER;
    RETURN;
  END IF;

  -- Get the weather forecast URL from the JSON response.
  OPEN  cr_get_forecast_url (cp_json => l_points_json);
  FETCH cr_get_forecast_url INTO l_forecast_url;
  CLOSE cr_get_forecast_url;
  logger.append_param(l_logger_params, 'forecast_url', l_forecast_url);

  -- Call API to get the weather forecast for the location.
  BEGIN
    x_weather_rec.forecast_json := apex_web_service.make_rest_request
      (p_url              => l_forecast_url,
       p_http_method      => 'GET',
       p_transfer_timeout => GC_WEATHER_TIMEOUT_SECS);
  EXCEPTION WHEN http_request_failed THEN
    logger.append_param(l_logger_params, 'forecast_response', x_weather_rec.forecast_json);
    logger.log_error('Weather Forecast Web Service Call Timed out', l_logger_scope, NULL, l_logger_params);
    x_status_rec.status_code := 'E';
    x_status_rec.status_msg  := GC_ERR_WEATHER;
    RETURN;
  END;

  -- Check if the call was sucessful.
  IF apex_web_service.g_status_code != 200 THEN
    logger.append_param(l_logger_params, 'response_code', apex_web_service.g_status_code);
    logger.append_param(l_logger_params, 'forecast_json', x_weather_rec.forecast_json);
    logger.log_error('Error from Weather Forecast API', l_logger_scope, NULL, l_logger_params);
    x_status_rec.status_code := 'E';
    x_status_rec.status_msg  := GC_ERR_WEATHER;
  END IF;
  
  logger.log('End', l_logger_scope, NULL, l_logger_params);
  
EXCEPTION WHEN OTHERS THEN
  logger.log_error('Unhandled Error ['||SQLERRM||']', l_logger_scope, NULL, l_logger_params);
  x_status_rec.status_code := 'E';
  x_status_rec.status_code := GC_ERR_WEATHER;
END get_weather_forcast;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
FUNCTION verify_authorization
  (p_payload       IN VARCHAR2,
   p_provided_hmac IN VARCHAR2) RETURN BOOLEAN IS

  l_raw_mac          RAW (2000);
  l_calculated_hmac  VARCHAR2(32000);
  l_provided_hmac    VARCHAR2(250);

BEGIN

  -- The Header Value is like this: HMAC NLvfAHhW9MqjHAZyNz/mGi1wRzZweo7FHHO0OsGSGh0=
  -- We need to strip the 'HMAC ' from this to get the HMAC value only.
  l_provided_hmac := REPLACE(p_provided_hmac, 'HMAC ', NULL);

  -- Generate a HMAC256 encoded String using the JSON Payload from Teams (p_payload)
  --   and the 'Security Key' generated when we created the Outbound Webhook in Teams (GC_TEAM_SECURITY_TOKEN)
  l_raw_mac := dbms_crypto.mac
    (src => UTL_I18N.STRING_TO_RAW (p_payload, 'UTF8'),
     typ => DBMS_CRYPTO.HMAC_SH256, 
     key => UTL_ENCODE.base64_decode(UTL_I18N.STRING_TO_RAW(GC_TEAM_SECURITY_TOKEN, 'UTF8')));
  l_calculated_hmac := UTL_I18N.RAW_TO_CHAR(UTL_ENCODE.base64_encode(l_raw_mac), 'UTF8');
  
  -- Compare the HMAC generated above to the HMAC provided in the Header.
  IF l_provided_hmac = l_calculated_hmac THEN
    RETURN TRUE;
  ELSE
    RETURN FALSE;
  END IF;

END verify_authorization;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE teams_weather
 (p_request        IN CLOB, 
  p_provided_hmac  IN VARCHAR2,
  x_status        OUT NUMBER) IS

  CURSOR cr_forecast (cp_json IN CLOB) IS
    SELECT jt.*
    FROM   JSON_TABLE(cp_json, '$.properties.periods[*]'
             COLUMNS 
              (line_number        NUMBER          PATH  '$.number',
               name               VARCHAR2(100)   PATH  '$.name',
               temperature        NUMBER          PATH  '$.temperature',
               temp_unit          VARCHAR2(25)    PATH  '$.temperatureUnit',
               wind_speed         VARCHAR2(25)    PATH  '$.windSpeed',
               wind_direction     VARCHAR2(25)    PATH  '$.windDirection',
               icon_url           VARCHAR2(100)   PATH  '$.icon',
               short_forecast     VARCHAR2(25)    PATH  '$.shortForecast',
               detailed_forecast  VARCHAR2(250)   PATH  '$.detailedForecast'
              )) jt
    WHERE line_number = 1;

  l_logger_scope        logger_logs.SCOPE%TYPE := GC_SCOPE_PREFIX || utl_call_stack.subprogram(1)(2);
  l_logger_params       logger.tab_param;
  lr_teams_msg_rec      teams_msg_rec;
  lr_elocation_rec      elocation_rec;
  lr_weather_rec        weather_rec;
  l_response_json       CLOB;
  lr_status_rec         status_rec;
  
BEGIN

  -- Set the HTTP Response Code. Assume Success (201)
  x_status := 201;

  logger.log('Start', l_logger_scope, NULL, l_logger_params);
  
  -- Call Function to compare HMAC passed in from Teams to a Calculated HMAC
  -- Note: Remove this check when testing from Postman.
  IF NOT verify_authorization (p_payload => p_request, p_provided_hmac => p_provided_hmac) THEN
    x_status := 401;
    logger.append_param(l_logger_params, 'Payload', p_request);
    logger.append_param(l_logger_params, 'Authorization Header HMAC', p_provided_hmac);
    logger.log_error('Un-Authorized Call to Webhook', l_logger_scope, NULL, l_logger_params);
    RETURN;
  END IF;
     
  -- Parse and Validate the JSON from Teams.
  lr_teams_msg_rec.json_payload := p_request;
  parse_teams_msg (x_teams_msg_rec => lr_teams_msg_rec, x_status_rec => lr_status_rec);

  -- Use Oracle eLocation to Geocode the City, State and Return Latitude and Longitude.
  IF lr_status_rec.status_code = 'S' THEN
    lr_elocation_rec.city_in  := lr_teams_msg_rec.city;
    lr_elocation_rec.state_in := lr_teams_msg_rec.state;
    call_elocation (x_elocation_rec => lr_elocation_rec, x_status_rec => lr_status_rec);
  END IF;

  -- Get JSON containing the Weather Forecast at the Location.
  IF lr_status_rec.status_code = 'S' THEN
    lr_weather_rec.latitude  := lr_elocation_rec.latitude;
    lr_weather_rec.longitude := lr_elocation_rec.longitude;
    get_weather_forcast (x_weather_rec => lr_weather_rec, x_status_rec => lr_status_rec);
    l_logger_params.DELETE;
  END IF;
  
  -- Prepare Response JSON to create an Adaptive Card which will be displayed in Teams.
  apex_json.initialize_clob_output (p_indent => 0);
  apex_json.open_object; -- {
  apex_json.write('type', 'message');
  apex_json.open_array('attachments');  
  IF lr_status_rec.status_code = 'S' THEN
    -- Prepare Success Response with the Forecast and an Image.
    apex_json.open_object; -- {
    apex_json.write('contentType', 'application/vnd.microsoft.card.adaptive');
    apex_json.open_object (p_name => 'content'); -- {
    apex_json.write('type', 'AdaptiveCard');
    apex_json.write('version', '1.4');
    apex_json.open_array('body');  
    FOR r_fcst_rec IN cr_forecast (cp_json => lr_weather_rec.forecast_json) LOOP
      apex_json.open_object (p_name => NULL); -- {
      apex_json.write('type', 'TextBlock');
      apex_json.write('text', r_fcst_rec.name || '-'||r_fcst_rec.detailed_forecast);
      apex_json.write('wrap', true);
      apex_json.close_object; -- } content
      apex_json.open_object (p_name => NULL); -- {
      apex_json.write('type', 'Image');
      apex_json.write('url', r_fcst_rec.icon_url);
      apex_json.close_object; -- } content
    END LOOP;
    apex_json.close_array; -- ] body
    apex_json.close_object; -- } content
    apex_json.close_object; -- }
  ELSE
    -- Prepare an Error Response.
    apex_json.open_object; -- {
    apex_json.write('contentType', 'application/vnd.microsoft.card.adaptive');
    apex_json.open_object (p_name => 'content'); -- {
    apex_json.write('type', 'AdaptiveCard');
    apex_json.write('version', '1.4');    
    apex_json.open_array('body');  
      apex_json.open_object (p_name => NULL); -- {
      apex_json.write('type', 'TextBlock');
      apex_json.write('text', 'Error: '||lr_status_rec.status_msg);
      apex_json.close_object; -- } content
      apex_json.open_object (p_name => NULL); -- {
      apex_json.write('type', 'TextBlock');
      apex_json.write('text', 'You Entered: '||lr_teams_msg_rec.city||','||lr_teams_msg_rec.state);
      apex_json.close_object; -- } content
    apex_json.close_array; -- ] body
    apex_json.close_object; -- } content
    apex_json.close_object; -- }
  END IF;
  apex_json.close_array; -- ] attachments

  -- Close out JSON and return CLOB.  
  apex_json.close_object; -- }
  l_response_json := apex_json.get_clob_output;
  apex_json.free_output;

  -- Set Response Type and Emit the JSON,
  owa_util.mime_header ('application/json', true);
  apex_util.prn (p_clob => l_response_json, p_escape => FALSE);

  logger.log('End', l_logger_scope, NULL, l_logger_params);

EXCEPTION WHEN OTHERS THEN
  x_status := 400;
  logger.log_error('Unhandled Error[ '||SQLERRM||']', l_logger_scope, NULL, l_logger_params);
END teams_weather;

END CNDEMO_TEAMS_BOT_PK;
/
SHOW ERR;
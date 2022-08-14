SET DEFINE OFF;
CREATE OR REPLACE PACKAGE BODY CNDEMO_OCI_PRE_AUTH_REQUESTS_PK AS
-------------------------------------------------------------------------------
-- NAME        : CNDEMO_OCI_PRE_AUTH_REQUESTS_PK
-- FILE NAME   : CNDEMO_OCI_PRE_AUTH_REQUESTS_PKB.sql
-- REVISION    : $2022.1.0$
-- PURPOSE     : Package containing code for the OCI Pre-Authenticated Requests Demo.
--
-- DELIVERED BY: $jdixon$
--               
-- Revision History:
-- VER        DATE         AUTHOR           DESCRIPTION
-- ========   ===========  ================ =======================================
-- 2022.1.0   13-AUG-2022  jdixon           Created.
-----------------------------------------------------------------------------------

  GC_SCOPE_PREFIX  CONSTANT VARCHAR2(100) := 'demo.'||LOWER($$plsql_unit) || '.';

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION generate_pre_auth_request
 (p_expiration_unit   IN VARCHAR2,
  p_expiration_value  IN NUMBER,
  p_access_type       IN VARCHAR2,
  p_object_name       IN VARCHAR2 DEFAULT NULL,
  p_object_listing    IN VARCHAR2 DEFAULT 'Deny') RETURN VARCHAR2 IS

  l_logger_scope        logger_logs.SCOPE%TYPE := GC_SCOPE_PREFIX || utl_call_stack.subprogram(1)(2);
  l_logger_params       logger.tab_param;
  l_request_url         VARCHAR2(1000);
  l_request_json        CLOB;
  l_response_json       CLOB;
  l_response_obj        JSON_OBJECT_T;
  l_expires_ts_tz       TIMESTAMP WITH TIME ZONE;
  l_expires_str         VARCHAR2(100);
  l_par_name            VARCHAR2(100);

BEGIN

  -- Determine the expiration time for the PAR.
  l_expires_ts_tz := SYSTIMESTAMP AT TIME ZONE 'UTC' + NUMTODSINTERVAL(p_expiration_value, p_expiration_unit);
  l_expires_str   := TO_CHAR(l_expires_ts_tz,'yyyy-mm-dd"T"hh24:mi:ss"Z"');

  -- Build the name for the PAR.
  l_par_name := GC_PAR_NAME_PREFIX || p_access_type || '_' || l_expires_str;
  
  -- Build up the URL to call the OCI web service which will generate the PAR.
  l_request_url := GC_OCI_OBJECT_BASE_URL ||
                     '/n/' || GC_OCI_NAMESPACE || 
                     '/b/' || GC_OCI_BUCKET_NAME ||
                     '/p/';

  -- Build the Request Body for the call to the generate the PAR web service.
  l_request_json := '{' ||
                    '"accessType":'  || apex_json.stringify( p_access_type ) || ',' ||
                    '"name":'        || apex_json.stringify( l_par_name ) || ',' ||
                    CASE 
                      WHEN p_object_name IS NOT NULL THEN '"objectName":'  || apex_json.stringify( p_object_name ) || ','
                      ELSE NULL
                    END  ||
                    '"bucketListingAction":' || apex_json.stringify( p_object_listing ) || ',' ||
                    '"timeExpires":' || apex_json.stringify( l_expires_str ) || 
                    '}';
    
  -- Call Web Service.
  l_response_json := apex_web_service.make_rest_request
   (p_url                  => l_request_url,
    p_http_method          => 'POST',
    p_body                 => l_request_json,
    p_credential_static_id => GC_OCI_CRED_STATIC_ID);

  IF apex_web_service.g_status_code = 200 THEN
    -- Parse the JSON Response.
    l_response_obj := json_object_t.parse(l_response_json);
    -- Return the PAR URL e.g. https://objectstorage.us-ashburn-1.oraclecloud.com/p/vDWqlx78OJgBIHyMFAZfzQSszzxcozXeQq3jNMuoMHsyrL2QR5TZCvlKC_UEtlDJ/n/nueva/b/nueva_apps/o/
    logger.log('Success', l_logger_scope, NULL, l_logger_params);
    RETURN (GC_OCI_OBJECT_BASE_URL || l_response_obj.get_String('accessUri'));
  ELSE
    logger.append_param(l_logger_params, 'status_code', apex_web_service.g_status_code);
    logger.append_param(l_logger_params, 'request_url', l_request_url);
    logger.append_param(l_logger_params, 'response', l_response_json);
    logger.log_error('Error Generating PAR', l_logger_scope, NULL, l_logger_params);
    raise_application_error(-20111,'Unable to Create Preauthenticated Request.');
  END IF;

EXCEPTION WHEN OTHERS THEN
  logger.log_error('Error Generating PAR ['||SQLERRM||']', l_logger_scope, NULL, l_logger_params);
  RAISE;
END generate_pre_auth_request;

END CNDEMO_OCI_PRE_AUTH_REQUESTS_PK;
/
SHOW ERR;
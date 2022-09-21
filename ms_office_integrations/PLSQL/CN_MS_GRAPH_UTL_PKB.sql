SET DEFINE OFF;
CREATE OR REPLACE PACKAGE BODY "CN_MS_GRAPH_UTL_PK" AS
-------------------------------------------------------------------------------
-- NAME        : CN_MS_GRAPH_UTL_PK
-- FILE NAME   : CN_MS_GRAPH_UTL_PKS.sql
-- REVISION    : $1.0$
-- PURPOSE     : MS Graph Utilities.
-- DELIVERED BY: Cloud Nueva
--               $Author: <jdixon> $
--
-- REVISION HISTORY:
-- VER     DATE         AUTHOR        DESCRIPTION
-- ======  ===========  ============= =======================================
-- 22.1.0  21-SEP-2022  jdixon        Initial Version
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION option_value (p_option_code IN cn_ms_graph_opts.option_code%TYPE)
  RETURN cn_ms_graph_opts.option_value%TYPE IS
  l_option_value    cn_ms_graph_opts.option_value%TYPE;
BEGIN
  SELECT option_value INTO l_option_value
  FROM   cn_ms_graph_opts
  WHERE  option_code = p_option_code;
  RETURN l_option_value;
END option_value;
  
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION token_url RETURN VARCHAR2 IS
  l_tenant_id       cn_ms_graph_opts.option_value%TYPE;
  l_auth_token_url  cn_ms_graph_opts.option_value%TYPE;
BEGIN
  l_tenant_id := option_value (p_option_code => 'TENANT_ID');
  l_auth_token_url := option_value (p_option_code => 'AUTH_TOKEN_URL');
  RETURN REPLACE(l_auth_token_url, '#TENANTID#', l_tenant_id);
END token_url;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION sp_sites
  (p_filter IN VARCHAR2 DEFAULT NULL) RETURN tt_sp_sites PIPELINED IS

  CURSOR cr_sp_sites (cp_json IN CLOB) IS
    SELECT jt.*
    FROM   JSON_TABLE(cp_json, '$.value[*]'
             COLUMNS (name         VARCHAR2(100)  PATH '$.name',
                      display_name VARCHAR2(100)  PATH '$.displayName',
                      site_id      VARCHAR2(100)  PATH '$.sharepointIds.siteId',
                      site_url     VARCHAR2(500)  PATH '$.sharepointIds.siteUrl')) jt;

  l_response_clob     CLOB;
  l_row               PLS_INTEGER := 0;
  lt_parm_names       apex_application_global.VC_ARR2;
  lt_parm_values      apex_application_global.VC_ARR2;
  row_data            sp_site_rec;
  row_data_miss       sp_site_rec;

BEGIN

  apex_debug.info('sp_sites - p_filter [%s]', p_filter);

  -- Set HTTP Request Headers.
  apex_web_service.clear_request_headers;
  apex_web_service.set_request_headers
   (p_name_01   => 'Content-Type',
    p_value_01  => 'application/json',
    p_name_02   => 'Prefer',
    p_value_02  => GC_GRAPH_API_VER);

  -- Add $select parameter to fetch the minimum fields.
  lt_parm_names(1)  := '$select';
  lt_parm_values(1) := 'name,displayName,sharepointIds';
  
  -- Apply a filter if one was passed in.
  IF p_filter IS NOT NULL THEN
    lt_parm_names(2)  := '$filter';
    lt_parm_values(2) := p_filter;
  END IF;

  -- Call the SharePoint Sites Web Service.
  l_response_clob := apex_web_service.make_rest_request
    (p_url                  => GC_SP_SITES_URL,
     p_http_method          => 'GET',
     p_transfer_timeout     => GC_TIMEOUT_SECS,
     p_parm_name            => lt_parm_names,
     p_parm_value           => lt_parm_values,
     p_token_url            => token_url,
     p_credential_static_id => option_value (p_option_code => 'WEB_CREDENTIAL_STATIC_ID'));

  apex_debug.info('sp_sites - SP Sites HTTP Code [%s]', apex_web_service.g_status_code);

  IF apex_web_service.g_status_code = 200 THEN
    -- Parse the response and loop through rows emiting them from the pipelined function.
    FOR r_site IN cr_sp_sites (cp_json => l_response_clob) LOOP
      l_row := l_row + 1;
      BEGIN
        row_data              := row_data_miss;
        row_data.name         := r_site.name;
        row_data.display_name := r_site.display_name;
        row_data.site_id      := r_site.site_id;
        row_data.site_url     := r_site.site_url;
        pipe row(row_data);
      EXCEPTION WHEN OTHERS THEN
        row_data.status_code := 'W';
        row_data.status_msg  := SQLERRM||'Row:'|| l_row;
        pipe row(row_data);
      END;
    END LOOP;
  ELSIF apex_web_service.g_status_code = 404 THEN
    apex_debug.error('sp_sites - Not Found [%s]', l_response_clob);
    row_data.status_code := 'W'; 
    row_data.status_msg  := 'Not Found';
    pipe row(row_data);
  ELSE
    apex_debug.error('sp_sites - Error [%s]', l_response_clob);
    row_data.status_code := 'E'; 
    row_data.status_msg  := 'Response: '||SUBSTR(l_response_clob,1,450);
    pipe row(row_data);
  END IF;

EXCEPTION WHEN NO_DATA_NEEDED THEN 
  NULL;
WHEN OTHERS THEN
  apex_debug.error('sp_sites - Unhandled Error [%s]', SQLERRM);
  row_data.status_code := 'E'; 
  row_data.status_msg  := 'Error: '||SQLERRM;
  pipe row(row_data);
END sp_sites;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION sp_site_drive
  (p_sp_site_id IN VARCHAR2) RETURN tt_drives PIPELINED IS

  row_data            drive_rec;
  lt_parm_names       apex_application_global.VC_ARR2;
  lt_parm_values      apex_application_global.VC_ARR2;
  l_response_clob     CLOB;
  l_url               VARCHAR2(32000);
  l_json_obj          JSON_OBJECT_T;

BEGIN

  apex_debug.info('sp_site_drive - p_sp_site_id [%s]', p_sp_site_id);

  -- Set HTTP Request Headers.
  apex_web_service.clear_request_headers;
  apex_web_service.set_request_headers
   (p_name_01   => 'Content-Type',
    p_value_01  => 'application/json',
    p_name_02   => 'Prefer',
    p_value_02  => GC_GRAPH_API_VER);

  -- Add $select parameter to fetch the minimum fields.
  lt_parm_names(1)  := '$select';
  lt_parm_values(1) := 'id,driveType,name';

  l_url := GC_SP_SITES_URL || '/'||p_sp_site_id||'/drive';
  apex_debug.info('sp_site_drive - l_url [%s]', l_url);
  l_response_clob := apex_web_service.make_rest_request
    (p_url                  => l_url,
     p_http_method          => 'GET',
     p_transfer_timeout     => GC_TIMEOUT_SECS,
     p_parm_name            => lt_parm_names,
     p_parm_value           => lt_parm_values,
     p_token_url            => token_url,
     p_credential_static_id => option_value (p_option_code => 'WEB_CREDENTIAL_STATIC_ID'));

  apex_debug.info('sp_site_drive - SP Drive HTTP Code [%s]', apex_web_service.g_status_code);

  IF apex_web_service.g_status_code = 200 THEN
    l_json_obj := JSON_OBJECT_T.PARSE(l_response_clob);
    row_data.id         := l_json_obj.get_String('id');
    row_data.name       := l_json_obj.get_String('name');
    row_data.drive_type := l_json_obj.get_String('driveType');
  ELSE
    apex_debug.error('sp_site_drive SP Drive Respose Error [%s]', l_response_clob);
    row_data.status_code := 'E';
    row_data.status_msg  := 'REST Call Failed ['||apex_web_service.g_status_code||']';
  END IF;

  pipe row(row_data);

EXCEPTION WHEN NO_DATA_NEEDED THEN 
  NULL;
WHEN OTHERS THEN
  apex_debug.error('sp_site_drive - Unhandled Error [%s]', SQLERRM);
  RAISE;
END sp_site_drive;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION sp_folder_list
  (p_drive_id   IN VARCHAR2,
   p_full_path  IN VARCHAR2) RETURN tt_folder_list PIPELINED IS

  row_data         folder_list_rec;
  row_data_miss    folder_list_rec;
  lt_parm_names    apex_application_global.VC_ARR2;
  lt_parm_values   apex_application_global.VC_ARR2;
  l_response_clob  CLOB;
  l_count          PLS_INTEGER;
  l_url            VARCHAR2(32000);
  l_json_obj       JSON_OBJECT_T;
  lt_json_items    JSON_ARRAY_T;
  lr_json_rec      JSON_OBJECT_T;

BEGIN

  apex_debug.info('sp_folder_list - p_drive_id [%s] p_full_path [%s]', p_drive_id, p_full_path);

  -- Set HTTP Request Headers.
  apex_web_service.clear_request_headers;
  apex_web_service.set_request_headers
   (p_name_01   => 'Content-Type',
    p_value_01  => 'application/json',
    p_name_02   => 'Prefer',
    p_value_02  => GC_GRAPH_API_VER);
    
 -- Determine the Folder Path.
  IF p_full_path IS NULL THEN
    l_url := GC_SP_DRIVES_URL || '/' || p_drive_id || '/root/children';
  ELSE
    l_url := GC_SP_DRIVES_URL || '/' || p_drive_id || '/root:/' || 
             UTL_URL.escape(p_full_path) || ':/children';
  END IF;

  -- Call the REST Service.
  l_response_clob := apex_web_service.make_rest_request
    (p_url                  => l_url,
     p_http_method          => 'GET',
     p_transfer_timeout     => GC_TIMEOUT_SECS,
     p_parm_name            => lt_parm_names,
     p_parm_value           => lt_parm_values,
     p_token_url            => token_url,
     p_credential_static_id => option_value (p_option_code => 'WEB_CREDENTIAL_STATIC_ID'));

  apex_debug.info('sp_folder_list - Folder List HTTP Code [%s]', apex_web_service.g_status_code);

  IF apex_web_service.g_status_code = 200 THEN
    l_json_obj := JSON_OBJECT_T.PARSE(l_response_clob);
    lt_json_items := l_json_obj.get_Array('value');
    l_count       := lt_json_items.get_size;
    FOR i in 0 .. l_count - 1 LOOP
      BEGIN
        row_data                      := row_data_miss;
        lr_json_rec                   := JSON_OBJECT_T(lt_json_items.get(i));
        row_data.id                   := lr_json_rec.get_String('id');
        row_data.name                 := lr_json_rec.get_String('name');
        row_data.webUrl               := lr_json_rec.get_String('webUrl');
        row_data.size_bytes           := lr_json_rec.get_Number('size');
        IF lr_json_rec.get_Object('lastModifiedBy').has('user') THEN
          row_data.last_updated_by := lr_json_rec.get_Object('lastModifiedBy').get_Object('user').get_String('displayName');
        ELSE
          row_data.last_updated_by := lr_json_rec.get_Object('lastModifiedBy').get_Object('application').get_String('displayName');
        END IF;
        row_data.lastModifiedDateTime := lr_json_rec.get_Object('fileSystemInfo').get_Timestamp('lastModifiedDateTime');
        -- The folder object only exists if the object is a folder as opposed to a file.
        IF lr_json_rec.has('folder') THEN
          row_data.item_type        := 'FOLDER';
          row_data.fldr_child_count := lr_json_rec.get_Object('folder').get_Number('childCount');
        ELSE
          row_data.item_type      := 'FILE';
          row_data.file_mime_type := lr_json_rec.get_Object('file').get_String('mimeType');
        END IF;
        row_data.status_code := 'S';
        row_data.status_msg  := 'Row:'|| i || ' of ' || l_count;
        pipe row(row_data);
      EXCEPTION WHEN OTHERS THEN
        row_data.status_code := 'W';
        row_data.status_msg  := SQLERRM||'Row:'|| i || ' of ' || l_count;
        pipe row(row_data);
      END;
    END LOOP;
  ELSIF apex_web_service.g_status_code = 404 THEN
    apex_debug.error('sp_folder_list - Not Found [%s]', SUBSTR(l_response_clob,1,450));
    row_data.status_code := 'W'; 
    row_data.status_msg  := 'Folder Not Found';
    pipe row(row_data);
  ELSE
    apex_debug.error('sp_folder_list - Web Service Error [%s]', SUBSTR(l_response_clob,1,450));
    row_data.status_code := 'E'; 
    row_data.status_msg  := 'Response: '||SUBSTR(l_response_clob,1,450);
    pipe row(row_data);
  END IF;

EXCEPTION WHEN NO_DATA_NEEDED THEN
  NULL;
WHEN OTHERS THEN
  apex_debug.error('sp_folder_list - Unhandled Error [%s]', SQLERRM);
  row_data.status_code := 'E'; 
  row_data.status_msg  := 'Error: '||SQLERRM;
  pipe row(row_data);
END sp_folder_list;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION sp_get_file_by_id
  (p_drive_id IN VARCHAR2,
   p_item_id  IN VARCHAR2) RETURN BLOB IS

  l_file_blob      BLOB;
  lt_parm_names    apex_application_global.VC_ARR2;
  lt_parm_values   apex_application_global.VC_ARR2;
  l_url            VARCHAR2(32000);

BEGIN

  apex_debug.info('sp_get_file_by_id - p_drive_id [%s] p_item_id [%s]', p_drive_id, p_item_id);

  -- Set HTTP Request Headers.
  apex_web_service.clear_request_headers;
  apex_web_service.set_request_headers
   (p_name_01   => 'Content-Type',
    p_value_01  => 'application/json',
    p_name_02   => 'Prefer',
    p_value_02  => GC_GRAPH_API_VER);

  -- Build URL to get File Content.
  l_url := GC_SP_DRIVES_URL || '/' || p_drive_id || '/items/' || p_item_id || '/content';
  apex_debug.info('sp_get_file_by_id - l_url [%s]', l_url);

  -- Call the item content service to get the file content.
  l_file_blob := apex_web_service.make_rest_request_b
    (p_url                  => l_url,
     p_http_method          => 'GET',
     p_transfer_timeout     => GC_TIMEOUT_SECS,
     p_parm_name            => lt_parm_names,
     p_parm_value           => lt_parm_values,
     p_token_url            => token_url,
     p_credential_static_id => option_value (p_option_code => 'WEB_CREDENTIAL_STATIC_ID'));

  apex_debug.info('sp_get_file_by_id - Get File HTTP Code [%s]', apex_web_service.g_status_code);

  RETURN l_file_blob;

END sp_get_file_by_id;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
PROCEDURE download_file 
  (p_drive_id  IN VARCHAR2,
   p_item_id   IN VARCHAR2,
   p_file_name IN VARCHAR2,
   p_mime_type IN VARCHAR2) IS

  l_file_size      PLS_INTEGER;
  l_export         apex_data_export.t_export;

BEGIN

  apex_debug.info('download_file - p_drive_id [%s] p_item_id [%s], p_file_name [%s], p_mime_type [%s]', p_drive_id, p_item_id, p_file_name, p_mime_type);
  
  -- Get the file from SharePoint.
  l_export.content_blob := sp_get_file_by_id
    (p_drive_id => p_drive_id,
     p_item_id  => p_item_id);

  -- Make sure we got something.
  l_file_size := dbms_lob.getlength(l_export.content_blob);
  IF l_file_size > 0 THEN
    -- Download the File.
    l_export.file_name := p_file_name;
    l_export.mime_type := p_mime_type;
    apex_data_export.download( p_export => l_export );
  ELSE
    apex_debug.error('download_file - Unable to Download File');
    raise_application_error (-20000, 'Unable to Download File.');
  END IF;

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('download_file - Unhandled Error [%s]', SQLERRM);
  RAISE;
END download_file;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
PROCEDURE dl_email_attachment
  (p_user_id       IN VARCHAR2,
   p_email_id      IN VARCHAR2,
   p_attachment_id IN VARCHAR2,
   p_file_name     IN VARCHAR2,
   p_mime_type     IN VARCHAR2)  IS

  l_file_size      PLS_INTEGER;
  l_export         apex_data_export.t_export;
  l_url            VARCHAR2(4000);

BEGIN

  apex_debug.info('dl_email_attachment - p_user_id [%s] p_email_id [%s] p_attachment_id[%s]', p_user_id, p_email_id, p_attachment_id);

  -- Build URL with Parameters.
  l_url := option_value (p_option_code => 'EMAIL_ATTACHMENT_ENDPOINT');
  l_url := REPLACE(l_url, '#USER_ID#', p_user_id);
  l_url := REPLACE(l_url, '#MESSAGE_ID#', p_email_id);
  l_url := REPLACE(l_url, '#ATTACHMENT_ID#', p_attachment_id);
  apex_debug.info('dl_email_attachment - l_url [%s]', l_url);

  -- Set Headers
  apex_web_service.clear_request_headers;
  apex_web_service.set_request_headers
   (p_name_01   => 'Content-Type',
    p_value_01  => 'application/x-www-form-urlencoded');

  -- Call Web Service.
  l_export.content_blob := apex_web_service.make_rest_request_b
    (p_url                  => l_url,
     p_http_method          => 'GET',
     p_token_url            => token_url,
     p_credential_static_id => option_value (p_option_code => 'WEB_CREDENTIAL_STATIC_ID'));

  apex_debug.info('dl_email_attachment - Get Attachment HTTP Code [%s]', apex_web_service.g_status_code);

  IF apex_web_service.g_status_code = 200 THEN
    l_file_size := dbms_lob.getlength(l_export.content_blob);
    IF l_file_size > 0 THEN
      -- Download the File.
      l_export.file_name := p_file_name;
      l_export.mime_type := p_mime_type;
      apex_data_export.download( p_export => l_export );
    ELSE
      apex_debug.error('dl_email_attachment - Unable to Download File.');
      raise_application_error (-20000, 'Unable to Download File.');
    END IF;
  ELSE
    apex_debug.error('dl_email_attachment - Error Calling MS API to get File.');
    raise_application_error (-20001, 'Error Calling MS API to get File.');
  END IF;

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('dl_email_attachment - Unhandled Error [%s]', SQLERRM);
  RAISE;
END dl_email_attachment; 

END CN_MS_GRAPH_UTL_PK;
/
SHOW ERR;
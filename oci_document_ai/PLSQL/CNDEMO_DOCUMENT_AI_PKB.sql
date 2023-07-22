CREATE OR REPLACE PACKAGE BODY CNDEMO_DOCUMENT_AI_PK AS
-------------------------------------------------------------------------------
-- NAME        : CNDEMO_DOCUMENT_AI_PK
-- FILE NAME   : CNDEMO_DOCUMENT_AI_PKB.sql
-- REVISION    : $2022.1.0$
-- PURPOSE     : Package containing code for the OCI Document AI Demo.
--
-- DELIVERED BY: $jdixon$
--               
-- Revision History:
-- VER        DATE         AUTHOR           DESCRIPTION
-- ========   ===========  ================ ===================================
-- 2022.1.0   25-JUL-2022  jdixon           Created.
-- 2022.1.1   18-SEP-2022  jdixon           Removed Logger References.
-- 2023.1.1   07-JAN-2022  jdixon           Added JSON capture and Camera Capture.
-------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
FUNCTION get_file (p_request_url IN VARCHAR2) RETURN BLOB IS

  l_file_blob           BLOB;
  l_log_prfx            VARCHAR2(100) := utl_call_stack.subprogram(1)(2);

BEGIN

  -- Call OCI Web Service to get the requested file.
  l_file_blob := apex_web_service.make_rest_request_b
   (p_url                  => UTL_URL.ESCAPE(p_request_url),
    p_http_method          => 'GET',
    p_credential_static_id => GC_WC_CREDENTIAL_ID);

  IF apex_web_service.g_status_code != 200 then
    apex_debug.error('%s - Unable to Get File. [%s]', l_log_prfx, apex_web_service.g_status_code);
    raise_application_error(-20112,'Unable to Get File.');
  END IF;
  
  RETURN l_file_blob;
  
EXCEPTION WHEN OTHERS THEN
  apex_debug.error('%s - Unhandled Error [%s]', l_log_prfx, SQLERRM);
  RAISE;
END get_file;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE delete_file (p_request_url IN VARCHAR2) IS

  l_log_prfx            VARCHAR2(100) := utl_call_stack.subprogram(1)(2);
  l_response            CLOB;

BEGIN

  apex_debug.info('%s - Delete File [%s]', l_log_prfx, p_request_url);

  -- Call OCI Web Service to delete the file.
  l_response := apex_web_service.make_rest_request
   (p_url                  => UTL_URL.ESCAPE(p_request_url),
    p_http_method          => 'DELETE',
    p_credential_static_id => GC_WC_CREDENTIAL_ID);

  IF apex_web_service.g_status_code != 204 then
    apex_debug.error('%s - Unable to Delete File. [%s]', l_log_prfx, l_response);
    raise_application_error(-20112,'Unable to Delete File.');
  END IF;
  
EXCEPTION WHEN OTHERS THEN
  apex_debug.error('%s - Unhandled Error [%s]', l_log_prfx, SQLERRM);
  RAISE;
END delete_file;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE put_file
 (p_mime_type         IN VARCHAR2,
  p_file_blob         IN BLOB,
  p_file_name         IN VARCHAR2,
  x_object_store_url OUT VARCHAR2) IS

  l_log_prfx            VARCHAR2(100) := utl_call_stack.subprogram(1)(2);
  l_response            CLOB;

BEGIN

  apex_debug.info('%s - Start. p_file_name [%s], p_mime_type [%s]', l_log_prfx, p_file_name, p_mime_type);

  -- Build the full Object Storage URL.
  x_object_store_url := GC_OCI_OBJ_STORE_BASE_URL || p_file_name;
  apex_debug.info('%s - OCI Object Store URL [%s]', l_log_prfx, x_object_store_url);

  -- Set Mime Type of the file in the Request Header.
  apex_web_service.g_request_headers.DELETE;
  apex_web_service.g_request_headers(1).name  := 'Content-Type';
  apex_web_service.g_request_headers(1).value := p_mime_type;

  -- Call Web Service to PUT file in OCI.
  l_response := apex_web_service.make_rest_request
   (p_url                  => UTL_URL.ESCAPE(x_object_store_url),
    p_http_method          => 'PUT',
    p_body_blob            => p_file_blob,
    p_credential_static_id => GC_WC_CREDENTIAL_ID);
  apex_debug.info('%s - Response [%s]', l_log_prfx, apex_web_service.g_status_code);

  IF apex_web_service.g_status_code != 200 then
    raise_application_error(-20111,'Unable to Upload File to OCI.');
  END IF;

  apex_debug.info('%s - File Uploaded [%s]', l_log_prfx, p_file_name);

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('%s - Unhandled Error [%s]', l_log_prfx, SQLERRM);
  RAISE;
END put_file;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE upload_file
  (p_apex_file_name    IN VARCHAR2,
   x_file_name        OUT VARCHAR2,
   x_object_store_url OUT VARCHAR2,
   x_document_id      OUT cndemo_document_ai_docs.document_id%TYPE) IS

  CURSOR cr_file_info IS
    SELECT filename
    ,      blob_content
    ,      mime_type
    FROM   apex_application_temp_files
    WHERE  name = p_apex_file_name;

  l_log_prfx            VARCHAR2(100) := utl_call_stack.subprogram(1)(2);
  lr_file_info          cr_file_info%ROWTYPE;

BEGIN

  apex_debug.info('%s - Start. apex_file_name [%s]', l_log_prfx, p_apex_file_name);

  -- Get the File BLOB Content and File Name uploaded from APEX.
  OPEN  cr_file_info;
  FETCH cr_file_info INTO lr_file_info;
  CLOSE cr_file_info;
  
  x_file_name := lr_file_info.filename;
  
  -- Post file to OCI Object Store.
  put_file
   (p_mime_type        => lr_file_info.mime_type,
    p_file_blob        => lr_file_info.blob_content,
    p_file_name        => lr_file_info.filename,
    x_object_store_url => x_object_store_url);

  -- Create Document Record
  INSERT INTO cndemo_document_ai_docs (file_name, mime_type, object_store_url)
  VALUES (lr_file_info.filename, lr_file_info.mime_type, x_object_store_url) 
  RETURNING document_id INTO x_document_id;

  apex_debug.info('%s - Document Created. x_document_id [%s]', l_log_prfx, x_document_id);

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('%s - Unhandled Error [%s]', l_log_prfx, SQLERRM);
  RAISE;
END upload_file;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE document_ai
  (p_file_name   IN VARCHAR2,
   p_document_id IN cndemo_document_ai_docs.document_id%TYPE) IS

  CURSOR cr_document_data (cp_json IN CLOB) IS
    SELECT jt.*
    FROM   JSON_TABLE(cp_json, '$'
             COLUMNS (document_type_code      VARCHAR2(50)  PATH '$.detectedDocumentTypes[0].documentType',
                      document_type_score     NUMBER        PATH '$.detectedDocumentTypes[0].confidence',
                      language_code           VARCHAR2(50)  PATH '$.detectedLanguages[0].languageCode',
                      language_score          NUMBER        PATH '$.detectedLanguages[0].confidence',
                      page_count              NUMBER        PATH '$.documentMetadata.pageCount')) jt;

  CURSOR cr_document_fields (cp_json IN CLOB) IS
    SELECT jt.*
    FROM   JSON_TABLE(cp_json, '$.pages[*]'
             COLUMNS (page_number       NUMBER        PATH '$.pageNumber',
                      NESTED PATH '$.documentFields[*]' COLUMNS
                       (field_type_code VARCHAR2(50)   PATH '$.fieldType',
                        field_label     VARCHAR2(100)  PATH '$.fieldLabel.name',
                        label_score     NUMBER         PATH '$.fieldLabel.confidence',
                        field_value     VARCHAR2(1000) PATH '$.fieldValue.value'
                        ))) jt
    WHERE  jt.field_type_code = 'KEY_VALUE';

  l_request_json        VARCHAR2(32000);
  l_response_json       CLOB;
  lr_document_data      cr_document_data%ROWTYPE;
  l_log_prfx            VARCHAR2(100) := utl_call_stack.subprogram(1)(2);
  l_result_file_url     VARCHAR2(500);

BEGIN

  apex_debug.info('%s - Start. file_name [%s], document_id [%s]', l_log_prfx, p_file_name, p_document_id);

  -- Replace the uploaded filename in the JSON payload to be sent to Document AI.
  l_request_json := REPLACE(GC_OCY_DOC_AI_PAYLOAD, '#FILE_NAME#', p_file_name);

  apex_debug.info('%s - request_json [%s]', l_log_prfx, l_request_json);

  -- Set Content-Type in the Request Header. This is required by the Document AI REST Service.
  apex_web_service.g_request_headers.DELETE;
  apex_web_service.g_request_headers(1).name  := 'Content-Type';
  apex_web_service.g_request_headers(1).value := 'application/json';

  -- Call the Document AI analyzeDocument REST Web Service.
  l_response_json := apex_web_service.make_rest_request
   (p_url                  => GC_OCI_DOC_AI_URL,
    p_http_method          => 'POST',
    p_body                 => l_request_json,
    p_credential_static_id => 'APEX_OCI_BLOG_CREDENTIAL');

  apex_debug.info('%s - Document AI Response [%s]', l_log_prfx, apex_web_service.g_status_code);

  IF apex_web_service.g_status_code != 200 then
    apex_debug.error('%s - Unable to call OCI Document AI, Response JSON [%s]', l_log_prfx, l_response_json);
    raise_application_error(-20112,'Unable to call OCI Document AI.');
  END IF;

/*
  TBD, Make Changes to use Document Understanding Instead of Document AI.
  -- Get Result File from OCI
  -- Details of Result File in Response


*/
    

  -- Get Document Level Data from the JSON response.
  OPEN  cr_document_data (cp_json => l_response_json);
  FETCH cr_document_data INTO lr_document_data;
  CLOSE cr_document_data;

  -- Get Key Value Fields from JSON and populate table.
  FOR r_field IN cr_document_fields (cp_json => l_response_json) LOOP
    INSERT INTO cndemo_document_ai_fields (document_id,field_type_code,field_label,label_score,field_value)
    VALUES (p_document_id,r_field.field_type_code,r_field.field_label,r_field.label_score,r_field.field_value);
  END LOOP;
  
  -- Update Document Table with Results.
  UPDATE cndemo_document_ai_docs
  SET    doc_ai_json         = l_response_json
  ,      language_code       = lr_document_data.language_code
  ,      language_score      = lr_document_data.language_score
  ,      document_type_code  = lr_document_data.document_type_code
  ,      document_type_score = lr_document_data.document_type_score
  ,      page_count          = lr_document_data.page_count
  WHERE  document_id         = p_document_id;

  apex_debug.info('%s - Document AI Complete [%s], document_id [%s]', l_log_prfx, p_file_name, p_document_id);

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('%s - Unhandled Error [%s]', l_log_prfx, SQLERRM);
  RAISE;
END document_ai;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE process_file
  (p_apex_file_name  IN VARCHAR2,
   x_document_id    OUT cndemo_document_ai_docs.document_id%TYPE) IS

  l_object_store_url    VARCHAR2(1000);
  l_file_name           VARCHAR2(100);
  l_log_prfx            VARCHAR2(100) := utl_call_stack.subprogram(1)(2);

BEGIN

  -- Get file and upload to OCI Object Storage.
  upload_file
   (p_apex_file_name   => p_apex_file_name, 
    x_file_name        => l_file_name,
    x_object_store_url => l_object_store_url,
    x_document_id      => x_document_id);

  -- Call OCI Document AI and parse the results.
  document_ai
    (p_file_name   => l_file_name,
     p_document_id => x_document_id);

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('%s - Unhandled Error [%s]', l_log_prfx, SQLERRM);
  RAISE;
END process_file;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE render_document
  (x_document_id  IN cndemo_document_ai_docs.document_id%TYPE) IS

  CURSOR cr_document IS
    SELECT mime_type
    ,      object_store_url
    FROM   cndemo_document_ai_docs
    WHERE  document_id = x_document_id;

  lr_document           cr_document%ROWTYPE;
  l_file_blob           BLOB;
  l_log_prfx            VARCHAR2(100) := utl_call_stack.subprogram(1)(2);

BEGIN

  -- Get the OCI URL and Mimetytpe of the receipt file.
  OPEN  cr_document;
  FETCH cr_document INTO lr_document;
  CLOSE cr_document;

  -- Get the file BLOB from OCI Object Storage.
  l_file_blob := get_file (p_request_url => lr_document.object_store_url);

  -- Output the file so it shows in APEX.
  owa_util.mime_header(lr_document.mime_type,false);
  htp.p('Content-Length: ' || dbms_lob.getlength(l_file_blob)); 
  owa_util.http_header_close;  
  wpg_docload.download_file(l_file_blob);

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('%s - Unhandled Error [%s]', l_log_prfx, SQLERRM);
  RAISE;
END render_document;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE dl_document_ai_json (p_document_id IN cndemo_document_ai_docs.document_id%TYPE) IS

  l_log_prfx            VARCHAR2(100) := utl_call_stack.subprogram(1)(2);
  l_file_size           PLS_INTEGER;
  l_export              apex_data_export.t_export;
  l_doc_ai_json         cndemo_document_ai_docs.doc_ai_json%TYPE;
  l_file_name           cndemo_document_ai_docs.file_name%TYPE;

BEGIN

  -- Get the JSON CLOB.
  SELECT doc_ai_json, file_name INTO l_doc_ai_json, l_file_name
  FROM   cndemo_document_ai_docs
  WHERE  document_id = p_document_id;

  apex_debug.info('%s - file_name [%s]', l_log_prfx, l_file_name);

  -- Convert to a BLOB.
  l_export.content_blob := 
    apex_util.clob_to_blob
     (p_clob    => l_doc_ai_json,
      p_charset => 'WE8ISO8859P1' );

  l_export.file_name := SUBSTR(l_file_name,1, INSTR(l_file_name,'.',-1)-1) || '_JSON.txt';
  l_export.mime_type := 'application/octet-stream';

  apex_debug.info('%s - JSON file_name [%s]', l_log_prfx, l_export.file_name);

  apex_data_export.download( p_export => l_export );

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('%s - Unhandled Error [%s]', l_log_prfx, SQLERRM);
  RAISE;
END dl_document_ai_json;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE process_camera_image IS

  l_log_prfx            VARCHAR2(100) := utl_call_stack.subprogram(1)(2);
  l_image_clob          CLOB;
  l_image_blob          BLOB;
  l_file_name           VARCHAR2(100);
  l_object_store_url    VARCHAR2(500);
  l_mime_type           VARCHAR2(50);
  l_document_id         cndemo_document_ai_docs.document_id%TYPE;

BEGIN

  l_image_clob := apex_application.g_clob_01;
  l_image_blob := apex_web_service.clobbase642blob(p_clob => l_image_clob);
  l_file_name  := 'cam_'||TO_CHAR(CURRENT_DATE,'YYYYMMDD')||'.jpeg';
  l_mime_type  := 'image/jpeg';

  -- Post file to OCI Object Store.
  l_object_store_url := GC_OCI_OBJ_STORE_BASE_URL || l_file_name;
  apex_debug.info('%s - OCI Object Store URL [%s]', l_log_prfx, l_object_store_url);
  put_file
   (p_mime_type        => l_mime_type,
    p_file_blob        => l_image_blob,
    p_file_name        => l_file_name,
    x_object_store_url => l_object_store_url);

  -- Create Document Record
  INSERT INTO cndemo_document_ai_docs (file_name, mime_type, object_store_url)
  VALUES (l_file_name, l_mime_type, l_object_store_url) 
  RETURNING document_id INTO l_document_id;
  
  -- Add Document ID to Session State of Page 5 where the analysis will be displayed.
  APEX_UTIL.SET_SESSION_STATE('P5_DOCUMENT_ID', l_document_id);

  -- Call OCI Document AI and parse the results.
  document_ai
    (p_file_name   => l_file_name,
     p_document_id => l_document_id);

  apex_debug.info('%s - Document Created. x_document_id [%s]', l_log_prfx, l_document_id);

  -- Write JSON to let AJAX process know that the process completed.
  apex_json.open_object;
  apex_json.write(p_name => 'result', p_value => 'success');
  apex_json.close_object;

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('%s - Unhandled Error [%s]', l_log_prfx, SQLERRM);
  apex_json.open_object;
  apex_json.write(p_name => 'result', p_value => 'Unable to Process Image');
  apex_json.close_object;
END process_camera_image;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE delete_document (p_document_id IN cndemo_document_ai_docs.document_id%TYPE) IS

  l_log_prfx            VARCHAR2(100) := utl_call_stack.subprogram(1)(2);
  l_file_url            cndemo_document_ai_docs.object_store_url%TYPE;

BEGIN

  -- Get the URL of the receipt in OCI.
  SELECT object_store_url INTO l_file_url
  FROM   cndemo_document_ai_docs
  WHERE document_id = p_document_id;

  -- Delete the OCI Image File.
  BEGIN
    delete_file (p_request_url => l_file_url);  
  EXCEPTION WHEN OTHERS THEN
    apex_debug.error('%s - Error Deleting file from OCI [%s]', l_log_prfx, SQLERRM);
    -- Don't prvent delete records if OCI delete fails.
  END;

  -- Delete the field records for the document.
  DELETE FROM cndemo_document_ai_fields
  WHERE document_id = p_document_id;
  
  -- Delete the Document Record.
  DELETE FROM cndemo_document_ai_docs
  WHERE document_id = p_document_id;
  
EXCEPTION WHEN OTHERS THEN
  apex_debug.error('%s - Unhandled Error [%s]', l_log_prfx, SQLERRM);
  RAISE;
END delete_document;

END CNDEMO_DOCUMENT_AI_PK;
/
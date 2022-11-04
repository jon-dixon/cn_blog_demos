SET DEFINE OFF;
CREATE OR REPLACE EDITIONABLE PACKAGE BODY CNDEMO_ADDR_UTL_PK AS

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
PROCEDURE call_elocation
  (p_payload_xml     IN CLOB,
   p_batch_count     IN NUMBER,
   pt_address_list   IN addresses_t,
   x_response_count OUT NUMBER) IS

  CURSOR cr_xml (cp_xml IN XMLTYPE) IS
    SELECT  xt.*
    FROM    XMLTABLE('/geocode_response/geocode'
              PASSING cp_xml
              COLUMNS 
                address_id          NUMBER         PATH '@id',
                match_count         NUMBER         PATH '@match_count',
                longitude           NUMBER         PATH './match[1]/@longitude[1]',
                latitude            NUMBER         PATH './match[1]/@latitude[1]',
                match_code          NUMBER         PATH './match[1]/@match_code[1]',
                match_vector        VARCHAR2(20)   PATH './match[1]/@match_vector[1]',
                error_message       VARCHAR2(20)   PATH './match[1]/@error_message[1]',
                name                VARCHAR2(100)  PATH './match[1]/output_address/@name[1]',
                house_number        VARCHAR2(100)  PATH './match[1]/output_address/@house_number[1]',
                street              VARCHAR2(100)  PATH './match[1]/output_address/@street[1]',
                intersecting_street VARCHAR2(100)  PATH './match[1]/output_address/@intersecting_street[1]',
                settlement          VARCHAR2(100)  PATH './match[1]/output_address/@settlement[1]',
                builtup_area        VARCHAR2(100)  PATH './match[1]/output_address/@builtup_area[1]',
                municipality        VARCHAR2(100)  PATH './match[1]/output_address/@municipality[1]',
                order1_area         VARCHAR2(100)  PATH './match[1]/output_address/@order1_area[1]',
                order2_area         VARCHAR2(100)  PATH './match[1]/output_address/@order2_area[1]',
                order8_area         VARCHAR2(100)  PATH './match[1]/output_address/@order8_area[1]',
                country             VARCHAR2(100)  PATH './match[1]/output_address/@country[1]',
                postal_code         VARCHAR2(100)  PATH './match[1]/output_address/@postal_code[1]',
                postal_addon_code   VARCHAR2(100)  PATH './match[1]/output_address/@postal_addon_code[1]'
              ) xt;

  l_payload_xml         CLOB;
  l_response_clob       CLOB;
  l_response_xml        XMLTYPE;
  http_request_failed   exception;
  pragma exception_init (http_request_failed, -29273); 
  l_match_address_json  cndemo_addresses.match_address_json%TYPE;

BEGIN

  -- Set HTTP Headers.
  apex_web_service.g_request_headers.delete;
  apex_web_service.g_request_headers(1).name := 'Content-Type';
  apex_web_service.g_request_headers(1).value := 'application/x-www-form-urlencoded';

  -- Finalize urlencoded Payload.
  l_payload_xml := TO_CLOB('xml_request=') || p_payload_xml || TO_CLOB(chr(38)) || TO_CLOB('format=XML');

  -- Call the eLocation Web Service.
  BEGIN
    l_response_clob := apex_web_service.make_rest_request
      (p_url              => GC_ELOCATION_URL,
       p_http_method      => 'POST',
       p_transfer_timeout => GC_ADDR_WS_TIMEOUT_SECS,
       p_body             => l_payload_xml);
  EXCEPTION WHEN http_request_failed THEN
    apex_debug.error('eLocation Web Service Call Timed out');
    raise_application_error(-20002, 'Call to eLocation Service Timed Out');
  END;

  -- Check if the call was sucessful.
  IF apex_web_service.g_status_code != 200 THEN
    apex_debug.error('Error returned from eLocation Web Service. HTTP Response Code [%s]', apex_web_service.g_status_code);
    raise_application_error(-20003, 'Error from eLocation Web Service Call');
  END IF;

  -- Parse the response into an XML object.
  l_response_xml := XMLTYPE(l_response_clob);

  -- Loop through the response and update the table.
  x_response_count := 0;
  FOR r_xml IN cr_xml (cp_xml => l_response_xml) LOOP
    -- Generate JSON for the found address.
    l_match_address_json := '{' ||
                            '"name":' || apex_json.stringify (r_xml.name) || ',' || 
                            '"house_number":' || apex_json.stringify (r_xml.house_number) || ',' || 
                            '"street":' || apex_json.stringify (r_xml.street) || ',' || 
                            CASE WHEN r_xml.intersecting_street IS NULL THEN NULL
                                 ELSE '"intersecting_street":' || apex_json.stringify (r_xml.intersecting_street) || ','
                            END || 
                            '"settlement":' || apex_json.stringify (r_xml.settlement) || ',' || 
                            '"builtup_area":' || apex_json.stringify (r_xml.builtup_area) || ',' || 
                            '"municipality":' || apex_json.stringify (r_xml.municipality) || ',' || 
                            '"order1_area":' || apex_json.stringify (r_xml.order1_area) || ',' || 
                            CASE WHEN r_xml.order2_area IS NULL THEN NULL
                                 ELSE '"order2_area":' || apex_json.stringify (r_xml.order2_area) || ','
                            END || 
                            CASE WHEN r_xml.order8_area IS NULL THEN NULL
                                 ELSE '"order8_area":' || apex_json.stringify (r_xml.order8_area) || ','
                            END ||
                            '"country":' || apex_json.stringify (r_xml.country) || ',' || 
                            '"postal_code":' || apex_json.stringify (r_xml.postal_code) || ',' || 
                            CASE WHEN r_xml.postal_addon_code IS NULL THEN NULL
                                 ELSE '"postal_addon_code":' || apex_json.stringify (r_xml.postal_addon_code)
                            END ||
                            '}';

    -- Update the address record.
    UPDATE cndemo_addresses
    SET    status_code         = CASE r_xml.match_count
                                  WHEN 0 THEN GC_ADDR_STATUS_ERROR
                                  ELSE GC_ADDR_STATUS_PROCESSED
                                 END
    ,      status_msg          = CASE r_xml.match_count
                                  WHEN 0 THEN 'No Matches Found'
                                  ELSE NULL
                                 END
    ,      match_code          = CASE r_xml.match_count
                                  WHEN 0 THEN GC_MATCH_CODE_NO_MATCHES
                                  ELSE r_xml.match_code
                                END
    ,      match_vector        = r_xml.match_vector
    ,      match_longitude     = r_xml.longitude
    ,      match_latitude      = r_xml.latitude
    ,      match_count         = r_xml.match_count
    ,      match_error_message = r_xml.error_message
    ,      match_address_json  = l_match_address_json
    ,      status_date_time    = current_timestamp
    WHERE  address_id          = r_xml.address_id;

    x_response_count := x_response_count + 1;

  END LOOP;

  -- See if any addresses did not get returned from the API call (match_code IS NULL)
  --  and set an error message.
  FOR i IN 1..pt_address_list.COUNT() LOOP
    UPDATE cndemo_addresses
    SET    status_code      = GC_ADDR_STATUS_ERROR
    ,      status_msg       = 'eLocation API Failed'
    ,      status_date_time = current_timestamp
    WHERE  address_id   = pt_address_list(i).address_id
    AND    status_code  IN (GC_ADDR_STATUS_PENDING,GC_ADDR_STATUS_WIP,GC_ADDR_STATUS_ERROR);
  END LOOP;

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('Unhandled error from call_elocation [%s]', SQLERRM);
  RAISE;
END call_elocation;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
PROCEDURE validate_addressses IS

  lt_addresses       addresses_t;
  l_payload_xml      CLOB;
  l_locations_xml    CLOB;
  l_location_xml     VARCHAR2(32000);
  l_batch_number     PLS_INTEGER := 0;
  l_batch_count      PLS_INTEGER := 0;
  l_response_count   PLS_INTEGER := 0;
  l_process_count    PLS_INTEGER := 0;

BEGIN

  -- Set Status of Eligible records to WIP.  
  UPDATE cndemo_addresses
  SET    status_code         = GC_ADDR_STATUS_WIP
  ,      match_message       = NULL
  ,      match_code          = NULL
  ,      match_error_message = NULL
  ,      match_vector        = NULL
  ,      status_date_time    = NULL
  WHERE  status_code IN (GC_ADDR_STATUS_PENDING,GC_ADDR_STATUS_ERROR);

  -- Get count of records to process.
  SELECT COUNT(1) INTO l_process_count
  FROM   cndemo_addresses
  WHERE  status_code = GC_ADDR_STATUS_WIP;
  apex_automation.log_info( p_message => 'Addresses to process ['||l_process_count||'].');

  IF l_process_count > 0 THEN
    -- Loop through un-processed records one batch at a time.
    OPEN cr_addresses;
    LOOP 
      FETCH cr_addresses BULK COLLECT INTO lt_addresses LIMIT GC_ADDR_BATCH_SIZE;
      EXIT WHEN lt_addresses.COUNT = 0;
      -- Initialize Variables for the Batch.
      l_batch_number  := l_batch_number + 1;
      apex_automation.log_info('> Starting Batch # ['||l_batch_number||'].');
      l_locations_xml := NULL;
  
      -- Build List of Locations.
      l_batch_count := lt_addresses.COUNT;
      FOR i IN 1..l_batch_count LOOP
        l_location_xml := '<input_location id="'||lt_addresses(i).address_id||'">'||
                          '<input_address match_mode="'||GC_ADDR_MATCH_MODE||'">' ||
                          '<'||GC_ADDR_TYPE_GDF_FORM||
                          ' name = "'||APEX_UTIL.URL_ENCODE(lt_addresses(i).address_name)||'"'||
                          ' street="'||APEX_UTIL.URL_ENCODE (lt_addresses(i).street)||'"'||
                          ' builtup_area="'||APEX_UTIL.URL_ENCODE (lt_addresses(i).city)||'"'||
                          ' order1_area="' ||APEX_UTIL.URL_ENCODE (lt_addresses(i).region)||'"'||
                          ' postal_code="' ||APEX_UTIL.URL_ENCODE (lt_addresses(i).postal_code)||'"'||
                          ' country="'     ||APEX_UTIL.URL_ENCODE (lt_addresses(i).iso_country_code)||'"'||
                          '/></input_address></input_location>';
        -- Append to Locations CLOB.
        l_locations_xml := l_locations_xml || TO_CLOB(l_location_xml);
      END LOOP;  -- Batch. 
  
      -- Build XML for Payload.
      l_payload_xml := TO_CLOB(GC_XML_ADDR_LIST_START) || l_locations_xml || TO_CLOB(GC_XML_ADDR_LIST_END);
  
      -- Call eLocation Web Service for the current batch and update table with results.
      call_elocation
       (p_payload_xml    => l_payload_xml,
        p_batch_count    => l_batch_count,
        pt_address_list  => lt_addresses,
        x_response_count => l_response_count);
      IF l_batch_count <> l_response_count THEN
        apex_automation.log_warn('  >> # Responses ['||l_response_count||'] <> Batch Count ['||l_batch_count||']');
      END IF;
      apex_automation.log_info('> Completed Batch # ['||l_batch_number||'].');
  
      -- Commit Batch.
      COMMIT;
  
    END LOOP;    -- Batches.
    apex_automation.log_info('Processed ['||l_process_count||'] addresses');
  ELSE
    apex_automation.log_info( p_message => 'No Addresses to Process');
  END IF;

EXCEPTION WHEN OTHERS THEN
  IF cr_addresses%ISOPEN THEN
    CLOSE cr_addresses;
  END IF;
  apex_automation.log_error('Unhandled Error ['||SQLERRM||']');
  RAISE;
END validate_addressses;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION matched_address_html
  (p_address_id IN cndemo_addresses.address_id%TYPE) RETURN VARCHAR2 IS

  l_match_address_json  cndemo_addresses.match_address_json%TYPE;
  l_return_html         VARCHAR2(32000);

BEGIN

  SELECT match_address_json INTO l_match_address_json
  FROM   cndemo_addresses
  WHERE  address_id = p_address_id;

  apex_json.parse(l_match_address_json);
  l_return_html := apex_json.get_varchar2('name');

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('Unhandled error from matched_address_html [%s]', SQLERRM);
  RAISE;
END matched_address_html;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION address_geojson
  (p_address_id IN cndemo_addresses.address_id%TYPE) RETURN VARCHAR2 IS

  CURSOR cr_coordinates IS
    SELECT match_longitude   longitude
    ,      match_latitude    latitude
    FROM   cndemo_addresses
    WHERE  address_id = p_address_id;

  lr_coordinates     cr_coordinates%ROWTYPE;
  l_geojson          VARCHAR2(1000);

BEGIN

  OPEN  cr_coordinates;
  FETCH cr_coordinates INTO lr_coordinates;
  CLOSE cr_coordinates;

  l_geojson := '{"coordinates":['||lr_coordinates.longitude||','||lr_coordinates.latitude||'],"type":"point"}';
  RETURN l_geojson;

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('Unhandled error from address_geojson [%s]', SQLERRM);
  RAISE;
END address_geojson;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
PROCEDURE import_file
  (p_import_mode  IN VARCHAR2,
   p_file_names   IN VARCHAR2) IS

  CURSOR cr_apex_files (cp_file_name IN VARCHAR2) IS
    SELECT filename
    ,      mime_type
    ,      blob_content
    ,      dbms_lob.getlength(blob_content) file_size
    FROM   apex_application_temp_files
    WHERE  name = cp_file_name;

  CURSOR cr_addresses (cp_file_blob IN BLOB) IS
    SELECT col001 addr_source_ref
    ,      col002 addr_name
    ,      col003 addr_country_code
    ,      col004 addr_street
    ,      col005 addr_city
    ,      col006 addr_region
    ,      col007 addr_postal_code
    FROM   apex_data_parser.parse
            (p_content   => cp_file_blob,
             p_skip_rows => 1,
             p_file_name => 'test.xlsx');

  l_file_blob        BLOB;
  lr_apex_file_rec   cr_apex_files%ROWTYPE;
  l_file_name_array  apex_t_varchar2;
  l_count_files      PLS_INTEGER;

BEGIN

  -- Convert : delimited list of file names into an Array and count the number of files.
  l_file_name_array := apex_string.split(p_str => p_file_names, p_sep => ':');
  l_count_files     := l_file_name_array.COUNT;

  IF l_count_files <> 1 THEN
    apex_debug.warn('No File Uploaded');
    raise_application_error(-20005, 'Please select a file.');
  END IF;

  -- Empty table if we are in REPLACE mode.
  IF p_import_mode = 'REPLACE' THEN
    DELETE FROM cndemo_addresses;
  END IF;

  -- Get the File.
  OPEN  cr_apex_files (cp_file_name => l_file_name_array(1));
  FETCH cr_apex_files INTO lr_apex_file_rec;
  CLOSE cr_apex_files;

  -- Parse the file and Load Addresses int the address table.
  FOR r_address IN cr_addresses (cp_file_blob => lr_apex_file_rec.blob_content) LOOP
    INSERT INTO cndemo_addresses
     (source_ref, status_code, address_name, 
      iso_country_code, street, city, 
      region, postal_code)
    VALUES 
     (r_address.addr_source_ref,'PENDING', r_address.addr_name, 
      r_address.addr_country_code, r_address.addr_street, r_address.addr_city,
      r_address.addr_region, r_address.addr_postal_code);
  END LOOP;

EXCEPTION WHEN OTHERS THEN
  apex_debug.error('Unhandled error from import_file [%s]', SQLERRM);
  RAISE;
END import_file;

END CNDEMO_ADDR_UTL_PK;
/
SHOW ERR;
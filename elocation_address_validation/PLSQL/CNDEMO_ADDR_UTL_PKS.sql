-- Run as CNDEMO
SET DEFINE OFF;
CREATE OR REPLACE PACKAGE CNDEMO_ADDR_UTL_PK AS

  -- Global Constants Used by this Package.
  GC_ELOCATION_URL            CONSTANT VARCHAR2(500)  := 'https://elocation.oracle.com/geocoder/gcserver'; 
  GC_ADDR_TYPE_GDF_FORM       CONSTANT VARCHAR2(15)   := 'gdf_form';
  GC_ADDR_MATCH_MODE          CONSTANT VARCHAR2(20)   := 'RELAX_POSTAL_CODE';  -- 'RELAX_ALL'
  GC_ADDR_BATCH_SIZE          CONSTANT PLS_INTEGER    := 10;
  GC_ADDR_WS_TIMEOUT_SECS     CONSTANT PLS_INTEGER    := 20;
  GC_MATCH_CODE_NO_MATCHES    CONSTANT cndemo_addresses.match_code%TYPE  := 0;
  GC_ADDR_STATUS_PENDING      CONSTANT cndemo_addresses.status_code%TYPE := 'PENDING';
  GC_ADDR_STATUS_WIP          CONSTANT cndemo_addresses.status_code%TYPE := 'WIP';
  GC_ADDR_STATUS_PROCESSED    CONSTANT cndemo_addresses.status_code%TYPE := 'PROCESSED';
  GC_ADDR_STATUS_ERROR        CONSTANT cndemo_addresses.status_code%TYPE := 'ERROR';

  -- Constants for Oracle eLocation API XML.
  GC_XML_ADDR_LIST_START   CONSTANT VARCHAR2(500) :=
    '<?xml version="1.0" encoding="UTF-8"?><geocode_request xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="../geocode_request.xsd"> <address_list>';
  GC_XML_ADDR_LIST_END     CONSTANT VARCHAR2(250) := '</address_list></geocode_request>';

  CURSOR cr_addresses IS
    SELECT address_id
    ,      source_ref
    ,      address_name
    ,      iso_country_code
    ,      street
    ,      city  
    ,      region
    ,      postal_code
    FROM   cndemo_addresses
    WHERE  status_code = GC_ADDR_STATUS_WIP
    ORDER BY address_id;
  TYPE addresses_t IS TABLE OF cr_addresses%ROWTYPE INDEX BY BINARY_INTEGER; 

-------------------------------------------------------------------------------
FUNCTION matched_address_html
  (p_address_id IN cndemo_addresses.address_id%TYPE) RETURN VARCHAR2;

-------------------------------------------------------------------------------
PROCEDURE import_file
  (p_import_mode  IN VARCHAR2,
   p_file_names   IN VARCHAR2);

-------------------------------------------------------------------------------
PROCEDURE validate_addressses;

-------------------------------------------------------------------------------
FUNCTION address_geojson
  (p_address_id IN cndemo_addresses.address_id%TYPE) RETURN VARCHAR2;

END CNDEMO_ADDR_UTL_PK;
/
SHOW ERR;
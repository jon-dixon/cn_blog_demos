CREATE OR REPLACE PACKAGE CNDEMO_DOCUMENT_AI_PK AS
-------------------------------------------------------------------------------
-- NAME        : cndemo_document_ai_pk
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
-------------------------------------------------------------------------------

  GC_OCI_OBJ_STORE_BASE_URL  CONSTANT VARCHAR2(500)  := 'https://objectstorage.us-ashburn-1.oraclecloud.com/n/nueva/b/APEX_OCI_BLOG_FILES/o/DocumentAI/';
  GC_OCI_DOC_AI_URL          CONSTANT VARCHAR2(500)  := 'https://vision.aiservice.us-ashburn-1.oci.oraclecloud.com/20220125/actions/analyzeDocument';
  GC_OCI_DOC_AI_TIMEOUT_SECS CONSTANT NUMBER         := 15;
  GC_WC_CREDENTIAL_ID        CONSTANT VARCHAR2(50)   := 'APEX_OCI_BLOG_CREDENTIAL';
  GC_OCY_DOC_AI_PAYLOAD      CONSTANT VARCHAR2(32000) := '{
  "compartmentId": "<<CHANGEME>>",
  "document": {
    "namespaceName": "<<CHANGEME>>",
    "bucketName": "<<CHANGEME>>",
    "objectName": "<<CHANGEME>>/#FILE_NAME#",
    "source": "OBJECT_STORAGE"
  },
  "features": [
    {
      "featureType": "TEXT_DETECTION"
    },
    {
      "featureType": "DOCUMENT_CLASSIFICATION",
      "maxResults": 2
    },
    {
      "featureType": "LANGUAGE_CLASSIFICATION",
      "maxResults": 2
    },
    {
      "featureType": "KEY_VALUE_DETECTION"
    },
    {
      "featureType": "TABLE_DETECTION"
    }
  ]
}';

PROCEDURE process_file
  (p_apex_file_name  IN VARCHAR2,
   x_document_id    OUT cndemo_document_ai_docs.document_id%TYPE);

PROCEDURE render_document
  (x_document_id  IN cndemo_document_ai_docs.document_id%TYPE);
  
END CNDEMO_DOCUMENT_AI_PK;
/

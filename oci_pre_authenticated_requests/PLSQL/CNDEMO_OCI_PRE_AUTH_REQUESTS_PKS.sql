CREATE OR REPLACE PACKAGE CNDEMO_OCI_PRE_AUTH_REQUESTS_PK AS
-------------------------------------------------------------------------------
-- NAME        : CNDEMO_OCI_PRE_AUTH_REQUESTS_PK
-- FILE NAME   : CNDEMO_OCI_PRE_AUTH_REQUESTS_PKB.sql
-- REVISION    : $2022.1.0$
-- PURPOSE     : Package containing code for the OCI Pre-Authenticated Requests Demo.
-- Related Blog: https://blog.cloudnueva.com/apex-oci-par
--
-- DELIVERED BY: $jdixon$
--               
-- Revision History:
-- VER        DATE         AUTHOR           DESCRIPTION
-- ========   ===========  ================ =======================================
-- 2022.1.0   13-AUG-2022  jdixon           Created.
-----------------------------------------------------------------------------------

  ---------------------------------------
  -- Constants that need to be changed --
  ---------------------------------------
  -- Oracle OCI Object Store Constants.
  -- ** Replace these values with your own values **
  GC_OCI_NAMESPACE        CONSTANT VARCHAR2(100)  := 'USE_YOUR_OCI_NAMESPACE';
  GC_OCI_BUCKET_NAME      CONSTANT VARCHAR2(100)  := 'APEX_OCI_BLOG_FILES';
  GC_OCI_OBJECT_BASE_URL  CONSTANT VARCHAR2(100)  := 'https://objectstorage.us-ashburn-1.oraclecloud.com';
  GC_OCI_CRED_STATIC_ID   CONSTANT VARCHAR2(50)   := 'APEX_OCI_BLOG_CREDENTIAL';
  GC_PAR_NAME_PREFIX      CONSTANT VARCHAR2(25)   := 'BLOG_DEMO_';

-- Generate a pre-authenticated request URL.
-- p_expiration_unit   Unit used to calculate URL expiration time. Values: [DAY,HOUR,MINUTE,SECOND]
-- p_expiration_value  Number of p_expiration_unit used to calculate URL expiration time.
-- p_access_type       Permissions: [ObjectRead,ObjectWrite,ObjectReadWrite,AnyObjectWrite,AnyObjectRead,AnyObjectReadWrite]
-- p_object_name       Object name or Prefix of objects in bucket that URL has access to.
-- p_object_listing    Allow URL to list objects. Values: [Deny,ListObjects]
FUNCTION generate_pre_auth_request
 (p_expiration_unit   IN VARCHAR2,
  p_expiration_value  IN NUMBER,
  p_access_type       IN VARCHAR2,
  p_object_name       IN VARCHAR2 DEFAULT NULL,
  p_object_listing    IN VARCHAR2 DEFAULT 'Deny') RETURN VARCHAR2;
  
END CNDEMO_OCI_PRE_AUTH_REQUESTS_PK;
/
SHOW ERR;
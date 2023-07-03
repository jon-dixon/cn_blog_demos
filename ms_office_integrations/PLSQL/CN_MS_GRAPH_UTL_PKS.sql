CREATE OR REPLACE EDITIONABLE PACKAGE "CN_MS_GRAPH_UTL_PK" AUTHID DEFINER AS
-------------------------------------------------------------------------------
-- NAME        : cn_ms_graph_utl_pk
-- FILE NAME   : CN_MS_GRAPH_UTL_PKS.sql
-- REVISION    : $23.1.0$
-- PURPOSE     : MS Graph Utilities.
-- DELIVERED BY: Cloud Nueva
--               $Author: <jdixon> $
--
-- REVISION HISTORY:
-- VER     DATE         AUTHOR        DESCRIPTION
-- ======  ===========  ============= =======================================
-- 22.1.0  21-SEP-2022  jdixon        Initial Version.
-- 23.1.0  03-JUL-2023  jdixon        Various Enhancements.
-------------------------------------------------------------------------------

  -- Global Constants
  GC_TIMEOUT_SECS            CONSTANT PLS_INTEGER    := 10;

  -- Misc MS Graph Values.
  GC_GRAPH_API_VER           CONSTANT VARCHAR2(20)   := 'apiversion=2.1';
  GC_SMALL_FILE_SIZE_BYTES   CONSTANT PLS_INTEGER    := 4000000;
  GC_MAX_FILE_SIZE_BYTES     CONSTANT PLS_INTEGER    := 60000000;

  -- MS Graph API Endpoints.
  GC_SP_SITES_URL            CONSTANT VARCHAR2(250)  := 'https://graph.microsoft.com/v1.0/sites';
  GC_SP_DRIVES_URL           CONSTANT VARCHAR2(250)  := 'https://graph.microsoft.com/v1.0/drives';

PROCEDURE post_authenticate
  (p_user_name IN VARCHAR2);

-----------------------------------
-----------------------------------
-- Utility APIs                  --
-----------------------------------
-----------------------------------
-- Get an Option Value
FUNCTION option_value (p_option_code IN cn_ms_graph_opts.option_code%TYPE)
  RETURN cn_ms_graph_opts.option_value%TYPE;

-- Build the Graph API Token URL
FUNCTION token_url RETURN VARCHAR2;

-- Returns Y if the Web Credentials can access the users email and calendar, otherwise returns N
FUNCTION user_access_allowed (p_user_id IN VARCHAR2) RETURN VARCHAR2;

------------------------------------------------
------------------------------------------------
-- SharePoint and Drive Record Types and APIs --
------------------------------------------------
------------------------------------------------
TYPE sp_site_rec IS RECORD
( name                  VARCHAR2(100),
  display_name          VARCHAR2(100),
  site_id               VARCHAR2(100),
  site_url              VARCHAR2(500),
  status_code           VARCHAR2(1) DEFAULT 'S',
  status_msg            VARCHAR2(500));
TYPE tt_sp_sites IS TABLE OF sp_site_rec;

TYPE drive_rec IS RECORD
( id           VARCHAR2(100),
  drive_type   VARCHAR2(100),
  name         VARCHAR2(100),
  status_code  VARCHAR2(1) DEFAULT 'S',
  status_msg   VARCHAR2(500));
TYPE tt_drives IS TABLE OF drive_rec;

TYPE folder_list_rec IS RECORD
( id                    VARCHAR2(100),
  item_type             VARCHAR2(10),
  name                  VARCHAR2(100),
  size_bytes            NUMBER,
  fldr_child_count      NUMBER,
  file_mime_type        VARCHAR2(100),
  last_updated_by       VARCHAR2(100),
  webUrl                VARCHAR2(4000),
  lastModifiedDateTime  TIMESTAMP,    -- UTC
  status_code           VARCHAR2(1),
  status_msg            VARCHAR2(500));
TYPE tt_folder_list IS TABLE OF folder_list_rec;

-- Get information about a Drive Linked to a SharePoint Site ID.
FUNCTION sp_sites
  (p_filter IN VARCHAR2 DEFAULT NULL) RETURN tt_sp_sites PIPELINED;

-- Get information about a Drive Linked to a SharePoint Site ID.
FUNCTION sp_site_drive
  (p_sp_site_id IN VARCHAR2) RETURN tt_drives PIPELINED;

-- List Content of A folder. Must have an APEX Session.
FUNCTION sp_folder_list
  (p_drive_id   IN VARCHAR2,
   p_full_path  IN VARCHAR2) RETURN tt_folder_list PIPELINED;

-- Populate an APEX Collection MS_SP_FOLDER_CONTENTS with contents of a SharePoint Folder.
PROCEDURE sp_folder_list_ac
  (p_drive_id   IN VARCHAR2,
   p_full_path  IN VARCHAR2);

-- Get a BLOB Representing the file Using the Item ID.
FUNCTION sp_get_file_by_id
  (p_drive_id IN VARCHAR2,
   p_item_id  IN VARCHAR2) RETURN BLOB;

-- Get file and download it.
PROCEDURE download_file 
  (p_drive_id  IN VARCHAR2,
   p_item_id   IN VARCHAR2,
   p_file_name IN VARCHAR2,
   p_mime_type IN VARCHAR2);

-- Create a file in SharePoint and Return the File ID
PROCEDURE sp_create_file
  (p_drive_id    IN VARCHAR2,
   p_folder_path IN VARCHAR2,
   p_file_name   IN VARCHAR2,
   p_mime_type   IN VARCHAR2,
   p_file_blob   IN BLOB,
   x_item_id    OUT NOCOPY VARCHAR2);

-- Delete a File from SharePoint.
PROCEDURE sp_delete_file
  (p_drive_id IN VARCHAR2,
   p_item_id  IN VARCHAR2);

---------------------------------
---------------------------------
-- Email Record Types and APIs --
---------------------------------
---------------------------------
PROCEDURE dl_email_attachment
  (p_user_id       IN VARCHAR2,
   p_email_id      IN VARCHAR2,
   p_attachment_id IN VARCHAR2,
   p_file_name     IN VARCHAR2,
   p_mime_type     IN VARCHAR2);

END CN_MS_GRAPH_UTL_PK;
/
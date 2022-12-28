SET DEFINE OFF;
CREATE OR REPLACE PACKAGE ARCS_UTL_PK AUTHID DEFINER AS

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------
  GC_APEX_WEB_CREDENTIAL_ARCS      CONSTANT VARCHAR2(100) := 'ARCS_BASIC_AUTH';  -- Statuc ID of the APEX Web Credential.
  GC_REST_TIMEOUT_SECS             CONSTANT PLS_INTEGER   := 20;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
  TYPE status_rec IS RECORD
   (status_code   VARCHAR2(1)   := 'S',
    status_msg    VARCHAR2(32767),
    info_msg      VARCHAR2(32767));

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Upload a File to the ARCS File System.
PROCEDURE upload_file
 (p_base_url   IN VARCHAR2,
  p_file_name  IN VARCHAR2,
  p_file_path  IN VARCHAR2,
  p_file_blob  IN BLOB);

-- Delete a File to the ARCS File System.
PROCEDURE delete_file
 (p_base_url   IN VARCHAR2,
  p_file_name  IN VARCHAR2,
  p_file_path  IN VARCHAR2);
   
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- Start an ARCS job, and return a URL to the job status API.
PROCEDURE start_job
 (p_base_url        IN VARCHAR2,
  p_job_name        IN VARCHAR2,
  p_params_json     IN VARCHAR2,
  x_job_status_url OUT NOCOPY VARCHAR2);

-- Start an ARCS job, and return a URL to the job status API.
PROCEDURE job_status
 (p_job_status_url      IN VARCHAR2,
  x_job_complete       OUT NOCOPY VARCHAR2,
  x_job_status_code    OUT NOCOPY NUMBER,
  x_job_status_details OUT NOCOPY VARCHAR2);

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
   x_status_rec OUT NOCOPY status_rec);
   
END ARCS_UTL_PK;
/
SHOW ERR;
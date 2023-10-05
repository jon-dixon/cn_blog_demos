create or replace PACKAGE CN_MSGRAPH_REST_PLUGIN_PK AUTHID DEFINER AS

  -- Use a fixed page size for fetching calendar entries.
  GC_CALENDAR_FIXED_PAGE_SIZE   CONSTANT PLS_INTEGER := 100;


PROCEDURE capabilities_calendar
 (p_plugin  in            apex_plugin.t_plugin,
  p_result  in out nocopy apex_plugin.t_web_source_capabilities);

PROCEDURE discover_calendar
 (p_plugin         in            wwv_flow_plugin_api.t_plugin,
  p_web_source     in            wwv_flow_plugin_api.t_web_source,
  p_params         in            wwv_flow_plugin_api.t_web_source_discover_params,
  p_result         in out nocopy wwv_flow_plugin_api.t_web_source_discover_result);

PROCEDURE fetch_calendar
 (p_plugin     in            apex_plugin.t_plugin,
  p_web_source in            apex_plugin.t_web_source,
  p_params     in            apex_plugin.t_web_source_fetch_params,
  p_result     in out nocopy apex_plugin.t_web_source_fetch_result);

END CN_MSGRAPH_REST_PLUGIN_PK;
/
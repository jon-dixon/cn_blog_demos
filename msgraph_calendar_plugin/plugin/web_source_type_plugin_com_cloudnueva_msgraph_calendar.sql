prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run the script connected to SQL*Plus as the owner (parsing schema)
-- of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2022.10.07'
,p_release=>'22.2.4'
,p_default_workspace_id=>8542862351627306
,p_default_application_id=>150
,p_default_id_offset=>0
,p_default_owner=>'WKSP_CNDEMO'
);
end;
/
 
prompt APPLICATION 150 - MS Office 365 Integrations
--
-- Application Export:
--   Application:     150
--   Name:            MS Office 365 Integrations
--   Date and Time:   16:20 Wednesday April 19, 2023
--   Exported By:     JON@CLOUDNUEVA.COM
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 21411310992823295
--   Manifest End
--   Version:         22.2.4
--   Instance ID:     8506497487825098
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/web_source_type/com_cloudnueva_msgraph_calendar
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(21411310992823295)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_name=>'COM.CLOUDNUEVA.MSGRAPH.CALENDAR'
,p_display_name=>'MS Graph Calendar'
,p_api_version=>2
,p_wsm_capabilities_function=>'CN_O365_REST_PLUGIN_PK.capabilities_calendar'
,p_wsm_fetch_function=>'CN_O365_REST_PLUGIN_PK.fetch_calendar'
,p_wsm_discover_function=>'CN_O365_REST_PLUGIN_PK.discover_calendar'
,p_standard_attributes=>'ENDPOINT_HINT'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(21411693349832996)
,p_plugin_id=>wwv_flow_imp.id(21411310992823295)
,p_name=>'ENDPOINT_HINT'
,p_is_required=>false
,p_default_value=>'https://graph.microsoft.com/v1.0/users/:user_id/calendar/events'
,p_depending_on_has_to_exist=>true
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done

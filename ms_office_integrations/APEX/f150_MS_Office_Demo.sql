prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_220100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.2'
,p_default_workspace_id=>14014479837717764
,p_default_application_id=>150
,p_default_id_offset=>0
,p_default_owner=>'CNDEMO'
);
end;
/
 
prompt APPLICATION 150 - MS Office 365 Integrations
--
-- Application Export:
--   Application:     150
--   Name:            MS Office 365 Integrations
--   Date and Time:   22:43 Friday August 5, 2022
--   Exported By:     JON@CLOUDNUEVA.COM
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                      5
--       Items:                    4
--       Processes:                4
--       Regions:                  6
--       Buttons:                  1
--     Shared Components:
--       Logic:
--         Items:                  2
--         Build Options:          1
--       Navigation:
--         Lists:                  2
--         Breadcrumbs:            1
--           Entries:              3
--       Security:
--         Authentication:         1
--         Authorization:          1
--       User Interface:
--         Themes:                 1
--         Templates:
--           Page:                10
--           Region:              19
--           Label:                7
--           List:                13
--           Popup LOV:            1
--           Calendar:             1
--           Breadcrumb:           1
--           Button:               3
--           Report:              12
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--   Version:         22.1.2
--   Instance ID:     9014439315612431
--

prompt --application/delete_application
begin
wwv_flow_imp.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_flow_imp.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'CNDEMO')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'MS Office 365 Integrations')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'APEX-OFFICE')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'D04E4EE6F25D7387CB4CBCB931DD7B2C650E04D170EDCA9C6E7DDAF07D14C9D3'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'21.2'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication=>'PLUGIN'
,p_authentication_id=>wwv_flow_imp.id(687873397416591762)
,p_application_tab_set=>1
,p_logo_type=>'IT'
,p_logo=>'#APP_FILES#icons/app-icon-192.png'
,p_logo_text=>'APEX Office 365 Integration'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'21.1.1'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'APEX Social Signon'
,p_last_updated_by=>'JON@CLOUDNUEVA.COM'
,p_last_upd_yyyymmddhh24miss=>'20220805224231'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>7
,p_ui_type_name => null
,p_print_server_type=>'NATIVE'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'N'
);
end;
/
prompt --workspace/credentials/ms_office_365_integration_blog
begin
wwv_imp_workspace.create_credential(
 p_id=>wwv_flow_imp.id(21249302878399155)
,p_name=>'MS Office 365 Integration Blog'
,p_static_id=>'MS_OFFICE365_INTEGRATION_BLOG'
,p_authentication_type=>'OAUTH2_CLIENT_CREDENTIALS'
,p_scope=>'https://graph.microsoft.com/.default'
,p_prompt_on_install=>true
);
end;
/
prompt --workspace/remote_servers/graph_microsoft_com_v1_0
begin
wwv_imp_workspace.create_remote_server(
 p_id=>wwv_flow_imp.id(14589430118609816)
,p_name=>'graph-microsoft-com-v1-0'
,p_static_id=>'graph_microsoft_com_v1_0'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('graph_microsoft_com_v1_0'),'https://graph.microsoft.com/v1.0/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('graph_microsoft_com_v1_0'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('graph_microsoft_com_v1_0'),'')
,p_remote_sql_default_schema=>nvl(wwv_flow_application_install.get_remote_server_default_db('graph_microsoft_com_v1_0'),'')
,p_mysql_sql_modes=>nvl(wwv_flow_application_install.get_remote_server_sql_mode('graph_microsoft_com_v1_0'),'')
,p_prompt_on_install=>false
);
end;
/
prompt --workspace/remote_servers/ms_tenant_login_url
begin
wwv_imp_workspace.create_remote_server(
 p_id=>wwv_flow_imp.id(688146201516932911)
,p_name=>'MS Tenant Login URL'
,p_static_id=>'MS_TENANT_LOGIN_URL'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('MS_TENANT_LOGIN_URL'),'https://login.microsoftonline.com/<YOUR_MS_OFFICE_TENANT_ID>/oauth2/v2.0/token')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('MS_TENANT_LOGIN_URL'),'')
,p_server_type=>'AUTHENTICATION'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('MS_TENANT_LOGIN_URL'),'')
,p_credential_id=>wwv_flow_imp.id(21249302878399155)
,p_remote_sql_default_schema=>nvl(wwv_flow_application_install.get_remote_server_default_db('MS_TENANT_LOGIN_URL'),'')
,p_mysql_sql_modes=>nvl(wwv_flow_application_install.get_remote_server_sql_mode('MS_TENANT_LOGIN_URL'),'')
,p_prompt_on_install=>true
);
end;
/
prompt --workspace/remote_servers/graph_microsoft_com
begin
wwv_imp_workspace.create_remote_server(
 p_id=>wwv_flow_imp.id(688161412933111255)
,p_name=>'graph-microsoft-com'
,p_static_id=>'graph_microsoft_com'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('graph_microsoft_com'),'https://graph.microsoft.com/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('graph_microsoft_com'),'')
,p_server_type=>'AUTHENTICATION'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('graph_microsoft_com'),'')
,p_credential_id=>wwv_flow_imp.id(21249302878399155)
,p_remote_sql_default_schema=>nvl(wwv_flow_application_install.get_remote_server_default_db('graph_microsoft_com'),'')
,p_mysql_sql_modes=>nvl(wwv_flow_application_install.get_remote_server_sql_mode('graph_microsoft_com'),'')
,p_prompt_on_install=>false
);
end;
/
prompt --workspace/remote_servers/www_cloudnueva_com_ords_dev
begin
wwv_imp_workspace.create_remote_server(
 p_id=>wwv_flow_imp.id(689834693037255801)
,p_name=>'www-cloudnueva-com-ords-dev'
,p_static_id=>'www_cloudnueva_com_ords_dev'
,p_base_url=>nvl(wwv_flow_application_install.get_remote_server_base_url('www_cloudnueva_com_ords_dev'),'https://www.cloudnueva.com/ords/dev/')
,p_https_host=>nvl(wwv_flow_application_install.get_remote_server_https_host('www_cloudnueva_com_ords_dev'),'')
,p_server_type=>'WEB_SERVICE'
,p_ords_timezone=>nvl(wwv_flow_application_install.get_remote_server_ords_tz('www_cloudnueva_com_ords_dev'),'')
,p_remote_sql_default_schema=>nvl(wwv_flow_application_install.get_remote_server_default_db('www_cloudnueva_com_ords_dev'),'')
,p_mysql_sql_modes=>nvl(wwv_flow_application_install.get_remote_server_sql_mode('www_cloudnueva_com_ords_dev'),'')
,p_prompt_on_install=>false
);
end;
/
prompt --application/shared_components/data_profiles/ms_office_users
begin
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(688146455672932914)
,p_name=>'MS Office Users'
,p_format=>'JSON'
,p_row_selector=>'value'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(688146602860932919)
,p_data_profile_id=>wwv_flow_imp.id(688146455672932914)
,p_name=>'ID'
,p_sequence=>1
,p_is_primary_key=>true
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>100
,p_has_time_zone=>false
,p_is_filterable=>false
,p_selector=>'id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(688146958219932920)
,p_data_profile_id=>wwv_flow_imp.id(688146455672932914)
,p_name=>'DISPLAY_NAME'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>2000
,p_has_time_zone=>false
,p_selector=>'displayName'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(688147209179932921)
,p_data_profile_id=>wwv_flow_imp.id(688146455672932914)
,p_name=>'EMAIL_ADDRESS'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>100
,p_format_mask=>'YYYY-MM-DD"T"HH24:MI:SS'
,p_has_time_zone=>false
,p_selector=>'mail'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(688150679997947040)
,p_data_profile_id=>wwv_flow_imp.id(688146455672932914)
,p_name=>'JOB_TITLE'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>100
,p_has_time_zone=>true
,p_selector=>'jobTitle'
);
end;
/
prompt --application/shared_components/data_profiles/calendar_entries
begin
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(688309163503818950)
,p_name=>'Calendar Entries'
,p_format=>'JSON'
,p_row_selector=>'value'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(688309685384818953)
,p_data_profile_id=>wwv_flow_imp.id(688309163503818950)
,p_name=>'EVENT_ID'
,p_sequence=>1
,p_is_primary_key=>true
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>500
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(688309968033818954)
,p_data_profile_id=>wwv_flow_imp.id(688309163503818950)
,p_name=>'SUBJECT'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>500
,p_has_time_zone=>false
,p_selector=>'subject'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(688309326405818953)
,p_data_profile_id=>wwv_flow_imp.id(688309163503818950)
,p_name=>'SHOW_AS'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>50
,p_format_mask=>'YYYY-MM-DD"T"HH24:MI:SS'
,p_has_time_zone=>false
,p_is_filterable=>false
,p_selector=>'showAs'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(688310220468818954)
,p_data_profile_id=>wwv_flow_imp.id(688309163503818950)
,p_name=>'IS_ONLINE_MEETING'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>10
,p_has_time_zone=>true
,p_selector=>'isOnlineMeeting'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(688317251109115676)
,p_data_profile_id=>wwv_flow_imp.id(688309163503818950)
,p_name=>'CONTENT_TYPE'
,p_sequence=>5
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>25
,p_has_time_zone=>true
,p_selector=>'body.contentType'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(688317611517119480)
,p_data_profile_id=>wwv_flow_imp.id(688309163503818950)
,p_name=>'BODY_CONTENT'
,p_sequence=>7
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>32000
,p_has_time_zone=>true
,p_selector=>'body.content'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(688318269065126865)
,p_data_profile_id=>wwv_flow_imp.id(688309163503818950)
,p_name=>'START_DATE_TIME'
,p_sequence=>8
,p_column_type=>'DATA'
,p_data_type=>'TIMESTAMP'
,p_format_mask=>'YYYY-MM-DD"T"HH24:MI:SS.FF7'
,p_has_time_zone=>false
,p_selector=>'start.dateTime'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(688318637547129756)
,p_data_profile_id=>wwv_flow_imp.id(688309163503818950)
,p_name=>'END_DATE_TIME'
,p_sequence=>9
,p_column_type=>'DATA'
,p_data_type=>'TIMESTAMP'
,p_format_mask=>'YYYY-MM-DD"T"HH24:MI:SS.FF7'
,p_has_time_zone=>false
,p_selector=>'end.dateTime'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(688319059015132147)
,p_data_profile_id=>wwv_flow_imp.id(688309163503818950)
,p_name=>'START_TIMEZONE'
,p_sequence=>10
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>100
,p_has_time_zone=>true
,p_selector=>'start.timeZone'
);
end;
/
prompt --application/shared_components/data_profiles/states
begin
wwv_flow_imp_shared.create_data_profile(
 p_id=>wwv_flow_imp.id(689837834048262113)
,p_name=>'States'
,p_format=>'JSON'
,p_row_selector=>'items'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(689838060339262116)
,p_data_profile_id=>wwv_flow_imp.id(689837834048262113)
,p_name=>'ID'
,p_sequence=>1
,p_column_type=>'DATA'
,p_data_type=>'NUMBER'
,p_has_time_zone=>false
,p_selector=>'id'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(689838317217262116)
,p_data_profile_id=>wwv_flow_imp.id(689837834048262113)
,p_name=>'CODE'
,p_sequence=>2
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'code'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(689838628703262116)
,p_data_profile_id=>wwv_flow_imp.id(689837834048262113)
,p_name=>'STATE'
,p_sequence=>3
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'state'
);
wwv_flow_imp_shared.create_data_profile_col(
 p_id=>wwv_flow_imp.id(689838949472262117)
,p_data_profile_id=>wwv_flow_imp.id(689837834048262113)
,p_name=>'ABBREV'
,p_sequence=>4
,p_column_type=>'DATA'
,p_data_type=>'VARCHAR2'
,p_max_length=>4000
,p_has_time_zone=>false
,p_selector=>'abbrev'
);
end;
/
prompt --application/shared_components/web_sources/ms_office_users
begin
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(688147527547932923)
,p_name=>'MS Office Users'
,p_static_id=>'MS_Office_Users'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(688146455672932914)
,p_remote_server_id=>wwv_flow_imp.id(14589430118609816)
,p_url_path_prefix=>'users'
,p_auth_remote_server_id=>wwv_flow_imp.id(688146201516932911)
,p_credential_id=>wwv_flow_imp.id(21249302878399155)
,p_catalog_internal_name=>'MS_GRAPH'
,p_catalog_service_name=>'MS Office Users'
,p_attribute_05=>'1'
,p_attribute_08=>'OFFSET'
,p_attribute_10=>'EQUALS'
,p_attribute_11=>'true'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(688147758550932925)
,p_web_src_module_id=>wwv_flow_imp.id(688147527547932923)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/web_sources/ms_office_default_calendar_entries
begin
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(688310530616818955)
,p_name=>'MS Office Default Calendar Entries'
,p_static_id=>'Calendar_Entries'
,p_web_source_type=>'NATIVE_HTTP'
,p_data_profile_id=>wwv_flow_imp.id(688309163503818950)
,p_remote_server_id=>wwv_flow_imp.id(14589430118609816)
,p_url_path_prefix=>'users/:user_id/calendar/events'
,p_auth_remote_server_id=>wwv_flow_imp.id(688161412933111255)
,p_auth_url_path_prefix=>'/v1.0/'
,p_credential_id=>wwv_flow_imp.id(21249302878399155)
,p_catalog_internal_name=>'MS_GRAPH'
,p_catalog_service_name=>'Default Calendar Entries'
,p_attribute_05=>'1'
,p_attribute_08=>'OFFSET'
,p_attribute_10=>'EQUALS'
,p_attribute_11=>'true'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(688311108727818961)
,p_web_src_module_id=>wwv_flow_imp.id(688310530616818955)
,p_name=>'user_id'
,p_param_type=>'URL_PATTERN'
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(688319851425142850)
,p_web_src_module_id=>wwv_flow_imp.id(688310530616818955)
,p_name=>'$select'
,p_param_type=>'QUERY_STRING'
,p_is_required=>false
,p_value=>'id,subject,showAs,isOnlineMeeting,body,start,end,location'
,p_is_static=>true
);
wwv_flow_imp_shared.create_web_source_param(
 p_id=>wwv_flow_imp.id(688320199858144776)
,p_web_src_module_id=>wwv_flow_imp.id(688310530616818955)
,p_name=>'$filter'
,p_param_type=>'QUERY_STRING'
,p_value=>'start/dateTime gt ''2022-07-29T07:00:00Z'''
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(688310749212818958)
,p_web_src_module_id=>wwv_flow_imp.id(688310530616818955)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
end;
/
prompt --application/shared_components/web_sources/states
begin
wwv_flow_imp_shared.create_web_source_module(
 p_id=>wwv_flow_imp.id(689839221441262119)
,p_name=>'States'
,p_static_id=>'States'
,p_web_source_type=>'NATIVE_ORDS'
,p_data_profile_id=>wwv_flow_imp.id(689837834048262113)
,p_remote_server_id=>wwv_flow_imp.id(689834693037255801)
,p_url_path_prefix=>'apps/ssd/states'
,p_attribute_01=>'N'
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(689839497890262120)
,p_web_src_module_id=>wwv_flow_imp.id(689839221441262119)
,p_operation=>'GET'
,p_database_operation=>'FETCH_COLLECTION'
,p_url_pattern=>'.'
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(689839888736262121)
,p_web_src_module_id=>wwv_flow_imp.id(689839221441262119)
,p_operation=>'POST'
,p_database_operation=>'INSERT'
,p_url_pattern=>'.'
,p_request_body_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "CODE":#CODE#, "STATE":#STATE#, "ABBREV":#ABBREV#',
'}'))
,p_force_error_for_http_404=>false
,p_allow_fetch_all_rows=>false
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(689864536658323101)
,p_web_src_module_id=>wwv_flow_imp.id(689839221441262119)
,p_operation=>'DELETE'
,p_database_operation=>'DELETE'
,p_url_pattern=>'.'
,p_request_body_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "id":#ID#',
'}'))
,p_force_error_for_http_404=>false
);
wwv_flow_imp_shared.create_web_source_operation(
 p_id=>wwv_flow_imp.id(689864840979324654)
,p_web_src_module_id=>wwv_flow_imp.id(689839221441262119)
,p_operation=>'PUT'
,p_database_operation=>'UPDATE'
,p_url_pattern=>'.'
,p_request_body_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'{',
'  "id":#ID#, "code":#CODE#, "state":#STATE#, "abbrev":#ABBREV#',
'}'))
,p_force_error_for_http_404=>false
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(687874136119591768)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(688076192992592272)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(688144145616925069)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Select User'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-file-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'10'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(688157869319038184)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Office Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-o'
,p_list_item_disp_cond_type=>'ITEM_IS_NOT_NULL'
,p_list_item_disp_condition=>'AI_USER_ID'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'20'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_bar
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(688068288401592147)
,p_name=>'Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(688077632117592299)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(688078186205592300)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_list_item_link_target=>'separator'
,p_parent_list_item_id=>wwv_flow_imp.id(688077632117592299)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(688078553953592300)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_imp.id(688077632117592299)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_32_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF4000000017352474200AECE1CE90000066D494441545847B5D76D6C9BD51507F0FFBD7E8B134A1AE2D64D9664EB540362826E6D612C69518005A8DB0265AD2B06DBC4A6';
wwv_flow_imp.g_varchar2_table(2) := '457C09D2345563621FCA8709699AF85069D35E3479DD2C10D3364DAA04A3DA8640626D51811484464ADF0281ACB4258DF3E2E7B9F79E73A6FB3816A91BEA30145B5614D9CF737EF79C73AF8F153EC3632790FC1CD0FC11106B6A83BBF65A981FDC8950ED';
wwv_flow_imp.g_varchar2_table(3) := '012FF6B66AB11F9CFFB94120D10EACAE00F950E19B21D025719C58BB0E0707EEC091DC1ABC63A6313E4E98C83D82F072313E35602FD06513B1CDB3CCF75504375580E5A188AE08A86D25C2AD5B10DEB016A7D329BC4184114538E118C724C4A9AB1EC564';
wwv_flow_imp.g_varchar2_table(4) := '3D66D180DF01CB2499DC42CC3B8C927501A32B8424020842014211CC0A303000F46D042F6F45C08C40041F41705A18EF6AC60801CFB73D8AA335C8A2004F3735F51BE07B04B99198BF40408A4460445003F8486516F4F6029B36016D6D8008C00C086005';
wwv_flow_imp.g_varchar2_table(5) := '3010CC28C12BA2F0D3F69FE090475C16F0A7D4B26B24A11E24A17B492427222986C031C3FFF5082B1F67608604EB6E126CF82A70E5F22AA0164429402BC0112A60FCB5FD3C1E52BF815D10F0EC15AB5604719B07F34E026FD422AD96193417948421EC09';
wwv_flow_imp.g_varchar2_table(6) := '7E751E203EDF336527FFDD70B324AFFF3256B65C81945FFDFC870FE6AF5182615DC1D6CCAFF0FE2580032B56E488620F3B713B00E9119F6ABF6211B00F2C3E2483D89780A75964D481C759F8F059A30EDD7D0FDD91CDA2104F204BF580AAC0CB879B3576';
wwv_flow_imp.g_varchar2_table(7) := 'B5FE12C72F01FC7345C76356E447496059C5AF5A7CF02AC0E7D40A33338D3A91B745E41D0B7A89C0E3A98A1BF90E70FEEC20068DC1635AA187FC25F352E0CB005401094121BB0F272E021CCD665BCE21FEB4886C151145B59547A967FF7C8F88FFEE848E';
wwv_flow_imp.g_varchar2_table(8) := '12F3611139F360A532363FCDA3BB30A480DD5AA1DB03EA4B0005665F02A0D0F34C1DE04867676686F5EF09D80C115D0328DFC2CCA708F6673A9DFE43C7071FD80D805DE88019BD17430CEC8E7D1200600186631EF0B73AC00B9D5767E2088B60C933A0A3';
wwv_flow_imp.g_varchar2_table(9) := '6613868E3A9D9FBAEBDC99071A9D9C273763083E031ADD3ED24525A85EECAB399CF080E71600A4141745280F61ED7CEDFD2D44E084FF38F0E1F8B71B018E7F1D4390853330776D044879C0BFEA0157AFCFA4AC2B2A327990D524AEDA7CCC7EBF976EFF70';
wwv_flow_imp.g_varchar2_table(10) := 'EC5B0D019B3024EAF200DF842942A1E7DF9700FA3349ED8A7026AF5CA08502801C2004CB52EA3FF36E43C0B19B31048DDD1AE8A63A6DD4F17E1B02C34D6A21C0FA6D99B83545655D5E53A0C555A05C059A0C08AED4F7FEE8E20052ED81057781CFA73F07';
wwv_flow_imp.g_varchar2_table(11) := '1C0A3DAFD66760FDFD99B89822D85633E02A88B900315B01932D7D6D6C64A90183995822288AB379CD81860BA06C8098F30053EA3BF9DAD20354B32A22028411403B03ED02B033A58D232F2E31A0FF871968298A33F9580408A12884766104B8E5CD6797';
wwv_flow_imp.g_varchar2_table(12) := '16B07FDB9E4C73688B209B8F91897681F600DF841496FA8FFC79E901698A15855D044014DC67C0034CE9D643FB961AF0F34C933F092380D32013AD3ECED6039EEA7FE9170D8FE2E81CF87FB7E1FE6DBFCEA412661FC4DE1523D29A5D35FD361805854FDE';
wwv_flow_imp.g_varchar2_table(13) := 'F6C2937B1B9D849F0950DABCF7CA952DC9DF2A7021EE472F3B7B01D6BC05E6BF4CA8D652E1B947CE36029CEAC3C396F0E3DA3C70C9D7F1E50EA23DD8A37B77757D5F981F50A004C8BE0C3373A0FBDCE8B1CEB1A3F14A12696B0CA2A7B598310633309830';
wwv_flow_imp.g_varchar2_table(14) := '16D3D6E03D4395811BA6BFDB92E687121AAB3EF549E8B5FFD8BEAFDDC6CCF5A4599563CBDEBCFFE5276826D1BACD005B0C519AC872480E860C669DC114194C1A8B290A70C1585ADD1DE4BA56BA35E904D2FEEBF8933210B7D8B5E6B50546B2FA144FE56E';
wwv_flow_imp.g_varchar2_table(15) := 'BB85459E48807B67C9207416C6BFD8C2FF3F650D269D41D9194C5A83CE6C80D51D0EE9D4C75371ED9E7343A9670D5388EDD7BD8ED186BF0BCAD7DCDA27228F33F1ED7ED5962C42B230E4A20C94AD41993C20C4056BD0950D2340F33C402D889F09FD2C0B';
wwv_flow_imp.g_varchar2_table(16) := 'E0C0798542EF41541A0264FD6062A27CEC4E211AB262D75A6733A1B331CB0ED373005F86291762620EF0C50E87963940348603BE1D7C458C567843111ECFBD82E76BBF191A3576F4FEA9EB6E5CD55489EF70CE7EC338FBA5904CFB0C595DB621CACE4680';
wwv_flow_imp.g_varchar2_table(17) := '4932E85E156275D6493A150DD30485B2521883604C04235A637FEE205E9C5F964501AAB3C4CED8E9CE93390B73B7756EFB2CDBAF944D989C74464D39233616E2F39D01775CC5E3C938DE02E33F5018A138DE3616C7470E63BC005C34A7FC0F63F0AB5DEA';
wwv_flow_imp.g_varchar2_table(18) := '5507E10000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(688069794276592169)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/shared_components/files/icons_app_icon_192_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000C0000000C0080600000052DC6C07000000017352474200AECE1CE90000200049444154785EED7D0B945C5599EEB7CFA9EA47D2799007242184109200A1411EB2842045302004046D2051446410D1EBF531';
wwv_flow_imp.g_varchar2_table(2) := 'E3383257EF5A33F1AEE58C8EDEEBCC30A377748DCE65C6BBAE7045676E108184000122CA53120C49788784772A21E947559DFDDFF5EFC739FB9C3AD55D09DDE93ED5A75C2D9DEA53A7AACEF9BFFD7FDFFFDA02F923BF02E3F80A8871FCDDF3AF9E5F01E4';
wwv_flow_imp.g_varchar2_table(3) := '001805235809B44D028E01F03E09BC07C051243081804012DE20601380DF4C0136BD01F4DD0A04A3F031C7C55BE6003844B7F92A60C6240F977BC0F9927082048E20A0530205027C0908024080045093C00001BB7D0FCF4F9984A7979F8F753DB762BD10';
wwv_flow_imp.g_varchar2_table(4) := 'D87B883EF2B8789B1C00237C9B6F0426F57AF8B4245C47C031126823A08DDF960D9EAD9D7FF877FB9C7D9EFF1D00010954DADBD077F27BB0FFD24BF1C8A293F18B815E3CD43E11BBC4A5E81DE1AFD0D2A7CF013082B7F74F3C7C91043E1A109610E1307E';
wwv_flow_imp.g_varchar2_table(5) := '2B6BEC66B5AFFBB7357E0B080B107E6D7B0730751AAADD2760CFC73E81B7DBDBB04B4A3C0FE0EE36897F179FC4FE11FC3A2D79EA1C00C37F5BC59F15702E05F86312E26C09CC24903674C36FACF1BBFF4D02230D2001014200132600A79D065CDE03397D';
wwv_flow_imp.g_varchar2_table(6) := '262A442803D82D084F08E0BEAA8FC7AA02DBA75E8DDDC3FFF55AEB8C390086F17E7E1558E47BDE3702D07B095820009FD5AB356E098682064212042E00F8F7346F61BD0303A1AD0D38663EF0E9EB81B9476A600C545105F0B6FA11D80DC28B10585BA9E2';
wwv_flow_imp.g_varchar2_table(7) := '97533EAD9ECF1F892B900360184C6275071604156F9524BA32103859004536FCE42AAE8D5C8340A680C0E5FE4379047E3DBF47F712E0EA8F0373E6009E0778022AB4C7E70A02D420F01A115E12C01621F024096CEA206C16D7E1D561F8EA993F450E8077';
wwv_flow_imp.g_varchar2_table(8) := '790BBFE1E1F38110571361B11098CEABB32B6C935C5E1BB9F1048E3768B4EABB40487A057E2F3EDFC92701D77F0A983A4503CB3ED82B140C2806AA90107843006F315D22C2CB1E706F7B116BC4B578E55D5E86CCBE3C07C041DCBACF00C579BEFF21802E';
wwv_flow_imp.g_varchar2_table(9) := '96A04B3C88D90148ADC8A1C11AE34C13BDD1738DBDC160807081603DC9252B804B2E013A3B01695FEC7C37F60CFCE37BFAA7C2E1A5003B05B05912B611F0BC90D8E6F9F87DE70D4A588F8B470E8003BCCD7FD586255EE07D490A9CA7567D40116F7E8462';
wwv_flow_imp.g_varchar2_table(10) := '37B1B2BB61CE480F4461D0242D1A8CFFA7FDAD46C0840EE053D7696F5028689D31D8437907DF80A1CAB156BC2D045E03B003122F40E0B77E800D9B9EC073EFFD61F8150FF06A8DFDC3730034798FFEAEBD7D512DA85E1980CE03C4059E317C4577EAF8BC';
wwv_flow_imp.g_varchar2_table(11) := '89FA3488FCB8ABBBEB0D6CA4A899E8901B2EE5DF396B767A3770CD278069D3D5EADED4830D80C160BD0353263E5F6F05BB40F8BD00B605C02B02788E084F4EFECF78A6A91367E4A01C0043DCA81F74E1F0818AFF41485C2581737D6062D584355DBA534F';
wwv_flow_imp.g_varchar2_table(12) := '75229EEF02244DDC0E16254A8B0E258DDF8A6A16C15FF83CB0E4046DD4437981C1BE7AD107F8A71AA89FFD027895085B3C814D52976AFC3E68C38EAC4797720034B082EF001327FAFE05B2804B02C245EDC05C5E65ADF074E98EBB72C70D3CEE09520D37';
wwv_flow_imp.g_varchar2_table(13) := '112DB202D9D6440C96304B7A0AFE7C679C04AC5A05CC9C01D49AF4028D80E07A070617038281B5BF1FAF81730E02DB9577203C57213C35FD4B783A230B7FF831730024EED8DF03EDEDC5E28924E8C304BADA873896ED8879BEE2EA4C77C2849611B1AE11';
wwv_flow_imp.g_varchar2_table(14) := '27E8502CF499920348AEF01148A29C419A90B65A202688015408F8E3CF02279D643CC0105AE0800DD64496DA0A5CB907546AEACBEF02F088246C2CF8D842015E82875D13BAF1BA380F7CC4987DE400706ECDF7DBDB8FF3115C26203E4C84B30B6C50366E';
wwv_flow_imp.g_varchar2_table(15) := '1F1A39459C5F19BBB3CADB28504A042819FA4C33FCFAD53ECA2037E309F89CBD04ACBA0438B704744E00282522346CD668720E1C556AE78B0560DF0076AB7C03612B8B69C95EC2C3E669B3F08C5835F6AA5A730000F84167E79105595D02C27F12F02EF7';
wwv_flow_imp.g_varchar2_table(16) := '416AC58F6C2769E4F18CAEE6F8F16392650F8389DDB415DE3578060F3F9A29A5600F70D6E9C0872E0166CC685E0C0F17285844DBE812D3A67DFDE897C03D20FCDA07FE5003DE6E9378A3F328BC2656A1325CEF7BB0E719D700F847A0ABD85E38DB236F15';
wwv_flow_imp.g_varchar2_table(17) := '045D591462321B902E5588B883FDAD7EB5D74BBDD5007574A76114285D200FA61192651469629A5F5F25E0D863808FAD048E3C12084699803008D83B28ED30A08AF59E16029B28C06385221EDED389CD733E3B7A15ADE31200370313655BDB7CE9CB4B88';
wwv_flow_imp.g_varchar2_table(18) := 'BC2F7700B394C035CB883278F37F91F1EB3FDA98BDCBD595A74868833A8A53478B12FA21F1F774AFD01838D663704E60DA61C0B5D7000B1600359BA438D82572B85EC749389388B3627A5F3F764A896F0B8107A6083C23BE7AE8AB59C715005603DEC2CE';
wwv_flow_imp.g_varchar2_table(19) := 'CE3955D47A08DEF59EEAC622B0D1D805DFD58C1608D61BB83EA19EC31B811CAEFA8EB1DADA7F472047C9B1C639838312C8047474E8D288C50B81EA287B80C1F0C37489413150C33310F8810FFCACEBC6435BA3346E00F0AF1326CC0EA45C42A0AF0981E5';
wwv_flow_imp.g_varchar2_table(20) := '9CC8D2A50BC6ACCD0A6E6F586CE56F9212598AA468519A2E709266C97069E8515205747A611D3FCBEF63B50A9F83C3B4BE0FDCF069E0B8E380EA58F1008320A1C8F54A5C9E51C34FBD1ABED555C5D362B523C186CB0BA59CA7E501C03CBFB3AD6D9EE78B';
wwv_flow_imp.g_varchar2_table(21) := '6F00E2324F8836499AC824E98DE6315102A9EEEF294070299136E278F8526B8438DD699C408B8E73F3008D3D41BCBA548544F943886C01C0DA25479302892D90B87ACAD7F1B8108E101B2110B42C006E01DAFABBBA160B29AF20A23FF784E8E4823557D0';
wwv_flow_imp.g_varchar2_table(22) := 'B2DAADA33C0D40E0C88214819C920FB039036B94070182C691A4643BA5A651D6F3B0E0FCD4F5D9F100AE6D3325AA1136A3828FFF3DB069F5087B829603C07AA0F0CAB46913A8B7F723E4FBDFF54133D938A232E184D1AB7A81142098AE957A11ECEA0513';
wwv_flow_imp.g_varchar2_table(23) := '9E0CEF60C4E763614FA331D4E730901B5C2447FA417995216891A54F7C6E3E96EB7AAEBB0E58BC381B1428B9B8F3E70F24760C1470CEECAFE185115AFCD5695B0A00FF366DDA64BF52F9608DE80B05E0DCA829258AA347B11CFB9B1BF171FD8181450A25';
wwv_flow_imp.g_varchar2_table(24) := '4AF306AE40AE0F6746C9330D440D14CBDD2D18862AAA8B0CBD71475940A4428ED75E9B5D00F01562815C25FC3302FCE9F4D5233709A31500205603625E67E7911D9EF7235F880B95B8752AC1A2208FE1F8CE8A9D14BBD62CE354295E5856E71512EF950C';
wwv_flow_imp.g_varchar2_table(25) := '972A71EA26B39C520AC5DB9D0911B65D325524A744915C10594F2704E193D7028B1665D303D8DBD3E603FD352C9FBE19F7895B47268B9C7900FC7CCA94059520F83382B84A80A63A114D13CA8FD39490EC1863B2C61AAEEAEAEA4BAB87D5BFC23334E90D';
wwv_flow_imp.g_varchar2_table(26) := 'EC6B92023914C9B19C41448B622B7C5D4D91438B9CAE331740962EF184A14F5C032CE4306806A2408D280E53214978813CAC98B11A5B46820A651600B761D2F44A97B80A1E7D138449ECF9D38D9957EF7AAE6E98485C149B2BACFFD6401BB05E30CB6E9D';
wwv_flow_imp.g_varchar2_table(27) := '8036278D7B0827B213AEF6E6B930EB1C8F1485465D3745C211DB0D7481A558575F031CBB700C25C20ED27A591407841B7AF7E1A7477D0F7D07799A862FCB1C007E0274744E9C7C85E7E32B4458C2E37262892A637DC9E4950581BBD287C784969C121A4D';
wwv_flow_imp.g_varchar2_table(28) := '05427AB8F440B5810A8F3A466E730716006EB8D47A36B7DC423DE7BEDE09837EFC6AC28263B30F00A50524D65215D7CEFC1BEC1CB700E0E0C62FA64C591648F165802E22411E085EDA6A6B794B7D06B7DE1BD453A23410B8ACDE91D1074889EC5992FCDE';
wwv_flow_imp.g_varchar2_table(29) := 'D61245119FC615A6160836E9560702333BE8A31F6F0D00D89E8481019C39EBBB78785C02E0975D5D4B02AFF075022E00308D83041141D1AB689CC31B230E797E42070C4289D23C44B4B2C7695178562D19629FC1712A6190D515D69121271265E65CA15E';
wwv_flow_imp.g_varchar2_table(30) := '48886493A6702248715A641361AB3E4638A6053C005FD4CEA26AD1FC4B1FF8BB69DFC69EE104C198A640FFD171D8BC6A07DD40848F0262BE201493CCDC1A613DC519020421CF778DD79CCD21F775EA214189DCBF0FA60DEABD51246A635120A331627904';
wwv_flow_imp.g_varchar2_table(31) := '374A943A582B020137A97018F4CA8FB60E00B878AE12E0DE82C075877D6B78F302631600BF9C3AEDCB00AE97C0D10075595E1C4E9BAA2B65D07C242E4C1DF36CDA1B4469B1784F6D735964B70125E6151ABCBF7D371704561BC4E94D22DBEC88607D6D22';
wwv_flow_imp.g_varchar2_table(32) := '61CDE180CB5711E61F937D0DC0DF4D9548105E1AA8E0C373FF164FB4AC075809F8574F9D7E19813E01E05C0F98AEA980138A8C023421E9B0B1F0F0A8BAB8BC030CA79E276EA0099AE4C4EDED0577E1A57E572F4901DD306803D7A02D1062BC3FD17D168A';
wwv_flow_imp.g_varchar2_table(33) := '64225558F6E12B08F35A04001C0E25C2DBBE87CBA67D070FB62400FE63FAE4336450BC51089C45C02CAE94D5E230DD30AD270829508C83C7BD418CA6847A21496E9A11C8712086E6DFE0330EEE0D225FD5581B9895DDAEF6616EA0DE1BB02BE70A572EED';
wwv_flow_imp.g_varchar2_table(34) := 'AE79F4F6E557D2C4B9F3D05E1BC3E5D0CD1AB20200F08E20F4CCF81F58D7ECEB9A396ED429D09AC30EEB96F03E06212E04E1746E1EAA995281D8CAEB24AEDC55D7507223405DA3326A2185CF9B853B4A7045E53D8327CF1CFEADE76F3AA69BF00621BC9A';
wwv_flow_imp.g_varchar2_table(35) := 'F4068381C00AE2A8CC3A7A6F6BF8FD443B03887B28C0EFFC76F9CC35D7E3AFA64CC469FDAD00001DDEED8540CFE1DFC3DD1A0FC3F3183500DC82C3A6744DF5AF939E7785843CA5007485B53BD64263869926509DE7C24B92E0EA8E1789223C914076494C';
wwv_flow_imp.g_varchar2_table(36) := '3394C8D1CE09F2633DC8BBA744AE604E0A64BEF5BCD273B4A70ADA2F418F13C4ED04F9DB620DCFBE08BC7A1330F0C69F605DBB8F0FF4B51200083D87DFD402005833EDF00B3D81AB8870890F3183F9AEAE954972F5748EED8A533799A556E50410EC59C5';
wwv_flow_imp.g_varchar2_table(37) := '10023909048DC1149AE4FA9A84B08D2851CAE7B6EF1F52B06805B3EF1503A0D37EA962E186E2F4E9E4D9FA1A890D20DA1E78C11FFAAAD8B41AE80F3DE66A78AFBD85759D052C6B250008F6005906002F5E774C3B622504DD0888D37457961BC7778980BE';
wwv_flow_imp.g_varchar2_table(38) := '9DF5650C4E9566C8FB1DEAA32D3E3453FED5D215F5BB31C42459725F13790AAB73E3406826F31C81C77D6DF31964FE0CBE31FA7ED000806741F4BB1A6823413E52A8E299CF03FBD288003100DE681D00982977BDC2CB38007E3573D61740F4259FB0C8CD';
wwv_flow_imp.g_varchar2_table(39) := '86862BBF63B8AEDCD40B71925AE815BACE90A3EA66658331E30FCF12F5EF2675461A254A03627D0639FAC431826A94701DBD728ADD2CE0D42ACF2D8DE63B54402F91C09D42E249F2E8597FA0B6E9061E5E3BC44301E035ACEB28B68807E0A238895E12E8';
wwv_flow_imp.g_varchar2_table(40) := '99FDFD0C52A05B007FD2B45997C3C3DF172066B1C8B5C6EB1A4B145A7462F1B170641A25899738C72061BC41F255116D8A03A811BF0F8DB7A9A23A576998DF13000E3F8F11C8EC09D9E8CD2CA29720692B80CD81100F79ED957B3EFB0EDE1CCAE8DDBF33';
wwv_flow_imp.g_varchar2_table(41) := '005E7D15EB3A0A58D60A22D87A0092E899FDC3EC0140DC3D63D6B944E25F84A0A3234DA65761BD42473F6E1DB23594FAD5D615BA91910DE50D92414C0DB8FA57197B4D8F1235A8FD77C193EA45121964367A2E66E2BD512B843E023DAC0C5EEAE1B38B2B';
wwv_flow_imp.g_varchar2_table(42) := '953F9C87831B2BA800B00BEB3A7C2CEB7B97F3410F047823752C5F2BE2A177944100FCAA6BD6CC6287B8D917E2A28A1318B74616A33AE1154C4669AC49450A32595A10F71E910608D76385B224702C78EA0115C2C211BA316F5517FB4F02B1DE5BF177F5';
wwv_flow_imp.g_varchar2_table(43) := 'CDF9AAA0DD02F41C012FF1E67614D0BF5F5FAD3E391C46A400F00AD6B5B79807E03068A63CC04398DBB96F7AED4B9E2FBE65DBFD7402D55D75EB456B6404C94237ED2B1A53927A811C8FD687BD2E89DCB201D8904572E93A242E9A8DE19B0F69A337FCCA';
wwv_flow_imp.g_varchar2_table(44) := '805774A21709F4A4047EE391F84DA5BFF3F79FC5EE612DF06200ECDAA13D407F0B7800C3127AC114E8C719A2406B0F9B7B3215E4434260A23BDFB21108EAB9BA354CBBA25B53734190E4DC6920703585E55B2934AA41CE204D1B0CE60DF8DD34C5517DAD';
wwv_flow_imp.g_varchar2_table(45) := 'CCFA5E20FE91F23992726DA552B9FDB318B971800C80575EC6BA4E06400BE4019406007A39139C19003C3267CE84B76BF8421BF06D770B2165CA51194D5DA9B0FE7B3D55A917C8CDE50CC2F7326F1C790FE773D4C59222CF53C7E70729AA6383E7D54AAD';
wwv_flow_imp.g_varchar2_table(46) := 'F44059825E01E15110DD5E15E237D7F7F60E7B43471A65520078D100A0853C00E701320380BB66CC98E317DAD678244EE54905B130A01BD949294ED31848D024D78063BCDC392E116D098D37564691E60D526899CA4F3416C8D627D9543A1F2989782FDE';
wwv_flow_imp.g_varchar2_table(47) := '17016C27E0916ACDFFC575037BB70D07AF3F907370BEE5956B4D14A8550040E8F5809ED9FF2B031488833BF7CC9C7D4E87EFDFD71F664053F8B34D82A58609CD2D1F0C3C21930F071C1AEF92122E6D54546713BEA92B7B7A519D357A492001EC93A03D44';
wwv_flow_imp.g_varchar2_table(48) := 'B44B78DE6DA25AFD3FCFF4F7BFB4DA9DAE7E20D63B0CC72A0FF06C8B0100E8F5D8036401006BA6CC3B6C627BF05F8B9EF8CA806B788DAA266D1C3491EE8A2231E9D19B7827D83008E4302A9AF43EF170A954217B7A1DC03629E5EF00FF9EADFBF7AE5D7D';
wwv_flow_imp.g_varchar2_table(49) := '9061CB61B0F9D82918003BB6B7180008BD3E6B809F66C0036C9833675E10783F17C07BC379387641771465448B9CC84918E9ACA74083757D455CBD0981ECEA1007746168D6F148619E82688040FD00ED13C023A856BFBBAABFFF81E136DEE1389F02C0B6';
wwv_flow_imp.g_varchar2_table(50) := 'D68B0211D073541600B0FEB0A3BAD14E7778C0DC30FC992C65182C8E3E08081A0AE498513B9428AC691B3C7916839B59F0D5C005410320DA45100F1620EF24CF7BE08A729979FE987DB00678F963ADE7016A3E7A8EC90200EE3962EEFB84276EF788A6DB';
wwv_flow_imp.g_varchar2_table(51) := 'A1AD96950F1E3E7404AAA145A9A1D154E11C25CFA2F7A8D706B1F78F87886C3DAA84101522EA03D1B382E44FFBF6EEFDF1273072E3F9861B4921005A290FC0FD00EC017E96010AB47EE6BCF77B3E6E073099077CC4428FC970642A2572828F51BF634A02';
wwv_flow_imp.g_varchar2_table(52) := '6D286D902459835697B24FEA27E03101FCDCAFD2BAC9FB776F3DCF29331E6E431DA9F32900AC6C310FC07913899EA3FEEF1807004780D6CF985BF20B628D80E8D2F6CB861AF29AB0C6261E1A4DC6FF1D5292028234816C58907EBFE8EDC24AA338106321';
wwv_flow_imp.g_varchar2_table(53) := 'CE7788C4DD80B8E9C9F29BF78F66046738406101A04A215A210CCA893089DE80D0734C1600B061D6DC12E0AD01D0E50478222038C6595F1611273D31E038FC25560BE488D608045146387A2E4E890A42A042C10621F057C569D3D65FBC7D3BD7DD67FEC1';
wwv_flow_imp.g_varchar2_table(54) := '22F8E54DAA23AC750040E80D902500084F7B80D4FA1A27EA93A0449A11A5E50C22951BADEE0985D054CE407B232E3FAE01B70AC86F5CF6F6DB9B336FF5CE17500078AA05012032040021D80308E501EA29093F97D406C9953FD9F0A2EFB02D8948B63EC6';
wwv_flow_imp.g_varchar2_table(55) := '56FEB4B1288ED769174045D2F7AB54FD4E4FB93CA21B308C06B018002F3E85751D5E6B7900E9650A00FE1A01180D608CB7913768545F9322901D796C0738C77C489A3670A570110255921B3D59FDFCC5E5F2E3A361A023FD9E0A004FB6501E40CF05EA95';
wwv_flow_imp.g_varchar2_table(56) := 'AC017E990111CC1AC083BF460816C1F581CCA4401D4C20872B7B53FB79C5A2F9B1B2086B7404DA1F48BAE8B2DD6F8CC924D670804301E0891604006B802C0060E3ACB925293400D8D8EB84AE53EC168BC5C4DA1FDDB53EF2206E1CDF8DFAB8CD5DC96619';
wwv_flow_imp.g_varchar2_table(57) := '9B3C2B0A5EFDE91FBC6ADF5F5EB4772F17AEB5E48301F0C2E3AD458100F4CA003DC7ACC98007D838776E8964718D00690A14F2EF04CF4F6D2F3481D388CBC4A620A55789D66B83B4A69B36DE9459CA0B7FFBF6EB5CB7E304575B0B071C067DE1D216CA03';
wwv_flow_imp.g_varchar2_table(58) := '180AC43DC11901C0FC1249CE037018D431FA21DA0B23AC18E2D4401BB8B428267E4D66376D6E10D7F448928FC9C0BFFC92F2AE315DCAF06EE1A800F0A116A340A627381B00E03C80C71EC08AE02408125CDD8DEE8477BFF9E4591A081CFDAC28589B1018';
wwv_flow_imp.g_varchar2_table(59) := '08AA7F5AEB68FBA74B77EEE4B47ACB3E2C005A250F60F60A53A510D900C0DCB925300512501A20C6D52D233A506DE034B5C4B304430CCF32EFCFF4A7BF16BC67C5EED77FDFB2966FBE1803E0F94B8C066801A2E7F6041F73472634C0FC92204E843100B4';
wwv_flow_imp.g_varchar2_table(60) := 'B9F28F3BA4CAA2E2DD08640BAC41CB22A2869C5A20FD632E7EFB9521074B651D200A002B5A8F0281C3A05902806728101B39CFBFB186CA0CDF9D07A4FF961E2E8D47898CC9A7688328D61F8D3F74429FEC26F6F8B270E2F2B776BC9275031FEAF37314E8';
wwv_flow_imp.g_varchar2_table(61) := 'F9DFB44E26D8CE05E2B1281901C0C29220ACF104995288B8068856EE0808EEA40837D419667E8DCB88D11F27BA14F7329A16599069014C655FFADDE306000F1A00B4100512DC0F900D0FB0B0C4A5101E641771E36C48828C1768D0A46E41501FEB8F8F3F';
wwv_flow_imp.g_varchar2_table(62) := '6CA6BAB46E1A34A1EC496FFC01A005AA41430FC022F8EE4C6880E34BF0B0C623D9A5EB1578EBC388E4C4C39431A262CA981B47895C411DFA954478D569638CD802A12CC611009E7DA005C7A2701EE09E4C00E0A412BC40512022EE2AD400D020B0BCA5BE';
wwv_flow_imp.g_varchar2_table(63) := 'E2332688D561294038C0EAD2507C4B1A5F00D8D07A51208F45706600E05308006DFC12823D414889B481C7C3A4E6B9C82984CC3F16EB4FABF6B4473AC0895129421981183714E8590B8016A040763A34CF05CA0600E69F5482106B3CA22EB5E7B959FD79';
wwv_flow_imp.g_varchar2_table(64) := '661A73730B887A0A53BFE65B7B6E14254AFA89A4680EB144A28C00E3030080F7EC3213066D15112CF460AC6C0060E1A92592B4C667009059821C2DA0BC81A5454EBB649A37080DFC80126771EF2278D3BDF1E4015A11005C0A21D0B3301314880140EC01';
wwv_flow_imp.g_varchar2_table(65) := '381116800D908D5EFD28DB742891F9DD7A0397FABB9901A736AE2E67A05F93CC2344F544E6CF651A271E6035E05DCD1E801B625AC503F054083F330038A344200300BE03DAF815FDB16070FE2B027D4CE38C6EC2B807499CC5B48209BFEA3C8028538DC6';
wwv_flow_imp.g_varchar2_table(66) := '0D05DA9E0360A87CA1FAFBB06F93CA5321362E3CA3449C0720A9A240DAE813AB7EF81C3FCFDAC06885E4FA6E429C75DEC04982D5E980F06F4ECA8D445916A97BF98E71900906BCEDE7B6A007007A16DE9F8530E8C2B34AE4B107D061501700FCBB16C2D6';
wwv_flow_imp.g_varchar2_table(67) := '33D81C2E47883408ACA7A80F8B5A911CCF2CD70BE478811C5330229483F10480735A4C049B8DB2B303005FAC11445DDAD0AD0670289032741704BC5ABB20D0AF7333016975FEC928515AB854532006801C1F1E6035BC6DEB5ACF03F036A9D900C0F1E794';
wwv_flow_imp.g_varchar2_table(68) := '48608DB014C81ABBAB01CCEF9AFAB820314060CDC083455D6D60D4AC05457DEB637A519D615BE56251762F1D0F148801B0B6C500C03BC4640A009EF6008A029910A8326887EB5BC3D794C7E60B9C1D8499124993404BE48507EF338827D4546984A47261';
wwv_flow_imp.g_varchar2_table(69) := '3C01E0EE160400A167E14319D0001B4E3AAFE405D0C57049BE2FB94A3361EC2639A69F4F6A06A30B9437D03F8D1368E62F09816C6851B9E007E3C7033000440B8541D903B008CE0A004420D678A0AE6865B7ABBC2374C3953F8A006911EC6883308BCC9E';
wwv_flow_imp.g_varchar2_table(70) := '203018680204C6EA552F82864ED9CF01D0546870AC1DA4EE1FA197F708CB0E00C85700B01E208DE608A6384E8834355C6A41E28652431A1545851A0A648EF5AA41FF34BE007027D6B5B750224C02BD7E760070414980CBA1CD540863B06146D8CD0CDBB0';
wwv_flow_imp.g_varchar2_table(71) := '673253ACF6A648780235C984ADD96A8344F15CCA54E8B01A94FB01FCDAF8A140BF6E4100B0067838131A60454988F43C400402A54CC32C31C729EBBD843EA64E335810847F331516561D2412612A0C0A943D2F07C058A337CD7C1E73FFD41E61D9018007';
wwv_flow_imp.g_varchar2_table(72) := '351D9AB3BC51356854195A2F84AD3688EB013744AA3D821331326152FDBC5B0F1417C3C64F94450E8066EC6DCC1D933D009C7AA9A2403A0CEA96399855DF18B25B1AED8AE5786EC026CFA2823A051E573B84C239BEADA9ED42B31E4078D59C028D39F31E';
wwv_flow_imp.g_varchar2_table(73) := 'FA036510003D2581408D46B4A510610EC0864063F541B656C88914C5C2A5CEAA6FF443A80F623545B6CCDAD5067A224500948557EC5EBA63EBB8980AB12DD70043236BA48AE1369CDAA334800B00E6F89ACF4785716ECCBF5E206BA35786AE5EEB788258';
wwv_flow_imp.g_varchar2_table(74) := '75A9934556DAC0BC8F395E8B60D5965386C801D094558CB18332E9015447989A0C67344058FE0C08C9CFB934C61ABB6BE84E0488B3C175A5D4F658EE3760DD6045B589128560D300E03C801485DC038C31E36EE6E3640F0067F49440BC41866D8A8F17C1';
wwv_flow_imp.g_varchar2_table(75) := '85A5112AC9E502441B752490D3926729B903D36B1C659223ADC1C0315EA71CE40068C6DEC6DC311904C0CA12086636A889EEC47A838DA055753E71611CAB0F4AD608D955DD447F74D4D3C90D28CAE4824D478794C7812C4BE41E60CC5977131F288300B8';
wwv_flow_imp.g_varchar2_table(76) := 'AA0421F56C5095EDD5461A467D5C30D84699BAA497F5066E019DA9150A5F636990A140EA7DE2FDC6616905C9B2249153A0260C6EAC1D924D00701E4085418D01AB01A071811A0ECD32856ED1FC20CBFF6D22CC36D0C405B4A236B6C2D48A6B03AE904659';
wwv_flow_imp.g_varchar2_table(77) := 'AFC00090940360AC5977139F277300587FD635259FA4198B628C5438E35142819A10C261DF40B28926DE2916EB264BF50611601808C6F39465C099E03C0CDA84CD8DA943320A00CE046B0F102F7130C2365CA9DD553DCA07C4BBC5DC0CB273BC2D9F0EEB';
wwv_flow_imp.g_varchar2_table(78) := '89D2FB0A3C5D8B549635BF7BE98E27F33CC09832EFA13F4C360100B345922358C3288D15AA311038DEC0F606C7C6A9447C3F554B5830A8049AA31B842EAF2629CBA879390086B6B73177440601705DC9572D9189A67825849D5A1FDB03AC2E797AAC5F97';
wwv_flow_imp.g_varchar2_table(79) := '4CC7E99316D44EFD8F1ABE15197DD8746FDB2E391126655914A97BE9D6DC038C390B1FE203651300AA259213616E719B13F64CD6F318111BA34B31A37622400E20A2CCB29B333019672BAE212179386E21C8019035EB37E50AAA1F202BD5A0EBCFB9A1E4';
wwv_flow_imp.g_varchar2_table(80) := '13190024125D361C1A66865DDE9E2C9788C7F4E3D42702565825AAC0C6CE408F63B4DE86A99702805FEC5EBA7563AE01320682EC7980736E28794A0350979DF5131B8B684A1762F53F8EA0B5959EF519611D518A0B6427E26343AE89E9139EA5409E9F03';
wwv_flow_imp.g_varchar2_table(81) := '2063C6AF16324D82B3E5013CD852082E87B6D95EB7A0CD4D74C52343B1528930BE1F954387C3B36223551265146EB5A990A0409685F07200E400885D8111198DB8FE9CCF953C2B829DF2E7B838B5C56BBA91C54D5CC51BE913C2D92D8F50A5144EC4C729';
wwv_flow_imp.g_varchar2_table(82) := 'B08B68913E378F451160119C53A0AC61207B1EE0BC2F963CC9A510663CBAADD9B1856975E5CD5115685DD7972B78EB066BD924972B909D8CB3ED1D30738104D5720064CDFA334981CEFB6249488AA642249B605808BB132194A1AAAA38A767C01990E50E';
wwv_flow_imp.g_varchar2_table(83) := 'D70AC7A4C457FE3A81EC5020B5C91AC9B2080ADD4BB7DE938BE08C8120931E80B749E562B858DDBF1BF971B3B7B196A69F89000017C5494441549E5EC71BD425C29CA23A97FAD8DF43811C2FA0531A04B22C381196032063E69F4511CC1E2014C1666F00';
wwv_flow_imp.g_varchar2_table(84) := 'B5C03BD95EA7784DCF008D0C3F2C730E1359C94972B6C4DA9D2CE100476592A3049ADE883B287B05D1BDF4C9DC03640D0119F4005FD64DF15C0EED1AA2D3151607030FC2B514C889FDAB3BE54677D20769C5B2CBC9194466630EA6405E81720064CDFAB3';
wwv_flow_imp.g_varchar2_table(85) := 'A901BE5C12C2D40285F4C6D6EAEBB287788F6F4A022C9C7E1B6981D47D056273451365D366B0AEDA349BA8ECF96DDD4B9F5C936B808C8120631E80C4FAF36E2C8137C8501EC09DE8E0666F132B7D2C8419558546604911C9893EE1D429D376E01605658F';
wwv_flow_imp.g_varchar2_table(86) := 'A742E400C898F96752037CB504B54106A2E1B831FAA38BD7A2F6C5C4EC1FB77B2C360D22024DD84AE90CCC0D8BE4EA80219507F0E1E500C89CF967160026131C72F8A89C393929AE7E5CA22B88DD2D952C002C8D72C6AC247A8EDDDDE9F51649B2EC1372';
wwv_flow_imp.g_varchar2_table(87) := '00E400380499E00BBE5682A905D222D86D6D4C0EB97246A224DA1AA3E96F6E3F71723E10AF10897D0512A5D12A13CC1E40CA1C003900461A0024D65FF0172540AE11C2F404C7429C6EC34A048E78B4275D2827EBFCE3E3D4E35E23D20E121E8B6029CBBE';
wwv_flow_imp.g_varchar2_table(88) := '0C7200E40038040058F11725523BC450971A49150ADCC8B0C33AFED8DF074B74452B7F2CEB5B072EA779C66696759568D9E74CF093B7E651A08C81207B51200600998698B0D3CB195D62CA1EE2337CDCA890DBF195963C4B2B904BB44C269A665803148A';
wwv_flow_imp.g_varchar2_table(89) := '5EF7D28D39003266FF592B8726B15E01C05B2384301D616EBB6314CE0C694FDAD8437796509A36E0E7D4C8C4C1F20A51A52951502E7026380740D6EC3F6B008058BFE2BF95086426C3257A75EB8C392A8B8E7576B9A5124EA15C543211CD038D2851BA40';
wwv_flow_imp.g_varchar2_table(90) := 'D623891800320740E6CC3F8B61500500A10190DAD09E0C673AFC3E513097CC1AC7EAFF75FFA31E8E156B948FD326D390532EF885EEA51B6FCE3540C64090410DF0D725F2CC68C464015C68ACC94C70141E4DCF0B2405B29B5770C4B55B2EEDF60310958B';
wwv_flow_imp.g_varchar2_table(91) := '1E6B801C0019B3FFAC5120D6007F5D92BE29856083E74A37B65FB55D633C0F10CF065BA16C0AE062E0499451C44A2CDC4CB2E92E53EF17558DF25894368F35400E801C00D115188196480D80C0E73028EF11E634B6B8214BA704BA7E144A22E499468B6C';
wwv_flow_imp.g_varchar2_table(92) := '86D915D076FEA8A14536D4AA8AE120CB45200740D6AC3F7BD5A00C80EF946421A240CAC043E3747B8153461E869D5C6EDD8F9BE46AD053104E9B8B1FCB6FAB26C381CA4562119C7B80AC6120831A800160A3402E7589EAFBF54D7027BE39196275580A55';
wwv_flow_imp.g_varchar2_table(93) := '4AD29E70F5E75D626C5B65729749BD533C10948B9C09CE019035FBCF9A0680587FE9DF94A4EA07A82F85A8AF00B5DA205AD9E3DB214560A8D70B89D53E91150EF30C4217C3B505C5EEA51BFF671E05CA1804B2E7017ABE5392D2733AC2DCFA7EDBE1A582';
wwv_flow_imp.g_varchar2_table(94) := 'FBA64CC2780693DCB22D91E9E5D2AEA7A8AFFFA9078F84103C1B94CA32F0BB97E700C898F9672E0F40627DCFF74A924723DA96C858B6D64D7C199EAF2D5E832136F521AD67C0F1147549354B7FCC5844A7149B3D4050F3720064CEFC3309809B4A01E97D';
wwv_flow_imp.g_varchar2_table(95) := '82A39188CE346797AAA80496D10396FBC7F6066BD03893DC5F20A5E8CE4697D88512C937832A4EC93D40F61090410A745329E07268E301EAA84C8CAB6BFA131D63C1E0D0263B1D22D61DD6A8BD32418B48C213EC5CE4731ED5DE5FDAF0C35DD9338103FB';
wwv_flow_imp.g_varchar2_table(96) := 'C4B41A5EBE517673D76C64F2003D0C001305B203B01AB54086111F0704CE73B1526A33E1213E42258512C51AF1093C184B52F0802FBDCB4B1B6E7AA3B94B93DDA37200347FEF460E003C1B34D6141F854055C8B22EDE1FE9014D89DCC2B6C1BC41FD8489';
wwv_flow_imp.g_varchar2_table(97) := '68F30C3D26BD008140063FAC163B6FBC60EDB7F7347F79B279640E80E6EFDB8800E0EE9E9B4A426D9021BAC836ADD7F17E87AAA451A246717D472CA786451DE16B73096DC2471054AFD9D7296FBDF88E9B069ABF3CD93C320740F3F76D44007047CF0F4A';
wwv_flow_imp.g_varchar2_table(98) := '051E8BC2D5A0B11D62E2A1CFA80422F20E752BBF4A1334008BDA0FCC6DB4897B0DDD182F2049EE6D2F0C9CF0FEBBFF6167F39726BB47E60068FEDE8D0C0056FEA854A09A990DEA6674E323D1ADB1A7C6FB430F604B9D532891CA1B68D19C16FF37A5D2E4';
wwv_flow_imp.g_varchar2_table(99) := 'F9F2DAD75F99F4B3554FAFAE347F69B27B640E80E6EFDDC8010081A140C95DE2D357F338086CF6D7357ADBDDD5481B684F10ED33601B71707FEF80F8C8871EF8D6EEE62F4BB68FCC01D0FCFD1B410070189435405A72CA843AC34E2F57003758E9C3C890';
wwv_flow_imp.g_varchar2_table(100) := '6D83B440B209347B4E675F62D0EB005D7CFF5D1D8FAFC66A938868FEE264F5C81C00CDDFB9910380E04CB0E909B6C2D5F2F990B7A7AFE6B1285198258E7791698FE1780A9B23506157F604F4AA04562D3FCB7F50AC1E3FC6AF2E499E07681A01230380AB';
wwv_flow_imp.g_varchar2_table(101) := '7E542A041C06650F90ACD749E3F4F5DA203579364402CDD21F223C2D64F0C937A79CF4C4AA5B57E958E8387AE40068FE668F0800EE5AF5CFE778C01A0093140572576AC788A3557CB03209A75E28CC04AB138685749EE2FE0449F4A680FC79B5E67F73E3';
wwv_flow_imp.g_varchar2_table(102) := '5DB557C613ED716F790E80510400BFF5DD1FFDC99984E05702E230AD018CC126223BB6F02D3624CB3DC66474436F90F0268C5E5F78A8C91A0949B7D66AD5BFDC53C18E55F7AEDED7FC2568BD237300347F4F87DD03F05BAF5DF9E325D2C3AF3D81A3646C';
wwv_flow_imp.g_varchar2_table(103) := 'FB231708C93EDE38C70F41935A07C4862F10503020886EA740FEA44295FB2FBE63F5DEE6BF7AEB1E9903A0F97B3B2200B87DE54F66157DFAC7A2E75F5E0D6AA6ACC1D2160B8224EF77A23B49DD106E9504143C0F1E095482CAEFA427BFD659958F3DFDEA';
wwv_flow_imp.g_varchar2_table(104) := 'F3FB3EFBE80FABCD7FEDD63E320740F3F7774400B07ED9EAC2C0CCB917168BC535810C4C7B631A0D4A8BF7DB30A6BBA71850F47CD4649559D30322A07FA909DCF79BD3F63EB77A9C45789AB9B539009AB94AFA981101009FF8572B7F3C53F8F87E8757B8';
wwv_flow_imp.g_varchar2_table(105) := 'B2226B2653EBACFE757A80FF96CC1968C3E70F59092A5B24053F94247ED151DEF3EA79F7AEEE6FFE6B8EAF237300347FBF470C00B47AB577E796A3CFF6206EF33D6F468D411046835C1A64E2F989EACF82F050143E066A039B41F453825C2FF70D3C75E1';
wwv_flow_imp.g_varchar2_table(106) := '5D5FDDDFFCD71B9F47E60068FEBE8F1800F8236C5E794BDB2BFEC04540EDA6F642DBBC819A29C4B449AC58924B8382A33A2C70076A955705C99F91C02DFD957D4F7DF83FFEFC9DE6BFD6F83E320740F3F77F4401603FC69DAB7E72297C7CAACD2B7E4470';
wwv_flow_imp.g_varchar2_table(107) := '6D3ED5942EB0BBC7F087F08440BB57C4BE4ADF5B40F06F44F24E04E2D10B7FF1B9D79BFF3AF991F60A6C3913EB3B3D2CEB6F8102904CB5443632C13BAFFAC9F112A24780CE15448B04309D089D1E1010681F403B41F404803B3BC85F5BBAF553C3DAB9C5';
wwv_flow_imp.g_varchar2_table(108) := '940C3B77FA0705914713AF3A9D9F381D8F3ECAFF5FFFB08777F6ED560BCC6673C889F677FE05C0899BF96FFCD7F02FE91F4FFDD9BC283CC29E35FE92A70F5F25CFC5BF1466F5BD70E7041FA51C0083DFF143E201EC47F8A7CFFC53F1E83D85251034D787';
wwv_flow_imp.g_varchar2_table(109) := '3F0582DA05206B01F5017843D6E4B68B6FBB61C7411969CA8BFABB571C3B50ABAEA805D54582D04980CF344BAB0E0929A5C9539BE79C7FAB1A56327F57B93CBD94F28C396ED3549BD1AB7398E7148133C710B701E9F3F37BD5A43E3F9F8DEB3202F37A49';
wwv_flow_imp.g_varchar2_table(110) := '0102F3796AE67C35F50E3CC605EA1C81DA06815FC9DB3CA9DDCEF4FB42BF474DCD03D3E7E5DFAAEA23D4C4B2EEEA45D326D26CFDEF6C3F5AC2031CCA5BF0CE920B4F84AC7E80A4584EA065ED44539479988C349B101BB74ABDA9B9A16A236D63DCC6584D';
wwv_flow_imp.g_varchar2_table(111) := 'EE412AAA6660638E715F13BD56BF8132D0100084809F53CFB331B3D19A7F4BF3376BE46CD08963F975EA78A9CFABC060CC5F9FD39E43F5DDA9EFA4004512671C5FC5E15309410E80414DEF907A804301827DDD1FBC4006C19785A4659DF03A076480AA59';
wwv_flow_imp.g_varchar2_table(112) := 'C9F5A6DDFAA7CE888DA1854738C0D07D37BAA8CF1AB835FCE8BF1A4CF6EF6CF06CB8AE51F36AAD0C988F63CF613C00DBA83A4E19B45EDDD531F639E341EC31164CF638FE0CA16731DF6DE9F1551C91036048936B190010567BFBBB1F5A8E407E7B02C4A9';
wwv_flow_imp.g_varchar2_table(113) := 'FD52A2A628883624BBDAEBB53C05006AA537C7253C43331EC09E3FE901D42A1E7A803800026212A3895312001170AC0760C068902401A0E9500418FE1E390086B47D7540CB0060F72917CDF7FBABB74C8477462F1946AC56CED105409CD66800F073A4BC';
wwv_flow_imp.g_varchar2_table(114) := '83E5F2917187CF391E4053A0C60050C69F03A0398B4F1CD51200A0533E3275FFC0FEAF7512DDD86B8BEF5425C5E8022008E29AC072782D6C036ED6D7ABBF63DCCD0340BF36D4093900C62700B81560DF091F3CA748C17D354361EC95182B00884470E401';
wwv_flow_imp.g_varchar2_table(115) := '5464478956DDD7AFBC82A3015C0A14D82892D5044C820C7872001C94DD872FCABC07A025CBBADEA1C2E726007FD367DA21C70A006440A885112613D2B4911BC9FF36ABB8A301B461BBE299233951644A8557D56A6FBC47A80B720D703050C83C00DE39F9';
wwv_flow_imp.g_varchar2_table(116) := '83878BAAFC4E1BE193030EFD5161CF51A24076C56700303FD7AB7BF3000805AD130665916DC5F47803008FB624817708E8396E23D61D8CA1377A4DE601D0DBFDC1A364ADF6AF058873AB618D91FEBA6309002A2C4ACCF76D1834CD03E85C8115B4E1EFA1';
wwv_flow_imp.g_varchar2_table(117) := '0836ABBFF100AE76085F63C2B5AD140562000402BB8B1E2E3BF6413C9003C0B9027D277CE0E840E2565F88335803B88FB106803091A5F200EF0E00217D0A75814DC0E9FF9EDD4279009FCB05045E0670D9E287C0E532C3F668090F10D4829B8BC0B2B1E6';
wwv_flow_imp.g_varchar2_table(118) := '016C14282D0F1018111C8F0235EF01C613008A828B3B70BFACE18F8EFF2D9E1F36EB6F853C80D20095E0DB45883FAA8C250DC0111E8EF53BA511AE0718140061F2CCD0A10405524258ADFCF130A82EC1683D0FD0E101FD1EBED15BC0DF9E7A2FCA39009C';
wwv_flow_imp.g_varchar2_table(119) := '2BF0FA92655D1DB2F8994ED07FEF1F4300E0159A011025A8EA4570320F101AF64102C0668A5B8D0215B864D82B9EB9F881EAC3C369FC2D9109E63C40FF92F3CFAE05749F00F188A0F0319A1A200E001BDAACCF03B814C8022096035055A076B55752DA29';
wwv_flow_imp.g_varchar2_table(120) := '7B689C086B150D50106CFC582B816B8F7F10C33EDD3BF31A80ADFDF953964D9D5E69FB7ABB945F7569D0E801C0547E86559C36766F4299AACC212E8275424B539B46006050E9D2671BF34F07009FE3FD2D228219003581CF4C20FCDB511BC165F3C3FA68';
wwv_flow_imp.g_varchar2_table(121) := '0900F015D9D7BDFC0859136B0A44EF650319DD30680E80E1B052B5B595871741B8E8B88DD8321CE74C9EA36500C054A8FC9E15A714FB2B0F7A40A71283A39008B3F5F86A153722382A71AEF700AA8E5F89D96865B71E4037CBB8FD0026A11626D7A22A52';
wwv_flow_imp.g_varchar2_table(122) := 'B718AE553C403B73FFF6C2F90B66D4EE15B79A9E9F614641CB0040ADF82B57FAFB9FDBBD047DF4CDA2C4A5D52032AA43550EED02208A02D9CF11014081C2D4021D08005C0D1065879DE4998902659D0271E8B3EAE19F0B9DF8CAB16B3162FBBAB5140014';
wwv_flow_imp.g_varchar2_table(123) := '0800B1E7A44BA6B689EAF25AA576932F6916F705E88E29D30C3382FD001600BC0A732B640808C5DBEB01A0457054C7E36A80B0CCD978B2309FE09478877D04896AD02C0380B7B5951E5E1E105876F203786E9817FDD8E95A0E00F6DBD192956D15EC5DD4';
wwv_flow_imp.g_varchar2_table(124) := '27AB975220FFBC0831B5AA7A6B75934C5A5BE37034C484062F099C99B6753BFA7935014017C1D99F10004E79B3E905188F003059DF4DA2804F2EBC1F4FF016CF3900DEC51578E3B8B327B58B29B303F47D5DD6E4956DC0448E14B101D60161183AC2F46A';
wwv_flow_imp.g_varchar2_table(125) := '6E92600E006C4FAFE6F7269115F603680FE016C1C5CA9C93F984441428AD232C8B1E808D3F10D85210B866C1837874A48DBF25F200CD6263FF0917CEEEAFF5774388CF0919F41409E0C4590C08C3020013CA0C9BDE6DE9B26E6A6F0600AA7AD402A28108';
wwv_flow_imp.g_varchar2_table(126) := '7633C14900B0ABC94A1E802908873A99F65484F7BF8594DF5DB871E4577E6B372D4B81D280C1FAA06FF107E6F441AE20197C0A529EE583C065D48AFE0C0300D45813365E67EA4334C1A11E00BA2126EE0162FDC00701002124961E57C31153C6F6540865';
wwv_flow_imp.g_varchar2_table(127) := 'F83CF715D802E1FDC86B93B72CBA17C33616A799C5715C0120D4072B56B4BFF6CCFEC524E85C8F82AF740931BF4F06A898393EC97129CD36C5DB64561A0034BD8900107A82610080DB13CCE76D2F4ABC6F510D33278F2D0030C5E1C9646CF84200FB898D';
wwv_flow_imp.g_varchar2_table(128) := 'DDFB9E90F2C1C993B169D65D38E4735FC7250042202C5CD1FE9ABFFF6CAAD6AE00C92B3B200E1FE069124991DCC45C201DCAD4D9DC8301405D1F805BE66C0676C51B62EA8BE16C0469CA8400A72D0870D8440DBAD17CF00ADFE66983EF0BB01F025B3C81';
wwv_flow_imp.g_varchar2_table(129) := 'A725F084EFE3E10953F1F89CFF87DED1FA8CE31A00F6A2BF3E7FD92CE957964849D712E4C7279028F44A9EDAC6C6AC076AD9CDFE069B0B94068010108378804661D090DB1BCF940680685690A6511C7A9D332D40F7BC00933A0E3D007895E7159E577AE6';
wwv_flow_imp.g_varchar2_table(130) := 'F5FB25FA21C47D205A1B109E29F878A350C4ABBD33B1F3C45B99FD8CEE23078073FD9F3B61E9D16D03410F02FA1081CEE984686320F02A7A4000B0215067229C8D02E98157A6EEDF667FED540837FCE978003B62D105806EB374E60919AF550980E38FAC';
wwv_flow_imp.g_varchar2_table(131) := '62D1EC00ED45676F9211B2333620367A4E5CA9555EA24C7A1CEA76002F7AC2DFEE1582271E3D024FAF1AA16CEEBBF96A390012578F87E8EEB8F9CE1321E96220F8A827E9542E3155A5D6434C860B0BDA4C2FB03B12B11100628930B70C3A0180682E90D3';
wwv_flow_imp.g_varchar2_table(132) := '34EF8E533100180808672EAAE2C8E972C4863EF10ACF3F0CC08A5A1CF08610785C4AFCD613F84320F07CA10D2F2F045E15F782F7C81AB38F1C000D6E0D03E1A59B7FFD010A821E905C3E11E2B8FE40A262387EDA68C4A101108D3C744570AC093E31F353';
wwv_flow_imp.g_varchar2_table(133) := '45888C06089BEDC399A0CE402D7E4E1298FF9F7E6C0D53260C0FFD6103E1959D298D12B11EB03FC05B04B109829E2B08EC9084E70A3E1E5BB001BF1FB396DEE083E50018E28E6D5BF8BEC9851A7D404879B59472591B6806478B6CE7953B1B34098090B2';
wwv_flow_imp.g_varchar2_table(134) := 'B8466D698E4D88B9A5108E078871FB2100E0668C4F5D5051AB3F1BEBBBD1BF96CB7398B6265519F29B10D8C622169EF72491FF9828565F38EE5EBC9935A3773F6F0E8026EFDECEC5CB660CF4BF73B50CE47280CE6F037572C428024214058AC6A138836E';
wwv_flow_imp.g_varchar2_table(135) := 'CD0A1D9BF993C804477344A3A9CFCD7800FE0C3C7877EA841ADEBBB08AAE0314BF7A83121D9367C3E7473FE12D013C4D02CF12E1E5828767858FC78EBD1F4F3579C93271580E8003BC4DCF2C3EEBC8426FFF1789821592E8B822D0CE4088CDED09E70139';
wwv_flow_imp.g_varchar2_table(136) := 'D5A8C9D5DD8A61930708B3BF291488FB876D98B551471807454F9C57C5513302700B6133ABBFA234DC70A279FC1E02DE02B00B8497BD221EF60BC5F5414775CBA23B60F6B63AC08B9581C373001CE44DDA7ACCA9256F405E5183BCB048741C478A38A3AC';
wwv_flow_imp.g_varchar2_table(137) := 'FE6726C2B953DE546E2051EF134D8673BAC01200D01B6D4493E1920050E724C291D32B38615E0D1D0D223FEE2ACFAB3D9765D480B721B015846D9EC0B335C236BFD8F6F8E2FB2B7F38C8CB92B997E5007897B76CFBFCD32EAA0E54BE06A285029853A300';
wwv_flow_imp.g_varchar2_table(138) := 'D5300A14456C18005175A8297D084723C601E0E605860200C7FD274DA8E1B485154C6CD740B10F6BF4BCCA57388825C07B36ED06B05708EC14056F43AD58BCED8475035BDFE565C8ECCB73000CC3AD7BE4F4F3A74C7CEDB555140457D7249D0E495D35E2';
wwv_flow_imp.g_varchar2_table(139) := 'ED8BE2733EDD6CAFE6FB76366804805846D8CE0175C6A3BB3DC14C5D2676D470C2BC0AA64D928AC773C4C6DE54DE7C0DC0DB42601779621B209E20C827E0E3A9E3EF1FDEF93AC3701947E514390086F9B23F35FBC4BF0DAAC1F93521174052A7DEE7CBD0';
wwv_flow_imp.g_varchar2_table(140) := '1F67ECE1D00030FA212C86D322DB054047BBC492A3FB3163B25402B6CA7F14D80B52C9A83D66955FEFB7B7FDECD8B5FD2F0DF3576D89D3E5001881DBF8D8AC139790A43F0E64F56249348B880AEC0DC2EE2DBBF945381E3DDEF71BDB01260100FE9BF024';
wwv_flow_imp.g_varchar2_table(141) := '264D0870EC91FD34B98B6A02D807E01D0E5192F0EEF3847CA828F0CCFC0DD835025FAFA54E990360046FE7A3734FBCA8DA5FF94240F20C2983999220F45E5EB629465320A50DC2FD01A22D90F47A1F8D47E7C269510C64576775FFF1F307F6140B780D02';
wwv_flow_imp.g_varchar2_table(142) := '3B84E7DD2326B5DFB6E88EBE435A4A3C8297EE909D3A07C0085F6AC2E9C5878FD87771B55AF92F01D14992D01640168848445323A2B8BFDE682FF216359E6D21A94602D5091D037DF3E60E6C9D36956E2B0A79B73F192F1F7DBB12B5F9E320AF400E8083';
wwv_flow_imp.g_varchar2_table(143) := 'BC7007FA322EADD8F0FD9B7B82803E5293F21429E591526904F225492F6040E8F1285C751404240312D847902FC0975BA64FAF3D70CA29FBEE9AFD4BBC70A0EF9D1FDFF80AE4001805EBD80CB4BD3CF3C4799EE83D33086A67D6AAB4209072B2CA2A0BBC';
wwv_flow_imp.g_varchar2_table(144) := '8982D82A8BDEC682687FB063D2B37B2EDEDEBA89A851B8FCB1B7CC0130DA77207FFF51BD02FF1FB0DED654649828B30000000049454E44AE426082';
null;
end;
/
begin
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(688070063578592171)
,p_file_name=>'icons/app-icon-192.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
null;
end;
/
prompt --application/shared_components/files/icons_app_icon_512_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000200000002000806000000F478D4FA000000017352474200AECE1CE90000200049444154785EECBD09B86555752EFACFB5F739A75A8AEAA18A020A0A84A24010101B1A45FA460523A64CA34623C92331D1C4';
wwv_flow_imp.g_varchar2_table(2) := 'DC7BF3D254F2E4C5A84FF34C623E9318D39A5C92AB31E64A288CA034854AA3018BBE87A280A2AAA0A8E6347BCDFBCDD5CE7EADB5F7DA6777E37C5FC1397BCF359B31D75AFF3FFE39E6980CF44316200B9005C8026401B2C0C859808DDC8869C06401B200';
wwv_flow_imp.g_varchar2_table(3) := '59802C4016200B800800DD046401B20059802C401618410B100118C149A7219305C8026401B20059800800DD03648111B6C02620781498BB0018E7C0D8012010FFC6011602610B0801B41602D313C0813F062647D85C3474B2C050598008C0504D270D86';
wwv_flow_imp.g_varchar2_table(4) := '2CE0B6C0AF0207BF0A1CCA81E52D6019071607C0620007035800604E0B18E3409303010366C43F00D31CD8C78097436097F8C7809D33C0F3E3C08E03C0B3FF0CB4C8F66401B2C060598008C060CD17F5962C50DA021F05E6EE01D6B3068EE31CEB387038';
wwv_flow_imp.g_varchar2_table(5) := 'E758C162F05F1A020B018C036808C007A298A0E85F083006700E70C4FF8F9400410842609203BB00BCC0185E0A436C0B802719F0E3258BF1E0E777E1A9D29DA4826401B240CF2C4004A067A6A786C902DDB1C02F3671562BC4D90036708E351C58C98125';
wwv_flow_imp.g_varchar2_table(6) := 'C2C317DEBD007CF14F3CFC11BA27FFE4DE88CFC44FFAFFF4BBF4EF56FC95500784E73FC5815739F07C1060C7C2397866F162DCFDD60B71F3855FC27DDD1925D54A16200B746A0122009D5A90AE270BF481053E0C1CCE025C018E8B38700462D05F28009F';
wwv_flow_imp.g_varchar2_table(7) := 'C5DE7C84D8C28DD7815D26003AE0A765E5CF6DE440AA236401A683067635195E3C6C159E7CFD19D872F97BF02DBC137733169106FA210B9005FAC0024400FA6012A80B6481762CF073C0C231E035CD0097B778E4F11F1FC4C01F017D01505BBD7B9B1A60';
wwv_flow_imp.g_varchar2_table(8) := '2301FA67725BD1EFC99AC29CB9C0BC05D8B57C199E5C7F021E7FED29B8EFF0A370E7C421F82F1C89EDF801A6D955143FD0CEFCD33564814E2D4004A0530BD2F5648159B6C02F002B9AC00604B8ACC5F146002704B1B7AF00BFECE9BB3C789BC46F2B2BEA';
wwv_flow_imp.g_varchar2_table(9) := '4AD50379B806F06BC4234C0ACC9B00962E030E3D14AF1E731C9E3D7E3D9E5EBD0A0FCF5B847B3183FB275B78FA400B3B0FFEA928B6807EC802648159B0001180593032354116A8C302D7004B1BC0E9AD00E781E31C00C705C00201CC3238EB9EBF6F3DDF';
wwv_flow_imp.g_varchar2_table(10) := 'B5FEEF5AFB2FAA4B271D598C41124538A7091CB21238FA6860DD6B307DCCB178EED0D5786EBC81C7A75A78289CC6C31C789435B16DCEABD8C6AEC6741DB6A33AC8026401D3024400E8AE200BF4B9053601CDDDC01961808B438E73C1B0BE012C12DE750A';
wwv_flow_imp.g_varchar2_table(11) := 'FC45DE790ACC3E8FDFB7CEAF5F27DA4BE30A52F315A9011119E071D4E07810A90138FE38E094538175C7205C781076CE4CE3A590E159C6F13080875B1C8F36191EDD15E2B1437E167BFB7CAAA87B648181B2001180819A2EEAECA859E0A3C051611CDC77';
wwv_flow_imp.g_varchar2_table(12) := '09673805F1BEFD3C984F43661D98CBA801BA0AA01381325EBFBE2C60AB53AE479017F1F79C7160F56AE07527036F7C33B0E62860E600D06A613F18F680E38590E3D120C0839CE121CEF1C0DC7978805D899746ED5EA0F19205EAB6001180BA2D4AF59105';
wwv_flow_imp.g_varchar2_table(13) := '6AB08090FB271A388F87B82A64EC5C1625EBE1D6E03EE155DB00D8F5996B8D5F066D1709D0257E792BA1AE04E8AA834D214889C0FC39C0860DC0396F014E3E056804491202A17208B2C0C119C36E00F773E0C700B622C4FD9CE3FEB9EFA3BC0335DC7254';
wwv_flow_imp.g_varchar2_table(14) := 'C5085A8008C0084E3A0DB97F2DF0DF804533C0893CC03B00B65138C853C966FB1C7C6328550055426CF1AB0F98CB7AFC7A1BB6BF65D02F432C645220976F25CB196B5602975E06BCF61460D1A27CFFA2D8C728521336A20C06C0F4241086788071DCC981';
wwv_flow_imp.g_varchar2_table(15) := '7B10E011D6C013E3C036ECC01EFC32A61833363AF4EFC453CFC8023DB00011801E189D9A240BE816F875607E001CCF817343862BC1D81922355F9A5F57DEBF2FC3BF8B041401B32BF8CF07FA2E8F5EBEC6F5BB6F2942FE4E10810513C0F9E70367BC215E';
wwv_flow_imp.g_varchar2_table(16) := '1E10A0AFC7200832D06C004CA4356A01933351DCC08FC0F163CEF108181E9B40A40CBC84107BD9077080EE3AB2005940B5001100BA23C8023DB4C02660CE3E606D10E0AC16C7E59CB1B31BC04102F85DEBE82A98E67420FB7C169604BAA506A4818213E3';
wwv_flow_imp.g_varchar2_table(17) := 'C0E9A701E79C03AC5B0734C7DC93245E62822444442126033B8188043C1CFDE37898B7F01803B6CF998F5DD88A3D6C937557630FEF046A9A2C30FB16200230FB36A716C902C202EC3780D54DE0EC56105C0E70B1ADEF50F185EEEDFB82F29C6A80EE8A3B';
wwv_flow_imp.g_varchar2_table(18) := '0885EED5CBCA411535A0C8F3F7D5658B3D10EBFE6363C0F1AF012EB8208E0FB02901FAAD245E6841003493930DA6A6718003CF3286A7798847791029040F34023C36CDB16BC11AEC646FA5EC84F4488EA60588008CE6BCD3A87B68814DC0410780D310E0';
wwv_flow_imp.g_varchar2_table(19) := '3D00BB00C091E2414CBD7EB96BB6C0391D307382303B6A800EE6AEB5FF2A04C2A676081220A4FE23D6003FF12E60FD06A0D98C8303CBFE4471030919989E41088697C1B10B0C4F70E0AE560B774D303C3836072FE00076D2524159CB52B961B000118061';
wwv_flow_imp.g_varchar2_table(20) := '98451AC34058E08BC0D8D3C061AD001B19D80742605DFA00BA415D0BF693469A5ED3CE9280CD63D7D7E96D6A4099403F1D9F6DF5BA62026C098D041158B210F8F9AB81D71C078C0912D0C68C47C71C26C184E2FA569C2F791A0CCF00B8ADC171D374807B';
wwv_flow_imp.g_varchar2_table(21) := '580B3BE62EC02EBC1B7B2990B00D43D3250363012200033355D4D141B5C026607C1FB06C1C780302F6DB0C385900909EC1CFE759A7DFD980D326A10B6433D483E483228FDD07D8AE7EF83E978984AB6D3D91917E68D18C38D2F060E0E73E081CFB9A7879';
wwv_flow_imp.g_varchar2_table(22) := 'A0D39FE8E527148224A0501C883C39199D6CF81DCEB1B905FC606C06CFCD30BC3C7F115EB9792BA6DFF2BB681129E8D4F2747DBF58800840BFCC04F563E82CF061606C19B02C004E4123F82970FEEE0018D381DF95C5CF05C4AECFCD93FE54121081B425';
wwv_flow_imp.g_varchar2_table(23) := '40B0AC1AE08B4590274F5726F4EF6CEDE90442FCAD8F47F4FDA823E2E580BA48807ED3098540C40F349AC0FE497016E02EDEC2F742E0CE468827A6033CC7395EDCD9C0BE23E7D3414643F7D08ED88088008CD884D370BB6F010EB0DF03E6874D9CCE43BC';
wwv_flow_imp.g_varchar2_table(24) := '1D60573286C32360D4BC70DBDAB7CD632E03BE69191711508883546111D1D095893260EF1B970DEC0DB52269442713E285B5E104E0ED97036B8F8A6302DA5A0F28711BA40185228660521C62CCF118E7B817C07D222B61D8C2238DB9787CDE04766339A6';
wwv_flow_imp.g_varchar2_table(25) := 'F156B458D77A53A2C354842C50D10244002A1A8C8A93057C16F865606239B0AE15043F0DF08BC0B00140D390E91D727C5D6A80B92C60AA0119B05B48890DF45DF2BD7D0922B652598223931EFD3AB90E110F20F6FFBFE10CE0D24B80430F49B21ECDC26D';
wwv_flow_imp.g_varchar2_table(26) := '29020AC50E83995644E45E640C4F30E05130DC1F72FC300871EF8E3DD8FEFC7CCC9CFA61CCD052C12C4C0A35D19105880074643EBA982C105B6013108C012B5B41F06E0EFE3E30763C80B9A1E49E965993B705C1D900D106983A6817C50628E51D24C047';
wwv_flow_imp.g_varchar2_table(27) := '046C84A08A9A208FC155974DF9102A8A2001975D02BCED6DC0410745590167F5270D28148484017BC1B09373BCC018B6862DDCD20CB0655B038F886502BC1B219181599D1E6AACA405880094341415230BB82CF05960EE1EE04CD660FF37033B2304E6A8';
wwv_flow_imp.g_varchar2_table(28) := 'E096C39855EA96C0B7C8632E03C832681AEBE8895F6E055CCFB2800EECEDA8013A46BB96356CC440B75B440200FCE22F00AF3B1560C9D9013DBF4B195AE09801C73E162722BA9ECFE0FAB9C7E22EBC052DC1166899A0E7B3441D482C4004806E05B2409B';
wwv_flow_imp.g_varchar2_table(29) := '1610417EAB80639A41F0AB007F2F676CBEDB2BCE2578D9A3CFCA4B17DA5400170097F1C25D24402613599F3C24A00CF9D0D50ABD8D221260EB93AB4E913678C562E0833F07AC3F213A41B0BF7EC4590431A313C02F9211DDC839AE6721EEDC371FBB973C';
wwv_flow_imp.g_varchar2_table(30) := '8203D884692204FD356DA3D41B2200A334DB34D65A2C20D2F78E01EB10045780F10F012C0AF0B301A4FA9949020C70D3D4005F9D65C05F2FA392018732215FA41D3AA4F7472BAA6C3D74F55D7CEE5BEAF09100BDCE690EBCF934E01DEF000E5D35FB4B01';
wwv_flow_imp.g_varchar2_table(31) := 'A56FA8980C881521111BF02218EE0C43DCD668E02E066C9BDA8F1D0BAFC12EC6284571699B52C18E2D4004A063135205236401F607C0D12C082E05E35772C65E9FC9FD9635743B40C79F5AD7B65343D6A406E8A444261BFA5243DAA3F4F3E8DA126A80AB';
wwv_flow_imp.g_varchar2_table(32) := '0D7928B6323672E05B12707D27D6E0E7CD890302C5B901F3E7F73109904E6904A2F4C32DCEF12A38B6B200F73638EE9B6178B8D9C46313D7E349F6CFD9595023F488D15067D302440066D3DAD4D6C05A6013B0645EA3F17620BC32043B9D33AC1041E102';
wwv_flow_imp.g_varchar2_table(33) := '981459DBE3C117A90156A0E46A26404331F078E87A5917E9D07500B91F4544C0282BCD701955A49DF1182A04078E3E0A78FB65C0FAF571A47E9574C1BDBA2945CE81A49F62F142E43ADA07E059703C210E336A34705F388D1FCE6BE07E7675F41DFD9005';
wwv_flow_imp.g_varchar2_table(34) := '6AB50011805ACD49950DA105D8271B8D4B1AC0FB39F8EB43864318306E8050327019305DE0A802A33D36401103DA5816702D0F1493807C64B24A2003AACFEBD795059F57EFB2A1263E389715D2724205181F03CE7A537C70D08A95404BF8D703F2936624';
wwv_flow_imp.g_varchar2_table(35) := '8CC6239609C4B1100C538CC73B0BA254C50CFFC543DCB67F1CB72FFF20F60CC8D0A89B7D6E0122007D3E41D4BDDE59E0D3C006DE685CC3C02FE50C2B65E02F92D7A35E3BBC7713E0DC24400650BDBE7680D894FEF3BDFAEA7771ED0A89513AE3DEE3EF6A';
wwv_flow_imp.g_varchar2_table(36) := '23AD4FABC6BA1CA210208BCAA1F74D0404AE59152F05BCEE94EA8706F5EE2E535BD6C880F85210821930EC03C71E0EEC0E18EE0D19FE2368E1DBF37E11CFF64BDFA91F8367012200833767D4E32E5BE04F81430E8C053FC9397BAF483CC780B902A2CBCA';
wwv_flow_imp.g_varchar2_table(37) := 'DD0A004A24400740D53B3601D70A981597046C606B93E6DD63CBFB958D4BAAD447285C9EBC6D5C2EA5C045168C31241F9CF566E0928B81652B80B0DF7605B471DF8A6502F193E61D10BFB738A600EC42881D1C789805B8AD35855B0F9AC18FEE9A8F99D3';
wwv_flow_imp.g_varchar2_table(38) := 'AEC6741B4DD12523680122002338E93464BB053E0DAC181F6F9C1B02EFE11C6F02B022F5BA5318B481A7EEADA66E9BE2A57A40532702856D240564F06D0788F56BD2BFCDBA5412108D4B1B8F0DECF571942DA37BF74524202D2F16D157AF002EBF1C38ED';
wwv_flow_imp.g_varchar2_table(39) := 'B4F8E4BF418805A8FA3C8A7189038CC4FFA75B102B20BB18B083014F73867B02E0AE26F0C034C30B2F8C63D7DA0FE040D536A8FC68588008C068CC338DD263813F019662026F0CC3E08A90B1B339C79101D0CCB6CC255E770E683924B980370525518778';
wwv_flow_imp.g_varchar2_table(40) := 'C8A22B2A2C09B840306B592201BA47AD7BD3368F5BFECC555EE97B64BF745B7B6CCC744C7A5F6553FB721AC8C4C96647DFB86C631248287ECE3913B8EC3260F1C1C991BFC378F78BB1C64985A2A04791A6581C6F1C72BC0C8E9D41806D618887A31D060C';
wwv_flow_imp.g_varchar2_table(41) := '0FF0069E6AEDC3D38B3E869DC3680E1A537B162002D09EDDE8AA21B08048DFBB784EF39C20C4251C782BC08F67C0BCF89878D3CB950FF2C97D62732DDC06880AC055200255D40017A89701525B821E9B42A01F335C8608E84A850CFC3612901126E91E2B';
wwv_flow_imp.g_varchar2_table(42) := 'AA23B5935001562D07DE7505F0FA33800323E4FB5AC880D839F08A48530CE031B1B380733CCA1A78B0318387E6FE129E1C82C79886D08105880074603CBA74702DF027133896F1E67BC0703E0FB19E332C4D7D5C19740DA95B036F397C4F072919C80C00';
wwv_flow_imp.g_varchar2_table(43) := '2B1D1B90F62AB6B5D55BAFA006D8647917719097044CD0761F35EC93FE7D8446EF874E045C2440B92EB1EB05E70257BC333ED697CFF23901FDF05488E501F14F2803C28ED3AD789B61C0F072083CCB80271146A460EB18C33DE33B703FDB444988FA61EE';
wwv_flow_imp.g_varchar2_table(44) := '66B30F440066D3DAD456CF2DF02560E1D4D8D84F878CBF93739CCE18168B4EA55E7F0E74B98F6F48DD060950A1D9EE39E7009E7D5F12B8756222B7A62B0B36309749830BECE5CFF5FAE5BFD565013709F0D5514402D2F9304947B9D3054576C0630E07AE';
wwv_flow_imp.g_varchar2_table(45) := 'BC224E113C2542E646F8270D208C48411C4418A72746144CB89D034F72E0B100B8778AE3072FBF84BBD66EA2B88151B86588008CC22CD31821807FBAD97C3D6FF077F190FDC418C372F106CCE47EEBD1B539741A4B0256195F2B9FD8DD0BC01E12A0D28A';
wwv_flow_imp.g_varchar2_table(46) := '587CD7EBD2F3FCA7056CDEB20B787555C1A512982429EFA1A29A481D77A9013E954006FE741CBA9A622318E967D191C10170D105C03BDF094C8B9C00BAE146F899487716A4C71B0B5B09A56BFF3476037840C40D04C0D65680FB798007F61CC0735F7A05';
wwv_flow_imp.g_varchar2_table(47) := '939B482118BABB8608C0D04D290D48B640E2F11FCF18BF88717619184E17682003BFEE69AAE0E92701A6E7DC0609482A3140542310A92651CAA39788854B3A2FF3B90D680DD291A0AB8B04E8362AA30EE824A0480DD049CC14074E3D1178CFBB8165CBFA';
wwv_flow_imp.g_varchar2_table(48) := 'F0A0A03E7B4C0510340260AC11FFFFD54908133ECC800718F05018E0A1A6082A0CF0D481265E59FC2DBC4AA98AFB6C12DBE80E1180368C4697F4BF053E0F4C4C8C8F1FCBD9CC5B386F5E0CF0378F010709AF3FF5A34D208BC76502A3960340429BE8D782';
wwv_flow_imp.g_varchar2_table(49) := 'B8001B00A61654BC6A4F70A00A9A66E220F120EB1EBAAE061479E3658139B58F6CA7D4AAA9A79EB5A5DBAAE070211BD08BCFCACF555C43140CB812B8FC12E08C338029DA195FE9A115EA40440618B06F2ADA6AF834031E671C8F86011E095B7878AC89C7';
wwv_flow_imp.g_varchar2_table(50) := '598817E6CEE025F631ECAFD40015EE0B0B1001E88B69A04ED46981BF9883B533ADB17318639730846F6A80AD1600A2C682F953F0CAA09D0367EA8327444103377997801C2D6F2715F98865404D19483B6A80CBA32FCA20A81303DD9BB61198B44C1A1390';
wwv_flow_imp.g_varchar2_table(51) := 'DB36B7511912E0ABBB4C3F5CA44520D6DC39C0B9E700975E2A6DC5ACF3461BF6BAC404248184421510FFC4724A8B6307E7780EC0D301C3439CE341063C1C067876E1389E6357E3E56137CDB08C8F08C0B0CC248D035F0416B189C6592182B7338EF338B0';
wwv_flow_imp.g_varchar2_table(52) := 'B61925564F00DB6AA318665CE7D41BE0AC65048C004892DBCBA801AEF6148F5A93F065A05341CFAE0688CBCB1C52E402595B7B3E0541FD4E234AA9FD67530DE040D0005E77727C4890580608477037406DAF85840CA45B0D85322082095B21F683633707';
wwv_flow_imp.g_varchar2_table(53) := '5E641C0FA0817BD18A62089EE00CCF2EF8553C5F5B1FA8A2DA2D4004A076935285B36D81EB80C62B63632789C87E20B80AE0C7053649DC190B667AAD2E004C4BEAC0E9DA2E1883BA5C5ACBAFAF194B211C32B1B00629CAC4A69E0041DD232F4310643520';
wwv_flow_imp.g_varchar2_table(54) := '1D8E4C011435C34302746FDED6765A7F11614B89D9DA23814B2F06366C00A66919A0F647330A248CB6190033ADE8DE9E61C01EC6F06370DC1D72DC3916E0D1031CCFFC6837B6BD7553740C32FDF489058800F4C9445037AA5BE03A607CD79C3987F0303C';
wwv_flow_imp.g_varchar2_table(55) := '3B60FCEA09E0CC166791C76F8B9857C1496F2F871BD91337805E2111E562037200348980E2F5A79EB20EF66DC606E84A43D6BA751BA323C780D4271F40DB88431912A05F57A60DBD8C4ED6D2BF8587BA6C3170E1F9C0D9E71001A8FE8455BB42DE6E2876';
wwv_flow_imp.g_varchar2_table(56) := '16881802418CF74EE109707C07C077C1F1F07803DB0F8C61C7B32F60EF7A41186877413543D7589A08408DC6A4AA66C7025F04C6001C8AF1F1D705C04F82F1778E814D28DBBD33EF59055DB987E6379D91800870B54AC50B502514F636741033BC6A8F1A';
wwv_flow_imp.g_varchar2_table(57) := 'A0921419765550D7970464CFBC1D20D6AF7793807C743685C3D6B6AD2E178173A90182002C980F9C751670FEB9C0F8F8709E0D303B4F5DFBAD083230DE8C1313ED9DC40E307C9F717C1F224531C733FB81E7C6E6E1A5C59338808F604A1CE1D07E6B7465';
wwv_flow_imp.g_varchar2_table(58) := '150B1001A8622D2ADB530B88D4BD87024B3031F1BA00E16500BBAC01AC156F0B23025E4154531E778149FC790EA2369093C14986F30CB47512905C90130133814E110866FD90EAD6D5039D08B8005A338D65D783A90614D5A5BFB165A057298F46882CB6';
wwv_flow_imp.g_varchar2_table(59) := '52C791CF88AD0D17718ADAE7622B481C0770D185C092A51407D0D307586C354C76170832B06F1AAF02B89F01F78AFFA3854766381E6B326C5B388E3DEC2398EC757F87BD7D2200C33EC34332BECF02730F9A3BF744F0D6DB39C7A5E298DE06D0B49DF86A';
wwv_flow_imp.g_varchar2_table(60) := 'B80FD9075589400C2FAA079F1B54F166938FD316520092CD9F7E9683A9DA5317A0CBE05B44044CF074938D0C3C4B1C316C273D2A38DB80DB459674C2A3C750B808850BF065422713B1460338EED8380EE0F023281F403FBD0E44EC80D85920FE7F601A53';
wwv_flow_imp.g_varchar2_table(61) := '60788A713C02E0BE30C0F718C70F2727B07DC5351151A09F2E58800840178C4A55D667814D40F32860CDD4C4C4BBC0F8BBC1715200CCB181AF0EB64A2F4A90001D5C64A8D73D6019A04CF541230DBAD79EFC5D8608E8A0AA90840E0E1592C72A9926D35E';
wwv_flow_imp.g_varchar2_table(62) := '3310D5A6D2464674F07581B76AC3F82F835C19B63109976D9E6C7612E5C492CC118701975F061C773C30432168F53D9C35D694EE2E10FF9F0921C235B7436C2F64F8D6CC34BE3973008F2FFF5DEC658C96076A347B941A9A7EC802FD6801F6F7C0C2FD73';
wwv_flow_imp.g_varchar2_table(63) := 'C7CF0B38BB069CBF419CD4A77BC96ED08E87A4809102C43A4CA9406337481535C01D2098019F0476B69D02368FDA00E0360F15B21180A8EE9AD400DDF63A61CBC756ED50212B694826CB463CC4B90087AE002EBB0438F9B5A400F4E383AEF7290D268CE2';
wwv_flow_imp.g_varchar2_table(64) := '673866C0F00238FEA5017C69FE323C84F7639288403D334904A01E3B522D35598003EC73C09CF90BC78F189BC67FE7C07B1A0C738427A707D8E94DBA20DD4502CC0D7AD549800EA42641F1A8014E0F5E864775DB60DA4303503595C106F0F16766DE00A3';
wwv_flow_imp.g_varchar2_table(65) := 'ACC50B77112FD5ABCF4997ED7319BC7535402F6F6CABB49C84E86A5BBE2F4446C0A58B81F3DF1667041472B39BFAD574135335B55A20DD6A3813622763F84BCCE0AF5E1EC353877D1407880874666A22009DD98FAEAECF02EC6F817933E3E3472008AE04';
wwv_flow_imp.g_varchar2_table(66) := 'E3D70038C458B58FBD02E78FEFE55E550DF069040660493DD2C159261AD17732582B2A400EA0324CC9E06B5305A228780DB4FD9EB2190B6153166CE446FECCDF867D5BA19B04A4F444231116322293201BD1916D2448E3A28380B3CF06CE7A1330463B01';
wwv_flow_imp.g_varchar2_table(67) := 'EA7B6267B92609AC44F6C12F4C3470FDC4023CCEAE8E960CE8A70D0B100168C3687449BD1610DBFAE64C4CAC9D0A705100F633003F990122899FE4ADA9705C74C67B5D6A80DF5BACB22490D3008304240355802B32B1AA04E8802B036146123C4B0226A0';
wwv_flow_imp.g_varchar2_table(68) := '6B364D2A54BC7D8DA01479FC3E40D66D29C74EC823ADA206F88898E88BD80AB87001F0A637006F790B30670E6D05ACF7E9ED596D2DCE71330BF1D78D39B871FEAFE0055203AACF051180EA36A32B6AB4C097818383396357862CB89283BD11E08BE3BC62';
wwv_flow_imp.g_varchar2_table(69) := 'F98F1DA6F208B2D25EBFAB4ED9237708C4FE36E26F7DE0A87AEE79795F06C11CE0552250AA1D8D08C87BE5EDD717908D92C9835C7D53E98C990DD1BCAE5A6C808B08080560DE3CE08CD38173CF8D7FF7294835DEDA5455B72DC0C019C78B2D8EAF8621FE';
wwv_flow_imp.g_varchar2_table(70) := 'EA8925F8E169A40654B23A11804AE6A2C2755940ECE93F6CFEC40541886B18700A07560AAFBF1C986BA542FFBA6E5D6A80EC719B7650D500D3DBD625718D34489EB61C8827EAB11DB4E35303B2F2729D05A984D5DE38D2156B6A80AD0F3E8F5C511634C2';
wwv_flow_imp.g_varchar2_table(71) := '64BFCE420224C3BADA923F4F0F053AF575C0F9E7C76A009D0950D753DC1FF5708E7D41807BF80CFE68D1527C935D8D7DFDD1B3FEEF051180FE9FA3A1EBE157168E1F37D50A7E0360178B182D7021F773253CAB18B4B51209BA145F67836E531A70670C88';
wwv_flow_imp.g_varchar2_table(72) := 'CBDADB719300192C7380D23C7BA9D2EC572993A06FA780AA3048DBEB2A90807464B6BAB2313B4880CDC3F7A9013E82A45EA711253D8622993ABDCF69FD8200CC99004E3E19B8F002E0A08388000CDD0B251E904809B233043EBD783FFE946D221250669E';
wwv_flow_imp.g_varchar2_table(73) := '890094B11295A9C5025F9A376F15E3ADF70460BF00C6D6224EE99B8369A4CDAAA0E86A58F7583354D6A46FF9FAD2E440425FD7353E122083BD0B18E5511A9EAC06DABE130645FDA9C7AFF755C94F50F23C81B8BFEEA3926562622735B9C55D1EBA0EFEBA';
wwv_flow_imp.g_varchar2_table(74) := '8DE4F1C8F32CD7A7CBF8AEB60401102980C516C00B2F8C03024901A8E571EECF4A3866428E2FF1297C62E9263CD39F9DEC9F5E1101E89FB918DA9E7C65FEFC95D3D3D367A1197C8833F626702C14379ECD6BCB17688B898095042468E25AE7AD04E81910';
wwv_flow_imp.g_varchar2_table(75) := 'FBAEB2A90179CF6C5EB009DA16C0D59A948F1C8E69925AC0B6C66F00B4462C54BA652E51E8A34ECBCB24C005BC459FA737BBABDF2609C869425AB7BCFBC1462A223B2704E0B527C50AC0A245440086F64583789B67C82335E05FD934FEF0A0DFC69D141C';
wwv_flow_imp.g_varchar2_table(76) := 'E89E712200C3FC34F4786C7FB370E152DE6ABDB9015C19727E0118968B757ED7B1ECAA77A9C25339E0964AA51EAFE342577DC6E752A7CAF5C1D41C0CE04C8A989F17270F4AD5809462E824CA4638DA016E196E0BDB300E3C8A0758789D64075D35D1C94B';
wwv_flow_imp.g_varchar2_table(77) := '5E574EAEB2323A5992E30B120270D289A400F4F875306BCD8BF4C22D8E49CE712363F8DCA225B885B60ADACD4F0460D66ECBD169E8F3C0C4E2050BDE1886E1950C780B80750C982B7BAEA5C03473E3F5D7BF694BB53E8D08781A9B2D2220D3191B30EAFD';
wwv_flow_imp.g_varchar2_table(78) := '97813CFA5D1D522694E844406EC7E6152BDF3B22FB53EBAA64C21190A781ADAB4DB94E1B49D109805EC646968C6B741B25F10262094010800B48011899979050025A1C0702866F3780FF6FC10DF82EBB1994085ABB0388008CCC23313B03FD9B89896359';
wwv_flow_imp.g_varchar2_table(79) := 'A3F13300CE07D86B007EB0B8C954AFBF18D03320C9D0AFF81A2F09D05D52C91C7593007B53B9E76A03401BC0159100550D50F30CD88058F7AA5337DD06B6B631948D0D7081B78D58D86C6FDA22BED2CC1B90DB54210352A5E912C0892901A01880D97911';
wwv_flow_imp.g_varchar2_table(80) := 'F4412B320968019F58FA9BD8D207DDEAAB2E1001E8ABE918DCCE7C61D1A2C58BA6A67E2664B88A33761C80250C60F2DAB5CF6FF78270F6A5BE21AE8212902044C7B1019A97E9DB80681F933B79900E724606410B2A476099341403A74A94E43E188422F5';
wwv_flow_imp.g_varchar2_table(81) := 'DE4B9E2790375FA00674789E804B0DB09300B957D2F6C5D426C912802000621B20C5000CEE3BA69D9E473101803812E27A3E83DF5CFA3BF8713BF50CEB35440086756667695CDF00E6BD346FDE790DC67E12C0DB02F015E2DDAB78FC1240B920DB450014';
wwv_flow_imp.g_varchar2_table(82) := 'CC8B0A159300DDD3D4F5F37652092BFDB3FC515A4548DCEED4CB35FB9A6FE193A1DCF08A3522A2132DF95862D9863A2190FBE13A9257943183368B4980DEAE3E661DE8757EA3F42D3194EBB3748EF5F18831A54B008200D036C0597A31F45133514C4018';
wwv_flow_imp.g_varchar2_table(83) := 'BD38FE86CDE013076FC2637DD4BD9E768508404FCD3FB88DFF2D303F983BF7641E049773E03206AC6F004C84DF9A5736453F000020004944415431EAF65CF5EAE8FD3BEF33E08A7E51A1A41CF81AAEBB33235C2932A2A1557C8DFB4AF31B3780CA23B491';
wwv_flow_imp.g_varchar2_table(84) := '80AC25A952F1766346309E7CB57DD7850EA8B6ED75692DFA187C070B65D36449F863D6537C6E804E947442A4DB29B591D8F2971280F3CE23056070DF389DF57CAC014CB7B01F21FE6C3AC4A7576CC2F6CE6A1C8EAB89000CC73CCEDA28BE0CCC191F1B3B';
wwv_flow_imp.g_varchar2_table(85) := '8E379B1720082EE2C0690D60A1B2E7DC450292B7B21BB07DD02BE70B284F024C0F5B25023250E9462C452C94427E1A60AFAFF83C01955AE4E5F5BEA77FAB80ADED2C900629F74701D4924B022ED03566272968900DCDE0721F64C54127207ABFCD3C08F9';
wwv_flow_imp.g_varchar2_table(86) := '98450C803800E8A40D802000A400CCDAABA2EF1A9A68025333516E80CF862D7C69E926BCD2779D9CE50E11019865830F7273FF343171ECCCD8D8B92C0C2F11C0CF183B340DF0AB04EA9E643D0EFD20339B8AB732A4C4454A81B65ED273C2A08F9258B05F';
wwv_flow_imp.g_varchar2_table(87) := '81D7F27D5103F85C1EB20A7C9A8290D834034E23C25F86EB72E716F88EE4B5F5518F59B011813224C0A477EADCEA84C09E3320AE25250027A6046021E50118E47750277D67222849E41BE5F801804F1EFC1A7C9D5D15E50C18D91F2200233BF5E507FE0F';
wwv_flow_imp.g_varchar2_table(88) := '8B162DE6ADD605E0FC321625F2E1470549EECD725EB345DE97BC427B4F4A7AD38A1B5CF21A1B9DA89D04945CD250065FAC06E82420034B0D916D6A806C1D1944758F5A01E00AA70BA6306DF3D8B336DA50036CF798DE86DC678564701E29008200BCED6D';
wwv_flow_imp.g_varchar2_table(89) := 'A400947FEA87B3649228688A717C1D1CFFEFE24DF8E1708EB4DCA8880094B3D3C896FACA8205E780F32B3863170310C01F1DD813FD7344D3555503DC9E7B51467EF7B24069CF5DDB605F778060F97EA4B798FF5021DD3B3682FD7462658DC82FAF0644ED';
wwv_flow_imp.g_varchar2_table(90) := '6975DA005E7E400AB70B5AEA93413BB7845DA9306D90B79EDD9BC947F136408E0D290120056064DF65E9C09B7150E00E707CE1E0B9F80CFB6FD833AA46210230AA33EF19F77540235CB8F0E856ABF59680B10F058C9D2E5EACE63AFF6C90809C1EB88945';
wwv_flow_imp.g_varchar2_table(91) := '32984C0D5001CE3654678904410ADBB254AA5C23FDE1A3314564A9C8D38DADA301BA56696A16C533766C17942F95DBB66DE774A5F14DFBE4AC4B627C4A1BF2344ABFDB6C2093461B21C988401203B06103C7DBCE2505805E77B10592A040E1FDFFE692DF';
wwv_flow_imp.g_varchar2_table(92) := 'C5F5A36A172200A33AF396717F11185B3067D11A345BAF0F0091C5EFDD0D204A9FE54ADF9BBD882DAEB3DBFB7540A2373620AEAD9447DDE543857CFDA88F04E4E37501A9E887BC29D20042CDD3F61D2A640362DD139789840D8075BB14EE12D088804A50';
wwv_flow_imp.g_varchar2_table(93) := 'F21B54FEBCA85DDD06690CC0861338DE9A10009FCA43AF83D1B040B214300D8EFF390E7C7CC188EE0A2002301AF77BE128FF66EEDCD50DC64E6904CD4B80F0F2066387B5B879488DD79BAEB424E026016E80ADB22460FA8D7EAFDEF26D823CFEEB4C8B18';
wwv_flow_imp.g_varchar2_table(94) := 'E53320F6D19772870A99202B6F8A2C77A8900AF66A9F8A403825013A10DB484AAA04F8FB6C6E11B5F5C1E6E5CB9677F53B250027240460E1C27C49A3F0A1A002436D81F1786BE0360EFCDED24DF8F3A11EAC637044004671D6A5317FEDE0830FDEDF6A6D';
wwv_flow_imp.g_varchar2_table(95) := '60C0659CF30B19D8490D208893669B80E587B0EA4B02D69C0149D3F6B6F24F0B813943ABE26BF2D16AB5A6E0ED68ACB00FB21B9DD8D46743DF987DE0EC55032C817CDD3E54A8133540DFD667231726BD33E305227B2589808E1704E0ADC0412206A0E826';
wwv_flow_imp.g_varchar2_table(96) := '1EF177C2A80C5F805F9229F03BC10C3E78F027F0E8A88C3D1D271180519BF164BCD701E3E18205C772C62E659CBF9B03EB9B8CCD6DD9C0A2EB44207E23BB3D67AFEE50BCF5AFA6438564095DEFD16C11019904147AD6DAA1C13AF0A5FC28AD53D7574AA9';
wwv_flow_imp.g_varchar2_table(97) := '011A59D3FB27F39F7496754037C0BCC6D305D3B300D6AFE7788B20007416C088BEF1ECC3160181D3215E01C3E797FD1E7E7BD48C430460D4661CC0DFCD9B77E8386BBE2D64FC030CFC8D0163D1497DD97AB2D509EE911A2035EBEB4129AFBA726C808596';
wwv_flow_imp.g_varchar2_table(98) := 'B4B15DD0456C9CEA87744FBAC65C1A9C25129001AD6ED39219046DC09D7D96FCE2EA976CC9C25D021652915E6F53036CDFA59FA54B00190120056004DF78FE2127A982EF02C7FB96FE3FA3755600118011791C38C0FE0E983736F7A00DACC93FC4C0DE3F';
wwv_flow_imp.g_varchar2_table(99) := '063445148CEBA5AA1F411B9BAA1A11706D15B4D7147FEA064C5710607E85D713CFBE749D4D68DE0CA9D7AA7CD30609F02B1C3EFAE21E7311D8E6DF6B736C09B68CCA2A5B06559BDAEE11D9738F7E9748800F94F3A2C5E709C86DB8EACCC0DEF22C470AC0';
wwv_flow_imp.g_varchar2_table(100) := '1870FC7A8E7348011891B75DB5612601813BC1F0C74B7F1F9BAA5D3DD8A589000CF6FC15F67E13101CBA78F1C24553534732CE2E47107C788261CD94E7581D058E346CB2026241747EF482AE1420E8270276B82C490232F4A94A023408F7900037B9712F';
wwv_flow_imp.g_varchar2_table(101) := '73C887D9D826D537E6AA6A8002E625D5001B10A7FD4CDBCFCA6875EA7D57C944310990EDE9233DB66D89E2B61B230250F89E18E5025176C01062F5F3A6FD33F8C5359FC423A3620F2200433CD3D71D76D8DC60DFBEA3C29999F338C74F05C0E962B8EEFD';
wwv_flow_imp.g_varchar2_table(102) := 'DBEAAB3AFBAB2409F0019F8F0474430DF02A015983329C94DC62A8EB1375A801867DDD8A80F94D4EC97490963D66991EC97544F782DE7EC925011D98957BCBA232B8EEBBC2ED821665C1A606A8C4224D562529006F0116D02E80217EE375383486C74476';
wwv_flow_imp.g_varchar2_table(103) := 'C0A59FC0973AAC69602E270230305355BEA342EEFFEADC25AB679AE10501E33FC1813731CE17B9F6F2BB40C5C0862E13011FEC59BF2BC81B5048022C6A80BB0FB1FD6520CD66240528C7C5BE3A95EF4A12017B7DEE34C22E22607CAE7BEE06F0E664C306';
wwv_flow_imp.g_varchar2_table(104) := 'FEB6766CE709B8AFB56C634C8C1CB55C920828FDE040730C103100E7A404C097D4A2FC63462587C802C96E805711E22BCDFDF81F8B3E879D43343CE75088000CD92C6F02C6D72F3CF8A200F8D910FC4C30B68281B3ECD5EA014D15583C7F6940A143A36C';
wwv_flow_imp.g_varchar2_table(105) := '522FF8555A1650C147075F83AC48705D48043274B1C2BB7187382D53871A60615D85FD577A58ED3C8174EE441BD13F9D84943C54C806EA699DD9773AC190FA9D7E95CEB2FAB7B6C5CF9ADED8AEE0085D571C077CDCF11CE79C032C3828927BE9872CA058';
wwv_flow_imp.g_varchar2_table(106) := '2039444B1C0CF40384F8D8D23FC0965130111180219AE5EBE61F7C7210841FE3601772C696312030C12A7E7B96F34ACB9180FCE5EFF24DDD46AE2536C0E21DE62D3A8883057C62A3E4B0E5B3918AD39A9D3C00531ACC9582550F16F29F272003B36C2705';
wwv_flow_imp.g_varchar2_table(107) := 'B065B0EEF03C017928654F18949705AC6420F950FECE36AE741BA02000670B0220960088000CD15BAFBEA10815600678A115E2B70EF903FC6589D0A6FA1AEF514D44007A64F83A9BFDCAC285CB2678E31778800F72E00800D9BC9A8023BD26BBA606F8FC';
wwv_flow_imp.g_varchar2_table(108) := '7173E4B5EC14F09280228AE23E54C83E129D5E584A856E92558E7C256D285E733582E55A5B97698E4EF11440D53C76357990E50C02B3CB19D1CCEE3A0DB855CAA5DA2CBE26EF840EF6BE5D0759D9E42C004100CE3A0710990043220075BE7E86A6AE6437';
wwv_flow_imp.g_varchar2_table(109) := 'C05EB1537A9CE3B70EFA03BC343483730C8408C000CFF037172C58BEBFD138179CFD52C8F969606C8E6B384E22D03535A01A09884A575A12F0ECA2778EA98A1AA0FA936DA9011E12E02316465B1D9080D44A8A172E01B5CD6B964F18343CF68225011DD0';
wwv_flow_imp.g_varchar2_table(110) := 'D3FB316D27EB47856386BD2440237E8A8A2165023CEE388E33490118E0B75DF7BB9E2C038460F8FEE40CDEBFFA5378B0FBADF6B6052200BDB57F5BAD5FB760C1F2808DBD01017E9A737E3E035B24B25A162596E99C0498B025BFD0E5C1987E9B3A5417A0';
wwv_flow_imp.g_varchar2_table(111) := 'D64902DC205B5252B764102C07DCDAE8DA5003ACF6C9BC67371D716904B2F7AC8FC10067C9F3963DE90CCC3D24A0D8A3D7D516757DDF4554F47BDB4628E47165DFA70A001180B6DE35A3769150015A21B6872DBC6FE5A7B179D8C74F04608066F8F3C0C4';
wwv_flow_imp.g_varchar2_table(112) := 'EA458BCE02822BC07011070E03C7783404E5CDEF06383B09C8A3BF9CC06CD8C901F1960A5C7EB7B7AD4AA70B7A76D1D7B253C0F4937D8A80D5326DE60DB0128E0E89800D64453BE671CFEA1EFDE8BAACEDF8779958147AEA2EE5C111D427AB0771D3E67D';
wwv_flow_imp.g_varchar2_table(113) := 'ED2302D1770901788D200067530CC000BDEE7AD2D5880070ECE121AEBDF9717CE6AA7F86080C1CDA1F22000332B5DF38E8A0635A8DC6CFCF709CC780750016A46BFDD98BD940A5929E6EC620F237713922A096CAFE729200BBFF5C2711B0AA2032683988';
wwv_flow_imp.g_varchar2_table(114) := '4CE1787BA806F848804FF5B18F29A7633278CB60AB7FAE03BB6B59200663F39EF0B5A3943608855D35AA924A384D051C1180B388000CC8EBAE67DD8C9202714C72E06BCBE6E27D6C1344CEB4A1FD2102D0E753FBE5238F9CB3F895577E296CF19F02C391';
wwv_flow_imp.g_varchar2_table(115) := '2170506044F7C783D052DD67FE96CF5B35C12577552B7BB9B210E1B8B8B21AE039BCDDDDBFAA470DBB7A95DF1C39B9497D4ECB77967BC95A73EDDB05AB10BD7CC6E591E8B62C5203B2FB2D9D734FF2A0B445D372B182A0C4E44964CD451C6C6A80752C89';
wwv_flow_imp.g_varchar2_table(116) := '9DC7C681638FE3787342002808B0CF5F7A7DD03DCE71DFDE1770FADABFC6813EE84ED7BA4004A06BA6EDACE26F62DDC4D4C2972EE001FB08673815C0E22448C5962D3F6B2C7A69DADEA8057B5AAC7E9BD7737624C5C96887347E0D5D7A4602A47E98E421';
wwv_flow_imp.g_varchar2_table(117) := 'FFC4452C721220435A3111A8930498844D96E57D94C8763F964B1E245306B9850874759BF2FCF66B5B0DD0EE3B9D38A8C4C09F3C486CF913044028006F140460016D03ECECCD34FC5727BB015E0CA7F186959FC363C33C6222007D36BBDF58B56ADEF49E';
wwv_flow_imp.g_varchar2_table(118) := 'FDAF43033FC9382EE28C1D1DE8981EFBFBFE63708DAD4EC55E6E676A800F522DE9669331E8E6774358F55D0271DDEEC385DA2101998DA28BCBAB01567AD185B880C2FBC2B8DFF3FB4207F7B4683A4A790C19085BA2F95DDB05758F5EB7BFA13A789604D4';
wwv_flow_imp.g_varchar2_table(119) := 'BEBACF13889600C6120270262D01F4D9EBAE2FBB13118010AF7060E38A4FE39B7DD9C99A3A4504A02643765ACD1781B1158B969DC483D6450CEC72066C0838E6A7112876602C21FD2A18D5260948DEE85E70563508FB5F5A05BEDE38BDF0BA960474CF55';
wwv_flow_imp.g_varchar2_table(120) := '99C0623B65F86F394BD1D977878D22F33A2EF2D9DC206CCA98DC57BA888F7CABE865C4DFFAF14932A0BB3208E665540AE4221B691BD9F79E00419D04C8F648BF4B0980580278D399C07C52003A7D550DFDF5491CC05E70FCD6F2CFE08F8679C04400FA60';
wwv_flow_imp.g_varchar2_table(121) := '76BFBA60C1F1AC397E2163C1859CF35319C372069EBF70BD60E55703A26F151290BF26CB834B523279CB17039C0A4D46F99244C04B382AE60CA8AE0614DB49E95FF447B9130655284C6EC014E87A4C04645097150059EF50BBA82D2368F76A3A4D454440';
wwv_flow_imp.g_varchar2_table(122) := '1FB6AE06B49341309A91440138E6354400FAE05537105D880800708073FCF98ACFE05706A2D36D769208409B86ABE33291C867AA397171087E3963380360AB9B4020BC7EC3B72F24017E22105DDE0611D05FF6F2DEAF6222605E6D71B4A38FACA09863A3';
wwv_flow_imp.g_varchar2_table(123) := 'D3DC55F30658370C7A6DEBEB99B1FBD23072B18D343FBE0B6A403BCB02FAAD228FA32840D00AD62987B464F79349471AE7A2DFAEA2CDE83B9D604877864A5E126222118037BC398E0110A4807EC8022E0B24A038CD816FACF80CDE35CC962202D0A3D9FD';
wwv_flow_imp.g_varchar2_table(124) := 'C6A2A56F03C37B43E0AC1038B2C13066BE742D6F2AE9456AEF7AC1B2401B24C004E82ADB05CB9100512A7FF99BE3F6BDB3AB9300075972DAB6020988AA568DECED7B36892AB26584CD32C9E5EA2B9F1B42A3200AED721101F1B99951375703F4FE47F528';
wwv_flow_imp.g_varchar2_table(125) := '24206F55056E8D5449942A1B7785D800590110048096007AF4C21BA466E31751C839B6ACFC2CCE1CA4AE57ED2B1180AA16EBB0FC57172CDE10048D2B59802BC0F849A9C75F7C54AFE9A6FA81C0FD6D3B4B02268CE76F73574B2EE8B796378767440ED64D';
wwv_flow_imp.g_varchar2_table(126) := '02AC54C94BB0E22F0BC7ABA09F9F3C78D58F2EA8013E7A681F977BA7404A0EF4799601DDF0D835FB1A39061CAA8F2F3640570BD2F653C5A039CEB1EE588E33040198EF8EB7E8F0D1A6CB87CB02E2D67C60C567B17EB886A58E8608C02CCCEE4D40F3D5E5';
wwv_flow_imp.g_varchar2_table(127) := 'CBD7F216CE669C5F11729C371160628A9B5B986CDD3160477B53BB01A93A0970019C5993F49AAFE35021A9611771486DE31C6F1B01824E486FF33C01D94B8DFBDB415C406293DE0608E66A890CECF27D2A3ED7096C99F304F2FA549224CFAFDCA6785929';
wwv_flow_imp.g_varchar2_table(128) := 'CB0FB61D089292C481C990E3A5F109FEF489A7707ECAA93871CE04E6D312C02CBCF406BC890818399E5EFE591C3EE043F1769F08409767F75F972C59C3803730B08B017661136C95D096F2FC924570977730A30B2509407C65C176C1D48DCB9AF12F2198';
wwv_flow_imp.g_varchar2_table(129) := '0421A960A00F1572D09E364980525B3457E54880DA0B69923B0810546E15ED0F3771B4D350FD56D10981F9BD44AFF4687EAB8CAFD231E3D64CBA25130E418EC44B2C7D91B580290EEC60604F71F0AD332DDC7DF092F0D18B2EC36B972EC5479B0156B6E8';
wwv_flow_imp.g_varchar2_table(130) := '34C02EBFF506BC7A16DF4F21C78B2B3F8715033E1A2200BD98C06F2C5CB80C6363AF63082EE2E0E771CED637181A19F02BE0E2F6AFF5BE2BAFC8D244A05E1260EF6DD23317AA1408FAA6E79CD217BFDF5F550DF0839EE5DBE423FB7525B66146A82EAE4E';
wwv_flow_imp.g_varchar2_table(131) := 'FD5799D0D9EF4CD51F96CACCE29240D17875F0976729056E15CE93185499D758B7F899A377110FD1A6C891D18A930FED601C4F72860718C73D6110DCDB9A99796813F004E7602FFD06DED79AC1279B8C08402FDE8783D666B21570D78A3FC29241EB7B95';
wwv_flow_imp.g_varchar2_table(132) := 'FE920250C55A25CADE74E491735EDDB9E7A4A0D9B824447809C04E6C80CF114E87D5F1F010010F9626EBD06E742A7A811BC4C2FA46AFA20648159456039C3EAFB1D0EE0445C92BB4FAAD15B70BEAA0250923D1AF95ED2A772ABA5885B3E239D65AED400D';
wwv_flow_imp.g_varchar2_table(133) := '30FA2F83B1736456AB2A8700E9F5AA04202572AA6595ED812588405AA7786109D017FF9F01F671F0A743E001067627E7ECAEE966EBE19727F1ECE780FD1929D984792FBE8C8D9CE3DA8620003EA39778C6A9C8F05B402403E21CBB57FC11160FF3688900';
wwv_flow_imp.g_varchar2_table(134) := 'D438BB372C5AB4762A98B89031FEDE10EC9426B0404068E8DDE41663820FE04A79AD6EE7D532423BB05BF02983577F1F7494ABB24BC08455A52D05A40C3455C6E605D3CAA70BBA0DEA22016E8220CD6F76713922A0B6A51A239B2F6D868BF0CD6D5FDFC8';
wwv_flow_imp.g_varchar2_table(135) := 'DC44C0CA1D2DD1FB650F15122DC56439AE397D4989FFC75B64B12D047F44803E7878331BC73D73F7E3C58F0093D65E7E18F35E9C8B8D9C1101A8F17537D455110118EAE9AD77705F5FB66C219BE6A78F058D0FB518DED9049BDB9213F994F5FADA5603B4';
wwv_flow_imp.g_varchar2_table(136) := '17B71334F3717BA3C1AD6FF42A6A40F2F22E481CA402A603EA1C68A6FA93F2B8EC731B83A559999734B8E2FD938B5CB5F9EBCC3855E76A80A8C1B39E5DAA1F1A6BA9B64B209F05B92DFD779DEAE8B7974D0DD0CEBD10455E01F02C387B1001BFA1311DFE';
wwv_flow_imp.g_varchar2_table(137) := 'FBC7C4DF257E784A00806B1B140350C26254242200200580EE048F056E58B972FEBEC9F098B1809DC7187EAD0976488BE719FC4C4873FA730A82E5A5CA039601889D9280DC0D932CE0825D170027AF7E2760C6D7951AAF05CDEA22011A062A33EE04C402';
wwv_flow_imp.g_varchar2_table(138) := '12E0AF53260169499F15643B59C85EE95D18EACD6C98341B939B3AD8BF71E7E24F5B4C49403A6706494882F9B2DB8E632A04F632C6B683F32743B0BBC0D8373E3E3DFDBDAA2FA58C00D0124055D38D6CF94C01F83C2D018CEC4DE01AF87540637CEEAA55';
wwv_flow_imp.g_varchar2_table(139) := 'E3F367CEE69CBD7F1CFCBCE954B6740295FE2AD4C14F6B2D7BA9779704B4B34BC0076EF6EFF2E8B562AFD433DE1A4840D4BF8A7101E94CB90153BF538AC13CB3535654F793DD8F9D8BECB5B35DD035A6C2FBC2E85EDE2B75242A39D44729FECEBC7D0E91';
wwv_flow_imp.g_varchar2_table(140) := '7D6D1F801DE0EC8110F831E77C4BA3D5BAF9A3C0EE765F444400DAB5DCE85E979C08B87B251180D1BD096C23BF0EEBC7E72CDBB52168B536B2001B1B0856B794154B7BA498FAA24DFF2A008A3A488086C8451E9C6DCCD1359623867D606E1281E4D55F3A';
wwv_flow_imp.g_varchar2_table(141) := '40D06E319B2A6F00A23408571F5D24C04F6EDC270B3A898F277190714D86E0C504C23AE6BA7609481DEBD692404E87A39910A0BF4BC8FB9CE16EB482BBC69BEC872F4C4E3EBCC9113B5BE5ADC43761DEF33BB011140350C56C235D36550056FE31290023';
wwv_flow_imp.g_varchar2_table(142) := '7D23C8838F22FC5FD9777613C1C742C6CF0A8079B61DDE8A53673AF61A3C15BFECF320C1AA6A801BFDDB2202866BE7835ED5F34BBDE8E8FF75C4065810772888403488DEA801561293DC285589807C7FC974375FDBC774C8F9AB0CFC49067C370CD92D41';
wwv_flow_imp.g_varchar2_table(143) := 'A371FF8E05534F6FDA19ADF7D7F6B36D13E6058200881800DA05509B5D87B9A28C00FC091180619EE7D263BB6EF9F205735BB8A801F6693076A4F42273427CF62EF79280922FFCB6D580AA24202EEFF49CCDEE663EAE4F1130FDF92A3B051C6A40EE4666';
wwv_flow_imp.g_varchar2_table(144) := '16F6D1296FFF2A2F0B58E886D4808FAA796D9B4D97C1B60A52106BB576410D28BC2F8CA749B551BC5D5F24EAE12F01F81E03BED69A6ADD16002F5E03BC5AFA61AC58502100A06D8015CD3792C53302F0A7440046F2069007FDEF8B0E5FCCC60E7C6882B3';
wwv_flow_imp.g_varchar2_table(145) := '4FCD38F6F3BB20CAA706E4D05CE165EFA8B0187C4D80B07A7C1294FA01D33C6CC65F5F5CB15A67987D50088ADA954679EBF07C306CDED675C70698E3F5D1138B7DCC431B8ACF21D0ED64DE5ACAC08BED9E1497EEBBE27B4D6E221A84D8BD37C9C57E7D16';
wwv_flow_imp.g_varchar2_table(146) := 'FE532308FFE9E7F7E399D97AB1640480820067CBE403DF0E1180819FC2CE07200293BFB56AD59A99C9D6CF73B0DF08C0C77D59440BBD3EC79B33F7930A3CDDF45DEC6115C52F67BB9BEA0602778DAE43852C8EB90774128B968E642FB0917578E589403F';
wwv_flow_imp.g_varchar2_table(147) := 'C40628BD8DFE5051BC18B44D36E43926C1492A0C02A3D8D677A745554E72CE5F06C38B8CF15B42C6AE9B7360E68E0F00073A7F32ABD5B0EDC39817346909A09AD546BB744600BE400AC0A8DE09EC1BCB97AF6BF0C6D50CF850002C8A0F11C9E1DA6698CE';
wwv_flow_imp.g_varchar2_table(148) := '48405A634E339CAFD9367306C423A84602BCD26F5A95D1D1AA768AD580620263D7194CD0CC67C7D5136F5B6D1C2C64B553D288EBBE2835DE0A2440B58E3ACFD2ED6B7DA68B8945E111C39C73FE62003C1682DF1B32DCCCC75ADFBE662FB6F7F2254204A0';
wwv_flow_imp.g_varchar2_table(149) := '97D61FCCB689000CE6BCD5D6EB1B56AE5C8B16FBC590B30F058C2F3683E04BE681CF7AA4C190E56D6BFAB6F927D697739B1904AD34C6CE09247B168C57755253AD22FA7F2960894A26F9DF3CA8E823587E8FD5AD4B78FB57990838ECE43958C8EB4BCBF6';
wwv_flow_imp.g_varchar2_table(150) := 'AB4004CC7B299F923AD580381686EF07E75B79C0EE04C39DBC851FCC9B9E7EE467807D713E95DEFEA404808B20408A01E8ED640C48EB6922A0434801189019ABB19BDF5AB16265ABC57E89835DC318165B9DDCECB55685085800BD9008745B0D906053EB';
wwv_flow_imp.g_varchar2_table(151) := '8BFDCDED19AF33F0CCE583C79366253EA5D50013D895FAAC63728DCC7E13F99605DC04C7BD65B0B25D153A95EEA2282087FA359AEAE323013ED2265B9B733C11707E1307BE1B005BF74D4F3F3E01ECFE3030D30FC09FF63522000C1B2302203201F69C92';
wwv_flow_imp.g_varchar2_table(152) := 'D4F8B2A2AABA62818C00FC192D0174C5C0FD5AE94D3872CEE49203D720E0BFCFC0E6E9EF0AE3DD917965553CDDAA6A40EE1D3B5FCE75A901A54840DC0BA7E76C55030AAE316E88AAB101762A91556B55388AF404B553F15457210FD5494011F84ABCB38D';
wwv_flow_imp.g_varchar2_table(153) := 'D800AD76CF4E01BD1FE9213CE25C0BCEF90D210FBFD644E38E707A7A7B1378F94960AA8E3DFBDD782F640A408B084037EC3B8C75120118C6592D31A61B961EF27FB1007F08CE16C887F8C89776850438DEFC6A5BDD5603AC28E9D1700BB60B3A8E3FF439';
wwv_flow_imp.g_varchar2_table(154) := '609DAB01660D3612909BBBDB24C0419592665DAD1739A9391150D95639DB6A36B2103601F8E9BFE408EB87C1C37F9C62335F993B89E7F700FB7702D3FD0AFAF2F3AA28009407A0C45B908AA43100877C91148091B91BFE63C9A1EF02C3EF8D05EC84992C';
wwv_flow_imp.g_varchar2_table(155) := '598DFB95AA7C23B9664ECFD86AC9BCB424262825D5121E804BAF2A50037C5EA6A24D9454035C3440198FC558E5EC94A0931330E34117C1B8EA39E7E6D5ACEFB0BBA57C2525A02A09F0D1135B5FD2F2BED1E876322797251F45BC8DF35710E5E1C7ED0CF8';
wwv_flow_imp.g_varchar2_table(156) := 'F7A920B82B3C70604737F7EB77EB45131180101B79400A40B76C3C6CF5120118B6192D18CF8D2B57BE216CB1DFE460970640A0038A17E40C79A0C03336FA6279715BD0D145049C14A5A365013BE2BA41DBFE8D01BC1A1128470212802B91415025030EB2';
wwv_flow_imp.g_varchar2_table(157) := 'E4B46D097295CC5D4C6E0AC66C9967EB159E00411F5993F85EC28012B224F7D171DFA7442F95F6C5DF21C72B625D1F1C5B39E3B7860D6C69EC9BFBC43378E5D54DC0D4A0BE120401E02144EA6E3A0D7050277196FB9D9E05B0EACF49019865D3CF7E73DF';
wwv_flow_imp.g_varchar2_table(158) := '59B264CD5430F1510EBC5F04FDC5DBFD6C3F766077BDD4AB674E8B5FF7166739EB8C49150ABCBE2EA8017ED0761A2F1E978A51DE580213FC928B0B0204EDD7E5F36990120530CDFE1792944A44C0BD4BC00EF62954FB9F8B7C4CE96FFEFB2200D0149BF5';
wwv_flow_imp.g_varchar2_table(159) := 'C581C21C0F00F81118BB87F3D6DD011B7B68FFFEFDBB06D1DBB7592923007416C0ECBF5C07B4C58C00FC051180019DC272DD1687FB2C5AB6E3FD8C357E2D603856807F71847449CF2F29562D8F7A0E032EA05281A2A4D757871AA021941B18DD2420AAC2';
wwv_flow_imp.g_varchar2_table(160) := '200116E2A34D9F01675D55034ACEAFD4C7EA0984AA1281621B29D3A319598C4878FB02F4C56F33C07300DF02E00E30FC386CE1D16072F2F92701E1ED8B849743F343046068A672D606420460D64CDDDB866E5876E8A9AC81DF07C725697EFFA8478511D2';
wwv_flow_imp.g_varchar2_table(161) := '154022717D0B3D49C5141AE4592E563F2A41043A5203A4D6ECBF1A90EDA3012E1260F782E3AAADE3CD4896FB3EF2F9C275A90169EBD5D2095BBCFB42DBFA3D7B950408A8E708C031C680FDF1FCDF06CE6F0C0276F7CC0C7FA43935F5DC14B0F76A409C68';
wwv_flow_imp.g_varchar2_table(162) := '3D943F190148B701FAD2790EA5056850552D901180BF2405A0AAED06A6FC4D40B3B57CD52738C32F05C0FC961E4A562B092896724DC0B4BCECBD44A0040948C98D0552331073CC609D1904DD24ABAA9DF249F2EB0EEE1C8E75928098EB55208789218C2B';
wwv_flow_imp.g_varchar2_table(163) := 'BC44C06FA33C829F892D7B6871FE7008FE9F8CF19B590B5B3135F5F40780970B4E2A1E98E7B8A8A30A01A05D0045E6A2EF0110011881DB60F3E2C32E09C6C24F35193B619A0B7873BCB8555CD5FC7437ECD85FEA55120799901C038C39392A55307D65E3';
wwv_flow_imp.g_varchar2_table(164) := '0ACFE9828E2624CA504D0DF08E38ED87D2E50A5E6ED6ABB822AFEAA0CD9CFCA79F04D82DE26ACB4702DCB675E70C28738D58D317FFC4963DCEF93E06F60267F861C8715BC8F93DAD20D87AF5BE7DCF8DC0636D0C312500108701894440A4008CE26D5069';
wwv_flow_imp.g_varchar2_table(165) := 'CC290158FD2552002A196E500ADFB8F8A845681CF802026C6440BA03CA99E9DF2E59E7A3ADBA4BA01864754B6AA0E8401FD59164051B0000200049444154372C01A40EE0F5F52FFEAE4612203BCD96FE7881363353522A2272F61FF3730F51B20EAFA806';
wwv_flow_imp.g_varchar2_table(166) := 'F97E487EAFA806587B9F0E4D1B561CC11F7F3903EC05B09D85FC111EE0CE80B3BB8346EB81BDAF4E3D3CCCF27E99F78D420048012863B2912F430460C86F811B97ACFA39D6C0EF35183B6CC6B98B5C03088F12109BAB02F824AE7C79B04A27A49808B8D4';
wwv_flow_imp.g_varchar2_table(167) := '00675B0EF7D7E74DE704C1444ABF176EFF56E98251A4825D936D06D5F2DD7B88520922E01FAF9B08B8AFF3AB01A9B72F16ED19F86321638F04E0F772F01F863C7870A2B1EFF1F7EEC18E217F844B0F2F220033C96980A40094B6DB2817CC08C05F910230';
wwv_flow_imp.g_varchar2_table(168) := '74F7C1ADCB96AD9A64637FC119BBA4D813B7787D5E225001AC121250DC07790A2C5EAB0549EA2201454A403B6A402151B2DAB7CAD2495241E923861DE4CAFC58A28ADD5603D4F10A6FBF914CC60CF052C8D856B45AF7B120B83BE4FCBE398C3DF5D57DFB';
wwv_flow_imp.g_varchar2_table(169) := '9EFFE77815807E240B440460121BD1C0B50DA100D01200DD1F0516C808C09789000CDDCDF29F2B0FFD100FD9EF3418D6A46F4BBF276E475809BF0D1B95DEFA27B9BEA53CC9446930B0C971715D44A05D35C04D200A00DD41028A0889E1CB7B9604EC7539';
wwv_flow_imp.g_varchar2_table(170) := 'D400CD00F19F056A867657C4F78BCFEF572F48257EE1F14F03331C780021BF87037781F3BB5ACDE6830B5E7DF5E5AB063849CF6CBC5C3202201201D112C06C987CE0DB200230F053681FC0B716AE5E8A79F8530E5C11703E2EBF8EFD24C001170E35C00F';
wwv_flow_imp.g_varchar2_table(171) := '6F16E8E8500DF09311D91605E70974942F40B39164D04A7277D2DD6C4CC6C515549614A4FB243620B39087084839F8390317817BF785E0773738BB656CDFBE3BAE02760EE9E3D99561C904202002D0151B0F5BA582747360F76A5200866B6ABFB562CD3B';
wwv_flow_imp.g_varchar2_table(172) := '19C2DFE70C27C64E9C4552770CD9E5F5655538BDF0929E6207244069C12E5848A39AA54385AC5EB3CDB80580EE5003CA2B26A2CDB09E5D02161EE8BC2F3C8F8EAC06A4802F6685737E8031B69373FE5408DC1F00B70761F8ED9F3A70E0B1E17A12676F34';
wwv_flow_imp.g_varchar2_table(173) := '2901E0940970F68C3EE02DA50AC0617F4D4B00033E9579F71F5EB76EE2C93DFB7F970157336089B21458920878A55F871A10634649E9372B56C5CB5551C9A506985427FFC4DABBBAD4809244A0702785615FDF6CD81207E584AF58ED49EF1B0741748EC9';
wwv_flow_imp.g_varchar2_table(174) := 'ACD9D65606FAB1327100625F3EE74F31E07EC6F98F5AC01D13FBF7DF49F27EE7AF1F22009DDB70D46A100A4008EC26023044337FD3CA951B42DEFC1418CE63C058FA62CE31B72635C0E39A16829C823BED9180F26A808AA82E1260A117D95DE1F3C215E2';
wwv_flow_imp.g_varchar2_table(175) := '53270930BCF02A762A9738C87727F8EC5BA40688178B00FF569C6E7777C8F9B606F0E310F86108FC689AF37B3FB86FDFB6217AEC7A3E948C00884C80B404D0F3F918840E6404E06F48011884F92AD5C79B0F59FDEE16C7271970940E5CEA4BBD4322604D';
wwv_flow_imp.g_varchar2_table(176) := '6E2377B1026025EE7C798F55F55C8BD5008306D9B58A0ED208778D081846296BD784F824D797B76D393520E72771F9D4DB17BFB7803D60EC451E86F773CE6F0F18BB0BCDE6C3632FBFFCE45514C15FEA39AE5A282300211D075CD576A35A3E5B02F85B22';
wwv_flow_imp.g_varchar2_table(177) := '0043710FDCB072E5FC269AFF83815DC3C00F76ED04EA0735C0E2E04673507A1941F3CFF331995399435A093520E9987A8D5AA74F1150BC63A9A01B80FDFA4267870AA58371F9ECBE71592C60E9AA007E316B2130CD815D8CF3A779107C270CC31B5918DE';
wwv_flow_imp.g_varchar2_table(178) := 'B773F5EA173FF2C8239343F180F5F1208800F4F1E4F469D7188BC2C3761F4604A04F67A862B76E5CB5EAF0468BFD1938CE670C63BEADC0EDA8015E50F434566D49C04F03EC70A9F5CC52C8F46B7DA3490E4AD248863E1D7EAFDA74BDDD505FFF7641EB78';
wwv_flow_imp.g_varchar2_table(179) := '0BD400959499BDB5902C31EBAF868CED02E7F78087FFB260EEDC7F7BC78E1D7B2ADEBA54BC430B0802D0DA8F8D9CE3DAA64804E4E7951DB646970F8305520560CDDF9102300CF3891B561E76C618C73F060C6BC501E886976D19656D6A40AD870A156901';
wwv_flow_imp.g_varchar2_table(180) := 'B6DDE9E53CD6F6D58022EAA17BD376F7BF5D12603FB9B1788E0D2250E98861A3B7E26AB1577F3F0BF112189EE51CDF4480AFBD77CF9E0786E2211AD041100118D089EB61B78900F4D0F8DD68FAA695AB3EC811FC61002C4D0940DA8ECF217091001F8170';
wwv_flow_imp.g_varchar2_table(181) := 'E573B77889921FED833FCD2251D12A99F1CC91265518A636A9425935A02A09D02C68E7044AFF4AE55650B77614123D530D28DE29A0A901C2A13CC0801738638F30CE7FD808C36FADDDBBF7A6D386F888DD6E3CA3DDAA332200AF62A3D806480A40B7AC3C';
wwv_flow_imp.g_varchar2_table(182) := '5CF56604E0EF490118F899BD0E682C5F71D8FFCF19DECF80F936DFB048158C01D323FDDA30DA75C6401D4B02527F5C7D2F82643F21914943591260A7547E8255AF1A90111BA551BF1A609D55BF1A20665078FBBB38C37D9CF3BB03CE7FC067667EB0F1C0';
wwv_flow_imp.g_varchar2_table(183) := '812706FE8119B201100118B2099D85E11001980523CF5613DF5CB76E62EEAB076E641C6F1607A8A9F85B15D46B200249932E2FBC3057BE6EB802E9BA1411B0146A5F0DB0EB23B34A044463468355884052813C57A246C6F632F007C1F9B75BC016CEF943';
wwv_flow_imp.g_varchar2_table(184) := '33F3E73FF1B3CF3F2F4EE3A39F3EB4804200681B601FCE50FF75292300FF400A40FFCD4EC51E7D6FE1EAA5FBE60577068C1F193AA566AB186C6DA92E352073E21DC85829EA3F6113A5948C6C5416CFBE900814A80149DDB95852D1AE751F336CA82D7E12';
wwv_flow_imp.g_varchar2_table(185) := '6052171E6DE3E39CBFC080FFC04CF8751E4EFF17E6CD7BF1DDBB76BD2282852BDE8E547C962D400460960D3E04CD11011882494C8770F39223DE88F1D6BF3260458607AA6797C296316AD7DB3DFBBC520641BB676C0F628BBB529A04E41D4AAE734FA04F';
wwv_flow_imp.g_varchar2_table(186) := 'F370A912EA352552092B42495595C5CED2FC485B9003C0121BE0988DC87002F4C5F63D06DC01DEFAF278187E7372EFDE1D5B01BE29FA8A7E06C502290108816B9BA4000CCAB4F5B49F290138FC2BA400F47422EA68FC3BCB0FFB200FF019C6A0EEFFEF50';
wwv_flow_imp.g_varchar2_table(187) := '0DA84A0272C0B1BBD9FE33ECEDF06757B98BBD5C9BA79BDABA4E1210911B8BE2E0035F83F838E749BF3B3C74C9BA1343532738A6C1F02A802719E7FF1132FE354C4C6CDDFAE28BFB08F4EB78127B53474600681B606F2660005B2502308093E6EAF24D87';
wwv_flow_imp.g_varchar2_table(188) := 'AEFE04E3C1AF32F0F956D7CDAA06A81055A80444C5CBC9DD5E78F66C196C470D28D2A75DBE793912204A95581268F34C01C54E5A477DE3F2DA49EA7294EE9373CE195EE088F2F0FF20E4ECC666ABF9BDD6BE1D2F6D056608F807FF4510118057B0911480';
wwv_flow_imp.g_varchar2_table(189) := 'C19FCBD91A41440080DD87FF232900B365F3AEB573F321ABFF8AA3F1DE00981079D9ACE0D1010950A842491250442FEC59EE6213554B1E54AC06784980C3555761BF1C09F08DB914A05720012E2B09D00F78B43F6F5F10863F0A59F04304FCCE9919F6FD';
wwv_flow_imp.g_varchar2_table(190) := '600C4F2FDFB56BEF5BE33CFDF43324162002302413398BC32002308BC6EE7653DF3D64CDF521C40140AC196348AC03F88880F97D31C829F5552002795B26C2B99705CAE6BD4F075AB1FF9285FA410D50884F452220AE6D887D7BF1DAFE8F5B9CDDDA60E1';
wwv_flow_imp.g_varchar2_table(191) := 'F75BADD6033C0C1FC3DEBD2FBF3BDECB5F249874FB56A5FABB60816C0920C4B54D5026C02E9878E8AACC9600FE272900033FB937AF5CF303C6D8A93C8EED927EFC6A809D2454F0A8EB200102BFDBC81B60F45D65274EA4EB4C0D485B2DB651FBB101D2C8';
wwv_flow_imp.g_varchar2_table(192) := '2C709D7E24265A807E83010738DF0BCEAF670CD7F320D88AFD78667CF19C9D776DDB36B589BCFD817FBE8B0690290022068082008BCC45DF0B95502C0170EC3E9C08C0E0DF0FDF59B9E6C7606CBDDDBDF3A80109D6B840D1A922E8EA420522E0F3D35D44';
wwv_flow_imp.g_varchar2_table(193) := 'A07A6C80E24F1B136CB79304EA1EE08D2B9316DA93DA5D6A8B77BC8E5B4FA11752C5E9A97B4DC630C33966C0EF6970F6951904378F8D61DBE49C1DBBB63E83495AD71FFC67BACA08880054B11695151620023044F7C17756AE798C31B6D684A57490F137';
wwv_flow_imp.g_varchar2_table(194) := '4EFD37F942FDBE58525708420512905F576549A06A6C809F0494523FBC44A024095048968F6A9937A4983101FA71305FF4FD5E0E3CC939FF2E107E1BADE67D8D39EC193A8067881EE636861211805DD8188A54C0A400B461C1D1BB242300D7D112C0C0CF';
wwv_flow_imp.g_varchar2_table(195) := 'FE7756AC793608D82A5949774BDD0E1A6025012A4CBA0884AABEBB68840DE02C309CF6C3D94D9FFF2EB59115AB7AA680467C0A49803906BF1A50AEFFA9C43F13E5E8E1CF70B01F31F09B798B7F6F226C3E72C9DE179FA735FD817F746B19C0B6CB31AF35';
wwv_flow_imp.g_varchar2_table(196) := '8708402DC61C914A88000CD144DF7CC8E1DB1BC04A7D29DD0D3555D500A7CFAE5831C7DCAA9EAE9D08B802044BEF129005108F02E28364894718778C4A154A129F6CCBA0DB46626D5FCC25077F8281DD1ACEE03FA739FFFE82713C73C9CE9DAF0CD1AD4B';
wwv_flow_imp.g_varchar2_table(197) := '43A9C10282004CCDC146C670AD780FD071C0351875C8AB4809C011FF4C0AC0C04FF5770E3D2222002D0762DAA1A67D126097CF6333D64D02A23A3B550332221057544AC9D04A46D714AA0125898F8704341930CDB107C07F3638FFB75680EF4DED9CF7F8';
wwv_flow_imp.g_varchar2_table(198) := '557866FFC0DFA83480AE58202500104B004400BA62E361AB9408C010CD684A0044CC7F3150296EB13B3640C232976FEB02D20C2B2B9C2E98F7CA8EB255498013E8130315F63DBB3FB42581368880B32D890808C97F2E63D8CFC30738F8DF4E73FE1F13F3';
wwv_flow_imp.g_varchar2_table(199) := '763F78F936EC1BA25B9586D2050B1001E8825187BC4A22004334C1390148BD7025359D32D27AD4807272B74B0D2807BE5AA97448567EE0AED1F826F9200DB0ABAA06B4B324E01D2F8FB7F3B5A2803FFE4DCEC32FA2D9BC8902FB86E801EDF250320220CE';
wwv_flow_imp.g_varchar2_table(200) := '022005A0CBD61E8EEA3302F02FB40430F033AA1380D849AD4A02B2AB547B98389C7CDF19097079E845B5BA320896DE2A98CB13D138CA91115D3549AE2B5C12505BD08BA7491B42CE7680F3AFB320FCDCDB77EEFCF1C0DF90348059B50011805935F75034';
wwv_flow_imp.g_varchar2_table(201) := '46046028A6311EC42D871EB19D598200231AE04038FBC7E2530B9476480272CC2D82F77C522CC27BF6E56CA611364982D6332F0948AF8E0BD90800071E03E7FF084CFCF9DB776D7B6A886E4B1ACA2C59406C039CDA858DA04440B364F1C16F26D95ABCFB';
wwv_flow_imp.g_varchar2_table(202) := '88FF450AC0C0CFA620008190FEAC2371C705D83DE014ACDCC8665F46B081B7DAA1AA4B0276D894DA89F98AF1535A0D90F47C9F12E0B353F45D291290D7228AC7A97BF943E0EC2F271AF8FB8B76EC786EE06F441A404F2C90118016AE6D06B40BA0279330';
wwv_flow_imp.g_varchar2_table(203) := '608D660A001180019B394B77FD0420BDA04A8060EEB95A8151FAD0E5D3BB00D54502EC201BF7DD4B047A7ABA607B6AC0186398E2E1132CE47F343D31F68F573EFFFC0B837F17D2087A65818800ECC04600D73602AC4C9246F5AA3BD4EE0058402C3F7280';
wwv_flow_imp.g_varchar2_table(204) := '14800198ABC22EA60420CD03E0F766AB2C0BA435B99705DA5103946B4A6610F42E1E7848802F03A2D1F7E88322DDC1263A4844A0400D883DFFF0E580B1DF9EDF9AFEBBB7EEDEBDBB7082A90059C06381940070B104400A00DD2B252C902A00477E959600';
wwv_flow_imp.g_varchar2_table(205) := '4A98ABBF8BE80420F7F95DFD6E6759C01F1BE022023E32527549405509B49ABD24C09B08595D45687B5940230E8E8173889D7EF8E4AA79CDCF9CB66D1B6DF1EBEF476B207A47046020A6A9AF3A4904A0AFA6A3B3CEDC72E891510C80EDEC3F3F0057D929';
wwv_flow_imp.g_varchar2_table(206) := 'E03F62D8DE8E26915B8659BB1AE0395DB0EED800DF982531411EF51407FF8787774E5CF3314AECD3D94D4F5767168876018C61232900745394B540140408EC2605A0ACC5FAB8DCAD0901107BC96D3FED2C09B86B72C0680771018A675F72494055392CFA';
wwv_flow_imp.g_varchar2_table(207) := '431B470CBB9604FCF6732F094862829899161387F804E13597BEF4D20394C7BF8F1FA801EB5A44001AD8C8451E005A0218B0D9EB4D773305E06BB404D09B19A8B1D59400C4F9E355A15C6FC60666EDE40CF01EB1631516BAA306E4A3359704A2EF9C527C';
wwv_flow_imp.g_varchar2_table(208) := '49B2A4101B371528A84D98EB111EE2BF07BB5FF8DF970093354E3F5535E216200230E237401BC3CF140022006D58AFCF2EB97555B204D01158B9930755560324F7BCCED8003FB571901FD101F74A87F38820EB98930F4B2F2524648C33BCCA78F885C9A9';
wwv_flow_imp.g_varchar2_table(209) := '894F5DB9E7D997FAECF6A1EE0CB805140240C7010FF86CCE4EF73305E05F4901981D8B77B1151B01C831B8AAD71A9D3F6BEDAD1DCC0B34879EA80116AAD0C67641A7E592057ED7F7DAE721E3FCFBE118FBF9CB9E7FFEBE2EDE0654F5885A202300B40B60';
wwv_flow_imp.g_varchar2_table(210) := '44EF80EAC3CE14002200D58DD76F57DCB6EA483513A0A186B741022AA712AE7ABA60F1928002E375C406B441029CAA43010948AF63C02BE0FCF7BFBFF385CF6D8A4FF9A51FB240AD165008002900B5DA76582BCB1480AF930230F0732C0840BC0B403E8E';
wwv_flow_imp.g_varchar2_table(211) := '371F563B7101318055D9259068EDAEFCFA997C2E9B5B2526851E75C5D3055DE3AEE53C818C1978ADCB19E7FFB567E6C0B957BDF2CACE81BFD168007D690122007D392D7DDD2922007D3D3DD53A67250069154A5C80D39FF51C8A532571505A7F959D02E5';
wwv_flow_imp.g_varchar2_table(212) := '48408EB7659727620354250119F1B14C813B2EC06C25C9B475A0C55A1FB97CC78EBFA836A3549A2C50DE02290108E92C80F2461BF1922901584B0AC0E0DF093201B0E0BEB24FAD487877C16BA2785B8DE50FF4B3D438CB6A80D3476FF388612B8D329704';
wwv_flow_imp.g_varchar2_table(213) := '78C8B175824FBDF9FC5DBB5E1EFCBB8C46D0AF16C80840886B9BB404D0AFD3D457FDCA08C0BFD112405F4D4C3B9DB96DD5DA7289804AAA013E9DC04504DC5106B6F444C9280B8880BBCEF438DE7AD48068A5C3D19877BBA3BEDC91D4C1C0C562FF7E846C';
wwv_flow_imp.g_varchar2_table(214) := 'D325BBB67FAA9D39A56BC802652D4004A0ACA5A85C6A01220043742FDCBE6AAD1404E8F2C755D09587EF02393700575D16C863DF8C3A7BA206D8298EFB98613F0DD0C7C42265813F1BB682375FBAFBB92787E856A3A1F4A1052202006C0C4522205200FA';
wwv_flow_imp.g_varchar2_table(215) := '7086FAAF4B1901F8062900FD373B157B2408801104A8ADEABBD7AFE3C6AAED6D97AE707ACEFA20444187186F2813E9B5450B1672D06301F1D1BAE38C0D682383A0DCDB68ED9FB329C6F1BFD61CB2F8FD276CDD3A55713AA93859A0920588005432171506';
wwv_flow_imp.g_varchar2_table(216) := '400460886E039900A8BE6D09502CB92CE052036673A780BB0F3ABAAB25FDD73996111C44A0684920B1FF2B1CFCD72FDEF1FC5F52CADF217AD0FA74284400FA7462FAB85B4400FA7872AA764D2700AAFF5C8204A8ACA15A76BC543F28AD04A48DF9770AB8';
wwv_flow_imp.g_varchar2_table(217) := '20BC302E201B7C3912900FDD62A776D50086C75B7CE6AA4B77ECB8B3EA5C5279B240550B64048076015435DDC896CF08C0BFD312C0C0DF045B94180075383E11DDB51EEF03458D2B488DB98F18F685EA393DEA3A3208469D2D47045C4B0255020485FC0F';
wwv_flow_imp.g_varchar2_table(218) := '609A737CBB114E7EF8FC5DBB9E1AF89B8B06D0F7162002D0F753D4771D2402D07753D27E8704011031002D4F15ED13015F28A0ADC17688803F8BA04BC3F0A9010A51294902BCC4C7B35320BE8E23D9FBBF179C7F7966FEC4EF5CF6D453BBDA9F55BA922C';
wwv_flow_imp.g_varchar2_table(219) := '50CE0232016888F740D18351AE5A2A35C41610048003BBD7920230F8B3BC65751204983CF8C56BE5259605B42255770AB86203DC6A80D307771CE6531C2068A815258980B3664FDE00D149410042F0971162D3933B9FFFD3AB81E9C1BFBB6804FD6E8188';
wwv_flow_imp.g_varchar2_table(220) := '0084F12E8006ED02E8F7E9EA8BFEA50AC051FF9B9600FA62423AE9C496D547A979003CA7DFA9A058208F77890418C01C0D3E6DAC4A6C80D767574C9A0DA52409F0D5ECDA2E181100C6B703F8958B5EDC7E5D27734AD79205CA5A2023009C0840599B8D7A';
wwv_flow_imp.g_varchar2_table(221) := 'B9880000BB89000CC19D9013000948EB52030C12E0876FDD9CD57609A4753BD400E7982AAA0115CE14A81A1BC0808710B25FBE60E7B6CD43706BD11006C0024400066092FAAC8B9902F04D5200FA6C6AAA7747108068ED2FBB54426D8F1AD07E5CC06C90';
wwv_flow_imp.g_varchar2_table(222) := '80B88DE240C574D0E54840D6F30A24C0D193786922693696FF1106C05D68B18F5EB06BDB6DD56792AE200B54B7404400A6B1310C4801A86EBDD1BC8208C010CDFB1DD9128092F65F4954EB4A75EB95BA4D775EA318256209A43AB8A313FE30C32A4B0255';
wwv_flow_imp.g_varchar2_table(223) := '22FE938E552002B69EA4CB017102203EC3186E0DC17EEDA21DCFDD3D44B7180DA58F2D9011004604A08FA7A9AFBA962D019002D057F3D25667EE5875D4F680C5C7019BBE791535A004A05B65F812D7657DAB72C4703A1E51BF852694E84B7140A4B955D0';
wwv_flow_imp.g_varchar2_table(224) := 'AE6FC87DB14C53A406F069707613C2F0D72EDCF5FC7D6D4D265D4416A868012200150D46C5E34C8022068008C0E0DF0D77AC3EDA7A189055142F15205802D00DF0B543ADEBD3E873073ABBAFF15FE0F2FFDD0A437B870AC55D576B4DB6004EF110DF9AE6';
wwv_flow_imp.g_varchar2_table(225) := 'F8F5CB5E7AEEFEC1BFB368048360818C008820C080B6010EC29CF5BA8F1901B89E62007A3D171DB77FC79AA3B7079CAD0CB999BACE4502FC5EAEFD5B05F2AC0E79151290C068451250749E806F11A01D35A0903C244420210093E06C7393E3E3E7EED8F6';
wwv_flow_imp.g_varchar2_table(226) := '60C7134B1590054A584010800393D808E0DA20C0CAD077D396A88F8A0CBF05E2254BEC3E6A331180819FED3B56AF4B960052B7DCE7C1575912308980F5DDA254E97EFBD4A306C4CB01C5FD90A7D54A838C798F558912EA8774655C3A4B0234C939DB3C36';
wwv_flow_imp.g_varchar2_table(227) := '868F9FBB8D08C0C03F5803328094007091078014800199B5DE76330D023CFA062200BD9D891A5ABF63CD31F11240065EA16FC95CD5DE677197805B7570670FF46B1129FC6A464C7990F271310930A0BF64CE00711D8B73014E720E220035DCD35445790B';
wwv_flow_imp.g_varchar2_table(228) := '1001286F2B2A195B2010BB9638761F4D0AC0E0DF125B0E3F36DA061886F212803D6D9D739DDC231B3A60B68417DEFB25019540149300A57C053520D90638098ECD4D520006FFA11AA01164048062000668D67ADBD58C00DC480A406F67A286D6B71C7EDC';
wwv_flow_imp.g_varchar2_table(229) := 'F60678AC0064A0A513001FF849DF15AEC99790C8D5550667B49F7B4DBEEA4E81E2650127F1F1D85FB9A6400D486300C41240738CD312400DF7355551CE020A01A054C0E58C36E2A5220200EC3E9A08C0E0DF095B0E3F3EDB05C022A0124B00327CD5AD06';
wwv_flow_imp.g_varchar2_table(230) := 'F885F9CCA23D880D702E337896053CE287AA727848404E00480118FC276AB0461011807DD8C8451E008A0118ACC9EB516FB3180022003D9A811A9BDD7244420092AC34623D3A220019B2C51E72FCB7CB17D6BEEB426C40DC423797059271BA34872E1E31';
wwv_flow_imp.g_varchar2_table(231) := '4C04A0C61B9AAAAA6401220095CC4585D31800520086E35E8809005B19469E7F0CB3F1D9F43211C8C1B13411289533A088549868EC39FCD7490F5C990CDD74A24A06C17C0C3E354019A93D3E200A02A41880E178AE0665140A01A025804199B69EF6335B';
wwv_flow_imp.g_varchar2_table(232) := '02F816C500F47422EA687CCB11EBB5D30025B017642053035278ABA00658A5F3BCD74561758A08210DB6526061CA212AA512EE8E1A60D09DA44F791E006C0E2808B08EDB9AEA2869012200250D45C5320B100118A29B61CB918200884440B2972F9300B1';
wwv_flow_imp.g_varchar2_table(233) := '4D4D1C55930E5A5E1228F2E0730650BC565E42DED78A58F3EB7BE66636CF13A8A206100118A2076AC0862208C0DE7DD8C8280FC080CD5CEFBA9B128075A400F46E12EA6A79CB911B120540DEFFAF837C8CFE2CFA585508D45881B85726F81513817E5003';
wwv_flow_imp.g_varchar2_table(234) := '7C7DB72E0A38158EA2D1A82A48721850B40D901480BAEE6CAAA78C051402404B00654C36F2653202F09FB40430F037434C00921880080125A93F0BFE93BC7F2E6204E42D83096C960D122C1D1BE0A51206CBA81A201895F7B8E97612532536A03C094846';
wwv_flow_imp.g_varchar2_table(235) := '3A8990130118F8276AB006400460B0E6AB1F7A4B04A01F66A1A63E6C597BA29409D0B1CEAF6F0BECDBD88012CB088ADDB82D7B6F56C24502ACD4C4AA06A835B8F8469608087C73D0A054C035DDDA544D090B4404600F36B2808E032E612E2A22ED0258F7';
wwv_flow_imp.g_varchar2_table(236) := '6D520006FE86D8B2F6A43C085091F72D6A80827C9212A0A80659D49D06B5928A200B0A0E0BFAA0D30052E983AA4A80B2B9D081D0A5D500A51FF2C0FC44208B0100DFCC88000CFC3335480320023048B3D51F7DCD14002200FD31219DF4222600AE25009D';
wwv_flow_imp.g_varchar2_table(237) := '04242D69CB04F6D8006724401BE709142C07685FC72D57510324DA509104B4AB06C8D71101E8E40EA66B3BB10011804EAC379AD7A6898048011882F9DF72D46BE3E380A330FF54C796E30012A852D6F865BD3B2F1B6F19742C23A4DCC1A50B78D6E373B0';
wwv_flow_imp.g_varchar2_table(238) := 'F4910AB381EA6A40A20794260169CF2C2D59D5007BFF89000CC18334A043C80880C804484180033A8BB3DBED8C00DC444B00B36BF92EB476FB5127470A401C1497EEF52B4B04747220F206B8760A9413F55D497BD2A1BBBC7BA576037CABA801290DAA72';
wwv_flow_imp.g_varchar2_table(239) := 'A6403468EF0147BED1CB3100B404D0859B9CAA745A800800DD1C552D902D011001A86ABAFE2B7FFBD1A7640A40940130230129B8EB6A800EF03209887F8F7609843128663F7A7C8127B170391290EB02B255DD44C02D31F8BE51840F6DFACCEB620265AD';
wwv_flow_imp.g_varchar2_table(240) := '4F164D3415244B054C3100FDF7800C798F88000CF9047761784400BA60D45E551911002D11904A041220CF504D96F835A893E4FF9C04489058810414ECD29340B6605940EF62A5D8805C77289F4EB83A0910B6E2C02403DFCC2908B0578FC248B64B0460';
wwv_flow_imp.g_varchar2_table(241) := '24A7BDA341D3124047E6EBAF8B6F3FFA546D1740EAC5CB6A40D19280ECF7E6A982A3E500966611948983E9275B25F2829C016A2D3E915D8F3BACB62410CF5822F15B2EB5D71696560252058021DC7CA031F5F18BB7ED78B0BFEE12EACDB05A60DBA998B7';
wwv_flow_imp.g_varchar2_table(242) := '773E3682B6010EEB14D73E2E410038C7EE7537530C40EDC69DED0A730290C0A9B6A52F4FFAA303780ABFFAC981C908326F3F890B504E14ACEF3C011F0950BE3394009384E4FEBE6B16AA9080DC5EAE2581F4F39C00F0CD071AFCE3176FDB460460B61F84';
wwv_flow_imp.g_varchar2_table(243) := '116D8F08C0884E7C07C34E97008E2102D08115FBE4D2DB8F3E6D7BC0909C05A09380540DD0A2FBA38FE5D8007D81DBB64CA01F2CE4200EAED880D26A40F797045C5904DDBA823F4030B17AB4044004A04F1E8C11E90611801199E81A87992E011001A8D1';
wwv_flow_imp.g_varchar2_table(244) := 'A8BDAAEAF675A74B4B0092576F80BC3814282502AEE03E1B1190BDFD76770948DE7A1D44C02AE3171007CB049527027E35203E0B0093886200F8C7CF2505A0578FC3C8B5AB10006065CBCE6247CE2E3460B7053202F01D5A0218F8FBE4F675AFDF1E80AF';
wwv_flow_imp.g_varchar2_table(245) := '5442D79CE701C8E700E82440260FF12251FC63891FC8CE1390BE579608942B251BE704A3E83D957FEF890DE8304030BEDCCE48AAA801F96980440006FE811AB001640480F2000CD8CCF5AEBBD912001180DE4D425D2DDF7ECC19310188104BFC47F6E2ED';
wwv_flow_imp.g_varchar2_table(246) := '527EB4D5CF28AF01BE01FCE6B2419C38C84F02E46F5542E13DCB47A61EBEF3092D870A992DDA3F917BD359CE802C0680F3CD21290075DDDA544F090B10012861242AA2588008C010DD101101486300F4437F0A403E02709934185EBC00C624CD0D1298D3';
wwv_flow_imp.g_varchar2_table(247) := '82013322D14E06417DC5419B178FEFAF12044309A84602E2D255494076556A992806200C680960881EAFBE1F0A1180BE9FA2BEEB202D9159E46C000020004944415401F4DD94B4DFA1580110A9801330374EFED312FF681E7B4C0274F5405212322C4DCB';
wwv_flow_imp.g_varchar2_table(248) := '25D90633D08DCBAA6A804D8550FCFFD2E709A8506E0AF3CA27F2AA461BF902B2503FC7FA84BDF5ECD32806800840FBF7325D59DD020A01103100D5ABA02B46CC02A4000CD184DF76EC1BB637A0EF0290613305634DE2D7B70BEA6A802F0620B59FED50A1';
wwv_flow_imp.g_varchar2_table(249) := '2CD030E9834238FC24C0EEB77BAE91A84B36A50A0970D7E85AE357788DE53EB19180581BE1440086E8B91A94A11804C0415E07653CD4CFEE5B202300DFA520C0EE5BBBCB2DDC76EC1BB73782840044CEB8BCEEAF79F6D19FF2F7F2DB428F0B9089835E67';
wwv_flow_imp.g_varchar2_table(250) := 'C600A420BABC8CA106584880D3B3F7EC12C87B5BA00468B8DFED4385720280CD61D0A25D005DBEE7A9FADC024400E86EA86A012200552DD6C7E56F3BEE4DDB038EE834C03805B08EA0B61C001A31D0960D8CD8005D0D50D6CB6D8403C99280BC94502179';
wwv_flow_imp.g_varchar2_table(251) := '902C1E386C1FB75A7E49202EEDF2FBDD135C2636403E0D9008401F3F2C43D83522004338A95D1E5296099014802E5B7A16AA8F08407416407E1C707CA29F0C903209903ED773FB27409FE70B908842569FAEB1A78DA58A81AA0EA8470CA7C8EE036EB57E';
wwv_flow_imp.g_varchar2_table(252) := '9FA2595A1150AA74D7E8FAA62836201955B204400AC02CDCF6D4446281940070E0DA261D074CF745090B240ECBEE63880094B0569F17B9EDB833B7074C6C03543D7D530D28DAB2674AFEE50E1512060A55675C3E5448EB576C4E9D90649F26D6EE2E0968';
wwv_flow_imp.g_varchar2_table(253) := '570D8834040B4B908F032605A0CF1F9821EB5E4600425C2B96022911D0904D701786932E011C7B0BC50074C1BCB35BE56DC79F991D079C27B5C9A577550D90415EF2D48D80BFDCF32F7DC4B0750B615C4F54872009D10602FB9281AC1BE416947C7C9F14';
wwv_flow_imp.g_varchar2_table(254) := 'A02C06A8058DCB4AA801FEA6CCF304E4258016C500CCEE0330E2ADC90A800806260230E2374489E10B02C081DDC710012861AD3E2F72DBF167C7A980A52580D84DCD8136DEABEFDF0EA8BAB655D58004E0337C9751562223A9E72F2F27284B15BA122013';
wwv_flow_imp.g_varchar2_table(255) := '0667D2BE6C86DA5B12D0DA90E6DBB75820779B08409F3F2443DC3D5200867872BB343422005D326C2FAA8D0880480414A702D452F7267BF693CFED6A80EE95CBB0A72F2BA8E702E4A442F3DF9D418371DD518C41D4DF36D4803ACE12D0BA9B5BC084FC32';
wwv_flow_imp.g_varchar2_table(256) := '6A80B02B477C16002900BD780A46B7CD8800CCC1461103404B00A37B1F54197946006EA525802A76EBCBB2B71D7F8E741AA00ED0E6897D59E21F6FAE7F8D14447F4A8A82BED75FF93EBDD6765A604E287212A0972F90F0A554C705AB0249C90250D7BE6E';
wwv_flow_imp.g_varchar2_table(257) := '67A780184B981C064404A02F1F93A1ED141180A19DDAAE0D8C0840D74C3BFB15DFB6FE2D8902907AFBB6ED76E2339B1A60530D7415C1FE771664A89C3FA0A9071A71C8140A493F673D8A0D90298EBE3BD04502946BA4A94EF30070C637B740BB0066FF29';
wwv_flow_imp.g_varchar2_table(258) := '18DD1689008CEEDCB73B722200ED5AAE0FAF8B0840940A5844E2EBF27DDAE17C8BA0BC3D30DBEE975D6693F8353540CF2098A9013A9948DB4EA47E7DAD5F8A53E8940428E71F59E6A8546C80A104B8E03EA331594BD961408C6F9EC60C2502EAC3E76458';
wwv_flow_imp.g_varchar2_table(259) := 'BB4404605867B67BE32202D03DDBCE7ACDB7AD7F6B1C04989D05A003B6F6B7255A3F8E0DA8A00628602E1F31AC81A623CF40760091A20424CB03CE1D09B9699D8B0405F101F175E597044A958F621AE21800460460D6EFFF516F3023001CD736280FC0A8';
wwv_flow_imp.g_varchar2_table(260) := 'DF0EA5C69F1180DB2906A094C1FAB9D06D2708029026024A7AAAED0288714F97E7B500BF148C6570AF420A0410EAE709A4805BBA4E291DB135A5B18B0448C09E0CD3151F500AD4A58B5DE5657D8308403F3F21C3DD372200C33DBFDD181D11806E58B547';
wwv_flow_imp.g_varchar2_table(261) := '75DE7AC2B91101E059321EC993D73CF5AC8BC67900F93595D500855CC4727FB6ED30DEF81FFF94520352204F4F17B42D6938FDFF364E18EC5C0D9088C0641C03404B003D7A1446B25922002339ED1D0D9A084047E6EBAF8B6F3DE16DD91240BCA62FFBA6';
wwv_flow_imp.g_varchar2_table(262) := '16E08DBE4E33F725EBF399032D01B8114F605BE397AFD7C13A591A3022ECA46B8CFEAA3108391971919A845B1853A2BAF02E35201E767912E02A9FE501A02580FE7A3846A037DB2EC7BCBD3BB191D312C008CC763D432402508F1DFBA2965B379C972402';
wwv_flow_imp.g_varchar2_table(263) := 'CA813527023EE094D3F726D7668A4192BDCFC8DCA72F231478F63C250105A4443B56582531FDAF06C84B00C0CCC7CFDCB6EDC1BEB839A813436F81480118C7C650E401A01880A19FEF3A06181D0604EC3E966200EA30676FEB880800133100E99A7E0CD2';
wwv_flow_imp.g_varchar2_table(264) := 'A61A603F8D2F97E64D6F3EAA23120C0A96150A6205CCC3852C41877A70A2460AD4238613C9C29298DFB94050C731C3466C40DC0F2200BD7D0646B9752200A33CFBED8D3D55008EDD424180ED59B08FAE8A094090A70296D6FDE31CFCDA71C00A429A9E7F';
wwv_flow_imp.g_varchar2_table(265) := '3C34CBC142991A9054507189402501967E6522816D89402235953308266D25F5DB0EF3D1F40963A780B148A0110131B674170029007DF4708C405788008CC024D73C442200351BB497D5DD7AE2F9C92E00DB7ABCAE06C8C825036D0AC82958EAC420F174';
wwv_flow_imp.g_varchar2_table(266) := 'A38FE57664702D77E4B0FBA861A92E4FC060A66C28FDD0C752B0D9AF6635203D0D90316C06A66809A0970FC488B59D1100110340A7018ED8ECB737DC8800305A0268CF7A7D76D5AD275E902402D23C7D4B40A0D50BCF70D74520546057A5F8540D284104';
wwv_flow_imp.g_varchar2_table(267) := '2455215B5A30405CF5D6F5438DE4D8803C89918FD4647A86346B79F95AD48068FB639C0780336C664400FAEC0919EEEE2804806200867BB26B1A5D1603404B003559B487D5DC7A922000E91280EEC99B6BED6680607A8D16E0270504AAC70C4BF105CEBD';
wwv_flow_imp.g_varchar2_table(268) := 'FA7ABC817DD9A0546C80E760A1ECA86269D9C3D86E984AFFC61C552102C62280B277208A01E044007AF8188C6CD344004676EADB1E78A600100168DB867D73E1AD275D6C1E071C61BA14B8E7D81E9879E2D968B454C00A09D023FE93FDFED6326985BA2A';
wwv_flow_imp.g_varchar2_table(269) := '612624EA94048896B204440621D11405D7EA7EA90C82665DE9276910200FB19905B404D0370FC708748408C0084C72CD43240250B3417B59DDAD275D929C06289F05A07BDCEEBFFD24405714CCD8801C7C65D097C1D2A20658BC7AF57021B9DDB42ECB2E';
wwv_flow_imp.g_varchar2_table(270) := '06E53C813495B0A7BC2F11B0BC9A619950492FB04E77B404005A02E8E5B3308A6D130118C559EF6CCC44003AB35F5F5D1D1180F43020652B9DA400C812B9B6DDCEBA24E091DDB3F03A2DDDB03B83A0BE469F82BBAC50C43E745B6A80410264A542263E89';
wwv_flow_imp.g_varchar2_table(271) := '9F6E25011261291520A8AA016910204041807DF5708C406788008CC024D73C442200351BB497D5DDFADA4B933C005A763FEBDE7C3F29C8D500818209AC458393415CF2B095ED8231F0C68A800AA8D9E13FD1C79E3E2457E644C051D63BB66449403F9740';
wwv_flow_imp.g_varchar2_table(272) := '21414A0FA5E9CB650073D53F2FA6AB01D9120011805E3E0A23D9361180919CF68E064D04A023F3F5D7C5B79C7CD97691012C4B04640D882BBF249026B689315C8641910820813A054C65E21103BF91B4A7529C80AC06486D66FD293996AC1F2EC2514C02';
wwv_flow_imp.g_varchar2_table(273) := '34EAA34CBC4C0258A45DF0680980B601F6D7F331ECBD210230EC335CFFF88800D46FD39ED578CBC9976F0F188F09401A1097A1939C1D5097E27560CC3DFBF8301F8FD79F8E560676DB928037BB9F251BA02D36C0200F793F559262230669A0A2F8AE7B44';
wwv_flow_imp.g_varchar2_table(274) := '20A62C44007AF6108C70C344004678F2DB1C3A1180360DD78F97DD72CAE5D25900A9076EDB05A049F316F93EF589CB1F2AA4ED1AB0C617141C50A4900D3D9990A42844005E9EC4C445255264CD88A80AFDA6ECAF9220D7B2401A03C0C13703ECE3676E7B';
wwv_flow_imp.g_varchar2_table(275) := '9CCE02E8C7876508FB4404600827B5CB432202D06503CF66F591021058CE0288CE06905D75DF963CBB775C7CA850EA75CB5EB91AADAF66EE4BCAE9A01F7D6C03F8A4FFD9A1421A89F1640CCC7317C8CA86255BA1AE76F812013B0204B3D30081CD214004';
wwv_flow_imp.g_varchar2_table(276) := '60361F80116F8B08C088DF006D0C9F08401B46EBD74B6E39E5ED5210A0ECA3A6DEAF1E15AF1103437657C1B8BD438554A0370F1532730AF8E5FC4409D0BDF88C38E4DEBE9EB448CF87902D6F388311531D449E717D39444D354C04A05F9F8EE1EF171180';
wwv_flow_imp.g_varchar2_table(277) := 'E19FE3BA474804A06E8BF6B0BE5B4E7DC7F680274180B6843F51305C0AC8B2A72F7BD37E993E3F5448F2F4157521F7D495B5766D5B62544FD52386B518803C3EC13516475FE42581944818F105DE4500232E222D4D04A0870FC088374D0460C46F803686';
wwv_flow_imp.g_varchar2_table(278) := '4F04A00DA3F5EB25B79CF28E7809208C9035FFE1F2DF3635A08814A85EBCF8CBBD24E0F1C0D3B57BC9E3367206389704A47AB5D307D5C441E952449525025F06415F6C8019174004A05F9F8EE1EF171180E19FE3BA474804A06E8BF6B0BE5B4E7D67721A';
wwv_flow_imp.g_varchar2_table(279) := '6002F8FA31BD1186E6C098AB0132B8A664C107A479F9F692075962030C354023125ADF2333475D8CFB6B3FEE582301591D7A9C435A59BA53C047A0245E95FD9A130161D39061129C62007AF8288C64D344004672DA3B1A3411808ECCD75F17DF72EA1512';
wwv_flow_imp.g_varchar2_table(280) := '01D083F2D2BE9AC16FB9179E0299B99F5F8EA457D7D21D6A4006D03AD84A6D48A06EC606141D22A41394B8C1521904F52D89FA8E85286852D46F5B5A50E75CD707B244404400FAEBE11881DE1001188149AE798844006A36682FABBBE5D42B93B3008A0F';
wwv_flow_imp.g_varchar2_table(281) := 'DE893D68590DB0ADFD0B4F5896B9FDB102A58E1836247EB5AF6A6C801DE47502923BE2A91A608BF0AFA60698470C5BCE1F481A964940940608B102D0A25D00BD7C1C46AE6D22002337E51D0F980840C726EC9F0A620220B6015A3C7805F033F75C3B2930';
wwv_flow_imp.g_varchar2_table(282) := '4D9D9B4BE2FE487A7B029F4C8E9725721DF895A0BB36B60B2ACB1BA2A174D9231F9B3B8DB0343EA55FB65D0FAE5311ED4A409A08880840FF3C17A3D2132200A332D3F58D9308407DB6EC794DB79C76E5F600414C0062175F4BE1AB7BF30E193D0557657B';
wwv_flow_imp.g_varchar2_table(283) := '9C2E894B24C222A91B19040B64F7BCAF5A8C8235D7BF9BC0284B15D992804C68CA651D4C550625B6408A3948CDAB6E02CCAC9E28009CF200F4FCA9189D0EFC9FF6DE04DE92AABA175EBBEA9C3BF4044DD3343433743334E0C424D24203028202C2B3018D';
wwv_flow_imp.g_varchar2_table(284) := '1A8D06FDDE7B2679C9C324FA864EA289F2A9313E13E3EC97F10979491E4880DBD0DDA868543406996901199BB9A7DB7DEF39557B7FBF5DBB76EDA176D5A9734E9D7BEA9E5A37BF48DF73ABF6B076D559FFF55F130280FA9C75593B45005096242B30CE9D';
wwv_flow_imp.g_varchar2_table(285) := 'A7BC3DEA05C06807652DD76A58E169C568D6F1B72BFD7552A4E2FAFC16C3769C82FC5D0BC293857F12EC92B70E6D631670E89B0D903101C93AD28C039F3DE90618B900100054E0B5A8CD121000D4E6A84BDB280280D24439FC81EE3C657DD20CC89DA667';
wwv_flow_imp.g_varchar2_table(286) := '86ACB9DBF9768A0DB003E41C857C74659D94E0D519039B9D700001ABB29F0023961F3F13C0B881800023962FBF13C3E0B83ED5E550BB4630062206A08D0060F82F458D568000A046875DD25611009424C82A0C73E7A91C00A83A0089F59D5BE9CE7603A4';
wwv_flow_imp.g_varchar2_table(287) := '7F1781797600A01D5467B91B0CC52AAE156E011D08E495E34D2B6B1598A72B78399EEEDEC89F23CD06B8FA25586BED08480CC6030140155E889AAD010140CD0EBC84ED22002841885519E2CE53AF1400200A02D47CE9893ED45C03A9203A87851DDD27EE';
wwv_flow_imp.g_varchar2_table(288) := '3141806EC1EBEE863C36204211629C9CC0BB9485CE83FB8CEBF5AE7E9AA2EF50F340E00E5D2605FA21D820C6016088557429665E6681316400AAF262D4641D08006A72D0256E13014089C21CF650779E7A55E202B003004D9740716B5929CED88A8FF478';
wwv_flow_imp.g_varchar2_table(289) := '1E1BE04897B382E78AF514D015B4ED6F8F0189DDE4A84B102058090960B43D5980C35D0341009A081C25210BF1BA80CD0225536D08310870D82F458DE6470050A3C32E69AB08004A12641586B9F3B4ABB6F91033004273A7AD67CB124ED6DDC9179E6214';
wwv_flow_imp.g_varchar2_table(290) := '5CBE7417C36083053163B19E02B68B4067032408B0E87B17B3A13119522C7A911FD3A7AFBB406C502019876CB9C66309170043005085F7A22E6B40005097932E6F9F0800CA93E5D047BAF3B4AB3517805456120868567F1C0C974ED5B395A93D86F97BBA';
wwv_flow_imp.g_varchar2_table(291) := '82A04DAB6754F3D34048A19E0276553EBBB150843BD2FB335B20EBAE073BCE41EC2BCD0664B9345CC040D0009E600F6681320400437F23EAB5000400F53AEF32768B00A00C2956648C3B4F7B870200A96E806E65ACAC5F4DB977C30648BA5CA7CD6D5ADD';
wwv_flow_imp.g_varchar2_table(292) := '1ECFC14E6403812C6ADE8C0D48EECFCC1428B6BFEC52C2BADBC4CD6AC85809066CD66374AA1DFAD7AE7DE6A1872AF278E032465C02080046FC8007B03D04000310EAB086BCF3F4776CF39342402EC5292D5FDB92D7AD67C918C86BDCF7D81677F76C402C';
wwv_flow_imp.g_varchar2_table(293) := '25CDBA2F141B60B001666C8091F56000128BC9D018083315326602A2FF74688A9472AF4816818FC84421A01010000CEB65A8E1BC08006A78E87D6E1901409F02ACD2ED779EFE4E01008CC8F9D82F9F17D8162B33B384AF4D9377FE3DD5DAD7A2EA85E16F';
wwv_flow_imp.g_varchar2_table(294) := '53F58E02444605431B80B86AF2F3CF4C859D06248EB95DCC849EF560B751CEB95E3E07512F00C6EB00300400557A396AB01604003538E492B78800A064810E73B83B4FFF95D805602BFD9CE03CAB46800201599477A70A80763F01C928B8D6A059E69672';
wwv_flow_imp.g_varchar2_table(295) := 'EDCE25E006396E1060B1019980448C4978B8A2012E5C4D93D4DE6437C0080004BC1220BA0086F94ED4696E0400753AED72F68A00A01C395662943B4F7F9716036053ECBA4BC0B2C21376407D2E0204B9551D17B735BC043A1B603303920A773006A9603E';
wwv_flow_imp.g_varchar2_table(296) := 'BDD96046695DFB9E641D2E90E30EDA53C18EBD811A670A65469C846A068400A0122F458D168100A046875DD25611009424C82A0C73E7EBDF15A701EA416AD20297966F413640A6EA7511106852FC620DA97E0229B7406C331B2E0A1EE0177F1EADC311C0';
wwv_flow_imp.g_varchar2_table(297) := '98E9D27000033E96EC2910A506A8B18DF2C2F69886CB82B3019D8B074523333A0B8C4C85014F034406A00AEF461DD68000A00EA75CEE1E1100942BCFA18EB6E5F5EF4E5C00E97AF5BA75EC62031CBEF644F96A0A33892F905B75B001B6E24C0AF6D8F3EA';
wwv_flow_imp.g_varchar2_table(298) := 'BF5B7324636840C060035CC0C65513409FC32E472CC1829CC3CD66A42A08E6F4134818002053618B6701DC835900437D2BEA33390280FA9C75593B45005096242B308E0000AA1D70E7A87AB7EFDC597A97F3E809836E5AE8AE487A9B0D50697A1A13612B';
wwv_flow_imp.g_varchar2_table(299) := '74BBF46EE47F37D98CBC463C6A1DF9738872C49209B119081B1448A061BA4D52FD04E2752A000008002AF04ED469090800EA74DAE5EC1501403972ACC4285B5EFFAB662960278DEF08624BA86DCB759050E21A9D9FD0E759D1F8F618EAF744F1EA547BA7';
wwv_flow_imp.g_varchar2_table(300) := '52BC060010EA351F04E431032603613427D2C18DDC63CACDD00104C40D8FA234406008002AF156D467110800EA73D665ED1401405992ACC0385BCEF8552D0640F3F52735EF75DADE06028E36BF0E9FB7529A5ADA9DAE175D7E72C3E296F5F7B5CA7C2910';
wwv_flow_imp.g_varchar2_table(301) := 'E008E69346BDA016BA8C0BD0AD78CB2560D0F9920D3065976E43AC839CB83991ACAE18AD2EAE03D0F2D0055081F7A22E4B40005097932E6F9F0800CA93E5D047DA72C67B05036037EB895796AEFAA75BF1A662D46BE5DB2E01FE7B527427A3204EEA1E1B';
wwv_flow_imp.g_varchar2_table(302) := '04C8DF7596C1621C144D1F6FC04AD94BBB386CE0D0990D48B718D68B0069A8A34330A42C23AC5C006C2A04EFDAB58F610CC0D05F8C9A2C0001404D0EBAC46D2200285198C31E6ACB19EF8B5D00AE943A8D8A4F2C7697D277C505B82DF2341B50A0D88EA6';
wwv_flow_imp.g_varchar2_table(303) := '48F35D0252F966F413D0E8F9549640AA608F2B8B40B7F2335A0C27A0C50602325850A725C41C1EB7FF2317004C85307BEDDAC7300B60D8EF455DE647005097932E6F9F0800CA93E5D047DAF286F769DD000D5E3E1D4C9769B99BF4B6CBFA373AE9194AD2';
wwv_flow_imp.g_varchar2_table(304) := '56DAB605EEB6A8BBAB2068FAE1E5FA54605F8ED59E599950811E9355E063C99E03FAB8DA3EADFDC78C82880100400660E86F457D168000A03E675DD64E11009425C90A8C1301009E0540436D359AC27494B2ED1C559F5FF94E82819ED8804479C6AD7D0D';
wwv_flow_imp.g_varchar2_table(305) := 'D785236DD165D9277A390E542C5233C050DA194D8552A97E96B59FC10E481700E19500812100A8C07B5197252000A8CB4997B74F0400E5C972E8236D79C3AF69ED802D4B59AECEF6B3772CB4533C36C0B4C233ACFF8E91F5DCE8D6E979DB0277651F982E';
wwv_flow_imp.g_varchar2_table(306) := '8ACEE98FB64BA3535321472B61991369C993032A0610B900280B11000CFDADA8CF021000D4E7ACCBDA290280B224598171140070F9F15D4C80B26ACDDC780D2D180AAE5845BEF29B0A156103B29A0AD974BD4EE55BD1FE5613252193BCB8060972B4F80A';
wwv_flow_imp.g_varchar2_table(307) := '714BD40C080140055E8A1A2D0101408D0EBBA4AD2200284990551866CBDAF76FF3195941F5E63586C5ED52EC3AB5ADA5E825557FEC4C013B004EFEAE030C9E2520D30475856B2B63DB9FAFC71F74D35428DBCDD15D19616D7D49619F78ECC43D91CF6C24';
wwv_flow_imp.g_varchar2_table(308) := '5900844DD11019802ABC177559030280BA9C7479FB4400509E2C873ED296B51F506980A9B43553D1A7ABF79996B169C5A72DDDE8FE149D9F9E4335E2C9B1BC8D8E84262848EE4F5D63BB263470E308704CD5F14FA6C9624BD275FF49826934E6C04E4D94';
wwv_flow_imp.g_varchar2_table(309) := '2E80080004E80218FA5B519F052000A8CF5997B55304006549B202E36C5EFBEBDB1ABC0E006700121D655AD5AA9CAFFD793A66A0783F01DBB2B75805A338906E65BBD8011B6C88DFD34D853A170BB2414ADACDE12A86A4EFC56237B472BF59C58138D060';
wwv_flow_imp.g_varchar2_table(310) := '0C6681C0140D5B08002AF05ED465090800EA72D2E5ED13014079B21CFA481C00F884AC60B60BC011F8675AEF6EA5CB3FCD0601FCAF7635C0AC8041A9C4756060BB0E3AFF5EA89F4034850E6ED2590C261B20F79E05622443E060266CB9C60592641D0004';
wwv_flow_imp.g_varchar2_table(311) := '00437F256AB5000400B53AEE52368B00A01431566390CD6BAFD9E67BB212609C5AA747AB3BD20053966C4A81EAED78758B5D2A44CBD7EF9C230600C95A6C9FBD8BA570D1ECE2BAEC16C316C0D05D147653A18E2E0C47EC83E1F2D0E4A217378A6E138580';
wwv_flow_imp.g_varchar2_table(312) := '68C8D300EFC66E80D5783D467E15080046FE884BDF200280D2453ABC0105008883008D72BDB1556CFBECE5529D0C8165F13A8081A2D83536C0D5B237D1CB42A927D1F546A061DA05915D0A587709E896BBEEB78F3767ACC764039C0182F63E53710E1A30';
wwv_flow_imp.g_varchar2_table(313) := '89A630AB08462E0009003C76EDDA8710000CEF8DA8D7CC0800EA75DE65EC1601401952ACC8189BD77E503000D2226571D39C647DB1023402D76205EA02078ECFB2FB096820C0655D276023B6E28B58E02ED0915B4A58BA117450E0E80F60B9088CAE80B1';
wwv_flow_imp.g_varchar2_table(314) := '5257CC882D1F7D0EC57E24BD007406C0A308002AF26ED461190800EA70CAE5EE110140B9F21CEA680200700640B75285D257CD7B241BA05BDC8989AE45F6DB34BD768DB47AA5B24C94A66D8DEBF72408C0F0D19B6C801D072095AFED2250BF3BFB0924C0';
wwv_flow_imp.g_varchar2_table(315) := '212D87BC2647A98C8594F56FCA4030202673E1898F840BC00B10000CF58DA8D7E40800EA75DE65EC1601401952ACC8189BCFFA605C0A580BCEB32C6F45C1BB14BC0E042CA5EBB0C69DDDF812A5A8DD9F4CE556E40938E9D0712FBF2DAF1E1BA0B11129F7';
wwv_flow_imp.g_varchar2_table(316) := '467EFA627E6964171B60B20E511D00C66609E300C0BF76ED4377610C4045DE8F515F060280513FE1F2F78700A07C990E6DC4CD677D282E059CB64C85916E59CED27237F2DB5D20201F1874D74FC0B2A25394BECE2214E82E6858FB3608D01904CB77DF55';
wwv_flow_imp.g_varchar2_table(317) := '6C4056CAA10E6814D3C22B0112CE00F076C0080086F63ED46D620400753BF1FEF78B00A07F1956660401003CD30590D91A57284751F04753B416A59DF2851BD72B1621BFE29E6DF9DB2040FDEE64033A52F1693FBFD96190239C4E4D8D7AE82760B80054';
wwv_flow_imp.g_varchar2_table(318) := '802377013060538000A032EF461D168200A00EA75CEE1E1100942BCFA18EB6F9ECFFE86E076C2B754B192620807F1EB1015644BE2B40D06214F8AF6910202D70DDAAB703F5EC6B3460D2B74BC061B9771AD30A4E34F794B5761D0871E9D159C610000CF5';
wwv_flow_imp.g_varchar2_table(319) := '65A8E1E408006A78E87D6E1901409F02ACD2ED11002071106007CB3F36FB93A03FA3F46F62B0DB7E7C0B18384040040432E79634BC1E7FA0830393F24F95EF4DB08946E76732164A59ABE03ED77DE992BF8A11116374EE27A0D62DD20063068001BA00AA';
wwv_flow_imp.g_varchar2_table(320) := 'F4828CF85A10008CF8010F607B08000620D4610DB9F9ECFFA4DA01BB94A55361DBB9F172F5AE9441572BDE8C78830408D86C8215999F4C970536E23C7BBD66806B1F3A1070D422C8EE29A0011057B0A2366E0A0838C0876806240100AF03804180C37A1F';
wwv_flow_imp.g_varchar2_table(321) := 'EA362F0280BA9D78FFFB4500D0BF0C2B33C2E675FF5973012408C02A8D1B2FD755B14F730D24DDFC127DED8EE04F98044329ABB933DD0246B640AC36ED887DCDF5E02CDF9BCCD9999A97EB2449573F9B0DB001880D0C241BE0722B28D094000046A78021';
wwv_flow_imp.g_varchar2_table(322) := '00A8CCCB5183852000A8C12197BC450400250B7498C36D5EF7E16D3EC4CD809285D8CA51A7DF2DA56EB006B2A52F1100C2B08E5D0A37BE39156F203E3773ECED6BB3AD7FBBE3607677C11CC063C53088AE7EFADE1D6E800EB10259FD04643B60C6600A58';
wwv_flow_imp.g_varchar2_table(323) := '880CC0305F889ACD8D00A066075EC27611009420C4AA0CB1890300D90CC8507A45D800977F3F56DEBA756F29D368EF2EA5EF88034857DCD3AD6969914B36C0661C9445AEBAFA29CB3B5D2340B3E08D356AB10146C05F3CBFBD3FFD77673F01536EA20E00';
wwv_flow_imp.g_varchar2_table(324) := '882040C6EB006CC63A00557941467C1D080046FC8007B03D04000310EAB08694008057024CB7BE9556B76DFDC6AB75D5F0372878ED3A2708708CEBC83E7097DD75AD296E691C59EA6917416FFD04F418063E0205C50688DF15A0C9624ACC38085BCEB210';
wwv_flow_imp.g_varchar2_table(325) := '1023300521AF0380006058EF43DDE6450050B713EF7FBF0800FA97616546D874CE6F5831003282DD65DDBBE87FFB3387B24BAC69FEB758310BADA99511D619075BB94B7780F5B9CBC5C015B2BE74A39B60394D85C4BA8995B9D0C925900E864C7A014439';
wwv_flow_imp.g_varchar2_table(326) := '034CD4014000509977A30E0B41005087532E778F0800CA95E75047DB74CE6FBA830053B5FB250D5E1018B872E3B9559EC406E4F8F0133D6F53FA5A11A248B1BBE20C62EB9FE92D876DB0E1C812C87553E87B9756BF640324A0D1AF91AE09B392A2620A74';
wwv_flow_imp.g_varchar2_table(327) := 'B0C3C01362996540A7A0115CBBF61ECC0218EA4B51A3C91100D4E8B04BDA2A02809204598561369DF35B220D308A74D71457FC6F376DAE5BE2A6328BF970B535CD4D90D40D88A671B109B6E5EF8E1570D70CD0E8F8641F31E0305A08AB39DCB9FA05004E';
wwv_flow_imp.g_varchar2_table(328) := 'CAAFCF3D01FA7EB2D8001BF488B5C818008800401B0140155E8C9AAC0101404D0EBAC46D2200285198C31E2A01008952D32974A1B0B2ABF5155096C2ECCD2E1E542818300D18B29B0A658188349B90EC2DBAC5FDF7C49F903004361312CB2895F560072B';
wwv_flow_imp.g_varchar2_table(329) := 'DA2C84FA5DA601027701F8ECDAB5F7600CC0B0DF8BBACC8F00A02E275DDE3E11009427CBA18F9406006EBF7CE792BD2E26C0620A6236409511761AF1144E0000200049444154B519960A368F0D50C023BB82A0BC3FABE89069A5F7D46238010E1A0830B6';
wwv_flow_imp.g_varchar2_table(330) := '2CE7D09995744D00C2440C000280A1BF0EB55B000280DA1D79DF1B4600D0B708AB33C0A6737F7B9B4F6005A50E9F79AAFE7F11E5EC020269EA3B69E09304E9154D0D7434F171C502A4020433D6AEF9FECB6B2AE4884D70320C926111ED8019C014F12932';
wwv_flow_imp.g_varchar2_table(331) := '00D5793D467E25080046FE884BDF200280D2453ABC010500E0DD00432B375FB7A0E5FA64105ED1E87D9752CF2A239CC706B8E205CCCFF2190AB9173D654F93B9D5E6D7AC196053FE92BACF771944CC840D4232DC0C7A2F00E2210018DEDB50BF991100D4';
wwv_flow_imp.g_varchar2_table(332) := 'EFCCFBDD3102807E2558A1FB379DFB3B5A2F0057DD7E1B0868710189B1EFA2B82D0ADF50865289AA6B7A6A316CFBE5739B0A69FBD059072340D08C6948B91734B640C435583110CEF574E82E18D75F106980648A783C0B0063002AF48A8CF45210008CF4';
wwv_flow_imp.g_varchar2_table(333) := 'F10E647308000622D6E10CBAE9BC6BB552C09A4273A5D1454B34159FA2CD75052BABE66659C91A38D0AC62A3C57082296CF781A574A3A1D20C81CCB15752B5C18DE6F2D015B7A1E4ED9A08B61BA1183B9014324A9886B40C1317000280E1BC08359D1501';
wwv_flow_imp.g_varchar2_table(334) := '404D0FBE8F6D2300E8437855BB350200511A60A873E28E1C7BF9E758333B7DE796D59FA19CD30A5BA7CB63A5ABDF9BD9BED7052474562183D1D01571026A5C8C85CE76D894BE053C72D901317604042C7703FF5DF50260C80054ED0519F1F5200018F103';
wwv_flow_imp.g_varchar2_table(335) := '1EC0F610000C40A8C31A320100D2E24FF9A9F9CAF202049545EECCAB4FF46A969BC0ADC48D80BC0EEE0321BB2E5B0CA7D6E5F2D99BA0A0B7A642B65BC191D2C8A86807CC3800E07500D00530ACF7A16EF32200A8DB89F7BF5F0400FDCBB03223DC71DE47';
wwv_flow_imp.g_varchar2_table(336) := 'B635380310010017A52D95A0AD6075A56B8100C3F2772978DDD5600103CD3F9F140E929FA53AF215CF1C70A60B3AC189CE1AD8947F4699642768D25D1769B7850A12940C008D4A01134000509997A3060B41005083432E798B08004A16E83087DBF4A68F';
wwv_flow_imp.g_varchar2_table(337) := '6CF380AC6089CF3FADF48CE2FAB90D8024659E4ED54B830B1B04E8D6B60417423246CAA013049896BA20046CA5EBEA27104BBE2B9740BCC75CCA5F0752FA3A4CEB5F8212CE2CC85E0004E0DAB5F7DC8ADD0087F952D4686E0400353AEC92B68A00A02441';
wwv_flow_imp.g_varchar2_table(338) := '5661984D6FFADD6D5ECC00288ADBA59CE56AD33100E22F7AD11B4D71DB8A328B1D483506D2E68BC7304B095B4ADF0ADECB6E34A48114BD6B9061C56BAC444E85C09E5C02C6FEC55A3CC6E25E009C01E09500110054E1DDA8C31A1000D4E194CBDD230280';
wwv_flow_imp.g_varchar2_table(339) := '72E539D4D136BDE9F7120020ADF4345D9E41B567F9DD2D96203B36204D8DA72D77D34A37D2058DD8801CE622A3DCB072316847E062036CA56D819A1410280A7AE275C5F2112E00C6EB00200018EA4B51A3C91100D4E8B04BDA2A02809204598561369DFF';
wwv_flow_imp.g_varchar2_table(340) := '7B910B40C400685635B3A8F75CCBDDA2B90D60202D6E57447E76E09E584A76473F4379E7C60664B119C2CA4F52F4F4BD3BD80C33C8D0061BB2CDB005689CB1017C223D0551C600C02C61740A100054E1B5A8CD1A1000D4E6A84BDB280280D24439FC8136';
wwv_flow_imp.g_varchar2_table(341) := '9DFFFB8A017058CA4E3620A59CF30204355091285C5B519AD7185271760DE44AD31AA3E7D800315B7E4F010D1CE514FF71774E74B01C099852EE085E0780309802C60B01210330FC37A31E2B4000508F732E73970800CA94E690C7520020EDC3CF750918';
wwv_flow_imp.g_varchar2_table(342) := '8C80F4999BF9FC626BB2BBA0C60424FA5E2A473D684E0AC465B99B9F99147E3C7757DD054DE622DD6150DF8F0E021C8045A7F36DD974884F884A0133CE00300400437E1FEA363D0280BA9D78FFFB4500D0BF0C2B33C2A6F33FAAC500B8AAEAC58ADB50AC';
wwv_flow_imp.g_varchar2_table(343) := '9A024C59E89DD90023984F2FC59B050C0C859A9EDB6003A21AFC79B105F9C0A2739BE118EC3895BA02349DBB0B2A70240B0111802908C9B56BEFB911B3002AF3868CF64210008CF6F90E627708000621D5218DB9E9828FC631005AE4BB33225FFACBF328';
wwv_flow_imp.g_varchar2_table(344) := '6DA99C5D167D113620CB5F1FDFAB1BDE460D7FF187B2FA09F0D1B25D021ADBE1022C16F8486556A480038DE210782120020C01C090DE83BA4E8B00A0AE27DFFBBE1100F42EBBCADDB9E9828F69310072791A359F61E9AABAFD1DD800A355AF0610B471F3';
wwv_flow_imp.g_varchar2_table(345) := 'FB09E85A3FC7556053F0923530D6DFF97E21010544DC4040775DC831AD756A40C0CC82485F1F31003C0600280280CABD21A3BD200400A37DBE83D81D028041487548630A00C0DB01C7950013DD6783005BC18905A782F15CF47B2A5DB0081BE09ECF50D0';
wwv_flow_imp.g_varchar2_table(346) := '4EF783BDAE8CD800E73ADDE98ED9AD86F3581333EBC1286DEC0019BC10509405802E8021BD09F59C1601403DCFBD9F5D2300E8477A15BB77D305FFCD04005239194020C3CA8DF7A2ACE40E6C402A8EC00C104C0085D36A9782D395AEBBE29F34E08D0A82';
wwv_flow_imp.g_varchar2_table(347) := 'C96D1DD88D640BBA951F838A8E5510ED54C7F4EF2236C01C3B6200286700B80B801702C218808ABD2623BB1C0400237BB403DB180280818976EE07DE74E17F172E006AD50130A8FB2CA5A90383227503FAE9272035B3A32B9F43A9CA4A80BDF713B01888';
wwv_flow_imp.g_varchar2_table(348) := '14D871C924E733DBE561B8083826A0220D30E485801000CCFD9B50CF191100D4F3DCFBD93502807EA457B17BEFB8E0BF6FF33DDB05E00AC6CB7209B840807EBFAD483B150412F7AA4C016D2CA3742FBFCA2A1454D425D053CD00B50F776D041DDCC47483';
wwv_flow_imp.g_varchar2_table(349) := 'CD64A47E17818B220B80A701C21404BC0E0002808ABD2623BB1C0400237BB403DB180280818976EE07E600C0F3BC154CA7B773A96E8D8A4F149AA5A419011229E758B51916BA6EC9EBF7C59FBBCA083BD988781D39D502953415E870F71370B938F4F568';
wwv_flow_imp.g_varchar2_table(350) := 'FBE81820A8ED4FEB6C28020BE53C26C08AD7140300FFDAB5F7DC80698073FF2AD472460400B53CF6BE368D00A02FF155EBE63B2EFC1F5A0C8045E31B16ABAE1035109018C652C1C5CA322925ACFBBB49CAFF6D96D8D5C181CE1C887F675725946C800B70';
wwv_flow_imp.g_varchar2_table(351) := 'A4D90C23202FF97386828EB66A5BF7E63CE99E027651255BF19BAE1011174067092153D0E2ED809101A8D65B32BAAB410030BA673BA89D21001894648730EE1D176D50BD00B252E9ECB2BB36956D80004D7147E395CC06A4E62EA2F46D86220614897297';
wwv_flow_imp.g_varchar2_table(352) := '6C820E02D2004404EFE96C80022C029C584C41B256BDF67F1AE4700931A0B3BC101041003084B7A0BE532200A8EFD9F7BA730400BD4AAE82F74500206E072C586AE9834F5BCE2A3F3ECB8FAF2BCD5E6203B25C02D6B846A3221B70D88A5BEEA903089024';
wwv_flow_imp.g_varchar2_table(353) := '42AA32A12306C191CDC095B81DDDEF6C20E46C9424EB00300400157C47467949080046F97407B33704008391EB5046BDE3A23F880140282C58AB946E5EFEBA53E145FA37AD349585ECB28675ABD80502B4BFC75212E3B995BAB8C41A27334050AB202863';
wwv_flow_imp.g_varchar2_table(354) := '0D12CBDD151BE0F0E36BF375AE2018AF4D6332542120986A035C7BEEDD1803309497A186932200A8E1A1F7B96504007D0AB04AB7DF71F11F58ED8035059ED9E0A693D59D558F5F46F7EBD1FB765A5F8E823594B86CC16B2BFBAC16C319E983B1D24FD70C';
wwv_flow_imp.g_varchar2_table(355) := 'C8B3FCF3D991748B619D31B1EF95ED80791D0032D5660C0140955E90115F0B0280113FE0016C0F01C000843AAC212300C02B014675001C16B55DD2D615919FB2AED356AE8A8077D40B4874B86ED567D50C30D980EC2A7D3A3070296CEBEFB65B21B3A950';
wwv_flow_imp.g_varchar2_table(356) := '9A8D483321F11E9369E53F1C4080312011F1C20100200018D68B50D3791100D4F4E0FBD83602803E8457B55BEFB8F80FAD5E002ECB578F0D90CABD770B5930E68E5803ED7333DEA0536C405136C0C55CD89F15682AE45CA7BB2AA1EA0A68030E05760C17';
wwv_flow_imp.g_varchar2_table(357) := '00A3C80054ED2519E1F5200018E1C31DD0D610000C48B0C318F68E8BFF486B07ECF2796BD67C8A0DC8681F9C6BF96ABB8C73F8D3697476E05EAC2C0D1CA07FA68189A273A7FA1398567ABAC5B08351D0FCF8CE1CFF823503543B6036D5A6080086F11ED4';
wwv_flow_imp.g_varchar2_table(358) := '754E0400753DF9DEF78D00A077D955EECE3BDEF247DB3CE095007910A0FCC989F23782D75CFE7A5B59A77DDEE9791C4D850AB301B29F8050D0E9CE825956BFEB739BAA77D44570351172B9401CE040B92B4C3021DA01F3344032D5A6013200957B4B4677';
wwv_flow_imp.g_varchar2_table(359) := '41080046F76C07B53304008392EC10C6BDE32D1FD77A0138687DA7CFBFDB7441A9F0B21886A8104E5CFE5703213D82007E5B3A362087DD30E6490383626C409E4B448DA99A01A9EB950B803300080086F01AD4764A0400B53DFA9E378E00A067D155EF46';
wwv_flow_imp.g_varchar2_table(360) := '01003406C0B05CE57A752B3B5666890B5BB3BA3315B6A5D41350E1083A345A0CE7310C8EB8008BD6CF6503B2CA0B67A40BE6371592322906022280A2CD130100C2660985A936F5AE3DF7EEBFC152C0D57B55467245080046F25807BA2904000315EFDC0E';
wwv_flow_imp.g_varchar2_table(361) := 'AE0080D60D300502B214719C38900AE873B810721AF518D907CEE040479BDD046C64295DDDC2CEB83F31CC55405E24FDA24D85A2DB5C204673251873A48110A7FF050080590274AAED7BD79E7B170280B97D0BEA3B1B0280FA9E7DAF3B4700D0ABE42A78';
wwv_flow_imp.g_varchar2_table(362) := 'DF1D6FFD44F11880447F39945E0C1A8C803EA76FDC528E8625CE27300B0519F4BB3370AF687741970BC08E4F48B4B5D869112020AF2902048C31D55CD10BC5BB01428800A082EFC8282F0901C0289FEE60F686006030721DCAA8B7BFF58FB7F9BC147054';
wwv_flow_imp.g_varchar2_table(363) := '07C052804EAA3EBEC666092C4598F29B3BABF6C9F9F2FDF38A2ED7D6E754CE361B9006079975035296BACD7AA4C182513C28C12D7620A1C355618105D10B80CD7AC0A6DA3E2003309437A19E932200A8E7B9F7B36B0400FD48AF62F77200C0630018CF02';
wwv_flow_imp.g_varchar2_table(364) := '487495DB37EF2EAFEB6203C4676910A0030C5765BE0C6B3EBECD50B819D6B4B0DAED35A55907158CA71F4827A59F17B310FF2D0202B60BC00102B4F5CB34400036152200A8D81B32DACB410030DAE73B88DD21001884548734E6ED6FFD93A40E803B684E';
wwv_flow_imp.g_varchar2_table(365) := 'B7F81D0C419EE51CEBBDDC7E02299641B7B4D3CA34556BDF6022A402D74B0DCBF5DB2040E869A2BB1C7406A44BF745361B90CF6E70C02219000100183200437A17EA382D02803A9E7A7F7B4600D09FFC2A75B700002A0BC004010E6BD6C0007974776CCD';
wwv_flow_imp.g_varchar2_table(366) := '17E92750D8D5A094A958679E0FDFCE5CD0818069C9AB6A7D59CC818BB948B301E97E022EF9A5990F910608B3003015FA2102804ABD21A3BD180400A37DBE83D81D02804148754863DE7E490C00B4180033902FCFEA77D1DDAECF94D24B14B7CBDD90A2EF';
wwv_flow_imp.g_varchar2_table(367) := '75F6C1A6D51D3D059C56BB8B0D906B34C7144D7C5C34BF8B3D48BB15C4AD562961174361B026B219500C003C0400437A156A392D02805A1E7B5F9B4600D097F8AA75B30000BEAA04A829AC0408A494753E4D2F15A1DAA9CD06E8D6B8BCCAB6E61D7E7327';
wwv_flow_imp.g_varchar2_table(368) := 'DD5F04086435164A2BF6ECE642163088969D1FC760300B3940200A01042618000400D57A41467C35080046FC8007B03D04000310EAB086BCFD924FC62E00AD1BA0A5F0B3DD029AC59CA19C5301715429D2DCD80057C9DDAC024256619D44962946C151D0';
wwv_flow_imp.g_varchar2_table(369) := '284389AB96BE1DDC1C390585F22B082AD98952C01200F03A005FC74240C37A216A362F02809A1D7809DB4500508210AB32C4ED977E32AE03A053E5E9C0B56C36C006013A8D9E5180478B944F83007D3C97D56D370AD215A9E3FAC26E01FD5E218B746C80';
wwv_flow_imp.g_varchar2_table(370) := '944BD179C475E9D80093DD100C00CC026353A18700A02AEF461DD68100A00EA75CEE1E1100942BCFA18E76FBA59F120C401403E0526CBA42CF4AED935BC84FE313E36B73C46C40C774416309F91679B19A011920C2C13A14EB2990050CECD887584E7C1E';
wwv_flow_imp.g_varchar2_table(371) := '8D6549D20019770110640086FA46D46B720400F53AEF32768B00A00C2956648C0400C4AD79CDD2B6B1E635E8FD02202051D816A07076D213CAD80D02E440BAC2CC6318D47A3BD70C70296D79BF191B50BCC3A03DA60956CCB6C7322E42C8336200089B0A';
wwv_flow_imp.g_varchar2_table(372) := '010140455E8D5A2C0301402D8EB9D44D220028559CC31D4C00001E0468C700E4B3014E65666C258F0DB082EF226220832E8FC6CCA1DE7302F13A9711B615BECE64586C45E10E839DD9009529206424BB010A17000280E1BE11F59A1D0140BDCEBB8CDD22';
wwv_flow_imp.g_varchar2_table(373) := '0028438A1519E3F6CBAE2B14032096EBB69A556A9F20B3D54F3A962019C7553B3F661ADCFD0474CB3FBF4EBF11781829581B70D86BCC62036250C4D4BE8AB101DAF829D6234DFF2700806701002F0484418015793D467E19080046FE884BDF200280D245';
wwv_flow_imp.g_varchar2_table(374) := '3ABC016FBFECD3A212602A0640D1E94595BA0A14740001CB8DE00413B9FD04740060C701C8BFB90047CC2C38DD0F163048351BD2C735DD102A36A0F3DCA98E81D12D6A6ED90C28620060160B010DEF75A8DDCC08006A77E47D6F180140DF22ACCE000900';
wwv_flow_imp.g_varchar2_table(375) := 'E02E002D30CDB0E2733F37AD695ED6365D8F5F071396259F52BACA372EA87297356DC716C8D5DAC020ED6AE8EC1670B92EF8F869F914CB60C85BBF720100E15900742A64C80054E7ED18FD95200018FD332E7B870800CA96E810C7BBFDB2CF24BD009455';
wwv_flow_imp.g_varchar2_table(376) := 'EE52D2B692CD6208C4E799CD7632C14486528F73F905BB10FF18F9FDFCBE9871305886226C40F6354E102303250D3747EC62C80A70EC58B238AE04C8783B603615328A2E8021BE0F759B1A0140DD4EBCFFFD2200E85F869519C104009AE2CFA4EC7570A0';
wwv_flow_imp.g_varchar2_table(377) := '2B50F3F3CCFAFA068E70297DFBB39C54BA48B94A774396E59E518B20890DE81604C8F5992586854B405FBB2E4BFEB9CE04C8BFC5EE09F1D78801A008002AF36ED461210800EA70CAE5EE110140B9F21CEA680200F06640320BC05654590ABF330DAF4080';
wwv_flow_imp.g_varchar2_table(378) := '630C8364C8A2EE2D256A04F4650502F259B3EAFF9B8A5744E0DBCAD9DA97B3FA209F5BCE612A7D5187C01EC3B556558B20E906C8608AB2001980A1BE11F59A1C0140BDCEBB8CDD220028438A151963E3DB3EB3CD97002093C62E66F5475BB228FEDC16C3';
wwv_flow_imp.g_varchar2_table(379) := '592020F9DCF6E13BD80067A53F4BD127D90B3AFDA02CFFCE5902AEC24172AF7C1C8B0DE81204104280311655024400509117A326CB40005093832E719B08004A14E6B087DAF8B6CF26ED80133FBB8BCA4EF9EEB3E97F050494259C8E9A37B4BF230031A3';
wwv_flow_imp.g_varchar2_table(380) := '8E80744DC4F9F3E96C029BC1C8EB06A8330C05D30553AE111D1C9896BFB3BB6034A5096C6227C62C50EE02400660D8EF449DE6470050A7D32E67AF0800CA91632546D9F8B63F3582001508D0AD655351BA5BE6766609B29B0AB9FCE39DE6EC930D3014B1';
wwv_flow_imp.g_varchar2_table(381) := '9A4B9512D6D7643111594D891C96BFB3A99035B72A054C6F2384FCD7B3BFF3A5472AF170E022465E02080046FE884BDF200280D2453ABC01375EFEA77121A0305A845984270F047456F8AEAC82E22D86ADF153963713CCBB68A5A7D2050BE5FB6BFBCA70';
wwv_flow_imp.g_varchar2_table(382) := '7B64BB056C6060C742A4630832032293EA877C2B8C6701DCEC53EFDA377EEF8B8F0EEF89C099EB24010400753AED72F68A00A01C395662948D977F2EA310509CCA97E86157609BAEA4E37FBB14B5638CECD8007D9C2C906105DAA55A0C9BD5F684A0BBED';
wwv_flow_imp.g_varchar2_table(383) := '27A0EDDF882170050D7602013255D02D2F12954EA033C0E09F7D4A7FF78D777DF9894A3C1CB8889197000280913FE2D2378800A074910E6F4001007816806000EC54B662417C7951EFBAB56D2AC08E20200B7C1820438B45B0FB09A46219F4623E051806';
wwv_flow_imp.g_varchar2_table(384) := '57196143469A6BC0193761FBFAF5B809F5B7280B80D13DC0E05BCD90FDDE99DFFFCBE787F744E0CC75920002803A9D76397B4500508E1C2B318A0200F9CD8072030453C0C1E53FD714AEC5121874BB8E25A4E59E35BEB39F801578E852D8992C85C3D71F';
wwv_flow_imp.g_varchar2_table(385) := '7919F2004E1E08B0B307C4B536F0F10800656C3721F0B5858B838F9E72D397F754E2E1C0458CBC0410008CFC1197BE410400A58B7478036EBCE2CF8C18809806D0FEA32B545D89DB9A3AAFFB9F69F9BBFA00643700CA060E8AD6B7147714F86F2B5B8712';
wwv_flow_imp.g_varchar2_table(386) := 'CFB4E6E579E8CADD6A839C6A8CA4B9069C0581EC26408A0D8801C076C2D89F9DFD9DBFD830BCA70167AE9B041000D4EDC4FBDF2F0280FE65589911365EFEF96D9ED74D33A0B405AB3623955A7FE0C0CC44E8E45E70CD197F16C70674DF4FC045D50B5051';
wwv_flow_imp.g_varchar2_table(387) := '980D70C61CA4C7E56B232C72013C0324FCF8BA3BFFF28B9579387021232F010400237FC4A56F100140E9221DDE800200C4310089AEB5946E8A32D7B2055C747AEE380E36A0DBF19321EC753AC042CC06740F02E24932F6D7B9A95046F1205979301E3766';
wwv_flow_imp.g_varchar2_table(388) := '3E386770BFD7F63F7AF65D7F76E3F09E069CB96E12400050B713EF7FBF0800FA976165465000208E01E8A8BC4D05EE2EF093AF3CC5E65D20C3FE3C2B7A3EA3B46E2A3F5FB3B8ED0041C342CF5B8B8B0D88DD0BAE1884645F3A33E16044E2F9B9FC184000';
wwv_flow_imp.g_varchar2_table(389) := '0CBE3B46C86F9CB9E5F3F756E6E1C0858CBC0410008CFC1197BE410400A58B7478036EBCE2F3DB3CE2AB2C0067D95C4B315B56716E95BF14A0C8A6D7DDED887510A0AF431FC7FA3C9395B06A06A49804B9D80E55087500E3CA1448050D66372AE22E0506';
wwv_flow_imp.g_varchar2_table(390) := '6C8630F28FBB76CFFCFA253FC100C0E1BD0DF59B190140FDCEBCDF1D2300E8578215BA3F02009EBF8252BBB98D2B975E2EDC9D679FDB01D0A594B314B061302BA5DCF5F8594020C506C4FB72D5F037C6C863035CE0C4E5A230D900FE3251602F321A7EFE';
wwv_flow_imp.g_varchar2_table(391) := 'DC3BBFF047157A34702935900002801A1C72C95B440050B2408739DCC62BFE970000BC0E4047FADFE163B7EEC9AD1B90CB063814680A2094C8066855F884FC75CADE663CF8DF8AB9093A3716324184C71B01017BC063ED0F9FB5F9CFEF18E6B38073D74F';
wwv_flow_imp.g_varchar2_table(392) := '020800EA77E6FDEE180140BF12ACD0FD1BAFF8421C0468D7017059B49662948A331704141927A3729F4638E84ABA634F818E567BBC260E0234BD9E062F2EA5AFB90932188CC2FD04E20C000A6CD3929D7BDE7CCA4FBEDCAED0A3814BA981041000D4E090';
wwv_flow_imp.g_varchar2_table(393) := '4BDE22028092053ACCE136BEFD0BDB3CD06300A472B4B5AFED73CF57EC1D6BFEF7C906F4347E079700DF9102010EB623B309905B169DFA09F8C48380852F0163D79DBBF973D70DF339C0B9EB29010400F53CF77E768D00A01FE955ECDE0800F02040570C';
wwv_flow_imp.g_varchar2_table(394) := '40CAC2B5C181CD08A42DF9EEACF50EE0C3984E28E8DE5D0E0E4B5E0BDE13E366C44158ED7CD30589D442536C8006421A8440C8E88FC629BDEA8C2D9F7BBC628F062EA7061240005083432E798B08004A16E830879B7AFB9F6FF3F52C80BC08FA64A19A75';
wwv_flow_imp.g_varchar2_table(395) := '5C20B8AF98B59E155F6006CDB994724FFD0AB2DC04DAE7B96C400A04B8F2FE6390E2B8D6070294D19D94D12F9CBBF94F3F36CC6700E7AEAF041000D4F7EC7BDD3902805E2557C1FBA6DEFE45D10D9051D50AB88052575B3183DA8CCFAD717A52D472C002';
wwv_flow_imp.g_varchar2_table(396) := '7EFDEEC6EFB0EE141BE0AA3D90D775300D68F42A823EE10020FC3E218D0F9D7DFBA77E5EC14703975403092000A8C12197BC450400250B7498C34DADFF62AA1780DBF2D5E979DB2ACFFA5B5AC99A35FF0D4E5FA3DC5DFEF774A74215B9AF51EE91307382';
wwv_flow_imp.g_varchar2_table(397) := '0A3B321CDA9A0D36408EEB622A2C774274A9FD9962031ADCF74FC3170983CF9EBDFF2FAF2337DC10B7621CE6938073D751020800EA78EAFDED1901407FF2ABD4DD53EBFF523000510C80526E266DDF053D6F283FCD7CEF9A0D7050FF596327FA5F5F7F8E';
wwv_flow_imp.g_varchar2_table(398) := '859F1A27E35AA9C435659EEE8AA829FA647AFB33875C81DEE6817F2D5AFF957A1D6AB7180400B53BF2BE378C00A06F115667000100B27B01A82A7F59BEF8CE3E7AB1DB7435BCEE41863657A69BA21F10C3D798B19F783E774F0189403ABB04B8F51FB2F0';
wwv_flow_imp.g_varchar2_table(399) := '31C6D82749B8F0EBE76CD91054E769C095D44D020800EA76E2FDEF170140FF32ACCC080A00C495001D016BDDD5FB8FB7E60A92CB88AAEF69FC682C97B2E69F716861B10129C0E00625E23EB33E40F2BBE1122862F96BC00000BC28F08FED2684FD2DB4C9';
wwv_flow_imp.g_varchar2_table(400) := '27CFD9F2498CFCAFCC9B50CF852000A8E7B9F7B36B0400FD48AF62F74EADFF521204A8969661ADE72A755B194B059B56C8996C4057E34BDA3E6BDEC42F106DAB7B9091013064C5645EC447AF2294991A28D6212049D44EF80EE2B34FACBBEDBACD157B14';
wwv_flow_imp.g_varchar2_table(401) := '703935940002801A1E7A9F5B4600D0A700AB74FBD4955FD662004CA52914B5A9603315A95379CB9D6634C349D5DECFEAFED7C19FEFB2D8B9CA2D3CBE0E56F4D371B101F1B5719BE1045C245B8DEF4986117B1FF37C6885C1C384C11F3F1E8E7FEB7D5B36';
wwv_flow_imp.g_varchar2_table(402) := 'CC54E939C0B5D453020800EA79EEFDEC1A01403FD2ABD8BD090060B4432F00331090A402DEA412D594BEAE04A33F3BACF52C97438245CC79F3FB150C820DC8621A18EFE213FF080BDFEC27A05C04635E1366C3D6F31E90CF4EEFA55F7EEBF73EF94AC51E';
wwv_flow_imp.g_varchar2_table(403) := '035C4E4D258000A0A607DFC7B61100F421BCAADD2A00000F028CB3000A2BF658E9B982F13A8EE1621A4CE0D05D85BFEEC1476797806B8D1618912C83D158C8642B22CB9F063B3D069F6313CDFF75CE4D1B5EACDA3380EBA9AF041000D4F7EC7BDD390280';
wwv_flow_imp.g_varchar2_table(404) := '5E2557C1FB4C00A05BB10E05E8B0CADD8A545782FA389A02CD8AB6D72DE9D8779EB6FA735C0259E0C3D88EA2E9FB6F31CC078ED993786E2E133EAEC723FE69B8D363ECAB0D687F66EDC6EB9EA9E023804BAAB1041000D4F8F07BDC3A02801E0557C5DBA6';
wwv_flow_imp.g_varchar2_table(405) := 'AEFC8A230830CBA24E2BF662857D1C20C060EBB5887A0B64142B239C37BE3576192026C57A4879097F3F5F7314F4C7D8F304E0EF3C609F3F7BEAE38F55F1FC714DF5960002807A9F7F2FBB4700D08BD42A7A8F0000711D80D41A8B5BDAE534FD910B98BF';
wwv_flow_imp.g_varchar2_table(406) := '4D8524A3C0187B9C50F87BE2795F3FE7B60D5B2B7AFCB8AC9A4B000140CD1F801EB68F00A007A155F516050064449B1D48D781CED7ACE16C6BBD28A39065C98B35F4C706D8FE7BBD54801CBFF85E5D6588797BDF300AA664F73020FF9F4FE0FA736ED9F0';
wwv_flow_imp.g_varchar2_table(407) := '5455CF1ED78512400080CF40B7124000D0ADC42A7CFDD4555FB5D200F5C576569ABDD7E377287B073DDFB9FB5F1668C807136A97FDB20DDCDF4F627F7FB09B30F85700F8E2AEB13D1B2FBBF1BA5D153E7A5C1A4A001000E043D0AD041000742BB10A5FBF';
wwv_flow_imp.g_varchar2_table(408) := 'F1AAAF3E4B88772065A15E3C4F5BB183114805DAB95D05DD47F217650AECB43B5DD9171FC3000116F828C23644BEFEA8AB1F8F6864CF301A7E8B90F02FCEBBE5E3BFA8F091E3D2500289041000E0C3D0AD041000742BB10A5F3F75D5579EF2887730D58B';
wwv_flow_imp.g_varchar2_table(409) := 'E6A4D2E9B3DC029D3FEFBEDEBFA6CC333305D4BCDDB500CE0207FA9C2698C81A3FAEEC4781C13400BB87507A1D99817FC1DAFE157ED8716929092000C087A25B092000E8566215BEFEB6ABBEFA880764152F532B7E6C3FB85C7C0A15E4B7EFCD8C0DC862';
wwv_flow_imp.g_varchar2_table(410) := '14F2620F5CAE081D04E88A3DCB6DE1F8DCB2FACDFDBBC7E7808001F0F6BDD384B18719C0B7C346F8950B6EDC80297E157ECE71696E092000C027A35B092000E8566215BE7EEAEAAFFD10183B3589B1D34180690C1B0D76D496F2CAFC3AACE994FB204B79';
wwv_flow_imp.g_varchar2_table(411) := '6BC02333EDAE98B56E56E8D30F2327CBC1010E08304A184C53060F3212DE1906EDBF79F36D7FF4EF153E5E5C1A4A2057020800F001E956020800BA955885010B5D5E0000200049444154AF9FBAEAEBFF07805D42009A8A05B0ACFE222E812E147B668B61';
wwv_flow_imp.g_varchar2_table(412) := '83F2B72CF6BEC7EFA0EC23859FC34E10B217286C0516DED220DEB7D7DDFCD1EF56F858716928814212400050484C78912601040023F4386CBCEA1B7FC2807D98105818C5B2E91DEE927D6A8AD1D091450204DD16BEC897B7DC0E927DC89C23836D489A01';
wwv_flow_imp.g_varchar2_table(413) := 'F5131B90C944848CD1E73D06FF008CFEC32C5BF2B38B6FF98D9D23F408E0566A2C010400353EFC1EB78E00A047C155F1B6DBDEF9D5AB2184BFF089BF54F4038815A173B1AEF800476C4047C56E296A27C59F05108A0007317E760062A6B2D7E21AA26BA6';
wwv_flow_imp.g_varchar2_table(414) := '81B15BDB043E75D8AE250F9CB0E53FEDAEE219E29A5002BD4A000140AF92ABEF7D080046E8EC375FFD8D23DA8CDDE511B2520100B94157E09F06109CB4BCFDF7CE4179D98D797445AD03931C3ADFB1A6DCC63F0613214003656C9610F83E40F0276FBAF1';
wwv_flow_imp.g_varchar2_table(415) := '631B47E8B8712B280143020800F081E856020800BA955885AFBF7EFDF563FB3476DF4A189C4518F8997100A93D146103D24576D25906D25ACF52EA454040677090D7B448D4EDE7CA9FED0260FFC618FBBB05AD991BDE70DB86972B7C74B8349440DF1240';
wwv_flow_imp.g_varchar2_table(416) := '00D0B7086B37000280113A72061BBC8DEF38ECBF0183DFF108594269D2E45EDB6551264057C4168B90A2F98B54E0EBACD85D95028B818CB8690F21C018E58AFF678CB16F43E0FFF3F7FE65D7D60DB0C12588113A79DC0A4A00B012203E045D4B000140D7';
wwv_flow_imp.g_varchar2_table(417) := '22ABF60DB75CFD95751EF85FF108592502015D11F12EE5AE29F9BE3305D4F8A6B56ECF5B9C55709529E6A3F1F179DD7E4AE90C30F809A5ECDBED90DC06D0BCFFA25B3EDC2240B2104FB50F12578712E85202C800742930BC1C10008CD84370EBBBFEFA20';
wwv_flow_imp.g_varchar2_table(418) := '12049F26C0AE20844CE48300CBB23764A12B67D775B6DBC0CA02D05882749BE12C36A03B96C023043C2010D2F03E007A3D21DEADB4B9F0A1BB6E7876175AFD23F660E3763A4A0001404711E105960410008CDC23C1C8ADEFF8C67B09C01FFA400E116581';
wwv_flow_imp.g_varchar2_table(419) := 'F3ACFB7E4040ACB053C17AD9E040800199A198B536179850E0808F31D118833DEDD99709235F2614FE3198A0BFD80987ECB8F2862B79653FFC4109D44E0208006A77E47D6F180140DF22ACDE0053EFFCC66A46D9A700C8C51E81F1840548946F87380063';
wwv_flow_imp.g_varchar2_table(420) := '4B0503040B2BF5A2AD80D31907BC531FA7FBDB617BD623F0D700F0F58970C9BDB7DFF8E4345AFCD57B0E7145732B010400732BEF51980D01C0289CA2630FB75DFDCDF703611F25408E628CC679F4FA852E8A5F59D9E6902E10E0BAD655DCC79D1160BA05';
wwv_flow_imp.g_varchar2_table(421) := '6C40628E13F9F88102A3EC2502F01DA0EC5B633EFBCE59FFF85F9E1DD1E3C36DA104BA96000280AE4556FB1B10008CE82370F37BBF716063867C1C805DED11B25076084C28F868DF3D808094DE7728EFE89A7CA52EC59ED70190FBF87DF0A04D83171961';
wwv_flow_imp.g_varchar2_table(422) := '3FF218B93124E4CEB1975EDA8A9DFA46F4C1C56DF52C0104003D8BAEB637220018E1A3BF65FDD7CEF07CF21942BC3384AEE74A59AFAC97F804DC5583F34A0917CE14C802022692D0810007290DCF87366DEF24C0EE624036B6DB6CCBE4B8FFC839376005';
wwv_flow_imp.g_varchar2_table(423) := 'BF117E64716B7D480001401FC2ABE9AD080046F8E01930B2F1AA6FBE9D01FBE366A3B9AA1D06DA6E59DA2D90B2DA3580909253C1D80047353FC53C98E02052FCC48380859CF1FF2E01F81780F6E699D9BD5BDF7AF3EFBF32C247855B4309F42D0104007D';
wwv_flow_imp.g_varchar2_table(424) := '8BB07603200018F123BF6FFDF5634FFAD3BF06403E36EE370E6985ED7C10D08B5BC0D0E38E00C30EFD04B8E2F73D0F9A5E0366DA330F5342FF1E804EB5F7361F78EBCDFF1115FF883FA3B8BD72248000A01C39D6691404003538EDCDEBAF5F34E3EDFACF';
wwv_flow_imp.g_varchar2_table(425) := '9EE77DB8411A2B431AC6EE0065E19BB10159C5834CDA5E892E2BED4F176E3A4090CFE9118F57EFE335FB9F0560FF485878537B82FDE0E2BFC52E7D357834718B254A00014089C2ACC95008006A72D0FFF71D5F593101CD0F0083F713802309891AE50CC5';
wwv_flow_imp.g_varchar2_table(426) := '25C0153F2184CF1F02B0A719C00F08856FB766E8CD68F1D7E481C46D962E010400A58B74E407440030F247AC3678EB155F3A888D35AF2600EF26E0BDAAE1797E40F5BA398EB880125D0211D54F3C081905C6D8130CE0A71EC014A3ECF60BFECF871EA9D1';
wwv_flow_imp.g_varchar2_table(427) := '51E0565102A54B000140E9221DF90111008CFC119B1BFCF63BFF7669135A170223EF04C6CE6A7A8D7D42161A6C4012919FDCDAA92CB045F52BCF42F207EEE3E7058928A3CF01C04F08211B19655B1E7B94DDF7C19F7C500F4CA8D989E0765102E5480001';
wwv_flow_imp.g_varchar2_table(428) := '403972ACD3280800EA74DAF15EBF74CD979A874D8FBDC6A3700530F25606ECF831AF11B101AA8570513620BFAAA0071EF07CFE80863B18B09F1280DB80C16DFBCDB0874FB9E9837B6A287EDC324A60201240003010B18EF4A0080046FA78F337B771FD97';
wwv_flow_imp.g_varchar2_table(429) := 'F609FDF1B540E04ACE0678408EE0F9F782A2A7511580341BD0394090FBF7B9E2F73D02ADB0BD1700FE9D307A5B40829B272617FCFC9C6FBE6FA6C662C7ADA30406220104000311EB480F8A0060A48FB7D8E6365E73FD3EE1AE3D177A0CD633C64E02C20E';
wwv_flow_imp.g_varchar2_table(430) := '06208B78ED7DDE4D37FAAF5D14280E2014D903E2EFB2E700031A00909700D81300F09D10D8B72EFAD6353F2EB61ABC0A258012E845024F9E01933300EFA00CFED827B022C446D8BD88B156F72000A8D571E76F76C306E6AD7DF8EFCE66AC751165701263';
wwv_flow_imp.g_varchar2_table(431) := '700021643F066C1F026C8C40D43E9A006384110244687CCA130A00609A32D80E045E2284FE9231F6034A9A375DF4BFDFF7781D44CC18235BCE39C75FB76B1781BD4711387C378192C31AB71614E4AA9CEB8A8E5170AA922E2B2AA8D50005852A47E477C8';
wwv_flow_imp.g_varchar2_table(432) := '9FA2B394B4A9D287C93BBB7BB7EE43DF7DD2D645FB4DEEB8AAE1C11FF8040E400050FA118CDC80080046EE48CBD9D0FFBDF46B8BC7C61BAFF67C762C03763830B63F10C659813100E61312A9FFB60730038CED0C09DBE6D3C6567FCCBFF79CBF79D7C31C';
wwv_flow_imp.g_varchar2_table(433) := '1E94B3926A8EC215FEB3A75C3AB970A63541C7FCC5D080A530132C69B75A0B48A339D6F45933048F809664A1FE1902E84519F58B32B6CBEF15F7F7DAED388C6ED5D790399273CDAE859923848EB5A5E6B03E08E4AE1C8BD1C7537F8EEF883FE0FFF12DA9';
wwv_flow_imp.g_varchar2_table(434) := 'A45615AA6BB2D6C8EFE17C97532691DCB24FC0B5C73074CD64CAB0D5E13CE50872FCACF38A3E0F814E4C0493C71EB0F7CC15FBB4AF6EFAB02F1DE937B09ADF0BF36D550800E6DB890D6DBD8CFCD3DBBEB9CF5873CF04191B6B84AD80F930DE0A67964F5F';
wwv_flow_imp.g_varchar2_table(435) := '72D325B509E663EBDE3BB17BC7738B3D681E1E86E1092C6C1D0D8C1ECA801C4869B81402B68878641C3C32C68079AAD482FA368EFEC5FF90245788BFC92B44202677BC08B70AA757D4DFC56F720CF33B3E1EC7FAE24F7A40F0F9A2DBCDF9F8AFFC63FE65';
wwv_flow_imp.g_varchar2_table(436) := 'C0233FC4D8F22AA176F48ACED64EAC75CBB5F201C49572FDC24DA4F6223A5388FFE50B8BE8A4F8EFFC1EFE37B15E317FF47B3C860C5615D7457F23D1BDD1B46A855117C9E877D50943EE51AD450F7DD59D5D54C093B88F46342AAF5C117D24D62BC65063';
wwv_flow_imp.g_varchar2_table(437) := '33EE348B078EF6A3C95AEE293AD7442EBA4CD4598B39E339923D9A6727E511EF9B791EF30ED9AF3D71ECC1ED25130DF0332B7B0FED3B0427AE9A04100054ED44703D9594003B62DDC48E65FB1E4C68EB0DA4357B2E0BE0444260256374790348936B2E59';
wwv_flow_imp.g_varchar2_table(438) := '58C95656BAFA8EA32522C521FECDFF57A824F5995248022BE80A5BFD5B5774F253A9BCA55292C28CAE35B2394DB0A0CF18FDDB0027DA5F99DE52AAF3184A3DC6524800801C2756D03108E1EB8CF5B85093F13A74A5CB159E5C9192758CA9A8FE3701A0C4';
wwv_flow_imp.g_varchar2_table(439) := 'FF49C51D0389645C1D2C088DAE004B18FD5B287AB5D764CE18E3C8F113A062ECC10408FCA47500A0F628D7A81092040C0A00A975C44F8C02478C97D36670D07E148E3F348049CED3A9AD55F29DC2450D5F020800867F06B8820A4B806DD8E0BD7CCB3D2B';
wwv_flow_imp.g_varchar2_table(440) := 'C7DAADB7C14C6B3D0BC31381D2A53E10C2BF84138B595312BA9DE66600942616DFD1B19DA8599386E2364230CB00001AA0D094A9042A12446833690C40EF00408DAB2B64AEB1853C2285571A00106AD904656A87F194093810A7A0030061A3F70400B47D';
wwv_flow_imp.g_varchar2_table(441) := '48F52F75B1B2E9E3FD2620C704007C7D2E00C0656500CCF841E19F791E8383978670FCA1142639FF8400A0C2DF2CD5581A02806A9C03AEA262121006FA7A6FFAF4F67974CFDEFF49DAC11B7C601052F1C5AABE5B35FA58FBC64D2CF2E442EB0E65E8D50C';
wwv_flow_imp.g_varchar2_table(442) := '00D8D6787700408084220C40B501409AE5E80E004820219F2A040015FB029927CB4100304F0E0A9739771260275FD39C81570E0AE8F4EFC34CEB3D0DCA1604D2568CBFB91100683C470266B2408ECE38A40180EE9EE8C400940900740B7BAE19001B00A8';
wwv_flow_imp.g_varchar2_table(443) := '5801E56AC86300D24C0240C363B0121980B9FBA218819910008CC021E216CA93C033275FB360097BEA2C3613FC1ED0E04CC2A0A1AC2CE5904600309A00400210C1F1A45D00324851C66C4836422A74F92472D783FEDCD82E806200401F23669DE2711100';
wwv_flow_imp.g_varchar2_table(444) := '94F7CED779240400753E7DDCBB2101B66EFDA2E957F6AE67EDD9DF041A9E000C1AFA053260CB0EA64BBEE8D10590882B915512236F2A30A500551060F4598718802C06402637F0AC01DD4B2E15B1EE0E97CADBC500B800808C0D8858022D383252FE5A86';
wwv_flow_imp.g_varchar2_table(445) := '803E47BF0040063AEA14BF1E14890000BFBCCA9000028032A48863CC7B09DCB77EFDD8618FEE793FECE1CA9FF25A3A3CBDDC04085A483A320073CF0044297D193100DD00802870D3CA0248004962B92B0660F000404FF5144F16028079FF95322F368000';
wwv_flow_imp.g_varchar2_table(446) := '605E1C132E72D012D87DDA65EF845DBB3FC1281C06C0F87B91FA410640685F45772B7FB58003838D01E80400445DCACE0CC0A00140B40C830D5292D183F7841C058DA06A3DC4F2D56B0F6875102406450660D0DF08F5181F01403DCE19779923811D6F5C';
wwv_flow_imp.g_varchar2_table(447) := '7F9AFFE22B37324A0F881B1B38AF4600500E00882CDC24B5910A65292D72870B402AC78E00201EB4930BA02800908578BA6500B20040A2F08DBA049D01801D8312E39CA4949094250601E2D75CB7124000D0ADC4F0FA9192C0CCDA771ED57EF9859B200C';
wwv_flow_imp.g_varchar2_table(448) := 'D774DA1802807200805260020ACC1700A0DC0631DF911103501400C8C8FF4E0C801B00281E060140A73717FF9E25010400F86CD456023BCEB8703F7F17B98EB5DBEFE5FD0D3A090201C06000401478E750A652DEB2F8B15EC25792EA024CC436BFC60088';
wwv_flow_imp.g_varchar2_table(449) := '2A00B212A05EB721BEBE400C80CD001401007A2C817C9EC44A9292C589B3C40600FA9E5CC1852A0850AE4CCCA0000085954B7925402C04D4E95DC6BF0B092000C027A1961260D75CD39CFEE153EF82D9D62718A3071511020280D102004279C6710C5AC9';
wwv_flow_imp.g_varchar2_table(450) := '5FA588E3FE0491C1AF070E0A0620E93D902A356CF623400050E4EDC26B8621010400C3903ACE395409F02A7FBB4FBD640DD933FBFFB220BC302BE8CF5E240280B20140EC15AF1C03204141360090A9847AA32065E5E7030009307A61001433A0022E9101';
wwv_flow_imp.g_varchar2_table(451) := '18EAD7C9BC9E1C01C0BC3E3E5C7C2F1278F28CF593FB4EEF7A1F69B73ECE282C2D3A060280FE01809EE72F62E0791D00617EDBB4F7F05C00DD030015C56F360F125C81E902B001809289C64638EA0B48D021DD1BF2B9450050F40DC6EB6C092000C067A2';
wwv_flow_imp.g_varchar2_table(452) := '5612E0D6FFECAB2F5EDD0E82EB48105CA6176FE924080400830700893F3F3A0CD5244836C7150176F1DF62DABEAC180019ED5FC40560330008003ABD3DF8F72A4A000140154F05D7343009B035EBC7F6F8D317D1B0FD351286CB1000A41A070BAFF800DA';
wwv_flow_imp.g_varchar2_table(453) := '014786BE5547C06600B2004012D4D71100E84980E92040998AE72A04E4020049BAA21503D01B00306DF724FE40EBF027A14D9A0D89B98484194017C0C0BE246A343002801A1D366E1560E7C997ECEFB5C38F78ADD6B521AF1BDBC50F3200836500F4EA77';
wwv_flow_imp.g_varchar2_table(454) := '0919AEB5C595547A3E03E00600896295817F8E2C80E100808CAA84960B206125100074F1C6E2A59D248000A09384F0EF23258199D79CBF3A08C8DF79EDE094B0CB9D2100985F004044EA2BFFBB02016EA5AB030001405433203B0B406700246BA1838CA8';
wwv_flow_imp.g_varchar2_table(455) := 'C361FCA362005C0C80B99624E7BF2000D0030F1B1EA60176F94AD7FEF2080000BC72CCBFC27EA32C0C32CA9BC3BD1593005BBFDEDFFDF09EB3486BF616A074BC1BFA3F26606532B75DF4365A80F9A5AF285BB13A5321C85FA5A2516E6D69EBC577C58A44';
wwv_flow_imp.g_varchar2_table(456) := 'BF3B5134AEE643C9548E710C5A5F36E7A98E0BC0C500E854BDCD00E8B9F5D17571438084E6D7EA0018CA39A317401E00305A16CBC03E2B70310B0028808000A0D89B8A57CD9504B862641EBC78ECF761F95CCD398C7910000C43EA159B939D7CC9829DC0';
wwv_flow_imp.g_varchar2_table(457) := '7E7D727AE673B35DD2FF0800A439AB5BD431511FA3131D72246C89D623A0530C40110020BB01AA8AFF71947D0600D06BF21BF5F63BB8006C06A06C0020C14CB47A6D2DC80054EC4B63C49743B866F4E1E963BE07878CF25611008CF2E916DCDBCED32E5F';
wwv_flow_imp.g_varchar2_table(458) := '06337BFE74AC15BCBBAD59CF056F8F1BB7E80172092C4006A06033A0AC2040776B5D5B398AA639E2E8ACD4BA020020C51858E0448C2DEB0EF239940B8089C003A3A29FBDE66E1880F2010003D10B002B01167D9FF13A21017FCC7B78D577E8B1A32C0F04';
wwv_flow_imp.g_varchar2_table(459) := '00A37CBA05F736FDDAF357D2D0BBD19F0D4E0E354ABEE0ED0800220D573E039054D44BE5BEF70A0014D56E76E553E578B3B2003A0180148BE0ECDAA7DC41CAFF2F418B1EA4187F16073AEACE18674D8418FCE88E041DD4F81E83831100147D9DF13AD1F9';
wwv_flow_imp.g_varchar2_table(460) := '8CC244E327C76C094E1B6581200018E5D32DB8B7575EF3E6231A01FCD86BB7F6EF2EFE5F4C804180F30500A866B9A50080C8D72F9D02EA59E8C40048CE402A6959CB4041010400055F5DBC6C001288FCFF04026FB271CBEA4DC1A50398A232432200A8CC';
wwv_flow_imp.g_varchar2_table(461) := '510C6F21DB4FBCE8E8060DB642D88BFD8F0040A0A0E131007A33A07C17403E0320DB0127A04E6BA8E364002C009028F60E4180650300559F4177202856031980E17DB7CCC799630030EB8F7B5F59B5857E783EEEA1E89A11001495D4085FB7F3B8F38E59';
wwv_flow_imp.g_varchar2_table(462) := '48FC87F6D0A0A75D2203502E00106A2CBB14B01D20D719002895AB3206CCFC09FE5B36001085830430E03F710CC01C030053D16B6E8B786112DE286641C02104003DBDD6B5BD29020000D3DE64E37FACDE1C7C769405810060944FB7E0DE664F5A77DC58';
wwv_flow_imp.g_varchar2_table(463) := '30F6C06E04004AC9C53E6C25C238967F0E2A011A00809A8ACEB0B263F7CB5C0300D9745750FDCA0590C70008D8A02A1EA6988AA4FBA0CC9910710E32F43051EA8E3A0036038000A0E08B8F973925C06B005042767ACB97BD7BF58D2FDE38CA62420030CA';
wwv_flow_imp.g_varchar2_table(464) := 'A75B706F3B8E3F7FF522200F2303A059B9F30000C892B98302006676801EED1FC712C400405D173B0FBA7201983500EC2C803C00A0FF4D751FD45D31C80014FC0AC0CB3409882A80E485F12357BDFEF0BF7BE4D151160E0280513EDD827B9B39F1A2A343';
wwv_flow_imp.g_varchar2_table(465) := '1A6E6561D0430E00C60008DAA0BC180061610B0B989BC042C19AE30BEB585ADFF1DF32D3007B7301F40A0092EC8578CDD275108D17CB49310008000ABEA678D91C4A8034C87DCD063BE5C82D303387D3CEF9540800E65CE4D59B30CA0208E16EAFD55A86';
wwv_flow_imp.g_varchar2_table(466) := '5900C3AF04285D009155DB070090E57EE3368132B240000AADDE833C733B06C00600326AC07601D80C000280EABDE3B8A2621288FDFF2D6FC2FF27980C7F75F52D305BECCEF979150280F9796EA5AE7AFAB597AE6461EB266FB6FDBA5EF2003008B07F06';
wwv_flow_imp.g_varchar2_table(467) := '40A6E5296B5F687E170090F2EEC400140100BABF7CAE0040EC28D0980DE9F7574C870C7474B900ECCE8802D0E89C822A30CD47F6E23A006B0EA5303916332BA5BE4138D8A84840F8FF61171B1FFBC4B15B5A9F2600DDB6469957A2400030AF8E6B308BDD';
wwv_flow_imp.g_varchar2_table(468) := '79DA79CBBC3D8DCF3682E03D580970380C801300700C6095C39500816BCF61030061E92BD7847434746200B200800AFF13578812C8F26A752E080006F33D80A3027842E36FF3168FBFE798A9D98DA32E130400A37EC205F6B7ED82772F5CF0D2CB1F9A98';
wwv_flow_imp.g_varchar2_table(469) := '9EFD34F602183E0010CA8FC64D7CD23100BD30008A5990F1027A509F7848BA6500860100EC4A8089DD8F0C4081371D2FC993404CFF53D2243FA60BC77EF5B85B671F1A7589210018F5132EB03F06E0ED3AE1FC333CC6BEC7C2EEA300D00550AE0BC00500';
wwv_flow_imp.g_varchar2_table(470) := 'CCD6BAC234EE8601E8070044F324C17BA26E5F629D17640004C08008D8C89FD49A127B3F9B01400050E085C64B7A924044FF034C9386F757930B17FDB7436FDBF9724F03CDA39B1000CCA3C31AE452779E72E9B16476F6EFBD56FBB5DD42000400BD0380';
wwv_flow_imp.g_varchar2_table(471) := '2480CE28B4936600B200809121606501E831009D0080483848387723EBA05F00A00709CA8A8242C54B9FBF7423285622CB0580006090DF02F51E9BD3FF14E079189FF8D8B15B66BE5A07692000A8C32917D8E3B3AFBD68F9C2107EB7D96AFD4ED0654740';
wwv_flow_imp.g_varchar2_table(472) := '0400E502009102A85C0051011D23A54E31003600D0FDE8E50000D169B05B064005E549451FFF37C500084621896DD081812306A0130030E30884DC3008B0C01740CD2F89142181103CF26332E1FFF6EA3B821FD441240800EA70CA05F6C8D6AC1FDBD5DC';
wwv_flow_imp.g_varchar2_table(473) := 'F516D20ABE4C28DD5FA67C15B8159B01690AD2B0616321AA1877AD668295DBAF97DA2D02004C45A8EA00C8B954D53D514EAF7706C00400624B9D5D00450080043666FCBEB6560D0024DD065D9D1133BA010A960101409177B8EED7C4D1FFBB99EFFD6DB8';
wwv_flow_imp.g_varchar2_table(474) := '70E5474FB8EDA991A7FF05E6C11F9480F8A224BB4EBB6235EC9EBECE0FC3CBA47FB988709001288B01D022EA3B3000B2A08E8B01D0DD0AD188050140527CC80027F900C0042E42E546F1015A25C52C17405CEE287AC4F47D48C52D33200447207E900128';
wwv_flow_imp.g_varchar2_table(475) := 'F246E2353D49C0834749D3FFF8317786DFE8E9FE7978130280797868835A327BD5BB17EE26CFBF0F5AE11F00A5FB159D0701C06000008DB59E5B39EAE9772603D02D0048946B5C7DD0A4E3E72700103C856000643320AC0350F48DAED77571F47F083ED9';
wwv_flow_imp.g_varchar2_table(476) := '34BEDF011F3CE2A6E71EAB8B041000D4E5A40BEC9301901D6BAF38D27F79D7974948CFD3A9EBBCDB1100CC1D0048F2E28DE8FBE103003DB6BF0A0C800E001A1E83954B29200028F02550C34BA2E03F022F79E38DCFAFDE1CFC619D448000A04EA75D60AF';
wwv_flow_imp.g_varchar2_table(477) := 'ECE46B9AD3ECA977B13DAD4F01A3CB0BDC82310031372D2DEFA47C4DD73100A60BC0C500B8008074D7D8F4B8701374EF02E88501E81600E83109837001200350E4CDC56BB8047C02C03C7277F380FDDE73C43FBDF4409DA48200A04EA75D70AF3B4FBB7C';
wwv_flow_imp.g_varchar2_table(478) := '19D9B3E79310B43F50A43B103200C365007A05000AB0A403EF54347D3117800E00A24645193100BCBA918A0950B90DF25F32F854C62348C0D36D0C000280822F7BCD2F6B4495FFC80E32EE7F6EF5966043DDC48100A06E275E70BFBB4F7DDB6BD89E3D9F';
wwv_flow_imp.g_varchar2_table(479) := 'F783F08D7A0EBAEB760400030200B1A63402FDA203E069828A2DE8150048256958E05AE961F1F7180AE82E075D89C729A3A938824C0020547D9A0150FB89779894419641801118E8320B80AF1F63000ABEF435BB8C2B3FC2FFC7239BC7F65DF281C36FDE';
wwv_flow_imp.g_varchar2_table(480) := '31D2AD7F5DC78B00A0660F7DD1EDB20D1BBCE96FFFF43CB677EFE7FC80AEC903010800CA050022858F8A76C08E5E001200E85DFC622F8451C047BA0064EABD54BDD1B029C51DD71A182800501505070900F41456040045DFF8FA5DD724002D429E21138D';
wwv_flow_imp.g_varchar2_table(481) := 'FF79ECA6762D0AFFD8A78C00A07ECF7DE11D5FBF7EBD7FF123D35741ABBD818474B5226CCD211000D41B0098AE04D16DCF9D06580C00A83887249A228EE82FC600200028FC8AD7F6429EF71F126843C3FFDF634B27AE3DEAC6E9E7EA280C0400753CF52E';
wwv_flow_imp.g_varchar2_table(482) := 'F6FCC845178DAFDCE6BD8BCECEFEBE4FD9D1DC72B44B052300E80D0024D47D6C91EB7EF02A3000865F3EC70530680060AE4355454C80825508080140172F780D2FE54A8F07FE8584FC948EF91F3B6E4B706B0DC5106D1901405D4FBE8B7DB375EF9DD8BD';
wwv_flow_imp.g_varchar2_table(483) := 'E3B9F7C14CF0FF00A52778C03C1D042000180C00887BF018457292087D0D8865C5008816C34CEB2AA8F9DFB5DE0346509EE172D0FCF2DA7C113891C57B3460207DF77A3B60155F20AB20DAF50B941A57EB90710E6681A0AC180051AAD8EC2B201F6F7401';
wwv_flow_imp.g_varchar2_table(484) := '74F1A2D7E4D258F9BFE0F9FE175AFED2CF9EB0E585DD35D97A6A9B0800EA7AF25DEEFB994BAE59B0E4A9A72E83D9E0D7808667F8000BB98249CAB96AFE6A31B4AA2220FDCD5219081FB65C80B2D71220112B97A4DF5DFCCDAF5B767A053A395FA26CB45E';
wwv_flow_imp.g_varchar2_table(485) := '06BA9528321ACCEA06D1385AC9D9648D5A109BB11FE35A6D2C4311C6B3C60BD667D4F7D88901180400D083FAF8BEC4F9A91D4AD1C92A7D8975DF370088EDF80460A81E00F2548A0200331E2506140800BA7CA3EB79795CF277163CEF9FD944E38F8FBBA3';
wwv_flow_imp.g_varchar2_table(486) := '754F3D2521768D00A0CEA7DFE5DE196364E675979E15B467DF01213D17285DD520840456C01A0280FE0140942E97F8D24DDA5B8008E58AE98601280200CC28FD1820F40D00E2587E07C3200180CA24883F710540C66D902DD8A8A51D6AC0132B0176F986';
wwv_flow_imp.g_varchar2_table(487) := '8FF6E532EA9F79E4875ED3FBE4D1CBC39BC80D108EF6AEF3778700A0CEA7DFE3DEF79C7AD9A1C16CFB422F6C5FCA42F67A0FE8726E4A865ACF78640044209CCD3974C300646501140200B1A2B45D00730D0014BB30B700406735300DB0C7177DC46E1B13';
wwv_flow_imp.g_varchar2_table(488) := '51FF4F91B1C6A7697B9FAF1F77D78BBB466C8B5D6F070140D722C31BB804EE3EF99AE671F0D4717416DE0A34B804C2E075630CC6DB89A5882E805E014044CDE7A401EA0020890988EE5170232AC623A3071CCD80CCF6BE7621203D4FBF3F06A02800D069';
wwv_flow_imp.g_varchar2_table(489) := '7D3B0BC00E02B45D00226D5242CE743D010400F89DC553FEDA40F69286FF056FFF659F5EF54FCF3D8F524117003E037D4AE0FAF5D7FB6FFEE5DF9FC6F64CBF9B04E1C58CB2C3FD0804E81DDC74C256D1BBD23E964BA85B0C00DF6FE2838FCBF6460A3D62';
wwv_flow_imp.g_varchar2_table(490) := 'F86362DF4183970100ECB80C09249C6D86A323D3CFB37810A0E9D7174824994B8BC7E8150024E00001409F6FF2E8DE1E05FD314261BCF1B570E1C24FACF997EDBF1CDDDD76B7336400BA93175E9D23815D275FBA9EEEDDFB7E08825703C0FEC0584358B3';
wwv_flow_imp.g_varchar2_table(491) := '0800DC20C7040011499EF8FD4D0060040CC6FD7D2578905C8B517EB70303906EE3AB17022A9701480209E375170100120CAA6B2513A15527D4DB166B418002622AF70B3200F5FDDA8AF3FD03AFE9DFD89CF03F76E454EBC1FA4A23BD730400F834942A81';
wwv_flow_imp.g_varchar2_table(492) := '9DE7BD67197BF18577406BF66D2C64270263FB13C67C57801732000E00C0955764282B0090645AC8D4BB020040828148913A5C0036003069F7EA018024EDD40A02B419000986100094FA5ACFCBC1A236BF046648D3DFC81ADEC78FDDD4FED1BCDCC80017';
wwv_flow_imp.g_varchar2_table(493) := '8D006080C2ADF3D0BB4FBEF8A4B0D5BE1CDAE185340C4F02068BF9C326BEC8310D309682E10288C3E40A0180387B31A1D305D3A2650BE8167107006037F2C9CB0210F795F47D00001D5E4944415464CEE05D0036038000A0CEDF26DDEF3D4EF7DB4B7CFF';
wwv_flow_imp.g_varchar2_table(494) := '76D2249F597576F05DB22155C3ACFB8147EC0E04002376A055DA0E5BBF7E72D723BB5F07EDE092300C2F87303C02188C450A26F10A58095D49E4BC523499F9FB1AD5AB8AC6AA3AF78A0A8EEDC28AD501B06300FA010049EC806CB4D30700903500A4FC84';
wwv_flow_imp.g_varchar2_table(495) := 'D862B6C20200D2BDA35BDC7A2120150310FFAB600C0002802ABDC9F36B2D49AE7FC3BF8536C8E78E63C15D640B04F36B1773B35A04007323E75ACFF2FCBAF58B9A3BB69F0C6DF61E68B5DFCA28DB1F1878927696C2A97B10A00D0054853B955429D4685C';
wwv_flow_imp.g_varchar2_table(496) := '23207109D8C57054547C111740AA956FD2524806EC0950254186CE001403002A2344661F0896417D6E0701F60B00047C14726B780C0E5E4A61CDA1142639FC5498B3D6EFE5286E3EA2FD01A837E6DF0063E39F5A75FB9E9F111512328A5BEE6B4F0800FA';
wwv_flow_imp.g_varchar2_table(497) := '121FDEDC8D04D8BA758BB6EF9E3897ED6D7D84CD86270363E391972EFE4100105BD9710C801B00C48AD3A8A8970500E238822E5D002E06C0050044FA9D09E322562331F6CD5802E1FDD1AA47160000D26594C490686E0EE94631D90FA5DD110074F3768E';
wwv_flow_imp.g_varchar2_table(498) := 'C6B58440C826C6FF2C1CF33FBDE6B63DCF8EC6AE06B70B040083932D8E9C218197DF74CD3EE4A5273F4077EDFD308370056130CEAB52D61700C8FAC2730B00CC14BD589D2641764AB10B059B66006C0020EF280B00C83807C98CC4F8C1600EB28200530C';
wwv_flow_imp.g_varchar2_table(499) := 'C07E14D61C820CC0087F2951F0C94BFEF8D81F6E5F38FBF5536E823D23BCD7D2B68600A03451E240DD4A60FBB9571D4DB7BDF49B2C685F08941DC6181D0726CA530B65A222E1F5CA824211A41D08F23E67EF8164508D8E96E30CA1178099DE6602006A65';
wwv_flow_imp.g_varchar2_table(500) := '01C86B95C51BB7DCCD720124EC403E03600300119BA1AC76254F33B8509ECBBC00008C41D36770C8320AC71F4261A2892E806EDFD3AA5F4F00F64083FC84349B9FD9B1A8B511957FF1134300505C5678E50024B0F9887513AF5DBA706D383BB39E85C185';
wwv_flow_imp.g_varchar2_table(501) := 'D0A68700301F0140BA10900D00546AA5E502B000004F2B34EED52DFA5433A0FE004012E0A96724588DA124ADAF833A570C40290C0007000D0687720070308571040003788B873364E4EFF7C833E07BFF4827BD6F4EBFD4BEE7949F407B38AB999FB32200';
wwv_flow_imp.g_varchar2_table(502) := '989FE73652AB66B0C19B3EF1A7CB6760CF992C0CAE84567099C7608222036054CE2B1B00489A3CB1F44B6000F20080CC26508C86041B8A6130D7A2723B5C31009203CA8D01600CC61A00872F0FE1988342186FAA1E0D23F512D5683342F143089E3FD5F4';
wwv_flow_imp.g_varchar2_table(503) := 'E09B746272CBD16FD8FD22A6F975FF102000E85E6678C70024C07859EA93AF696CA75B5752183F95EE99F92D68B7DFE00123BCC9D028BA0054753FD99238BB12A0745C24D1F3A2BE8F66D96B91FF0519804E002049EDB3EA0BE4B900CA00007AAD8824AE';
wwv_flow_imp.g_varchar2_table(504) := '40EED560162424B2B21EE26BA58B825BFD47AE0861F581149A1E86840FE0F59D93212365C5FFC727F7B1C6D817A90F1BE9B3B38F9F703FB4E664012338090280113CD4F9BCA50808AC5FDF7C71EBF6FDBD805C15CECEFC861F844770DF749814781D8D18';
wwv_flow_imp.g_varchar2_table(505) := '801400E011F29AF28ED49B96373FD70C800D0044B321011BF83F5D31008300007ABAA0D9ABA03300E0698A3CF56FF581211C7500058F2789E3CFBC9140D4C217003C021078E445323EFE978DB1E6DF4C34773D79D04DB01753FCFA3B4A0400FDC90FEF1E';
wwv_flow_imp.g_varchar2_table(506) := 'A0041E3B62DDC4F8E2B1139A41EB43D06A5F0294AD4872E5472008B0570010DDD72303E06A072CD4A8EC05904EDD934AB72A0040EF8B209921050CCC34400E00164E30387E6508872DA3D8FE6C80EF6B59434BA5CF353F05088807CFC2F8D8B7262716FE';
wwv_flow_imp.g_varchar2_table(507) := 'D5CBC12B8FBE6A0AF6A0E22F47DA0800CA91238E3220097046E0A933D62F9DDCF5D2D9AC15BE8786C15A22FA0B00770DA8AF7B2D6DCDD57C486A392D204D58D8927E4F2E908507ED2BB5CF7595196F3C899ED7C6891767AE52CDA70300D1015045F727C5';
wwv_flow_imp.g_varchar2_table(508) := '761C0C800D009271243DAE55018C14BB1604580400481BBFAA0C40B70060C92483130F0D61E57E14788605FE544F0282D917EB0A005AC423DB188187FD867F1B8C4DDCCAFCDD4FACBE0576566FE5F37B450800E6F7F9D566F5ECE46B9ADBE9532B839999';
wwv_flow_imp.g_varchar2_table(509) := 'F359D07E1B0BC3337CC6F6E320404595C796EC3C07004201BBB30092223D1A03500400A8B4C3188EC432D29B34D96980650080C49F2FB30D8C34437710A01D0360BB00BA01001C542D5B44E184434258BE2F430050A16F0CEE8DE14A9F10E04EFC1920DE';
wwv_flow_imp.g_varchar2_table(510) := '1340C82F88C7EEF1FDC68FA0417EBEB83DFBEC015B607785963D524B41003052C739FA9BD9F6AA0B167A013D8604ED75948557B0809ED160CC6F6B3060BED401C86200B20080AEC4A50B400F8F1414BD641164B8A0EC2E2823EDBB0700725CDD0590B422';
wwv_flow_imp.g_varchar2_table(511) := 'D65C31CA8D20B47D541530E66864CD01BD147042DF6B6D7DC5DEF57D581902499B63CD6D11932E6AC7E23DE0E310C260C53E14D61C1CC2BE0BE32A85A3FF9A5476875CE1F31EE13C166386C12EF0FCFB01E03EF0D983CC6F6C8566F351989D7EDA9B845D';
wwv_flow_imp.g_varchar2_table(512) := 'AB6F81D9CA6E644416860060440EB26EDBD871C285FBCD84EDE300820B5810BE6B3185A3A769209280E71503A0E5F0C72E807E00802A90D4190024167E871880B900001228940A001880EFD3A806C0710787303986298073FD3D21A9FD31EEB48F943E79';
wwv_flow_imp.g_varchar2_table(513) := '8EF9FE4F09F3EEA661F8B037419E00D278AA19CEBC1C4CC25E54FA737B420800E656DE385B8912E0F1014F1F77DE7E7E939E08EDF0EDD00EDEB380B2257B68A8A5C8C5D6646C253AD3098754095036D54DF2D8E71000E895141510302B01C68442629177';
wwv_flow_imp.g_varchar2_table(514) := 'C300D84179790C80ACD92F1F8DE477A373A0F82B1FD7641524A3A1180E394EC800C69B148E3E90C2B10785253E7938944B0232784F2AFD260108B9D207F218788DEFFA1E7C3F0CD95632EE3D33E94F3CB7F3C99DBBD7DC076D42B4501E14ED9C4A0001C0';
wwv_flow_imp.g_varchar2_table(515) := '9C8A1B271B94049E3BFDD21574FB8E8B5918AC87307CA347D922AE7444EAA05212F301008815A763008AB8008A32008307008E8A82B106B70B010D020044698A0C60D12485E3568670C4720A21060096FAFA250A9FFBF1F9BB26005BC87CB2D3F7E001EA';
wwv_flow_imp.g_varchar2_table(516) := '8DFDCCA3F4DFC0675BFD058B1E3BF2E6DF7A92900D780AA59E427F832100E84F7E78778524C0366CF09EBEE1CE93BC76EB6208E85B58C85EDD246C51C02844F69FF4916B6B1E7E1640DA05500400A8FA000AD244350492CC887C17800D009242435A905E';
wwv_flow_imp.g_varchar2_table(517) := '7F0C40310020B581ED0288EECE61000CD6223E5B3D0640320ECB178770FC2121ECBF040300CB7855654E3E0FE0A33C4D8F91BD0C602721F00278F03010FF3E687A0F00638F360E3CE4F1A3FEFEB1E7CA9817C7188C0410000C46AE38EA1025F0C8E9172D';
wwv_flow_imp.g_varchar2_table(518) := '59BC7BFA94B0C5DECC82E07CC682E3C718196F47CA4D4FCAAB421A603E0090E10C72DD7A2540A9E464F11DE14AD0156FFCEF42ED80E334CA390400FA59D8C182FD0200190078D8B210D61C12C204FAFF7B7E2325A5CF03F8828855232F03836DA4014F11';
wwv_flow_imp.g_varchar2_table(519) := '461E617EF361EECF6F2CF09EF2172C78EAC87FDEBEBDE7C9F0C639950002803915374E36971278E1E40B0FDABB7BEFA90DDABE8886F45C12B26308A3D19798FCA90C0310E5EBEB5DFE7822A0EAD433D70020B1C89374433D825EAC4D020EB94C3D0BC0D9';
wwv_flow_imp.g_varchar2_table(520) := '55D072011401007A1A617C7BE41CE9C400703664ACC160F541011CB392EA71A173F908CEDBB9B885DF20A202DF2C3F7A429EF13CEF9700EC51EAC356208D8708F11F0F08DBB6EFAA135E58F9E59F60FBDD7978DA0800E6E1A1E192BB93C0B3AF597704DB';
wwv_flow_imp.g_varchar2_table(521) := '4BCFA44170090BC30B9A8C2E156C408518800A0100C3271F0300E55AE0B24F0300A32F81E68A50C0253E338361508A3C8B01B001802895DC1900707FF4BE0B299C784800072E65E8FF2FF0CAF8B1D2F73D803D0C0220E451006F2B23EC1168C083E08F3D';
wwv_flow_imp.g_varchar2_table(522) := 'C4C299C7DA0BF7D971D2821D3BC90DC2B3863FF357020800E6EFD9E1CABB90008F0F78F21FBE73A437337B09A3C1E540E9590D0610509AD4DF57BDE7541EBBC61594560950D2FA4616C01000807221081B3EED4210729035FFA5D53D1F004040010EDB3F';
wwv_flow_imp.g_varchar2_table(523) := '84D71C1140B381E97FFAAB22BFF4A53F3FAAC0272CFD5D8478BF60401EF21AEC7EE635EEF527C7EF5DB86CC1D32B8E7E6E2F76DBEBE20B679E5C8A00609E1C142EB33C093CF1DAF34F21BB765D03017B23A5C1511E8531DDEA95C16F56B440050080F2EF';
wwv_flow_imp.g_varchar2_table(524) := 'DB4180C9EF469C437E0C401100608E2BCF403000C2452160817409248588AC588284B27704298AFBE31804AD2681EA77A03105051800CE12347D06C71F1CC0B1075368A39D1A45E9F38A7BFCBF02D00105C253F0C80B00F014F3BC27A20A7C0B26FFF595';
wwv_flow_imp.g_varchar2_table(525) := 'D79FFB835336DC84947E795F39951D090140658F06173668093C79DC5957D0D9992B20A4A733C60EF5188C7355237DEF830400762A5CF47B1C032094A94A0394F6B911076037039211F3730000E4DA3A03000958540B5E679682D6EC590F6CEC1500F074';
wwv_flow_imp.g_varchar2_table(526) := 'BF83968670C26101EC3329D201EBF8C3FDF852E987224B6F2F00D94D087B163CFF2900F6983746EE6D8C8FDF7DF8473EF27372CE063D3CA68E22ABDD9E1100D4EEC871C3BA049E3CE3DC83E9F333174318BC8585F46460F4600F08E15DE4F4D434BD9680';
wwv_flow_imp.g_varchar2_table(527) := '6EAB26BAA58B6640668B5F4D490E0800C80638490681912DA01C1F463681B4C80D602124D72B00D08306F5B23D5AA586B86A432C6D2D003101061D1800AEEC7D8FC2B1078770CCCAB076C17F52E9C7F29A6184EC268CED601EF92501F208781EAFB5FF60';
wwv_flow_imp.g_varchar2_table(528) := 'B070E943C7FFCB8B0FE3B741BD258000A0DEE78FBB17CA903C71C2DA357426BCC0A7E1A594B25701A5FB090B548F3797B101420D1A45856A0C0052AE84240830CD0070602561841E2028D916FED7A4B9530700208198EEB2E1BEFF039684B0E6D020CAFD';
wwv_flow_imp.g_varchar2_table(529) := '1FF5E23FB2180F8FD6176E19320D00DB89072F30421EF61A8D078085F7F9BEF7CBE9454B7F79D28DCF635E3E7EEB25124000800F034A40AAA4F5EBC79E7A60DB71B415FC073A1B5C06213D96303A219452ACB88CB2C19A93A0240020A2DC6D1780E6FB97';
wwv_flow_imp.g_varchar2_table(530) := '8D735C2E003B873F7667E8ED8013A5ABAD5729523D0D512FC4A317184A330036008894BC66A9CBBF47BEFE1E00800E0E5489619DB9888315196F3243A3D4BF550785D0F04733F84FAFC0C74B3C3020BB1881ED9EC79E8586FF3342BD1FB189C67D1EEC7D';
wwv_flow_imp.g_varchar2_table(531) := '66D18A57BD7CE05FDFC34101FEA00452124000800F054AC092C0DDD75CD3DCFFFB0F9ECA76CFBC1FC2F0CD8CD28378FC540402860C00F43AF99D53EF5410A0E02CE4FFE90583725C000918991F00803BB9972D0EE0B8430258BE44809951F8D1A3F67914';
wwv_flow_imp.g_varchar2_table(532) := '1F05080957FA00DB3DDF7B8C8DF9DF6763939B3DB2E3C7AB16C10CDC006DDE7B6714F68E7B18AC0410000C56BE38FA3C9600BBFE7AFFF13FF8F32B617ACF87683B7C2D005B008CF90389018869F34E0C80130068350DA463C2F86F8C14DC00C0CAA9D7CA';
wwv_flow_imp.g_varchar2_table(533) := 'EFAA52BCD507005C6E0D8FC1D12B0238EAC010C69AF31700C82F65C939F1FAFA40609600D903C076B32679A43936764B7BC1E25B8EBBF1C587E6F12B864B1FB20410000CF90070FAEA4B60E779972F7BE9C967DF4367DA5743485703A3FB70B6B9CC1800';
wwv_flow_imp.g_varchar2_table(534) := '1EA8A7AAE765BB00CA07006A17A920C01E180031466F2E0069B226C57F743092541E548580F418000E00962F09E1D8956DD86FF1FC337E35A5CF17CF157E4808D9090C5E00E23D0B4DB8DF1B9FFCBEBF72FF2D477EF3F16DD57F6B7085F341020800E6C3';
wwv_flow_imp.g_varchar2_table(535) := '29E11A2B2181ADAF5A7722ECDA733504C19B8186C703630BCACA02D00140E42B37D20085952E4BE046BFE931007D31009D01804CF753E17BAA1220E7D9F518001B0028378538C2BC18805E010057FE134D0A471D18C061CB43189B67857F38AB4F796F1D';
wwv_flow_imp.g_varchar2_table(536) := '6EE513F21CE539F9C07EE137BC0760BCF1D3F68A65F71CFF574FBF548997001731521240003052C7899B19B404B65D70C1C23D8FED3E99B567AF8030BC9486F4C868CE3E83003B010069F927B9070E002095AB512F20AA2FA0E72CD815FFE63F00E0E23F';
wwv_flow_imp.g_varchar2_table(537) := '70691005FFEDB3707E50FF5123BDA8991EB4BC86F71800F91921E45E9EA247164CFC62D2DFE7172B6F7A068BF10CFA85AEF9F808006AFE00E0F6BB970003469E38E98DFB06D3B3AF038FFD0A9D0DAE84205CA8A2DD63723A491C5094B44DB327CA5A7301';
wwv_flow_imp.g_varchar2_table(538) := 'B81880A200C0889897E57D2D00202D7133212FA6D61D3100BD30007AB47E848F623197CD007077C382710A6B0E6DC38AA5BCB85DA57FC423E29169AF01F7107FEC2E4683EF81EF3D3D0D8DE75EA12B5E3A67CBE33395DE012E6EA42450F1F765A4648D9B';
wwv_flow_imp.g_varchar2_table(539) := '1931096C00F07EF535EB96B477EE3913C2F0F748BBBD5628B85E00809E8267C60018C17BB2FA400603D02D004818052DBD50671984EB41311C4299777601940D0012B062A5178694C20987B5E18803AA99F6177DC146FD746117341BDF2184DC4C1AE3DF';
wwv_flow_imp.g_varchar2_table(540) := '0D5BBBB7CD8CADD8FBAAA9E7F6C629FC23F676E076E683041000CC8753C235565A023C20F0FE35A71E303E0B57D299D67F014A0F03609E2C41AB97142EC2000805AC4A01BB0080AC262874731C231097019616B7C12EA8763F229E20CE91EB160008455C';
wwv_flow_imp.g_varchar2_table(541) := '0D00105002471C300BAB5706B0607CB839FF56E47EC8FDF9E0916749B3B1994C2EBC992CDA6FF32B8F3EBAE7E4A380C20D40314DAFD2AF746D168700A036478D1B1DB4041E5975D1B8EFEF3E366CEDBD86B65A6F050A8700A3BE5E52785000200A108CAD';
wwv_flow_imp.g_varchar2_table(542) := 'E3B9040051C47F521751BA11D45A949B41485F7701C8A04671BF8249AE2C009B01E0E06AE9C2104E3CBC05FB2C9A7BBFBF2CC6C3ADFB1020F0086C67002F119F3C4E9AFE0F48B3F11DB664DF7B61F7B69DAB164180AD7307FDF6E1F8BD480001402F52C3';
wwv_flow_imp.g_varchar2_table(543) := '7B500219126000E4A163CF5CE479E1E930DDFA151AB6CF83901D2A43EDF46242D2CA8FACF09C34C0220C40E9004053ECBA0BC066002400308B12F50E00F4380ABD67820E003888583C11C23187B461F9BE14783BDBB948FC93ED7379BDFD36217B81C013';
wwv_flow_imp.g_varchar2_table(544) := '8CC0E3849087C1F7EFA163CD7F5BB0A7F9286DECD87BC47268A3D2C7AF89AA4B000140D54F08D7372F2570F7C9273717EF1A3B8006ADB3BD7678190B828B3CC616079CDC4F82030537E00600B14DEC68ABABB308D205306800A05BFABA0BA05B00A06A1D';
wwv_flow_imp.g_varchar2_table(545) := 'A8AA843A03600380840D889F029E2D313116C2D12B0338686900CDC6601F0FAEEC1B712FDD5980577CCFBB9F11F83910F620F8642B85C6D6F17D269F83EDDB678E58072DB2216E6530D865E1E8288152248000A01431E2202801B7049E5979C98299F167';
wwv_flow_imp.g_varchar2_table(546) := '0F0D3C7A066DB30F9076EB4CDEF697F75D3519003B08B03800E016B102053A251FA7FC39D200ED94C144096BDDFF24B52FFAC7AB71B300401280C8D793EADA27E4D30F00E02B6878148E3CB00D07EF1FC244B37CBB3FB2F201A0E901100F7862FE338CF8';
wwv_flow_imp.g_varchar2_table(547) := '3FA0003F6E78EC21E27B4F8FB1C6333BE9DE1DB01C5A6BB0EC2EBEFAF358020800E6F1E1E1D2E78704B85BE09E575DB060D1EEE757B6C17B4B381BFC7633A487062C8430660422852983F984AA145EF1020C40AF0040F7BBF319258B201575E500000338';
wwv_flow_imp.g_varchar2_table(548) := 'EAC05938EC801026C6CA51FED297CFDD084D02101002ED067908487333F1D8261AB2C7C788FF025D3EF3CA0CC0DE3527408056FEFC78EF70959D258000A0B38CF00A94406912D8F6AA0B16BEBC73C7498CB6DE4BDBEDCB3D161EC0153F6F5B2B14B948BB';
wwv_flow_imp.g_varchar2_table(549) := '4BEAEB0D190088B50C970190C0E8C8152D387C45D097F2E7D63DE19D9D623953461878B01B1AFE3D3EF13651AFF14302C1E3FEE2E68B47BEEED497C8862D9CACC11F94C0484A0001C0481E2B6EAAEA12F8E9B167AE1C9F995E1786ED2B5948CFF402D89F';
wwv_flow_imp.g_varchar2_table(550) := '5BFB6DD9C2574607940000B8DF5C720A4930A2741B68827231002E0060B82E62D780022D3193E170019840A2600C006FF2D308E1E0FD0338FC800026C7F4A4CACEA72C297D2F0E140C81CCF02E7AE0C1F37EC3BB8F92C64F81C1BF43933D353E3EB9EDF0';
wwv_flow_imp.g_varchar2_table(551) := '9B77BCD27954BC0225301A124000301AE788BB988712B86FCDFA31686D5D455BE1F96C36BC98527A9A076CDF90F11881381C6E8800200950B418001B00A8EB640124770C40B700800397F1310A072F6BC1C15CF9378B45FB47757788F8FF365F3B212F32';
wwv_flow_imp.g_varchar2_table(552) := '80673C02BF649EFF1030721F6D341EF13CF62C195BF0E2EA5B5EDE390F1F1F5C324AA06F092000E85B8438004AA03F093C78EC998B6767F79E40DBAD735910BE8531767283D1F1566CBACB623DBAA2D50B01E5C5004496798F0C800D00544EBF96BD6034';
wwv_flow_imp.g_varchar2_table(553) := '032A110030069313211CB2BC0D2BF60D617C3C8E4ECC10B58CD6F73D80BD943020F04B20B09578642B23DE5606FE23CD31F698EF375E64071DF0CA91DFC492BBFD3DB578F728480001C0289C22EE61242470F73127EFEFCDD0D7B0A07D2184E1650D4A57';
wwv_flow_imp.g_varchar2_table(554) := '87348CAC582D2A40D408D4F461160048BA07CE310088320C7A7401888C0380A58B5B11EDBF6C098566C31DF0E7C7D1FADCD29F66A4453CF22000B98F007B081A8D5F80EFFFC223EC6980991D4F04EBA6CFD982FEFC9178517013A54900014069A2C48150';
wwv_flow_imp.g_varchar2_table(555) := '02E548E0BE234E3DB015B64FA7B4FD1F683BB86C32A44BF602E515E75480A00100628BDCAA04E802004979E00231009D1800B3A891EA2AD80B00E063F1FA08FC0BE9C065B3B072FF00962CA4C07DF7F24B4A52FB3C2FDFF300F630B28310EF5E4AE0DF3C';
wwv_flow_imp.g_varchar2_table(556) := '60F7B3B1E656C2261E0D17359F3F76E78B7BC99628DB127F500228810C092000C0470325505109FCE8C4B30E6D6C7FF96D613BB822A4C1E93E65931C04F0D441930128170088B8BE240F21C902B05D006E0010173AEA820188E6230CC6C742386029CFF1';
wwv_flow_imp.g_varchar2_table(557) := '6FC3C249917EA0A2F5A3A63A6D42C8D3CCF31E24843C487C761FF863F7ED7BF861F72EFFFA43BB2A7A8CB82C944065258000A0B247830B43090809DCBDEAF5AFA37B76AEA761F02616D2E308638BA2D4C1982E974179A2C2A02AD8D30B03108D61010057';
wwv_flow_imp.g_varchar2_table(558) := '374091AEA880888C5388CA1BC9F845ADBE3F5F995E5048641C080DDF6C5058B23084154B5B70E0B210B81FBF1502EFED3B0D00BB880F4F02F37FC10879C46FB007D9F8E4CF57DDFA5F1F206483AC408C8F0A4A0025D083041000F42034BC052530D712B8';
wwv_flow_imp.g_varchar2_table(559) := '6FCDBA457BA7B79F1DCCCE5E4CC3F6598CB2A31B0C26DB4C34E78D14721F0020093414B587AC9883AC76C0C50140E24EE0EB8DA984462380C593212C5B12C27EFB0630B980CD00C02B94F1A63AF03830FF118F90AD6C9C3D42172CDC7ADC4D3B1E9B6BB9';
wwv_flow_imp.g_varchar2_table(560) := 'E37C28815196000280513E5DDCDBC849E05F579D7E88B777D71BDA41F86616066F60148EF2196DF2B4C1B04F009058F4250100B30BA20028DCEA1F6B30583C19C0C2456D58B238DCB978117D7EBCC99E65E06D05CF7B8832EF21AFC99E80F1F12757DFB2';
wwv_flow_imp.g_varchar2_table(561) := 'FB85913B44DC104AA022124000509183C065A004BA91C05D47BEF670D69A3D9DB4C34B68189C4A193BDA63AC113295A2D78D0BA07F0620E904102B7A151418F9F209C05883823F1EC2C205E18BFB2E0EB62D594C9F989C60F77BCDC6BFB75BFEC33E8167';
wwv_flow_imp.g_varchar2_table(562) := 'A70F5FF2F2ABFFFA394EFDE30F4A0025306009200018B080717894C02025F09D556F5CDE6CBDFCFAF66CEB721A84A702B0A3FD904D72E51FF51990AD8693EE0271B9E188E75755F58A0200C1DE73A7437CB76C1E948C258A00C9FEBC3E61401B8C359BB0';
wwv_flow_imp.g_varchar2_table(563) := '6DE164EBE9FD96058F2C594C7FB670E1C40F27F685FB675ED8BDEB88CD6C9610E2CEF51BA4F0706C9440CD258000A0E60F006E7F7424F0FDE35EF38670E7EC3BC39999D343602B19634B1963E38C8127D4AB081794C1787A33A07E00801859660D305E77';
wwv_flow_imp.g_varchar2_table(564) := '880FB71700B6371AE14B4B96C283071E089B571D091BF7FDD68E5F8C8EC471272881F92D010400F3FBFC70F528819404EE5E77C9FE7B1E7DECCDC1CCEC1B59D85E45195909215BC6205C40193419309F02F89E560BC00600921B90BD005457428301E09D';
wwv_flow_imp.g_varchar2_table(565) := '8D43001200612D20DE2B0CE88BE0D397C69AF0E0E245DE0F8F79F5E23B8EBAF1B1E7F09850022881EA49000140F5CE04578412284D02DF5D73E661C19E9DAF0B77ED3D9EB1F0084AD841C06079C8E8FE10864B00603C04C68BEA798C328F329E919FD4DE';
wwv_flow_imp.g_varchar2_table(566) := '8912FDA8D0FEA263316121000D197833E091971983E7C183172883271AE3630FFB0B9AF7ED77D4E2FBCED9F2B3EDA56D02074209A004062201040003112B0E8A12A89E04BEBF7EFDE4EC4FEF3F386CB50FA201EC1FB65B07302007308F2C85205C4C83F6';
wwv_flow_imp.g_varchar2_table(567) := '6448D938106F8C78A4C97710523AC3186D01F15BA4E14F8307DB83207899507811C61B2F30683E3BB9DFA26D973CFCEF4F576FC7B82294004A204F020800F0F94009D45802F7ADDF30F6CCA3DF9BA4DB9F1F6F6D7FB9C928F5BDB14683D106670580B5C2';
wwv_flow_imp.g_varchar2_table(568) := '60C66B87E38B1607DEE4A2D66147ACD9FB4FB71DBD770316E1A9F153835B1F15092000189593C47DA0045002280194004AA00B092000E8425878294A002580124009A004464502080046E524711F280194004A00258012E84202FF3F9313018C6E0A41A1';
wwv_flow_imp.g_varchar2_table(569) := '0000000049454E44AE426082';
null;
end;
/
begin
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(688070316950592228)
,p_file_name=>'icons/app-icon-512.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content => wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
null;
end;
/
prompt --application/plugin_settings
begin
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(687870098053591751)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(687870351686591753)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attribute_01=>'Y'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(687870629225591754)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_RICH_TEXT_EDITOR'
,p_attribute_01=>'Y'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(687870966206591754)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_attribute_02=>'N'
,p_attribute_03=>'POPUP:ITEM'
,p_attribute_04=>'default'
,p_attribute_06=>'LIST'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(687871263227591754)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attribute_01=>'fa-star'
,p_attribute_04=>'#VALUE#'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(687871535329591755)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_JET'
,p_attribute_01=>'MONTH-PICKER:YEAR-PICKER'
,p_attribute_02=>'VISIBLE'
,p_attribute_03=>'15'
,p_attribute_04=>'FOCUS'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(687871839625591755)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_CSS_CALENDAR'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(687872196312591756)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SWITCH_CB'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(687872496142591756)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'FULL'
,p_attribute_02=>'POPUP'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(687872708538591756)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attribute_01=>'IG'
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(688071616198592229)
,p_name=>'Administration Rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return true;'
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_items/ai_user_id
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(688157513432035291)
,p_name=>'AI_USER_ID'
,p_protection_level=>'S'
);
end;
/
prompt --application/shared_components/logic/application_items/ai_user_name
begin
wwv_flow_imp_shared.create_flow_item(
 p_id=>wwv_flow_imp.id(688160473486065934)
,p_name=>'AI_USER_NAME'
,p_protection_level=>'S'
);
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(688071896773592231)
,p_group_name=>'Administration'
);
end;
/
prompt --application/comments
begin
null;
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(687873674147591764)
,p_name=>'Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(687873861164591765)
,p_short_name=>'Home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(688145074487925086)
,p_short_name=>'Select User'
,p_link=>'f?p=&APP_ID.:10:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(688158720584038185)
,p_short_name=>'Office Calendar'
,p_link=>'f?p=&APP_ID.:20:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>20
);
end;
/
prompt --application/shared_components/navigation/breadcrumbentry
begin
null;
end;
/
prompt --application/shared_components/user_interface/templates/page/drawer
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(687874409053591774)
,p_theme_id=>42
,p_name=>'Drawer'
,p_internal_name=>'DRAWER'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Drawer-page t-PageTemplate--drawer #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Drawer" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Drawer-header">#REGION_POSITION_01#</div>',
'  <div class="t-Drawer-bodyWrapperOut">',
'    <div class="t-Drawer-bodyWrapperIn">',
'      <div class="t-Drawer-body" role="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</div>',
'    </div>',
'  </div>',
'  <div class="t-Drawer-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>11
,p_preset_template_options=>'js-dialog-class-t-Drawer--pullOutEnd'
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_js_init_code=>'apex.theme42.dialog(#PAGE_URL#,{title:#TITLE#,w:#DIALOG_WIDTH#,mxw:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,dlgCls:''t-Drawer-page--standard ''+#DIALOG_CSS_CLASSES#,#DIALOG_ATTRIBUTES#},#PAGE_CSS_CLASSES#,#TRIGGERING_ELEMENT#)'
,p_dialog_js_close_code=>'apex.theme42.dialog.close(#IS_MODAL#,#TARGET#)'
,p_dialog_js_cancel_code=>'apex.theme42.dialog.cancel(#IS_MODAL#)'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1659739787629394056
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687874792903591783)
,p_page_template_id=>wwv_flow_imp.id(687874409053591774)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687875086676591787)
,p_page_template_id=>wwv_flow_imp.id(687874409053591774)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687875356721591787)
,p_page_template_id=>wwv_flow_imp.id(687874409053591774)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_side_column
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(687877383996591801)
,p_theme_id=>42
,p_name=>'Left Side Column'
,p_internal_name=>'LEFT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.leftSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft t-PageBody--hideActions no-anim t-PageTemplate--leftCol #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." title="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." id="t_Button_navControl" type="button"><span class="t-Header-'
||'controlsIcon" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'      #AFTER_LOGO#',
'    </div>',
'    <div class="t-Header-navBar">',
'      <div class="t-Header-navBar--start">#BEFORE_NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--center">#NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--end">#AFTER_NAVIGATION_BAR#</div>',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main class="t-Body-mainContent" id="main">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" id="t_Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs" id="t_Body_inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525196570560608698
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687877638092591802)
,p_page_template_id=>wwv_flow_imp.id(687877383996591801)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687877927953591802)
,p_page_template_id=>wwv_flow_imp.id(687877383996591801)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687878275049591803)
,p_page_template_id=>wwv_flow_imp.id(687877383996591801)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687878537774591805)
,p_page_template_id=>wwv_flow_imp.id(687877383996591801)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687878852692591806)
,p_page_template_id=>wwv_flow_imp.id(687877383996591801)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687879181441591806)
,p_page_template_id=>wwv_flow_imp.id(687877383996591801)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687879412471591806)
,p_page_template_id=>wwv_flow_imp.id(687877383996591801)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687879727274591807)
,p_page_template_id=>wwv_flow_imp.id(687877383996591801)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687880001555591807)
,p_page_template_id=>wwv_flow_imp.id(687877383996591801)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687880380954591807)
,p_page_template_id=>wwv_flow_imp.id(687877383996591801)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687880645964591808)
,p_page_template_id=>wwv_flow_imp.id(687877383996591801)
,p_name=>'Full Width Content'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/right_side_column
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(687881049462591809)
,p_theme_id=>42
,p_name=>'Right Side Column'
,p_internal_name=>'RIGHT_SIDE_COLUMN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.rightSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8"> ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft no-anim t-PageTemplate--rightSideCol #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<script>(sessionStorage.getItem("right.&APP_ID..&APP_PAGE_ID..preferenceForExpanded") === "true") ? document.getElementById(''t_PageBody'').classList.add(''js-rightExpanded'') : document.getElementById(''t_PageBody'').classList.add(''js-rightCollapsed'')</sc'
||'ript>',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." title="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." id="t_Button_navControl" type="button"><span class="t-Header-'
||'controlsIcon" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'      #AFTER_LOGO#',
'    </div>',
'    <div class="t-Header-navBar">',
'      <div class="t-Header-navBar--start">#BEFORE_NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--center">#NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--end">#AFTER_NAVIGATION_BAR#</div>',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" id="t_Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" aria-label="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button'
||'>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs" id="t_Body_inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525200116240651575
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687881346456591809)
,p_page_template_id=>wwv_flow_imp.id(687881049462591809)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687881602117591809)
,p_page_template_id=>wwv_flow_imp.id(687881049462591809)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687881978651591810)
,p_page_template_id=>wwv_flow_imp.id(687881049462591809)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687882202064591810)
,p_page_template_id=>wwv_flow_imp.id(687881049462591809)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687882565851591811)
,p_page_template_id=>wwv_flow_imp.id(687881049462591809)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687882865638591811)
,p_page_template_id=>wwv_flow_imp.id(687881049462591809)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687883157527591811)
,p_page_template_id=>wwv_flow_imp.id(687881049462591809)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687883479713591811)
,p_page_template_id=>wwv_flow_imp.id(687881049462591809)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687883724231591812)
,p_page_template_id=>wwv_flow_imp.id(687881049462591809)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687884089272591812)
,p_page_template_id=>wwv_flow_imp.id(687881049462591809)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687884310759591812)
,p_page_template_id=>wwv_flow_imp.id(687881049462591809)
,p_name=>'Full Width Content'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/standard
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(687884731653591813)
,p_theme_id=>42
,p_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim t-PageTemplate--standard #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." title="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." id="t_Button_navControl" type="button"><span class="t-Header-'
||'controlsIcon" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'      #AFTER_LOGO#',
'    </div>',
'    <div class="t-Header-navBar">',
'      <div class="t-Header-navBar--start">#BEFORE_NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--center">#NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--end">#AFTER_NAVIGATION_BAR#</div>',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" id="t_Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs" id="t_Body_inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>1
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>4070909157481059304
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687885005931591813)
,p_page_template_id=>wwv_flow_imp.id(687884731653591813)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687885370424591814)
,p_page_template_id=>wwv_flow_imp.id(687884731653591813)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687885651004591814)
,p_page_template_id=>wwv_flow_imp.id(687884731653591813)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687885982525591814)
,p_page_template_id=>wwv_flow_imp.id(687884731653591813)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687886267323591815)
,p_page_template_id=>wwv_flow_imp.id(687884731653591813)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687886515299591815)
,p_page_template_id=>wwv_flow_imp.id(687884731653591813)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687886840291591815)
,p_page_template_id=>wwv_flow_imp.id(687884731653591813)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687887181167591816)
,p_page_template_id=>wwv_flow_imp.id(687884731653591813)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687887493414591816)
,p_page_template_id=>wwv_flow_imp.id(687884731653591813)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687887799305591816)
,p_page_template_id=>wwv_flow_imp.id(687884731653591813)
,p_name=>'Full Width Content'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/page/master_detail
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(687888105356591817)
,p_theme_id=>42
,p_name=>'Marquee'
,p_internal_name=>'MASTER_DETAIL'
,p_is_popup=>false
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyTableHeader#MIN#.js?v=#APEX_VERSION#',
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'))
,p_javascript_code_onload=>'apex.theme42.initializePage.masterDetail();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--masterDetail t-PageBody--hideLeft no-anim t-PageTemplate--marquee #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<script>(sessionStorage.getItem("right.&APP_ID..&APP_PAGE_ID..preferenceForExpanded") === "true") ? document.getElementById(''t_PageBody'').classList.add(''js-rightExpanded'') : document.getElementById(''t_PageBody'').classList.add(''js-rightCollapsed'')</sc'
||'ript>',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." title="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." id="t_Button_navControl" type="button"><span class="t-Header-'
||'controlsIcon" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'      #AFTER_LOGO#',
'    </div>',
'    <div class="t-Header-navBar">',
'      <div class="t-Header-navBar--start">#BEFORE_NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--center">#NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--end">#AFTER_NAVIGATION_BAR#</div>',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-info" id="t_Body_info">#REGION_POSITION_02#</div>',
'        <div class="t-Body-contentInner" role="main">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" id="t_Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs" id="t_Body_inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>1996914646461572319
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687888472902591818)
,p_page_template_id=>wwv_flow_imp.id(687888105356591817)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687888726834591818)
,p_page_template_id=>wwv_flow_imp.id(687888105356591817)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687889002250591818)
,p_page_template_id=>wwv_flow_imp.id(687888105356591817)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687889390391591819)
,p_page_template_id=>wwv_flow_imp.id(687888105356591817)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687889625945591819)
,p_page_template_id=>wwv_flow_imp.id(687888105356591817)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687889918149591819)
,p_page_template_id=>wwv_flow_imp.id(687888105356591817)
,p_name=>'Master Detail'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687890234325591820)
,p_page_template_id=>wwv_flow_imp.id(687888105356591817)
,p_name=>'Right Side Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687890519218591820)
,p_page_template_id=>wwv_flow_imp.id(687888105356591817)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687890888004591820)
,p_page_template_id=>wwv_flow_imp.id(687888105356591817)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687891132556591820)
,p_page_template_id=>wwv_flow_imp.id(687888105356591817)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687891497659591821)
,p_page_template_id=>wwv_flow_imp.id(687888105356591817)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687891738781591821)
,p_page_template_id=>wwv_flow_imp.id(687888105356591817)
,p_name=>'Full Width Content'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>8
);
end;
/
prompt --application/shared_components/user_interface/templates/page/left_and_right_side_columns
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(687892152347591822)
,p_theme_id=>42
,p_name=>'Left and Right Side Columns'
,p_internal_name=>'LEFT_AND_RIGHT_SIDE_COLUMNS'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.bothSideCols();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">  ',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>',
'</head>',
'<body class="t-PageBody t-PageBody--showLeft no-anim t-PageTemplate--leftRightCol #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<script>(sessionStorage.getItem("right.&APP_ID..&APP_PAGE_ID..preferenceForExpanded") === "true") ? document.getElementById(''t_PageBody'').classList.add(''js-rightExpanded'') : document.getElementById(''t_PageBody'').classList.add(''js-rightCollapsed'')</sc'
||'ript>',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." title="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL"." id="t_Button_navControl" type="button"><span class="t-Header-'
||'controlsIcon" aria-hidden="true"></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'      #AFTER_LOGO#',
'    </div>',
'    <div class="t-Header-navBar">',
'      <div class="t-Header-navBar--start">#BEFORE_NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--center">#NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--end">#AFTER_NAVIGATION_BAR#</div>',
'    </div>',
'  </div>',
'  <div class="t-Header-nav">#TOP_GLOBAL_NAVIGATION_LIST##REGION_POSITION_06#</div>',
'</header>',
''))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  #SIDE_GLOBAL_NAVIGATION_LIST#',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-side" id="t_Body_side">#REGION_POSITION_02#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" id="t_Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'  <div class="t-Body-actions" id="t_Body_actions">',
'    <button class="t-Body-actionsToggle" title="#EXPAND_COLLAPSE_SIDE_COL_LABEL#" id="t_Button_rightControlButton" type="button"><span class="t-Body-actionsControlsIcon" aria-hidden="true"></span></button>',
'    <div class="t-Body-actionsContent" role="complementary">#REGION_POSITION_03#</div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs" id="t_Body_inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_sidebar_def_reg_pos=>'REGION_POSITION_03'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>17
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2525203692562657055
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687892424800591822)
,p_page_template_id=>wwv_flow_imp.id(687892152347591822)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687892701987591823)
,p_page_template_id=>wwv_flow_imp.id(687892152347591822)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687893051364591823)
,p_page_template_id=>wwv_flow_imp.id(687892152347591822)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687893348674591823)
,p_page_template_id=>wwv_flow_imp.id(687892152347591822)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687893678758591824)
,p_page_template_id=>wwv_flow_imp.id(687892152347591822)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687893979185591824)
,p_page_template_id=>wwv_flow_imp.id(687892152347591822)
,p_name=>'Left Column'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>3
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687894224398591824)
,p_page_template_id=>wwv_flow_imp.id(687892152347591822)
,p_name=>'Right Column'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>3
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687894524270591824)
,p_page_template_id=>wwv_flow_imp.id(687892152347591822)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687894880333591825)
,p_page_template_id=>wwv_flow_imp.id(687892152347591822)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>6
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687895140874591825)
,p_page_template_id=>wwv_flow_imp.id(687892152347591822)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687895474566591825)
,p_page_template_id=>wwv_flow_imp.id(687892152347591822)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687895712841591826)
,p_page_template_id=>wwv_flow_imp.id(687892152347591822)
,p_name=>'Full Width Content'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>6
);
end;
/
prompt --application/shared_components/user_interface/templates/page/minimal_no_navigation
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(687896191391591826)
,p_theme_id=>42
,p_name=>'Minimal (No Navigation)'
,p_internal_name=>'MINIMAL_NO_NAVIGATION'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.noSideCol();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#  ',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody t-PageBody--hideLeft t-PageBody--hideActions no-anim #PAGE_CSS_CLASSES# t-PageBody--noNav t-PageTemplate--minimal" #TEXT_DIRECTION# #ONLOAD# id="t_PageBody">',
'<a href="#main" id="t_Body_skipToContent">&APP_TEXT$UI_PAGE_SKIP_TO_CONTENT.</a>',
'#FORM_OPEN#',
'<header class="t-Header" id="t_Header" role="banner">',
'  #REGION_POSITION_07#',
'  <div class="t-Header-branding">',
'    <div class="t-Header-controls">',
'      <button class="t-Button t-Button--icon t-Button--header t-Button--headerTree" aria-label="#EXPAND_COLLAPSE_NAV_LABEL#" title="#EXPAND_COLLAPSE_NAV_LABEL#" id="t_Button_navControl" type="button"><span class="t-Icon fa fa-bars" aria-hidden="true"'
||'></span></button>',
'    </div>',
'    <div class="t-Header-logo">',
'      <a href="#HOME_LINK#" class="t-Header-logo-link">#LOGO#</a>',
'      #AFTER_LOGO#',
'    </div>',
'    <div class="t-Header-navBar">',
'      <div class="t-Header-navBar--start">#BEFORE_NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--center">#NAVIGATION_BAR#</div>',
'      <div class="t-Header-navBar--end">#AFTER_NAVIGATION_BAR#</div>',
'    </div>',
'  </div>',
'</header>',
'    '))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body">',
'  <div class="t-Body-main">',
'    <div class="t-Body-title" id="t_Body_title">#REGION_POSITION_01#</div>',
'    <div class="t-Body-content" id="t_Body_content">',
'      <main id="main" class="t-Body-mainContent">',
'        #SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION#',
'        <div class="t-Body-fullContent">#REGION_POSITION_08#</div>',
'        <div class="t-Body-contentInner">#BODY#</div>',
'      </main>',
'      <footer class="t-Footer" id="t_Footer" role="contentinfo">',
'        <div class="t-Footer-body">',
'          <div class="t-Footer-content">#REGION_POSITION_05#</div>',
'          <div class="t-Footer-apex">',
'            <div class="t-Footer-version">#APP_VERSION#</div>',
'            <div class="t-Footer-customize">#CUSTOMIZE#</div>',
'            #BUILT_WITH_LOVE_USING_APEX#',
'          </div>',
'        </div>',
'        <div class="t-Footer-top">',
'          <a href="#top" class="t-Footer-topButton" id="t_Footer_topButton"><span class="a-Icon icon-up-chevron"></span></a>',
'        </div>',
'      </footer>',
'    </div>',
'  </div>',
'</div>',
'<div class="t-Body-inlineDialogs" id="t_Body_inlineDialogs">#REGION_POSITION_04#</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>',
''))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_navigation_bar=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-NavigationBar t-NavigationBar--classic" data-mode="classic">',
'  <li class="t-NavigationBar-item">',
'    <span class="t-Button t-Button--icon t-Button--noUI t-Button--header t-Button--navBar t-Button--headerUser">',
'      <span class="t-Icon a-Icon icon-user"></span>',
'      <span class="t-Button-label">&APP_USER.</span>',
'    </span>',
'  </li>#BAR_BODY#',
'</ul>'))
,p_navbar_entry=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item">',
'  <a class="t-Button t-Button--icon t-Button--header" href="#LINK#">',
'    <span class="t-Icon #IMAGE#"></span>',
'    <span class="t-Button-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>4
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2977628563533209425
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687896476365591827)
,p_page_template_id=>wwv_flow_imp.id(687896191391591826)
,p_name=>'After Logo'
,p_placeholder=>'AFTER_LOGO'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687896727618591827)
,p_page_template_id=>wwv_flow_imp.id(687896191391591826)
,p_name=>'After Navigation Bar'
,p_placeholder=>'AFTER_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687897043452591827)
,p_page_template_id=>wwv_flow_imp.id(687896191391591826)
,p_name=>'Before Navigation Bar'
,p_placeholder=>'BEFORE_NAVIGATION_BAR'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>4
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687897338777591828)
,p_page_template_id=>wwv_flow_imp.id(687896191391591826)
,p_name=>'Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687897608920591828)
,p_page_template_id=>wwv_flow_imp.id(687896191391591826)
,p_name=>'Breadcrumb Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687897995942591828)
,p_page_template_id=>wwv_flow_imp.id(687896191391591826)
,p_name=>'Dialogs, Drawers and Popups'
,p_placeholder=>'REGION_POSITION_04'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687898215637591828)
,p_page_template_id=>wwv_flow_imp.id(687896191391591826)
,p_name=>'Footer'
,p_placeholder=>'REGION_POSITION_05'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687898570956591829)
,p_page_template_id=>wwv_flow_imp.id(687896191391591826)
,p_name=>'Top Navigation'
,p_placeholder=>'REGION_POSITION_06'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687898875572591829)
,p_page_template_id=>wwv_flow_imp.id(687896191391591826)
,p_name=>'Banner'
,p_placeholder=>'REGION_POSITION_07'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687899168009591836)
,p_page_template_id=>wwv_flow_imp.id(687896191391591826)
,p_name=>'Full Width Content'
,p_placeholder=>'REGION_POSITION_08'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/page/login
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(687899521300591837)
,p_theme_id=>42
,p_name=>'Login'
,p_internal_name=>'LOGIN'
,p_is_popup=>false
,p_javascript_code_onload=>'apex.theme42.initializePage.appLogin();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-PageBody--login t-PageTemplate--login no-anim #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#',
'<div class="t-Login-bg">',
'  #BACKGROUND_IMAGE#',
'  <div class="t-Login-bgImg"></div>',
'</div>'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Login-container">',
'  <header class="t-Login-containerHeader">#REGION_POSITION_01#</header>',
'  <main class="t-Login-containerBody" id="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</main>',
'  <footer class="t-Login-containerFooter">#REGION_POSITION_02#</footer>',
'</div>',
''))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>6
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2099711150063350616
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687899813064591838)
,p_page_template_id=>wwv_flow_imp.id(687899521300591837)
,p_name=>'Background Image'
,p_placeholder=>'BACKGROUND_IMAGE'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>false
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687900107088591838)
,p_page_template_id=>wwv_flow_imp.id(687899521300591837)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687900471631591838)
,p_page_template_id=>wwv_flow_imp.id(687899521300591837)
,p_name=>'Body Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687900744105591839)
,p_page_template_id=>wwv_flow_imp.id(687899521300591837)
,p_name=>'Body Footer'
,p_placeholder=>'REGION_POSITION_02'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/modal_dialog
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(687902126178591840)
,p_theme_id=>42
,p_name=>'Modal Dialog'
,p_internal_name=>'MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.modalDialog();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--standard t-PageTemplate--dialog #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_breadcrumb_def_reg_pos=>'REGION_POSITION_01'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_js_init_code=>'apex.theme42.dialog(#PAGE_URL#,{title:#TITLE#,h:#DIALOG_HEIGHT#,w:#DIALOG_WIDTH#,mxw:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,dlgCls:''t-Dialog-page--standard ''+#DIALOG_CSS_CLASSES#,#DIALOG_ATTRIBUTES#},#PAGE_CSS_CLASSES#,#TRIGGERING_ELEMEN'
||'T#)'
,p_dialog_js_close_code=>'apex.theme42.dialog.close(#IS_MODAL#,#TARGET#)'
,p_dialog_js_cancel_code=>'apex.theme42.dialog.cancel(#IS_MODAL#)'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2098960803539086924
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687902401881591841)
,p_page_template_id=>wwv_flow_imp.id(687902126178591840)
,p_name=>'Content Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687902799225591841)
,p_page_template_id=>wwv_flow_imp.id(687902126178591840)
,p_name=>'Dialog Header'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687903070037591842)
,p_page_template_id=>wwv_flow_imp.id(687902126178591840)
,p_name=>'Dialog Footer'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/page/wizard_modal_dialog
begin
wwv_flow_imp_shared.create_template(
 p_id=>wwv_flow_imp.id(687903671179591843)
,p_theme_id=>42
,p_name=>'Wizard Modal Dialog'
,p_internal_name=>'WIZARD_MODAL_DIALOG'
,p_is_popup=>true
,p_javascript_code_onload=>'apex.theme42.initializePage.wizardModal();'
,p_header_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html class="no-js #RTL_CLASS# page-&APP_PAGE_ID. app-&APP_ALIAS." lang="&BROWSER_LANGUAGE." #TEXT_DIRECTION#>',
'<head>',
'  <meta http-equiv="x-ua-compatible" content="IE=edge" />',
'  <meta charset="utf-8">',
'  <title>#TITLE#</title>',
'  #APEX_CSS#',
'  #THEME_CSS#',
'  #TEMPLATE_CSS#',
'  #THEME_STYLE_CSS#',
'  #APPLICATION_CSS#',
'  #PAGE_CSS#',
'  #FAVICONS#',
'  #HEAD#',
'  <meta name="viewport" content="width=device-width, initial-scale=1.0" />',
'</head>',
'<body class="t-Dialog-page t-Dialog-page--wizard t-PageTemplate--wizard #DIALOG_CSS_CLASSES# #PAGE_CSS_CLASSES#" #TEXT_DIRECTION# #ONLOAD#>',
'#FORM_OPEN#'))
,p_box=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Dialog" role="dialog" aria-label="#TITLE#">',
'  <div class="t-Dialog-header">#REGION_POSITION_01#</div>',
'  <div class="t-Dialog-bodyWrapperOut">',
'    <div class="t-Dialog-bodyWrapperIn">',
'      <div class="t-Dialog-body" role="main">#SUCCESS_MESSAGE##NOTIFICATION_MESSAGE##GLOBAL_NOTIFICATION##BODY#</div>',
'    </div>',
'  </div>',
'  <div class="t-Dialog-footer">#REGION_POSITION_03#</div>',
'</div>'))
,p_footer_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#FORM_CLOSE#',
'#DEVELOPER_TOOLBAR#',
'#APEX_JAVASCRIPT#',
'#GENERATED_CSS#',
'#THEME_JAVASCRIPT#',
'#TEMPLATE_JAVASCRIPT#',
'#APPLICATION_JAVASCRIPT#',
'#PAGE_JAVASCRIPT#  ',
'#GENERATED_JAVASCRIPT#',
'</body>',
'</html>'))
,p_success_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--success t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Success" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-header">',
'          <h2 class="t-Alert-title">#SUCCESS_MESSAGE#</h2>',
'        </div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Success'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_notification_message=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-alert">',
'  <div class="t-Alert t-Alert--defaultIcons t-Alert--warning t-Alert--horizontal t-Alert--page t-Alert--colorBG" id="t_Alert_Notification" role="alert">',
'    <div class="t-Alert-wrap">',
'      <div class="t-Alert-icon">',
'        <span class="t-Icon"></span>',
'      </div>',
'      <div class="t-Alert-content">',
'        <div class="t-Alert-body">#MESSAGE#</div>',
'      </div>',
'      <div class="t-Alert-buttons">',
'        <button class="t-Button t-Button--noUI t-Button--icon t-Button--closeAlert" onclick="apex.jQuery(''#t_Alert_Notification'').remove();" type="button" title="#CLOSE_NOTIFICATION#"><span class="t-Icon icon-close"></span></button>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_region_table_cattributes=>' summary="" cellpadding="0" border="0" cellspacing="0" width="100%"'
,p_theme_class_id=>3
,p_error_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--danger t-Alert--wizard t-Alert--defaultIcons">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-body">',
'        <h3>#MESSAGE#</h3>',
'        <p>#ADDITIONAL_INFO#</p>',
'        <div class="t-Alert-inset">#TECHNICAL_INFO#</div>',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      <button onclick="#BACK_LINK#" class="t-Button t-Button--hot w50p t-Button--large" type="button">#OK#</button>',
'    </div>',
'  </div>',
'</div>'))
,p_grid_type=>'FIXED'
,p_grid_max_columns=>12
,p_grid_always_use_max_columns=>true
,p_grid_has_column_span=>true
,p_grid_always_emit=>true
,p_grid_emit_empty_leading_cols=>true
,p_grid_emit_empty_trail_cols=>false
,p_grid_default_label_col_span=>2
,p_grid_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="container">',
'#ROWS#',
'</div>'))
,p_grid_row_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="row #CSS_CLASSES#">',
'#COLUMNS#',
'</div>'))
,p_grid_column_template=>'<div class="col col-#COLUMN_SPAN_NUMBER# #CSS_CLASSES# #FIRST_LAST_COLUMN_ATTRIBUTES#" #ATTRIBUTES#>#CONTENT#</div>'
,p_grid_first_column_attributes=>'col-start'
,p_grid_last_column_attributes=>'col-end'
,p_dialog_js_init_code=>'apex.theme42.dialog(#PAGE_URL#,{title:#TITLE#,h:#DIALOG_HEIGHT#,w:#DIALOG_WIDTH#,mxw:#DIALOG_MAX_WIDTH#,modal:#IS_MODAL#,dialog:#DIALOG#,dlgCls:''t-Dialog-page--wizard ''+#DIALOG_CSS_CLASSES#,#DIALOG_ATTRIBUTES#},#PAGE_CSS_CLASSES#,#TRIGGERING_ELEMENT#'
||')'
,p_dialog_js_close_code=>'apex.theme42.dialog.close(#IS_MODAL#,#TARGET#)'
,p_dialog_js_cancel_code=>'apex.theme42.dialog.cancel(#IS_MODAL#)'
,p_dialog_height=>'auto'
,p_dialog_width=>'720'
,p_dialog_max_width=>'960'
,p_dialog_browser_frame=>'MODAL'
,p_reference_id=>2120348229686426515
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687903950405591843)
,p_page_template_id=>wwv_flow_imp.id(687903671179591843)
,p_name=>'Wizard Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687904259334591843)
,p_page_template_id=>wwv_flow_imp.id(687903671179591843)
,p_name=>'Wizard Progress Bar'
,p_placeholder=>'REGION_POSITION_01'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_page_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687904562785591844)
,p_page_template_id=>wwv_flow_imp.id(687903671179591843)
,p_name=>'Wizard Buttons'
,p_placeholder=>'REGION_POSITION_03'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/button/icon
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(688042978229592059)
,p_template_name=>'Icon'
,p_internal_name=>'ICON'
,p_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidde'
||'n="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--noLabel t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#" title="#LABEL!ATTR#" aria-label="#LABEL!ATTR#"><span class="t-Icon #ICON_CSS_CLASSE'
||'S#" aria-hidden="true"></span></button>'
,p_reference_id=>2347660919680321258
,p_translate_this_template=>'N'
,p_theme_class_id=>5
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(688043625660592062)
,p_template_name=>'Text'
,p_internal_name=>'TEXT'
,p_template=>'<button onclick="#JAVASCRIPT#" class="t-Button #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_hot_template=>'<button onclick="#JAVASCRIPT#" class="t-Button t-Button--hot #BUTTON_CSS_CLASSES#" type="button" #BUTTON_ATTRIBUTES# id="#BUTTON_ID#"><span class="t-Button-label">#LABEL#</span></button>'
,p_reference_id=>4070916158035059322
,p_translate_this_template=>'N'
,p_theme_class_id=>1
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/button/text_with_icon
begin
wwv_flow_imp_shared.create_button_templates(
 p_id=>wwv_flow_imp.id(688043785445592062)
,p_template_name=>'Text with Icon'
,p_internal_name=>'TEXT_WITH_ICON'
,p_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES#" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-label">#LABEL#'
||'</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_hot_template=>'<button class="t-Button t-Button--icon #BUTTON_CSS_CLASSES# t-Button--hot" #BUTTON_ATTRIBUTES# onclick="#JAVASCRIPT#" type="button" id="#BUTTON_ID#"><span class="t-Icon t-Icon--left #ICON_CSS_CLASSES#" aria-hidden="true"></span><span class="t-Button-'
||'label">#LABEL#</span><span class="t-Icon t-Icon--right #ICON_CSS_CLASSES#" aria-hidden="true"></span></button>'
,p_reference_id=>2081382742158699622
,p_translate_this_template=>'N'
,p_theme_class_id=>4
,p_preset_template_options=>'t-Button--iconLeft'
,p_theme_id=>42
);
end;
/
prompt --application/shared_components/user_interface/templates/region/alert
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687905156087591845)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-Alert #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title" id="#REGION_STATIC_ID#_heading" data-apex-heading>#TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">#BODY##SUB_REGIONS#</div>',
'    </div>',
'    <div class="t-Alert-buttons">#PREVIOUS##CLOSE##CREATE##NEXT#</div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Alert'
,p_internal_name=>'ALERT'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-Alert--horizontal:t-Alert--defaultIcons:t-Alert--warning'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2039236646100190748
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687905419425591848)
,p_plug_template_id=>wwv_flow_imp.id(687905156087591845)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687905733768591852)
,p_plug_template_id=>wwv_flow_imp.id(687905156087591845)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687906060765591852)
,p_plug_template_id=>wwv_flow_imp.id(687905156087591845)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687906349104591852)
,p_plug_template_id=>wwv_flow_imp.id(687905156087591845)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687906613640591853)
,p_plug_template_id=>wwv_flow_imp.id(687905156087591845)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687906994170591853)
,p_plug_template_id=>wwv_flow_imp.id(687905156087591845)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687910334526591858)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">#PREVIOUS##BODY##SUB_REGIONS##NEXT#</div>'
,p_page_plug_template_name=>'Blank with Attributes'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4499993862448380551
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687910662678591858)
,p_plug_template_id=>wwv_flow_imp.id(687910334526591858)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687910939332591859)
,p_plug_template_id=>wwv_flow_imp.id(687910334526591858)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687911251335591859)
,p_plug_template_id=>wwv_flow_imp.id(687910334526591858)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687911528333591860)
,p_plug_template_id=>wwv_flow_imp.id(687910334526591858)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/blank_with_attributes_no_grid
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687911749043591860)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="#REGION_CSS_CLASSES#">#PREVIOUS##BODY##SUB_REGIONS##NEXT#</div>'
,p_page_plug_template_name=>'Blank with Attributes (No Grid)'
,p_internal_name=>'BLANK_WITH_ATTRIBUTES_NO_GRID'
,p_theme_id=>42
,p_theme_class_id=>7
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3369790999010910123
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687912074646591860)
,p_plug_template_id=>wwv_flow_imp.id(687911749043591860)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687912359565591861)
,p_plug_template_id=>wwv_flow_imp.id(687911749043591860)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687912660161591861)
,p_plug_template_id=>wwv_flow_imp.id(687911749043591860)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687912941736591861)
,p_plug_template_id=>wwv_flow_imp.id(687911749043591860)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/buttons_container
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687913189876591861)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-ButtonRegion t-Form--floatLeft #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ButtonRegion-wrap">',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##CLOSE##DELETE#</div></div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--content">',
'      #BODY#',
'      <div class="t-ButtonRegion-buttons">#CHANGE#</div>',
'      #SUB_REGIONS#',
'    </div>',
'    <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Buttons Container'
,p_internal_name=>'BUTTONS_CONTAINER'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>17
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2124982336649579661
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687913482345591862)
,p_plug_template_id=>wwv_flow_imp.id(687913189876591861)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687913703302591862)
,p_plug_template_id=>wwv_flow_imp.id(687913189876591861)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687914009712591862)
,p_plug_template_id=>wwv_flow_imp.id(687913189876591861)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687914398545591863)
,p_plug_template_id=>wwv_flow_imp.id(687913189876591861)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687914693775591863)
,p_plug_template_id=>wwv_flow_imp.id(687913189876591861)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687914948957591863)
,p_plug_template_id=>wwv_flow_imp.id(687913189876591861)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687915284987591864)
,p_plug_template_id=>wwv_flow_imp.id(687913189876591861)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687915525838591864)
,p_plug_template_id=>wwv_flow_imp.id(687913189876591861)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687915859589591864)
,p_plug_template_id=>wwv_flow_imp.id(687913189876591861)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/cards_container
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687917412769591866)
,p_layout=>'TABLE'
,p_template=>'<div role="region" aria-label="#TITLE!ATTR#" class="t-CardsRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>#ORDER_BY_ITEM##BODY##SUB_REGIONS#</div>'
,p_page_plug_template_name=>'Cards Container'
,p_internal_name=>'CARDS_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>21
,p_default_template_options=>'u-colors'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2071277712695139743
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687917702282591867)
,p_plug_template_id=>wwv_flow_imp.id(687917412769591866)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687918024941591867)
,p_plug_template_id=>wwv_flow_imp.id(687917412769591866)
,p_name=>'Sort Order'
,p_placeholder=>'ORDER_BY_ITEM'
,p_has_grid_support=>true
,p_has_region_support=>false
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687918368214591867)
,p_plug_template_id=>wwv_flow_imp.id(687917412769591866)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/carousel_container
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687919363460591869)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-Region t-Region--carousel #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Region-header">',
'    <div class="t-Region-headerItems t-Region-headerItems--title">',
'      <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'      <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading" data-apex-heading>#TITLE#</h2>',
'    </div>',
'    <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
'  </div>',
'  <div role="region" aria-label="#TITLE#" class="t-Region-bodyWrap">',
'    <div class="t-Region-buttons t-Region-buttons--top">',
'      <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'      <div class="t-Region-buttons-right">#NEXT#</div>',
'    </div>',
'    <div class="t-Region-body">',
'      #BODY#',
'      <div class="t-Region-carouselRegions">#SUB_REGIONS#</div>',
'    </div>',
'    <div class="t-Region-buttons t-Region-buttons--bottom">',
'      <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'      <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'    </div>',
'  </div>',
'</div>'))
,p_sub_plug_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">',
'  #SUB_REGION#',
'</div>'))
,p_page_plug_template_name=>'Carousel Container'
,p_internal_name=>'CAROUSEL_CONTAINER'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#',
'#APEX_FILES#plugins/com.oracle.apex.carousel/1.1/com.oracle.apex.carousel#MIN#.js?v=#APEX_VERSION#'))
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-Region--showCarouselControls'
,p_preset_template_options=>'t-Region--hiddenOverflow'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2865840475322558786
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687919688603591870)
,p_plug_template_id=>wwv_flow_imp.id(687919363460591869)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687919982472591870)
,p_plug_template_id=>wwv_flow_imp.id(687919363460591869)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687920247392591870)
,p_plug_template_id=>wwv_flow_imp.id(687919363460591869)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687920588745591871)
,p_plug_template_id=>wwv_flow_imp.id(687919363460591869)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687920854614591871)
,p_plug_template_id=>wwv_flow_imp.id(687919363460591869)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687921143860591871)
,p_plug_template_id=>wwv_flow_imp.id(687919363460591869)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687921478603591871)
,p_plug_template_id=>wwv_flow_imp.id(687919363460591869)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687921795378591872)
,p_plug_template_id=>wwv_flow_imp.id(687919363460591869)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687922037344591872)
,p_plug_template_id=>wwv_flow_imp.id(687919363460591869)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687922307320591872)
,p_plug_template_id=>wwv_flow_imp.id(687919363460591869)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687922634171591873)
,p_plug_template_id=>wwv_flow_imp.id(687919363460591869)
,p_name=>'Slides'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/collapsible
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687929279730591883)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!HTML#" class="t-Region t-Region--hideShow #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--controls"><span class="t-Button t-Button--icon t-Button--hideShow"><span class="a-Icon _a-Collapsible-icon" aria-hidden="true"></span></span></div>',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <h2 class="t-Region-title" data-apex-heading><button class="t-Region-titleButton" type="button">#TITLE#</button></h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#EDIT#</div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#CLOSE#</div>',
'    <div class="t-Region-buttons-right">#CREATE#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #COPY#',
'     #BODY#',
'     #SUB_REGIONS#',
'     #CHANGE#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
' </div>',
'</div>'))
,p_page_plug_template_name=>'Collapsible'
,p_internal_name=>'COLLAPSIBLE'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>1
,p_preset_template_options=>'is-expanded:t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2662888092628347716
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687929514897591883)
,p_plug_template_id=>wwv_flow_imp.id(687929279730591883)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687929822031591883)
,p_plug_template_id=>wwv_flow_imp.id(687929279730591883)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687930120602591884)
,p_plug_template_id=>wwv_flow_imp.id(687929279730591883)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687930421165591884)
,p_plug_template_id=>wwv_flow_imp.id(687929279730591883)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687930735702591884)
,p_plug_template_id=>wwv_flow_imp.id(687929279730591883)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687931042540591885)
,p_plug_template_id=>wwv_flow_imp.id(687929279730591883)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687931369747591885)
,p_plug_template_id=>wwv_flow_imp.id(687929279730591883)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687931641106591885)
,p_plug_template_id=>wwv_flow_imp.id(687929279730591883)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687931955583591886)
,p_plug_template_id=>wwv_flow_imp.id(687929279730591883)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/content_block
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687938702962591895)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-ContentBlock #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-ContentBlock-header">',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--title">',
'      <span class="t-ContentBlock-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'      <h1 class="t-ContentBlock-title" id="#REGION_STATIC_ID#_heading" data-apex-heading>#TITLE#</h1>',
'      #EDIT#',
'    </div>',
'    <div class="t-ContentBlock-headerItems t-ContentBlock-headerItems--buttons">#CHANGE#</div>',
'  </div>',
'  <div class="t-ContentBlock-body">#BODY##SUB_REGIONS#</div>',
'  <div class="t-ContentBlock-buttons">#PREVIOUS##NEXT#</div>',
'</div>',
''))
,p_page_plug_template_name=>'Content Block'
,p_internal_name=>'CONTENT_BLOCK'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-ContentBlock--h1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2320668864738842174
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687939034435591895)
,p_plug_template_id=>wwv_flow_imp.id(687938702962591895)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687939384788591895)
,p_plug_template_id=>wwv_flow_imp.id(687938702962591895)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687939666576591896)
,p_plug_template_id=>wwv_flow_imp.id(687938702962591895)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687939958747591896)
,p_plug_template_id=>wwv_flow_imp.id(687938702962591895)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687940228660591896)
,p_plug_template_id=>wwv_flow_imp.id(687938702962591895)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687940513437591897)
,p_plug_template_id=>wwv_flow_imp.id(687938702962591895)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/hero
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687942932784591905)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-HeroRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-HeroRegion-top">',
'    <div class="t-HeroRegion-wrap">',
'      <div class="t-HeroRegion-col t-HeroRegion-col--left">#REGION_IMAGE#<span class="t-HeroRegion-icon t-Icon #ICON_CSS_CLASSES#"></span></div>',
'      <div class="t-HeroRegion-col t-HeroRegion-col--content">',
'        <h1 class="t-HeroRegion-title" data-apex-heading>#TITLE#</h1>',
'        #BODY#',
'      </div>',
'      <div class="t-HeroRegion-col t-HeroRegion-col--right"><div class="t-HeroRegion-form">#SUB_REGIONS#</div><div class="t-HeroRegion-buttons">#NEXT#</div></div>',
'    </div>',
'  </div>',
'  <div class="t-HeroRegion-bottom">#SMART_FILTERS#</div>',
'</div>',
''))
,p_page_plug_template_name=>'Hero'
,p_internal_name=>'HERO'
,p_image_template=>'<img class="t-HeroRegion-icon" src="#REGION_IMAGE_URL#" alt="" />'
,p_theme_id=>42
,p_theme_class_id=>22
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672571031438297268
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687943278925591906)
,p_plug_template_id=>wwv_flow_imp.id(687942932784591905)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687943508217591906)
,p_plug_template_id=>wwv_flow_imp.id(687942932784591905)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687943864998591906)
,p_plug_template_id=>wwv_flow_imp.id(687942932784591905)
,p_name=>'Smart Filters'
,p_placeholder=>'SMART_FILTERS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687944152718591906)
,p_plug_template_id=>wwv_flow_imp.id(687942932784591905)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/image
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687946126223591909)
,p_layout=>'TABLE'
,p_template=>'<div id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-ImageRegion #REGION_CSS_CLASSES#"><img src="#REGION_IMAGE_URL#" alt="#REGION_IMAGE_ALT_TEXT#" #REGION_IMAGE_ATTRIBUTES# /></div>'
,p_page_plug_template_name=>'Image'
,p_internal_name=>'IMAGE'
,p_theme_id=>42
,p_theme_class_id=>21
,p_preset_template_options=>'t-ImageRegion--noFilter:t-ImageRegion--auto:t-ImageRegion--cover:t-ImageRegion--square'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>1673953645642781634
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687946424950591910)
,p_plug_template_id=>wwv_flow_imp.id(687946126223591909)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687946730207591910)
,p_plug_template_id=>wwv_flow_imp.id(687946126223591909)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_dialog
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687951501074591916)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#" class="t-DialogRegion #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE!ATTR#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY##SUB_REGIONS#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Dialog'
,p_internal_name=>'INLINE_DIALOG'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal:js-draggable:js-resizable'
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2671226943886536762
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687951855074591916)
,p_plug_template_id=>wwv_flow_imp.id(687951501074591916)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687952153351591916)
,p_plug_template_id=>wwv_flow_imp.id(687951501074591916)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687952470648591917)
,p_plug_template_id=>wwv_flow_imp.id(687951501074591916)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687952782847591917)
,p_plug_template_id=>wwv_flow_imp.id(687951501074591916)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687953034101591917)
,p_plug_template_id=>wwv_flow_imp.id(687951501074591916)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687953345139591918)
,p_plug_template_id=>wwv_flow_imp.id(687951501074591916)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687953650780591918)
,p_plug_template_id=>wwv_flow_imp.id(687951501074591916)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687953916326591918)
,p_plug_template_id=>wwv_flow_imp.id(687951501074591916)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_drawer
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687956127198591921)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'  <div id="#REGION_STATIC_ID#" class="t-DrawerRegion js-dialog-class-ui-dialog--drawer #REGION_CSS_CLASSES# js-regionDialog" #REGION_ATTRIBUTES# style="display:none" title="#TITLE!ATTR#">',
'    <div class="t-DrawerRegion-wrap">',
'      <div class="t-DrawerRegion-bodyWrapperOut">',
'        <div class="t-DrawerRegion-bodyWrapperIn">',
'          <div class="t-DrawerRegion-body">#BODY##SUB_REGIONS#</div>',
'        </div>',
'      </div>',
'      <div class="t-DrawerRegion-buttons">',
'        <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'          <div class="t-ButtonRegion-wrap">',
'            <div class="t-ButtonRegion-col t-ButtonRegion-col--left">',
'              <div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div>',
'            </div>',
'            <div class="t-ButtonRegion-col t-ButtonRegion-col--right">',
'              <div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div>',
'            </div>',
'          </div>',
'        </div>',
'      </div>',
'    </div>',
'  </div>',
'</div>'))
,p_page_plug_template_name=>'Inline Drawer'
,p_internal_name=>'INLINE_DRAWER'
,p_theme_id=>42
,p_theme_class_id=>24
,p_default_template_options=>'js-modal'
,p_preset_template_options=>'js-dialog-class-t-Drawer--pullOutEnd'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>1659526333647509386
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687956416585591921)
,p_plug_template_id=>wwv_flow_imp.id(687956127198591921)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687956706376591922)
,p_plug_template_id=>wwv_flow_imp.id(687956127198591921)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687957062844591922)
,p_plug_template_id=>wwv_flow_imp.id(687956127198591921)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687957329448591922)
,p_plug_template_id=>wwv_flow_imp.id(687956127198591921)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687957604293591923)
,p_plug_template_id=>wwv_flow_imp.id(687956127198591921)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687957991143591923)
,p_plug_template_id=>wwv_flow_imp.id(687956127198591921)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687958200910591924)
,p_plug_template_id=>wwv_flow_imp.id(687956127198591921)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687958573735591924)
,p_plug_template_id=>wwv_flow_imp.id(687956127198591921)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/inline_popup
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687960717156591927)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div id="#REGION_STATIC_ID#_parent">',
'<div id="#REGION_STATIC_ID#" class="t-DialogRegion #REGION_CSS_CLASSES# js-regionPopup" #REGION_ATTRIBUTES# style="display:none" title="#TITLE!ATTR#">',
'  <div class="t-DialogRegion-wrap">',
'    <div class="t-DialogRegion-bodyWrapperOut"><div class="t-DialogRegion-bodyWrapperIn"><div class="t-DialogRegion-body">#BODY##SUB_REGIONS#</div></div></div>',
'    <div class="t-DialogRegion-buttons">',
'       <div class="t-ButtonRegion t-ButtonRegion--dialogRegion">',
'         <div class="t-ButtonRegion-wrap">',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--left"><div class="t-ButtonRegion-buttons">#PREVIOUS##DELETE##CLOSE#</div></div>',
'           <div class="t-ButtonRegion-col t-ButtonRegion-col--right"><div class="t-ButtonRegion-buttons">#EDIT##CREATE##NEXT#</div></div>',
'         </div>',
'       </div>',
'    </div>',
'  </div>',
'</div>',
'</div>'))
,p_page_plug_template_name=>'Inline Popup'
,p_internal_name=>'INLINE_POPUP'
,p_theme_id=>42
,p_theme_class_id=>24
,p_preset_template_options=>'js-dialog-size600x400'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>1483922538999385230
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687961017535591928)
,p_plug_template_id=>wwv_flow_imp.id(687960717156591927)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687961396949591928)
,p_plug_template_id=>wwv_flow_imp.id(687960717156591927)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687961680950591928)
,p_plug_template_id=>wwv_flow_imp.id(687960717156591927)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687961961230591929)
,p_plug_template_id=>wwv_flow_imp.id(687960717156591927)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687962236060591929)
,p_plug_template_id=>wwv_flow_imp.id(687960717156591927)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687962565341591929)
,p_plug_template_id=>wwv_flow_imp.id(687960717156591927)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687962885054591929)
,p_plug_template_id=>wwv_flow_imp.id(687960717156591927)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687963157437591930)
,p_plug_template_id=>wwv_flow_imp.id(687960717156591927)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/interactive_report
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687966107370591934)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-IRR-region #REGION_CSS_CLASSES#">#PREVIOUS##ORDER_BY_ITEM##BODY##SUB_REGIONS##NEXT#</div>',
''))
,p_page_plug_template_name=>'Interactive Report'
,p_internal_name=>'INTERACTIVE_REPORT'
,p_theme_id=>42
,p_theme_class_id=>9
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2099079838218790610
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687966496208591934)
,p_plug_template_id=>wwv_flow_imp.id(687966107370591934)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687966778199591935)
,p_plug_template_id=>wwv_flow_imp.id(687966107370591934)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687967042120591935)
,p_plug_template_id=>wwv_flow_imp.id(687966107370591934)
,p_name=>'Sort Order'
,p_placeholder=>'ORDER_BY_ITEM'
,p_has_grid_support=>true
,p_has_region_support=>false
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687967363745591935)
,p_plug_template_id=>wwv_flow_imp.id(687966107370591934)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687967667149591935)
,p_plug_template_id=>wwv_flow_imp.id(687966107370591934)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/login
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687968214451591936)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-Login-region t-Form--stretchInputs t-Form--labelsAbove #REGION_CSS_CLASSES#" id="#REGION_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Login-header">',
'    #REGION_IMAGE#',
'    <span class="t-Login-logo #ICON_CSS_CLASSES#" aria-hidden="true"></span>',
'    <h1 class="t-Login-title" id="#REGION_STATIC_ID#_heading" data-apex-heading>#TITLE#</h1>',
'  </div>',
'  <div class="t-Login-body">#BODY#</div>',
'  <div class="t-Login-buttons">#NEXT#</div>',
'  <div class="t-Login-links">#EDIT##CREATE#</div>',
'  <div class="t-Login-subRegions">#SUB_REGIONS#</div>',
'</div>'))
,p_page_plug_template_name=>'Login'
,p_internal_name=>'LOGIN'
,p_image_template=>'<img class="t-Login-logo" src="#REGION_IMAGE_URL#" alt="" data-app-icon />'
,p_theme_id=>42
,p_theme_class_id=>23
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2672711194551076376
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687968542151591937)
,p_plug_template_id=>wwv_flow_imp.id(687968214451591936)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687968854303591937)
,p_plug_template_id=>wwv_flow_imp.id(687968214451591936)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687969128839591937)
,p_plug_template_id=>wwv_flow_imp.id(687968214451591936)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687969446138591938)
,p_plug_template_id=>wwv_flow_imp.id(687968214451591936)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687969779773591938)
,p_plug_template_id=>wwv_flow_imp.id(687968214451591936)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/standard
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687970755600591939)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-Region #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
' <div class="t-Region-header">',
'  <div class="t-Region-headerItems t-Region-headerItems--title">',
'    <span class="t-Region-headerIcon"><span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span></span>',
'    <h2 class="t-Region-title" id="#REGION_STATIC_ID#_heading" data-apex-heading>#TITLE#</h2>',
'  </div>',
'  <div class="t-Region-headerItems t-Region-headerItems--buttons">#COPY##EDIT#<span class="js-maximizeButtonContainer"></span></div>',
' </div>',
' <div class="t-Region-bodyWrap">',
'   <div class="t-Region-buttons t-Region-buttons--top">',
'    <div class="t-Region-buttons-left">#PREVIOUS#</div>',
'    <div class="t-Region-buttons-right">#NEXT#</div>',
'   </div>',
'   <div class="t-Region-body">',
'     #ORDER_BY_ITEM#',
'     #BODY#',
'     #SUB_REGIONS#',
'   </div>',
'   <div class="t-Region-buttons t-Region-buttons--bottom">',
'    <div class="t-Region-buttons-left">#CLOSE##HELP#</div>',
'    <div class="t-Region-buttons-right">#DELETE##CHANGE##CREATE#</div>',
'   </div>',
' </div>',
'</div>',
''))
,p_page_plug_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_plug_table_bgcolor=>'#ffffff'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Region--scrollBody'
,p_plug_heading_bgcolor=>'#ffffff'
,p_plug_font_size=>'-1'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>4070912133526059312
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687971072612591940)
,p_plug_template_id=>wwv_flow_imp.id(687970755600591939)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687971399384591940)
,p_plug_template_id=>wwv_flow_imp.id(687970755600591939)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687971659660591940)
,p_plug_template_id=>wwv_flow_imp.id(687970755600591939)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687971941040591940)
,p_plug_template_id=>wwv_flow_imp.id(687970755600591939)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687972273454591941)
,p_plug_template_id=>wwv_flow_imp.id(687970755600591939)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687972581742591941)
,p_plug_template_id=>wwv_flow_imp.id(687970755600591939)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687972818214591941)
,p_plug_template_id=>wwv_flow_imp.id(687970755600591939)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687973113767591942)
,p_plug_template_id=>wwv_flow_imp.id(687970755600591939)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687973473101591942)
,p_plug_template_id=>wwv_flow_imp.id(687970755600591939)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687973794871591942)
,p_plug_template_id=>wwv_flow_imp.id(687970755600591939)
,p_name=>'Sort Order'
,p_placeholder=>'ORDER_BY_ITEM'
,p_has_grid_support=>true
,p_has_region_support=>false
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687974016085591943)
,p_plug_template_id=>wwv_flow_imp.id(687970755600591939)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687974348518591943)
,p_plug_template_id=>wwv_flow_imp.id(687970755600591939)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
,p_max_fixed_grid_columns=>12
);
end;
/
prompt --application/shared_components/user_interface/templates/region/tabs_container
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687980512404591951)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-TabsRegion #REGION_CSS_CLASSES# apex-tabs-region" #REGION_ATTRIBUTES# id="#REGION_STATIC_ID#">',
'  #BODY#',
'  <div class="t-TabsRegion-items">#SUB_REGIONS#</div>',
'</div>'))
,p_sub_plug_template=>'<div data-label="#SUB_REGION_TITLE#" id="SR_#SUB_REGION_ID#">#SUB_REGION#</div>'
,p_page_plug_template_name=>'Tabs Container'
,p_internal_name=>'TABS_CONTAINER'
,p_javascript_file_urls=>'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>5
,p_preset_template_options=>'t-TabsRegion-mod--simple'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>3221725015618492759
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687980884677591951)
,p_plug_template_id=>wwv_flow_imp.id(687980512404591951)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687981101998591952)
,p_plug_template_id=>wwv_flow_imp.id(687980512404591951)
,p_name=>'Tabs'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>false
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/title_bar
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687983117087591954)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<nav aria-label="#TITLE!ATTR#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES# class="t-BreadcrumbRegion #REGION_CSS_CLASSES#">',
'  <div class="t-BreadcrumbRegion-top">',
'    <div class="t-BreadcrumbRegion-body">',
'      <div class="t-BreadcrumbRegion-breadcrumb">#BODY#</div>',
'        <div class="t-BreadcrumbRegion-title">',
'        <h1 id="#REGION_STATIC_ID#_heading" class="t-BreadcrumbRegion-titleText" data-apex-heading>#TITLE#</h1>',
'      </div>',
'    </div>',
'    <div class="t-BreadcrumbRegion-buttons">#PREVIOUS##CLOSE##DELETE##HELP##CHANGE##EDIT##COPY##CREATE##NEXT#</div>',
'  </div>',
'  <div class="t-BreadcrumbRegion-bottom">#SMART_FILTERS#</div>',
'</nav>',
''))
,p_page_plug_template_name=>'Title Bar'
,p_internal_name=>'TITLE_BAR'
,p_theme_id=>42
,p_theme_class_id=>6
,p_default_template_options=>'t-BreadcrumbRegion--showBreadcrumb'
,p_preset_template_options=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2530016523834132090
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687983425272591954)
,p_plug_template_id=>wwv_flow_imp.id(687983117087591954)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687983751934591955)
,p_plug_template_id=>wwv_flow_imp.id(687983117087591954)
,p_name=>'Change'
,p_placeholder=>'CHANGE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687984057825591955)
,p_plug_template_id=>wwv_flow_imp.id(687983117087591954)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687984377211591955)
,p_plug_template_id=>wwv_flow_imp.id(687983117087591954)
,p_name=>'Copy'
,p_placeholder=>'COPY'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687984692790591955)
,p_plug_template_id=>wwv_flow_imp.id(687983117087591954)
,p_name=>'Create'
,p_placeholder=>'CREATE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687984955561591956)
,p_plug_template_id=>wwv_flow_imp.id(687983117087591954)
,p_name=>'Delete'
,p_placeholder=>'DELETE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687985299778591956)
,p_plug_template_id=>wwv_flow_imp.id(687983117087591954)
,p_name=>'Edit'
,p_placeholder=>'EDIT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687985581596591957)
,p_plug_template_id=>wwv_flow_imp.id(687983117087591954)
,p_name=>'Help'
,p_placeholder=>'HELP'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687985844156591957)
,p_plug_template_id=>wwv_flow_imp.id(687983117087591954)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687986138872591958)
,p_plug_template_id=>wwv_flow_imp.id(687983117087591954)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687986454900591958)
,p_plug_template_id=>wwv_flow_imp.id(687983117087591954)
,p_name=>'Smart Filters'
,p_placeholder=>'SMART_FILTERS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687986793775591959)
,p_plug_template_id=>wwv_flow_imp.id(687983117087591954)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/region/wizard_container
begin
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(687987915785591961)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div role="region" aria-label="#TITLE!ATTR#" class="t-Wizard #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_ATTRIBUTES#>',
'  <div class="t-Wizard-header">',
'    <h1 class="t-Wizard-title" id="#REGION_STATIC_ID#_heading" data-apex-heading>#TITLE#</h1>',
'    <div class="u-Table t-Wizard-controls">',
'      <div class="u-Table-fit t-Wizard-buttons">#PREVIOUS##CLOSE#</div>',
'      <div class="u-Table-fill t-Wizard-steps">#BODY#</div>',
'      <div class="u-Table-fit t-Wizard-buttons">#NEXT#</div>',
'    </div>',
'  </div>',
'  <div class="t-Wizard-body">#SUB_REGIONS#</div>',
'</div>'))
,p_page_plug_template_name=>'Wizard Container'
,p_internal_name=>'WIZARD_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>8
,p_preset_template_options=>'t-Wizard--hideStepsXSmall'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_reference_id=>2117602213152591491
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687988222136591962)
,p_plug_template_id=>wwv_flow_imp.id(687987915785591961)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687988530431591962)
,p_plug_template_id=>wwv_flow_imp.id(687987915785591961)
,p_name=>'Close'
,p_placeholder=>'CLOSE'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687988833039591963)
,p_plug_template_id=>wwv_flow_imp.id(687987915785591961)
,p_name=>'Next'
,p_placeholder=>'NEXT'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687989129346591963)
,p_plug_template_id=>wwv_flow_imp.id(687987915785591961)
,p_name=>'Previous'
,p_placeholder=>'PREVIOUS'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>false
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(687989416254591963)
,p_plug_template_id=>wwv_flow_imp.id(687987915785591961)
,p_name=>'Wizard Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
end;
/
prompt --application/shared_components/user_interface/templates/list/badge_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(688015497177592012)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02# is-current" aria-current="page">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'    <span class="t-BadgeList-label">#TEXT#</span>',
'    <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item #A02#">',
'  <a class="t-BadgeList-wrap u-color #A04#" href="#LINK#" #A03#>',
'    <span class="t-BadgeList-label">#TEXT#</span>',
'    <span class="t-BadgeList-value">#A01#</span>',
'  </a>',
'</li>',
''))
,p_list_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_theme_id=>42
,p_theme_class_id=>3
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--cols t-BadgeList--3cols:t-BadgeList--circular'
,p_list_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Value'
,p_a02_label=>'List item CSS Classes'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'Link Classes'
,p_reference_id=>2062482847268086664
,p_list_template_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'A01: Large Number',
'A02: List Item Classes',
'A03: Link Attributes'))
);
end;
/
prompt --application/shared_components/user_interface/templates/list/cards
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(688019485032592020)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item is-active #A04#" aria-current="page">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap">',
'        <h3 class="t-Card-title">#TEXT#</h3>',
'        <h4 class="t-Card-subtitle">#A07#</h4>',
'      </div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#" aria-hidden="true"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #A04#">',
'  <div class="t-Card">',
'    <a href="#LINK#" class="t-Card-wrap" #A05#>',
'      <div class="t-Card-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#"><span class="t-Card-initials" role="presentation">#A03#</span></span></div>',
'      <div class="t-Card-titleWrap">',
'        <h3 class="t-Card-title">#TEXT#</h3>',
'        <h4 class="t-Card-subtitle">#A07#</h4>',
'      </div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#A01#</div>',
'        <div class="t-Card-info">#A02#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #A06#" aria-hidden="true"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_list_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_list_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Secondary Information'
,p_a03_label=>'Initials'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Attributes'
,p_a06_label=>'Card Color Class'
,p_a07_label=>'Subtitle'
,p_reference_id=>2885322685880632508
);
end;
/
prompt --application/shared_components/user_interface/templates/list/media_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(688025035401592028)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item is-active #A04#">',
'  <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'    <div class="t-MediaList-iconWrap" aria-hidden="true">',
'      <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'    </div>',
'    <div class="t-MediaList-body">',
'      <h3 class="t-MediaList-title" aria-current="page">#TEXT#</h3>',
'      <p class="t-MediaList-desc">#A01#</p>',
'    </div>',
'    <div class="t-MediaList-badgeWrap">',
'      <span class="t-MediaList-badge">#A02#</span>',
'    </div>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item  #A04#">',
'  <a href="#LINK#" class="t-MediaList-itemWrap #A05#" #A03#>',
'    <div class="t-MediaList-iconWrap" aria-hidden="true">',
'      <span class="t-MediaList-icon u-color #A06#"><span class="t-Icon #ICON_CSS_CLASSES#" #IMAGE_ATTR#></span></span>',
'    </div>',
'    <div class="t-MediaList-body">',
'      <h3 class="t-MediaList-title">#TEXT#</h3>',
'      <p class="t-MediaList-desc">#A01#</p>',
'    </div>',
'    <div class="t-MediaList-badgeWrap">',
'      <span class="t-MediaList-badge">#A02#</span>',
'    </div>',
'  </a>',
'</li>'))
,p_list_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_theme_id=>42
,p_theme_class_id=>5
,p_default_template_options=>'t-MediaList--showIcons:t-MediaList--showDesc'
,p_list_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'Description'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Link Attributes'
,p_a04_label=>'List Item CSS Classes'
,p_a05_label=>'Link Class'
,p_a06_label=>'Icon Color Class'
,p_reference_id=>2066548068783481421
);
end;
/
prompt --application/shared_components/user_interface/templates/list/tabs
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(688027803965592031)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Tabs-item is-active #A03#" aria-current="page" id="#A01#">',
'  <a href="#LINK#" class="t-Tabs-link #A04#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span>',
'    <span class="t-Tabs-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Tabs-item #A03#" id="#A01#">',
'  <a href="#LINK#" class="t-Tabs-link #A04#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span>',
'    <span class="t-Tabs-label">#TEXT#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Tabs'
,p_internal_name=>'TABS'
,p_javascript_file_urls=>'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.apexTabs#MIN#.js?v=#APEX_VERSION#'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Tabs--simple'
,p_list_template_before_rows=>'<ul class="t-Tabs #COMPONENT_CSS_CLASSES#">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'List Item ID'
,p_a03_label=>'List Item Class'
,p_a04_label=>'Link Class'
,p_reference_id=>3288206686691809997
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_tabs
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(688029480686592034)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavTabs-item #A03# is-active" aria-current="page" id="#A01#">',
'  <a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span>',
'    <span class="t-NavTabs-label">#TEXT_ESC_SC#</span>',
'    <span class="t-NavTabs-badge #A05#">#A02#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavTabs-item #A03#" id="#A01#">',
'  <a href="#LINK#" class="t-NavTabs-link #A04# " title="#TEXT_ESC_SC#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true"></span>',
'    <span class="t-NavTabs-label">#TEXT_ESC_SC#</span>',
'    <span class="t-NavTabs-badge #A05#">#A02#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Top Navigation Tabs'
,p_internal_name=>'TOP_NAVIGATION_TABS'
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-NavTabs--inlineLabels-lg:t-NavTabs--displayLabels-sm'
,p_list_template_before_rows=>'<ul class="t-NavTabs #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_navtabs">'
,p_list_template_after_rows=>'</ul>'
,p_a01_label=>'List Item ID'
,p_a02_label=>'Badge Value'
,p_a03_label=>'List Item Class'
,p_a04_label=>'Link Class'
,p_a05_label=>'Badge Class'
,p_reference_id=>1453011561172885578
);
end;
/
prompt --application/shared_components/user_interface/templates/list/links_list
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(688031061475592036)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-LinksList-item is-current #A03#" aria-current="page">',
'  <a href="#LINK#" class="t-LinksList-link" #A02#>',
'    <span class="t-LinksList-icon" aria-hidden="true"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span>',
'    <span class="t-LinksList-label">#TEXT#</span>',
'    <span class="t-LinksList-badge">#A01#</span>',
'  </a>',
'</li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-LinksList-item #A03#">',
'  <a href="#LINK#" class="t-LinksList-link" #A02#>',
'    <span class="t-LinksList-icon" aria-hidden="true"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span>',
'    <span class="t-LinksList-label">#TEXT#</span>',
'    <span class="t-LinksList-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Links List'
,p_internal_name=>'LINKS_LIST'
,p_theme_id=>42
,p_theme_class_id=>18
,p_list_template_before_rows=>'<ul class="t-LinksList #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<ul class="t-LinksList-list">'
,p_after_sub_list=>'</ul>'
,p_sub_list_item_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-LinksList-item is-current #A03#" aria-current="page">',
'  <a href="#LINK#" class="t-LinksList-link" #A02#>',
'    <span class="t-LinksList-icon" aria-hidden="true"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span>',
'    <span class="t-LinksList-label">#TEXT#</span>',
'    <span class="t-LinksList-badge">#A01#</span>',
'  </a>',
'</li>',
''))
,p_sub_list_item_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-LinksList-item #A03#">',
'  <a href="#LINK#" class="t-LinksList-link" #A02#>',
'    <span class="t-LinksList-icon" aria-hidden="true"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span>',
'    <span class="t-LinksList-label">#TEXT#</span>',
'    <span class="t-LinksList-badge">#A01#</span>',
'  </a>',
'</li>',
''))
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-LinksList-item is-current #A03#" aria-current="page">',
'  <a href="#LINK#" class="t-LinksList-link" #A02#>',
'    <span class="t-LinksList-icon" aria-hidden="true"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span>',
'    <span class="t-LinksList-label">#TEXT#</span>',
'    <span class="t-LinksList-badge">#A01#</span>',
'  </a>',
'  #SUB_LISTS#',
'</li>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-LinksList-item #A03#">',
'  <a href="#LINK#" class="t-LinksList-link" #A02#>',
'    <span class="t-LinksList-icon" aria-hidden="true"><span class="t-Icon #ICON_CSS_CLASSES#"></span></span>',
'    <span class="t-LinksList-label">#TEXT#</span>',
'    <span class="t-LinksList-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_a01_label=>'Badge Value'
,p_a02_label=>'Link Attributes'
,p_a03_label=>'List Item CSS Classes'
,p_reference_id=>4070914341144059318
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_bar
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(688032684641592039)
,p_list_template_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Menu Bar'
,p_internal_name=>'MENU_BAR'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menubar", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  iconType: ''fa'',',
'  menubar: true,',
'  menubarOverflow: true,',
'  callout: e.hasClass("js-menu-callout")',
'});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-showSubMenuIcons'
,p_list_template_before_rows=>'<div class="t-MenuBar #COMPONENT_CSS_CLASSES#" id="#PARENT_STATIC_ID#_menubar"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Menu Item ID / Action Name'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute (Used By Actions Only)'
,p_a05_label=>'Shortcut'
,p_a06_label=>'Link Target'
,p_reference_id=>2008709236185638887
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_mega_menu
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(688033652354592041)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item t-MegaMenu-item--top t-MegaMenu-item--noSub is-active #A04#" data-current="true" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item t-MegaMenu-item--top t-MegaMenu-item--noSub #A04#" data-current="false" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_list_template_name=>'Top Navigation Mega Menu'
,p_internal_name=>'TOP_NAVIGATION_MEGA_MENU'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-MegaMenu #COMPONENT_CSS_CLASSES#" id="t_MenuNav" style="display:none;">',
'  <div class="a-Menu-content t-MegaMenu-container">',
'    <div class="t-MegaMenu-body">',
'    <ul class="t-MegaMenu-list t-MegaMenu-list--top">'))
,p_list_template_after_rows=>' </ul></div></div></div>'
,p_before_sub_list=>'<ul class="t-MegaMenu-list t-MegaMenu-list--sub">'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item is-active #A04#" data-current="true" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_sub_list_item_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item #A04#" data-current="false" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item t-MegaMenu-item--top t-MegaMenu-item--hasSub is-active #A04#" data-current="true" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item t-MegaMenu-item--top t-MegaMenu-item--hasSub #A04#" data-current="false" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>',
'</li>'))
,p_sub_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item is-active #A04#" data-current="true" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>'))
,p_sub_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MegaMenu-item #A04#" data-current="false" data-id="#A01#" data-shortcut="#A05#">',
'  <span class="a-Menu-item t-MegaMenu-itemBody #A08#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#"></span>',
'    <a class="a-Menu-label t-MegaMenu-labelWrap" href="#LINK#" target="#A06#">',
'      <span class="t-MegaMenu-label">#TEXT_ESC_SC#</span>',
'      <span class="t-MegaMenu-desc">#A03#</span>',
'    </a>',
'    <span class="t-MegaMenu-badge #A07#">#A02#</span>',
'  </span>'))
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Badge Value'
,p_a03_label=>'Description'
,p_a04_label=>'List Item Class'
,p_a05_label=>'Shortcut Key'
,p_a06_label=>'Link Target'
,p_a07_label=>'Badge Class'
,p_a08_label=>'Menu Item Class'
,p_reference_id=>1665447133514362075
);
end;
/
prompt --application/shared_components/user_interface/templates/list/wizard_progress
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(688035698365592044)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step is-active" aria-current="step" id="#LIST_ITEM_ID#">',
'  <div class="t-WizardSteps-wrap" data-link="#LINK#">',
'    <span class="t-WizardSteps-marker" aria-hidden="true"></span>',
'    <span class="t-WizardSteps-label">#TEXT# <span aria-hidden="true" class="t-WizardSteps-labelState"></span></span>',
'  </div>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-WizardSteps-step" id="#LIST_ITEM_ID#">',
'  <div class="t-WizardSteps-wrap" data-link="#LINK#">',
'    <span class="t-WizardSteps-marker" aria-hidden="true"></span>',
'    <span class="t-WizardSteps-label">#TEXT# <span aria-hidden="true" class="t-WizardSteps-labelState"></span></span>',
'  </div>',
'</li>'))
,p_list_template_name=>'Wizard Progress'
,p_internal_name=>'WIZARD_PROGRESS'
,p_javascript_code_onload=>'apex.theme.initWizardProgressBar();'
,p_theme_id=>42
,p_theme_class_id=>17
,p_preset_template_options=>'t-WizardSteps--displayLabels'
,p_list_template_before_rows=>'<ul aria-label="#CURRENT_PROGRESS#" class="t-WizardSteps #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_reference_id=>2008702338707394488
);
end;
/
prompt --application/shared_components/user_interface/templates/list/menu_popup
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(688037061632592046)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>',
''))
,p_list_template_name=>'Menu Popup'
,p_internal_name=>'MENU_POPUP'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("##PARENT_STATIC_ID#_menu", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({ iconType: ''fa'', callout: e.hasClass("js-menu-callout")});'))
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<div id="#PARENT_STATIC_ID#_menu" class="#COMPONENT_CSS_CLASSES#" style="display:none;"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul>'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Menu Item ID / Action Name'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute (Used By Actions Only)'
,p_a05_label=>'Shortcut'
,p_a06_label=>'Link Target'
,p_reference_id=>3492264004432431646
);
end;
/
prompt --application/shared_components/user_interface/templates/list/navigation_bar
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(688037669725592047)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#" aria-current="page">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" title="#A04#" target="#A06#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true" #IMAGE_ATTR#></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <a class="t-Button t-Button--icon t-Button--header t-Button--navBar" href="#LINK#" title="#A04#" target="#A06#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true" #IMAGE_ATTR#></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span>',
'  </a>',
'</li>'))
,p_list_template_name=>'Navigation Bar'
,p_internal_name=>'NAVIGATION_BAR'
,p_theme_id=>42
,p_theme_class_id=>20
,p_list_template_before_rows=>'<ul class="t-NavigationBar #COMPONENT_CSS_CLASSES#" id="#LIST_ID#">'
,p_list_template_after_rows=>'</ul>'
,p_before_sub_list=>'<div class="t-NavigationBar-menu" style="display: none" id="menu_#PARENT_LIST_ITEM_ID#"><ul>'
,p_after_sub_list=>'</ul></div></li>'
,p_sub_list_item_current=>'<li class="#A02#" data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li class="#A02#" data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item is-active #A02#" aria-current="page">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#" title="#A04#">',
'    <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true" #IMAGE_ATTR#></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow" aria-hidden="true"></span>',
'  </button>'))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-NavigationBar-item #A02#">',
'  <button class="t-Button t-Button--icon t-Button t-Button--header t-Button--navBar js-menuButton" type="button" id="#LIST_ITEM_ID#" data-menu="menu_#LIST_ITEM_ID#" title="#A04#">',
'      <span class="t-Icon #ICON_CSS_CLASSES#" aria-hidden="true" #IMAGE_ATTR#></span><span class="t-Button-label">#TEXT_ESC_SC#</span><span class="t-Button-badge">#A01#</span><span class="a-Icon icon-down-arrow" aria-hidden="true"></span>',
'  </button>'))
,p_sub_templ_curr_w_child=>'<li class="#A02#" data-current="true" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_templ_noncurr_w_child=>'<li class="#A02#" data-current="false" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_a01_label=>'Badge Value'
,p_a02_label=>'List  Item CSS Classes'
,p_a04_label=>'Title Attribute'
,p_a06_label=>'Link Target'
,p_reference_id=>2846096252961119197
);
end;
/
prompt --application/shared_components/user_interface/templates/list/side_navigation_menu
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(688038045094592047)
,p_list_template_current=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#">',
'  <a href="#LINK#" title="#A04#" style="display: none" target="#A06#">#TEXT_ESC_SC#</a>',
'  <div class="a-TreeView-node a-TreeView-node--topLevel" aria-hidden="true">',
'    <div role="none" class="a-TreeView-row is-selected is-current--top"></div>',
'    <div role="none" class="a-TreeView-content is-selected is-current--top">',
'      <span class="fa fa-file-o #ICON_CSS_CLASSES#"></span>',
'      <span class="a-TreeView-label">#TEXT_ESC_SC#</span>',
'    </div>',
'  </div>',
'</li>',
''))
,p_list_template_noncurrent=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-current="false" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#">',
'  <a href="#LINK#" title="#A04#" style="display: none" target="#A06#">#TEXT_ESC_SC#</a>',
'  <div class="a-TreeView-node a-TreeView-node--topLevel" aria-hidden="true">',
'    <div role="none" class="a-TreeView-row"></div>',
'    <div role="none" class="a-TreeView-content">',
'      <span class="fa fa-file-o #ICON_CSS_CLASSES#"></span>',
'      <span class="a-TreeView-label">#TEXT_ESC_SC#</span>',
'    </div>',
'  </div>',
'</li>'))
,p_list_template_name=>'Side Navigation Menu'
,p_internal_name=>'SIDE_NAVIGATION_MENU'
,p_javascript_file_urls=>'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.treeView#MIN#.js?v=#APEX_VERSION#'
,p_javascript_code_onload=>'apex.jQuery(''body'').addClass(''t-PageBody--leftNav'');'
,p_theme_id=>42
,p_theme_class_id=>19
,p_default_template_options=>'js-defaultCollapsed'
,p_preset_template_options=>'js-navCollapsed--hidden:t-TreeNav--styleA'
,p_list_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Body-nav" id="t_Body_nav" role="navigation" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL".">',
'  <div class="a-TreeView t-TreeNav #COMPONENT_CSS_CLASSES#" id="t_TreeNav" data-id="#PARENT_STATIC_ID#_tree" aria-label="&"APP_TEXT$APEX.TEMPLATE.MAIN_NAV_LABEL".">',
'    <ul>',
''))
,p_list_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    </ul>',
'  </div>',
'</div>',
'<script>(sessionStorage.getItem("nav.&APP_ID..preferenceForExpanded") === "true" && window.matchMedia("(min-width: " + getComputedStyle(document.documentElement).getPropertyValue("--js-mq-lg") + ")").matches) && document.getElementById(''t_PageBody'').'
||'classList.add(''js-navExpanded'');</script>',
'<script>',
'    const labels = document.querySelectorAll(".a-TreeView .a-TreeView-label");',
'    for (const label of labels) {',
'        label.textContent = label.textContent.replaceAll(/\[(.*?)\]/ig, '''');',
'    }',
'</script>'))
,p_before_sub_list=>'<ul style="display:none">'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#">',
'  <a href="#LINK#" title="#A04#" style="display: none" target="#A06#">#TEXT_ESC_SC#</a>',
'  <div class="a-TreeView-node a-TreeView-node--topLevel" aria-hidden="true">',
'    <div role="none" class="a-TreeView-row is-selected is-current--top"></div>',
'    <div role="none" class="a-TreeView-content is-selected is-current--top">',
'      <span class="fa fa-file-o #ICON_CSS_CLASSES#"></span>',
'      <span class="a-TreeView-label">#TEXT_ESC_SC#</span>',
'    </div>',
'  </div>',
''))
,p_item_templ_noncurr_w_child=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li data-current="false" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#">',
'  <a href="#LINK#" title="#A04#" style="display: none" target="#A06#">#TEXT_ESC_SC#</a>',
'  <div class="a-TreeView-node a-TreeView-node--topLevel" aria-hidden="true">',
'    <div role="none" class="a-TreeView-row"></div>',
'    <div role="none" class="a-TreeView-content">',
'      <span class="fa fa-file-o #ICON_CSS_CLASSES#"></span>',
'      <span class="a-TreeView-label">#TEXT_ESC_SC#</span>',
'    </div>',
'  </div>',
''))
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-icon="#ICON_CSS_CLASSES#" data-shortcut="#A05#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'ID Attribute'
,p_a02_label=>'Disabled (True/False)'
,p_a04_label=>'Title Attribute (Used By Actions Only)'
,p_a05_label=>'Shortcut Key'
,p_a06_label=>'Link Target'
,p_reference_id=>2466292414354694776
);
end;
/
prompt --application/shared_components/user_interface/templates/list/top_navigation_menu
begin
wwv_flow_imp_shared.create_list_template(
 p_id=>wwv_flow_imp.id(688039855456592050)
,p_list_template_current=>'<li class="a-MenuBar-item a-Menu--current" data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a class="a-MenuBar-label" href="#LINK#" title="#A04#" target="#A06#">#TEXT_ES'
||'C_SC#</a></li>'
,p_list_template_noncurrent=>'<li class="a-MenuBar-item" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a class="a-MenuBar-label" href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_list_template_name=>'Top Navigation Menu'
,p_internal_name=>'TOP_NAVIGATION_MENU'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var e = apex.jQuery("#t_MenuNav", apex.gPageContext$);',
'if (e.hasClass("js-addActions")) {',
'  apex.actions.addFromMarkup( e );',
'}',
'e.menu({',
'  behaveLikeTabs: e.hasClass("js-tabLike"),',
'  menubarShowSubMenuIcon: e.hasClass("js-showSubMenuIcons") || null,',
'  menubar: true,',
'  menubarOverflow: true,',
'  callout: e.hasClass("js-menu-callout")',
'});',
''))
,p_theme_id=>42
,p_theme_class_id=>20
,p_default_template_options=>'js-tabLike'
,p_list_template_before_rows=>'<div class="t-Header-nav-list #COMPONENT_CSS_CLASSES#" id="t_MenuNav"><ul>'
,p_list_template_after_rows=>'</ul></div>'
,p_before_sub_list=>'<ul style="display: none">'
,p_after_sub_list=>'</ul></li>'
,p_sub_list_item_current=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_sub_list_item_noncurrent=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a></li>'
,p_item_templ_curr_w_child=>'<li class="a-MenuBar-item a-Menu--current" data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a class="a-MenuBar-label" href="#LINK#" title="#A04#" target="#A06#">#TEXT_ES'
||'C_SC#</a>'
,p_item_templ_noncurr_w_child=>'<li class="a-MenuBar-item" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a class="a-MenuBar-label" href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_curr_w_child=>'<li data-current="true" data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_sub_templ_noncurr_w_child=>'<li data-id="#A01#" data-disabled="#A02#" data-hide="#A03#" data-shortcut="#A05#" data-icon="#ICON_CSS_CLASSES#"><a href="#LINK#" title="#A04#" target="#A06#">#TEXT_ESC_SC#</a>'
,p_a01_label=>'Menu Item ID / Action Name'
,p_a02_label=>'Disabled (True/False)'
,p_a03_label=>'Hidden (True/False)'
,p_a04_label=>'Title Attribute (Used By Actions Only)'
,p_a05_label=>'Shortcut Key'
,p_a06_label=>'Link Target'
,p_reference_id=>2525307901300239072
);
end;
/
prompt --application/shared_components/user_interface/templates/report/alerts
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(687990400781591966)
,p_row_template_name=>'Alerts'
,p_internal_name=>'ALERTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Alert t-Alert--horizontal t-Alert--colorBG t-Alert--defaultIcons t-Alert--#ALERT_TYPE#" role="alert">',
'  <div class="t-Alert-wrap">',
'    <div class="t-Alert-icon">',
'      <span class="t-Icon" aria-hidden="true"></span>',
'    </div>',
'    <div class="t-Alert-content">',
'      <div class="t-Alert-header">',
'        <h2 class="t-Alert-title">#ALERT_TITLE#</h2>',
'      </div>',
'      <div class="t-Alert-body">',
'        #ALERT_DESC#',
'      </div>',
'    </div>',
'    <div class="t-Alert-buttons">',
'      #ALERT_ACTION#',
'    </div>',
'  </div>',
'</div>'))
,p_row_template_before_rows=>'<div class="t-Alerts #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_alerts" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>14
,p_reference_id=>2881456138952347027
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/badge_list
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(687990640577591977)
,p_row_template_name=>'Badge List'
,p_internal_name=>'BADGE_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-BadgeList-item">',
'  <span class="t-BadgeList-wrap u-color">',
'    <span class="t-BadgeList-label">#COLUMN_HEADER#</span>',
'    <span class="t-BadgeList-value">#COLUMN_VALUE#</span>',
'  </span>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-BadgeList #COMPONENT_CSS_CLASSES#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-BadgeList--large:t-BadgeList--fixed:t-BadgeList--circular'
,p_reference_id=>2103197159775914759
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/cards
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(687994618453591983)
,p_row_template_name=>'Cards'
,p_internal_name=>'CARDS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <a href="#CARD_LINK#" class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </a>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':CARD_LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Cards-item #CARD_MODIFIERS#">',
'  <div class="t-Card">',
'    <div class="t-Card-wrap">',
'      <div class="t-Card-icon u-color #CARD_COLOR#"><span class="t-Icon fa #CARD_ICON#"><span class="t-Card-initials" role="presentation">#CARD_INITIALS#</span></span></div>',
'      <div class="t-Card-titleWrap"><h3 class="t-Card-title">#CARD_TITLE#</h3><h4 class="t-Card-subtitle">#CARD_SUBTITLE#</h4></div>',
'      <div class="t-Card-body">',
'        <div class="t-Card-desc">#CARD_TEXT#</div>',
'        <div class="t-Card-info">#CARD_SUBTEXT#</div>',
'      </div>',
'      <span class="t-Card-colorFill u-color #CARD_COLOR#"></span>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Cards #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_cards" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Cards--animColorFill:t-Cards--3cols:t-Cards--basic'
,p_reference_id=>2973535649510699732
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/comments
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(688000039762591990)
,p_row_template_name=>'Comments'
,p_internal_name=>'COMMENTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Comments-item #COMMENT_MODIFIERS#">',
'  <div class="t-Comments-icon">',
'    <div class="t-Comments-userIcon #ICON_MODIFIER#" aria-hidden="true">#USER_ICON#</div>',
'  </div>',
'  <div class="t-Comments-body">',
'    <div class="t-Comments-info">',
'      #USER_NAME# <span class="t-Comments-date">#COMMENT_DATE#</span> <span class="t-Comments-actions">#ACTIONS#</span>',
'    </div>',
'    <div class="t-Comments-comment">',
'      #COMMENT_TEXT##ATTRIBUTE_1##ATTRIBUTE_2##ATTRIBUTE_3##ATTRIBUTE_4#',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-Comments #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>',
''))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-Comments--chat'
,p_reference_id=>2611722012730764232
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/contextual_info
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(688001249407591991)
,p_row_template_name=>'Contextual Info'
,p_internal_name=>'CONTEXTUAL_INFO'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ContextualInfo-item">',
'  <span class="t-ContextualInfo-label">#COLUMN_HEADER#</span>',
'  <span class="t-ContextualInfo-value">#COLUMN_VALUE#</span>',
'</div>'))
,p_row_template_before_rows=>' <div class="t-ContextualInfo #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</div>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_reference_id=>2114325881116323585
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/standard
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(688002269772591993)
,p_row_template_name=>'Standard'
,p_internal_name=>'STANDARD'
,p_row_template1=>'<td class="t-Report-cell" #ALIGNMENT# #ACCESSIBLE_HEADERS#>#COLUMN_VALUE#</td>'
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Report #COMPONENT_CSS_CLASSES#" id="report_#REGION_STATIC_ID#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">',
'  <div class="t-Report-wrap">',
'    <table class="t-Report-pagination" role="presentation">#TOP_PAGINATION#</table>',
'    <div class="t-Report-tableWrap">',
'    <table class="t-Report-report" id="report_table_#REGION_STATIC_ID#" aria-label="#REGION_TITLE#">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'      </tbody>',
'    </table>',
'    </div>',
'    <div class="t-Report-links">#EXTERNAL_LINK##CSV_LINK#</div>',
'    <table class="t-Report-pagination t-Report-pagination--bottom" role="presentation">#PAGINATION#</table>',
'  </div>',
'</div>'))
,p_row_template_before_first=>'<tr>'
,p_row_template_after_last=>'</tr>'
,p_row_template_type=>'GENERIC_COLUMNS'
,p_before_column_heading=>'<thead>'
,p_column_heading_template=>'<th class="t-Report-colHead" #ARIA_SORT# #ALIGNMENT# id="#COLUMN_HEADER_NAME#" #COLUMN_WIDTH#>#COLUMN_HEADER#</th>'
,p_after_column_heading=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</thead>',
'<tbody>'))
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_preset_template_options=>'t-Report--altRowsDefault:t-Report--rowHighlight'
,p_reference_id=>2537207537838287671
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/search_results
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(688004834407591996)
,p_row_template_name=>'Search Results'
,p_internal_name=>'SEARCH_RESULTS'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition1=>':LABEL_02 is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition2=>':LABEL_03 is null'
,p_row_template3=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'    </div>',
'  </li>'))
,p_row_template_condition3=>':LABEL_04 is null'
,p_row_template4=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-SearchResults-item">',
'    <h3 class="t-SearchResults-title"><a href="#SEARCH_LINK#">#SEARCH_TITLE#</a></h3>',
'    <div class="t-SearchResults-info">',
'      <p class="t-SearchResults-desc">#SEARCH_DESC#</p>',
'      <span class="t-SearchResults-misc">#LABEL_01#: #VALUE_01#</span>',
'      <span class="t-SearchResults-misc">#LABEL_02#: #VALUE_02#</span>',
'      <span class="t-SearchResults-misc">#LABEL_03#: #VALUE_03#</span>',
'      <span class="t-SearchResults-misc">#LABEL_04#: #VALUE_04#</span>',
'    </div>',
'  </li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-SearchResults #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">',
'<ul class="t-SearchResults-list">'))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>',
'</div>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'NOT_CONDITIONAL'
,p_row_template_display_cond3=>'NOT_CONDITIONAL'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070913431524059316
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/content_row
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(688005083983591997)
,p_row_template_name=>'Content Row'
,p_internal_name=>'CONTENT_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-ContentRow-item #ITEM_CLASSES#">',
'  <div class="t-ContentRow-wrap">',
'    <div class="t-ContentRow-selection">#SELECTION#</div>',
'    <div class="t-ContentRow-iconWrap">',
'      <span class="t-ContentRow-icon #ICON_CLASS#">#ICON_HTML#</span>',
'    </div>',
'    <div class="t-ContentRow-body">',
'      <div class="t-ContentRow-content">',
'        <h3 class="t-ContentRow-title">#TITLE#</h3>',
'        <div class="t-ContentRow-description">#DESCRIPTION#</div>',
'      </div>',
'      <div class="t-ContentRow-misc">#MISC#</div>',
'      <div class="t-ContentRow-actions">#ACTIONS#</div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_before_rows=>'<ul class="t-ContentRow #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>1797843454948280151
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/timeline
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(688008286013592002)
,p_row_template_name=>'Timeline'
,p_internal_name=>'TIMELINE'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <div class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#" role="presentation">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </div>',
'</li>'))
,p_row_template_condition1=>':EVENT_LINK is null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-Timeline-item #EVENT_MODIFIERS#" #EVENT_ATTRIBUTES#>',
'  <a href="#EVENT_LINK#" class="t-Timeline-wrap">',
'    <div class="t-Timeline-user">',
'      <div class="t-Timeline-avatar #USER_COLOR#" role="presentation">',
'        #USER_AVATAR#',
'      </div>',
'      <div class="t-Timeline-userinfo">',
'        <span class="t-Timeline-username">#USER_NAME#</span>',
'        <span class="t-Timeline-date">#EVENT_DATE#</span>',
'      </div>',
'    </div>',
'    <div class="t-Timeline-content">',
'      <div class="t-Timeline-typeWrap">',
'        <div class="t-Timeline-type #EVENT_STATUS#">',
'          <span class="t-Icon #EVENT_ICON#"></span>',
'          <span class="t-Timeline-typename">#EVENT_TYPE#</span>',
'        </div>',
'      </div>',
'      <div class="t-Timeline-body">',
'        <h3 class="t-Timeline-title">#EVENT_TITLE#</h3>',
'        <p class="t-Timeline-desc">#EVENT_DESC#</p>',
'      </div>',
'    </div>',
'  </a>',
'</li>'))
,p_row_template_before_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-Timeline #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_timeline" data-region-id="#REGION_STATIC_ID#">',
''))
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_reference_id=>1513373588340069864
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/media_list
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(688008698673592002)
,p_row_template_name=>'Media List'
,p_internal_name=>'MEDIA_LIST'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'  <a href="#LINK#" class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'    <div class="t-MediaList-iconWrap" aria-hidden"true">',
'      <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#"><span class="t-Icon #ICON_CLASS#"></span></span>',
'    </div>',
'    <div class="t-MediaList-body">',
'      <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'      <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'    </div>',
'    <div class="t-MediaList-badgeWrap">',
'      <span class="t-MediaList-badge">#LIST_BADGE#</span>',
'    </div>',
'  </a>',
'</li>',
''))
,p_row_template_condition1=>':LINK is not null'
,p_row_template2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<li class="t-MediaList-item #LIST_CLASS#">',
'  <div class="t-MediaList-itemWrap #LINK_CLASS#" #LINK_ATTR#>',
'    <div class="t-MediaList-iconWrap" aria-hidden"true">',
'      <span class="t-MediaList-icon u-color #ICON_COLOR_CLASS#"><span class="t-Icon #ICON_CLASS#"></span></span>',
'    </div>',
'    <div class="t-MediaList-body">',
'      <h3 class="t-MediaList-title">#LIST_TITLE#</h3>',
'      <p class="t-MediaList-desc">#LIST_TEXT#</p>',
'    </div>',
'    <div class="t-MediaList-badgeWrap">',
'      <span class="t-MediaList-badge">#LIST_BADGE#</span>',
'    </div>',
'  </div>',
'</li>',
''))
,p_row_template_before_rows=>'<ul class="t-MediaList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="#REGION_STATIC_ID#_report" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</ul>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'NOT_CONDITIONAL'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'NOT_CONDITIONAL'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>1
,p_default_template_options=>'t-MediaList--showDesc:t-MediaList--showIcons'
,p_preset_template_options=>'t-MediaList--stack'
,p_reference_id=>2092157460408299055
,p_translate_this_template=>'N'
,p_row_template_comment=>' (SELECT link_text, link_target, detail1, detail2, last_modified)'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_column
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(688011608304592007)
,p_row_template_name=>'Value Attribute Pairs - Column'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_COLUMN'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #COLUMN_HEADER#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #COLUMN_VALUE#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'GENERIC_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>6
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068636272681754
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/report/value_attribute_pairs_row
begin
wwv_flow_imp_shared.create_row_template(
 p_id=>wwv_flow_imp.id(688013669207592009)
,p_row_template_name=>'Value Attribute Pairs - Row'
,p_internal_name=>'VALUE_ATTRIBUTE_PAIRS_ROW'
,p_row_template1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<dt class="t-AVPList-label">',
'  #1#',
'</dt>',
'<dd class="t-AVPList-value">',
'  #2#',
'</dd>'))
,p_row_template_before_rows=>'<dl class="t-AVPList #COMPONENT_CSS_CLASSES#" #REPORT_ATTRIBUTES# id="report_#REGION_STATIC_ID#" data-region-id="#REGION_STATIC_ID#">'
,p_row_template_after_rows=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</dl>',
'<table class="t-Report-pagination" role="presentation">#PAGINATION#</table>'))
,p_row_template_type=>'NAMED_COLUMNS'
,p_row_template_display_cond1=>'0'
,p_row_template_display_cond2=>'0'
,p_row_template_display_cond3=>'0'
,p_row_template_display_cond4=>'0'
,p_pagination_template=>'<span class="t-Report-paginationText">#TEXT#</span>'
,p_next_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_page_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS#',
'</a>'))
,p_next_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--next">',
'  #PAGINATION_NEXT_SET#<span class="a-Icon icon-right-arrow" aria-hidden="true"></span>',
'</a>'))
,p_previous_set_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="#LINK#" class="t-Button t-Button--small t-Button--noUI t-Report-paginationLink t-Report-paginationLink--prev">',
'  <span class="a-Icon icon-left-arrow" aria-hidden="true"></span>#PAGINATION_PREVIOUS_SET#',
'</a>'))
,p_theme_id=>42
,p_theme_class_id=>7
,p_preset_template_options=>'t-AVPList--leftAligned'
,p_reference_id=>2099068321678681753
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/hidden
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(688040895460592052)
,p_template_name=>'Hidden'
,p_internal_name=>'HIDDEN'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer t-Form-labelContainer--hiddenLabel col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label u-VisuallyHidden">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--hiddenLabel rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>13
,p_reference_id=>2039339104148359505
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(688040900664592054)
,p_template_name=>'Optional'
,p_internal_name=>'OPTIONAL'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>',
''))
,p_before_item=>'<div class="t-Form-fieldContainer rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>2317154212072806530
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_above
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(688041042081592055)
,p_template_name=>'Optional - Above'
,p_internal_name=>'OPTIONAL_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>#HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>3030114864004968404
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/optional_floating
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(688041179790592055)
,p_template_name=>'Optional - Floating'
,p_internal_name=>'OPTIONAL_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'<label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>'<div class="t-Form-inputContainer"><div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'
,p_after_element=>'#ITEM_POST_TEXT##HELP_TEMPLATE#</div>#INLINE_HELP_TEMPLATE##ERROR_TEMPLATE#</div>'
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<span class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</span>'
,p_error_template=>'<span class="t-Form-error">#ERROR_MESSAGE#</span>'
,p_theme_id=>42
,p_theme_class_id=>3
,p_reference_id=>1607675164727151865
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(688041239658592055)
,p_template_name=>'Required'
,p_internal_name=>'REQUIRED'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer col col-#LABEL_COLUMN_SPAN_NUMBER#">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer is-required rel-col #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-inputContainer col col-#ITEM_COLUMN_SPAN_NUMBER#">',
'  <div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'))
,p_after_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ITEM_POST_TEXT##HELP_TEMPLATE#',
'  </div>',
'  <div class="t-Form-itemAssistance">',
'    #ERROR_TEMPLATE#',
'    <div class="t-Form-itemRequired" aria-hidden="true">#REQUIRED#</div>',
'  </div>',
'  #INLINE_HELP_TEMPLATE#',
'</div>'))
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<div class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</div>'
,p_error_template=>'<div class="t-Form-error">#ERROR_MESSAGE#</div>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>2525313812251712801
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_above
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(688041976198592056)
,p_template_name=>'Required - Above'
,p_internal_name=>'REQUIRED_ABOVE'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label> #HELP_TEMPLATE#',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--stacked is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-inputContainer">',
'  <div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'))
,p_after_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ITEM_POST_TEXT##HELP_TEMPLATE#',
'  </div>',
'  <div class="t-Form-itemAssistance">',
'    #ERROR_TEMPLATE#',
'    <div class="t-Form-itemRequired" aria-hidden="true">#REQUIRED#</div>',
'  </div>',
'  #INLINE_HELP_TEMPLATE#',
'</div>'))
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<div class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</div>'
,p_error_template=>'<div class="t-Form-error">#ERROR_MESSAGE#</div>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>3030115129444970113
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/label/required_floating
begin
wwv_flow_imp_shared.create_field_template(
 p_id=>wwv_flow_imp.id(688042453563592057)
,p_template_name=>'Required - Floating'
,p_internal_name=>'REQUIRED_FLOATING'
,p_template_body1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-labelContainer">',
'  <label for="#CURRENT_ITEM_NAME#" id="#LABEL_ID#" class="t-Form-label">'))
,p_template_body2=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span class="u-VisuallyHidden">(#VALUE_REQUIRED#)</span></label>',
'</div>'))
,p_before_item=>'<div class="t-Form-fieldContainer t-Form-fieldContainer--floatingLabel is-required #ITEM_CSS_CLASSES#" id="#CURRENT_ITEM_CONTAINER_ID#">'
,p_after_item=>'</div>'
,p_item_pre_text=>'<span class="t-Form-itemText t-Form-itemText--pre">#CURRENT_ITEM_PRE_TEXT#</span>'
,p_item_post_text=>'<span class="t-Form-itemText t-Form-itemText--post">#CURRENT_ITEM_POST_TEXT#</span>'
,p_before_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-Form-inputContainer">',
'  <div class="t-Form-itemRequired-marker" aria-hidden="true"></div>',
'  <div class="t-Form-itemWrapper">#ITEM_PRE_TEXT#'))
,p_after_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ITEM_POST_TEXT##HELP_TEMPLATE#',
'  </div>',
'  <div class="t-Form-itemAssistance">',
'    #ERROR_TEMPLATE#',
'    <div class="t-Form-itemRequired" aria-hidden="true">#REQUIRED#</div>',
'  </div>',
'  #INLINE_HELP_TEMPLATE#',
'</div>'))
,p_help_link=>'<button class="t-Form-helpButton js-itemHelp" data-itemhelp="#CURRENT_ITEM_ID#" title="#CURRENT_ITEM_HELP_LABEL#" aria-label="#CURRENT_ITEM_HELP_LABEL#" tabindex="-1" type="button"><span class="a-Icon icon-help" aria-hidden="true"></span></button>'
,p_inline_help_text=>'<div class="t-Form-inlineHelp">#CURRENT_ITEM_INLINE_HELP_TEXT#</div>'
,p_error_template=>'<div class="t-Form-error">#ERROR_MESSAGE#</div>'
,p_theme_id=>42
,p_theme_class_id=>4
,p_reference_id=>1607675344320152883
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/breadcrumb/breadcrumb
begin
wwv_flow_imp_shared.create_menu_template(
 p_id=>wwv_flow_imp.id(688045225431592065)
,p_name=>'Breadcrumb'
,p_internal_name=>'BREADCRUMB'
,p_before_first=>'<ul class="t-Breadcrumb #COMPONENT_CSS_CLASSES#">'
,p_current_page_option=>'<li class="t-Breadcrumb-item is-active" aria-current="page"><h1 class="t-Breadcrumb-label">#NAME#</h1></li>'
,p_non_current_page_option=>'<li class="t-Breadcrumb-item"><a href="#LINK#" class="t-Breadcrumb-label">#NAME#</a></li>'
,p_after_last=>'</ul>'
,p_max_levels=>6
,p_start_with_node=>'PARENT_TO_LEAF'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916542570059325
,p_translate_this_template=>'N'
);
end;
/
prompt --application/shared_components/user_interface/templates/popuplov
begin
wwv_flow_imp_shared.create_popup_lov_template(
 p_id=>wwv_flow_imp.id(688045414372592082)
,p_page_name=>'winlov'
,p_page_title=>'Search Dialog'
,p_page_html_head=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<!DOCTYPE html>',
'<html lang="&BROWSER_LANGUAGE.">',
'<head>',
'<title>#TITLE#</title>',
'#APEX_CSS#',
'#THEME_CSS#',
'#THEME_STYLE_CSS#',
'#FAVICONS#',
'#APEX_JAVASCRIPT#',
'#THEME_JAVASCRIPT#',
'<meta name="viewport" content="width=device-width,initial-scale=1.0" />',
'</head>'))
,p_page_body_attr=>'onload="first_field()" class="t-Page t-Page--popupLOV"'
,p_before_field_text=>'<div class="t-PopupLOV-actions t-Form--large">'
,p_filter_width=>'20'
,p_filter_max_width=>'100'
,p_filter_text_attr=>'class="apex-item-text"'
,p_find_button_text=>'Search'
,p_find_button_attr=>'class="t-Button t-Button--hot t-Button--padLeft"'
,p_close_button_text=>'Close'
,p_close_button_attr=>'class="t-Button u-pullRight"'
,p_next_button_text=>'Next &gt;'
,p_next_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_prev_button_text=>'&lt; Previous'
,p_prev_button_attr=>'class="t-Button t-PopupLOV-button"'
,p_after_field_text=>'</div>'
,p_scrollbars=>'1'
,p_resizable=>'1'
,p_width=>'380'
,p_result_row_x_of_y=>'<div class="t-PopupLOV-pagination">Row(s) #FIRST_ROW# - #LAST_ROW#</div>'
,p_result_rows_per_pg=>100
,p_before_result_set=>'<div class="t-PopupLOV-links">'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>2885398517835871876
,p_translate_this_template=>'N'
,p_after_result_set=>'</div>'
);
end;
/
prompt --application/shared_components/user_interface/templates/calendar/calendar
begin
wwv_flow_imp_shared.create_calendar_template(
 p_id=>wwv_flow_imp.id(688045303849592068)
,p_cal_template_name=>'Calendar'
,p_internal_name=>'CALENDAR'
,p_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>',
''))
,p_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_day_close_format=>'</td>'
,p_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">#TITLE_FORMAT#<div class="t-ClassicCalendar-dayEvents">#DATA#</div>'
,p_weekend_close_format=>'</td>'
,p_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_nonday_close_format=>'</td>'
,p_week_open_format=>'<tr>'
,p_week_close_format=>'</tr> '
,p_daily_title_format=>'<table cellspacing="0" cellpadding="0" border="0" summary="" class="t1DayCalendarHolder"> <tr> <td class="t1MonthTitle">#IMONTH# #DD#, #YYYY#</td> </tr> <tr> <td>'
,p_daily_open_format=>'<tr>'
,p_daily_close_format=>'</tr>'
,p_weekly_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--weekly">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_weekly_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_weekly_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_weekly_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_weekly_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_day_close_format=>'</div></td>'
,p_weekly_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_weekly_weekend_close_format=>'</div></td>'
,p_weekly_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_weekly_time_close_format=>'</th>'
,p_weekly_time_title_format=>'#TIME#'
,p_weekly_hour_open_format=>'<tr>'
,p_weekly_hour_close_format=>'</tr>'
,p_daily_day_of_week_format=>'<th scope="col" id="#DY#" class="t-ClassicCalendar-dayColumn">#IDAY#</th>'
,p_daily_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--daily">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #DD#, #YYYY#</h1>'))
,p_daily_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" aria-label="#CALENDAR_TITLE# #START_DL#" class="t-ClassicCalendar-calendar">'
,p_daily_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_daily_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_day_close_format=>'</div></td>'
,p_daily_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_daily_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol" id="#TIME#">'
,p_daily_time_close_format=>'</th>'
,p_daily_time_title_format=>'#TIME#'
,p_daily_hour_open_format=>'<tr>'
,p_daily_hour_close_format=>'</tr>'
,p_cust_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#IMONTH# #YYYY#</h1>'))
,p_cust_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th id="#DY#" scope="col" class="t-ClassicCalendar-dayColumn">',
'  <span class="visible-md visible-lg">#IDAY#</span>',
'  <span class="hidden-md hidden-lg">#IDY#</span>',
'</th>'))
,p_cust_month_open_format=>'<table class="t-ClassicCalendar-calendar" cellpadding="0" cellspacing="0" border="0" aria-label="#IMONTH# #YYYY#">'
,p_cust_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_week_open_format=>'<tr>'
,p_cust_week_close_format=>'</tr> '
,p_cust_day_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_day_close_format=>'</td>'
,p_cust_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#">'
,p_cust_nonday_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_nonday_open_format=>'<td class="t-ClassicCalendar-day is-inactive" headers="#DY#">'
,p_cust_nonday_close_format=>'</td>'
,p_cust_weekend_title_format=>'<span class="t-ClassicCalendar-date">#DD#</span>'
,p_cust_weekend_open_format=>'<td class="t-ClassicCalendar-day is-weekend" headers="#DY#">'
,p_cust_weekend_close_format=>'</td>'
,p_cust_hour_open_format=>'<tr>'
,p_cust_hour_close_format=>'</tr>'
,p_cust_time_title_format=>'#TIME#'
,p_cust_time_open_format=>'<th scope="row" class="t-ClassicCalendar-day t-ClassicCalendar-timeCol">'
,p_cust_time_close_format=>'</th>'
,p_cust_wk_month_title_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar">',
'<h1 class="t-ClassicCalendar-title">#WTITLE#</h1>'))
,p_cust_wk_day_of_week_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<th scope="col" class="t-ClassicCalendar-dayColumn" id="#DY#">',
'  <span class="visible-md visible-lg">#DD# #IDAY#</span>',
'  <span class="hidden-md hidden-lg">#DD# #IDY#</span>',
'</th>'))
,p_cust_wk_month_open_format=>'<table border="0" cellpadding="0" cellspacing="0" summary="#CALENDAR_TITLE# #START_DL# - #END_DL#" class="t-ClassicCalendar-calendar">'
,p_cust_wk_month_close_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'</table>',
'</div>'))
,p_cust_wk_week_open_format=>'<tr>'
,p_cust_wk_week_close_format=>'</tr> '
,p_cust_wk_day_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_day_close_format=>'</div></td>'
,p_cust_wk_today_open_format=>'<td class="t-ClassicCalendar-day is-today" headers="#DY#"><div class="t-ClassicCalendar-dayEvents">'
,p_cust_wk_weekend_open_format=>'<td class="t-ClassicCalendar-day" headers="#DY#">'
,p_cust_wk_weekend_close_format=>'</td>'
,p_agenda_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-ClassicCalendar t-ClassicCalendar--list">',
'  <div class="t-ClassicCalendar-title">#IMONTH# #YYYY#</div>',
'  <ul class="t-ClassicCalendar-list">',
'    #DAYS#',
'  </ul>',
'</div>'))
,p_agenda_past_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-past">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_today_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-today">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_future_day_format=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  <li class="t-ClassicCalendar-listTitle is-future">',
'    <span class="t-ClassicCalendar-listDayTitle">#IDAY#</span><span class="t-ClassicCalendar-listDayDate">#IMONTH# #DD#</span>',
'  </li>'))
,p_agenda_past_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-past">#DATA#</li>'
,p_agenda_today_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-today">#DATA#</li>'
,p_agenda_future_entry_format=>'  <li class="t-ClassicCalendar-listEvent is-future">#DATA#</li>'
,p_month_data_format=>'#DAYS#'
,p_month_data_entry_format=>'<span class="t-ClassicCalendar-event">#DATA#</span>'
,p_theme_id=>42
,p_theme_class_id=>1
,p_reference_id=>4070916747979059326
);
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(688046605131592096)
,p_theme_id=>42
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_ui_type_name=>'DESKTOP'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_reference_id=>4070917134413059350
,p_is_locked=>false
,p_default_page_template=>wwv_flow_imp.id(687884731653591813)
,p_default_dialog_template=>wwv_flow_imp.id(687902126178591840)
,p_error_template=>wwv_flow_imp.id(687899521300591837)
,p_printer_friendly_template=>wwv_flow_imp.id(687884731653591813)
,p_breadcrumb_display_point=>'REGION_POSITION_01'
,p_sidebar_display_point=>'REGION_POSITION_02'
,p_login_template=>wwv_flow_imp.id(687899521300591837)
,p_default_button_template=>wwv_flow_imp.id(688043625660592062)
,p_default_region_template=>wwv_flow_imp.id(687970755600591939)
,p_default_chart_template=>wwv_flow_imp.id(687970755600591939)
,p_default_form_template=>wwv_flow_imp.id(687970755600591939)
,p_default_reportr_template=>wwv_flow_imp.id(687970755600591939)
,p_default_tabform_template=>wwv_flow_imp.id(687970755600591939)
,p_default_wizard_template=>wwv_flow_imp.id(687970755600591939)
,p_default_menur_template=>wwv_flow_imp.id(687983117087591954)
,p_default_listr_template=>wwv_flow_imp.id(687970755600591939)
,p_default_irr_template=>wwv_flow_imp.id(687966107370591934)
,p_default_report_template=>wwv_flow_imp.id(688002269772591993)
,p_default_label_template=>wwv_flow_imp.id(688041179790592055)
,p_default_menu_template=>wwv_flow_imp.id(688045225431592065)
,p_default_calendar_template=>wwv_flow_imp.id(688045303849592068)
,p_default_list_template=>wwv_flow_imp.id(688031061475592036)
,p_default_nav_list_template=>wwv_flow_imp.id(688039855456592050)
,p_default_top_nav_list_temp=>wwv_flow_imp.id(688039855456592050)
,p_default_side_nav_list_temp=>wwv_flow_imp.id(688038045094592047)
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>wwv_flow_imp.id(687913189876591861)
,p_default_dialogr_template=>wwv_flow_imp.id(687910334526591858)
,p_default_option_label=>wwv_flow_imp.id(688041179790592055)
,p_default_required_label=>wwv_flow_imp.id(688042453563592057)
,p_default_page_transition=>'NONE'
,p_default_popup_transition=>'NONE'
,p_default_navbar_list_template=>wwv_flow_imp.id(688037669725592047)
,p_file_prefix => nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/22.1/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(688045651265592088)
,p_theme_id=>42
,p_name=>'Redwood Light'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/oracle-fonts/oraclesans-apex#MIN#.css?v=#APEX_VERSION#',
'#THEME_FILES#css/Redwood#MIN#.css?v=#APEX_VERSION#'))
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Redwood-Theme.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Redwood-Theme#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2596426436825065489
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(688045883517592089)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>2719875314571594493
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(688046038928592089)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_current=>true
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3543348412015319650
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(688046242828592089)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>1938457712423918173
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(688046469534592090)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_current=>false
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita-Slate.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>3291983347983194966
);
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687875610093591797)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'PAGE'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687876651248591799)
,p_theme_id=>42
,p_name=>'PAGE_POSITION'
,p_display_name=>'Position'
,p_display_sequence=>1
,p_template_types=>'PAGE'
,p_help_text=>'Sets the position of the page.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687901056479591839)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND'
,p_display_name=>'Page Background'
,p_display_sequence=>20
,p_template_types=>'PAGE'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687901882093591840)
,p_theme_id=>42
,p_name=>'PAGE_LAYOUT'
,p_display_name=>'Page Layout'
,p_display_sequence=>10
,p_template_types=>'PAGE'
,p_null_text=>'Floating (Default)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687907420660591854)
,p_theme_id=>42
,p_name=>'ALERT_TYPE'
,p_display_name=>'Alert Type'
,p_display_sequence=>3
,p_template_types=>'REGION'
,p_help_text=>'Sets the type of alert which can be used to determine the icon, icon color, and the background color.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687907898944591855)
,p_theme_id=>42
,p_name=>'ALERT_TITLE'
,p_display_name=>'Alert Title'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the title of the alert is displayed.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687908498324591855)
,p_theme_id=>42
,p_name=>'ALERT_ICONS'
,p_display_name=>'Alert Icons'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets how icons are handled for the Alert Region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687908820425591856)
,p_theme_id=>42
,p_name=>'ALERT_DISPLAY'
,p_display_name=>'Alert Display'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the layout of the Alert Region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687916157574591865)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_help_text=>'Determines how the region is styled. Use the "Remove Borders" template option to remove the region''s borders and shadows.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687916554831591865)
,p_theme_id=>42
,p_name=>'BODY_PADDING'
,p_display_name=>'Body Padding'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body padding for the region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687922930016591873)
,p_theme_id=>42
,p_name=>'TIMER'
,p_display_name=>'Timer'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Sets the timer for when to automatically navigate to the next region within the Carousel Region.'
,p_null_text=>'No Timer'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687923714622591874)
,p_theme_id=>42
,p_name=>'BODY_HEIGHT'
,p_display_name=>'Body Height'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the Region Body height. You can also specify a custom height by modifying the Region''s CSS Classes and using the height helper classes "i-hXXX" where XXX is any increment of 10 from 100 to 800.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687924980769591876)
,p_theme_id=>42
,p_name=>'ACCENT'
,p_display_name=>'Accent'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_help_text=>'Set the Region''s accent. This accent corresponds to a Theme-Rollable color and sets the background of the Region''s Header.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687926100871591878)
,p_theme_id=>42
,p_name=>'HEADER'
,p_display_name=>'Header'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Determines the display of the Region Header which also contains the Region Title.'
,p_null_text=>'Visible - Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687926504629591878)
,p_theme_id=>42
,p_name=>'BODY_OVERFLOW'
,p_display_name=>'Body Overflow'
,p_display_sequence=>2
,p_template_types=>'REGION'
,p_help_text=>'Determines the scroll behavior when the region contents are larger than their container.'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687928531233591881)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Sets the animation when navigating within the Carousel Region.'
,p_null_text=>'Fade'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687936094520591891)
,p_theme_id=>42
,p_name=>'DEFAULT_STATE'
,p_display_name=>'Default State'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the default state of the region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687936423010591892)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_ICON_POSITION'
,p_display_name=>'Collapsible Icon Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines the position of the expand and collapse toggle for the region.'
,p_null_text=>'Start'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687937205520591893)
,p_theme_id=>42
,p_name=>'COLLAPSIBLE_BUTTON_ICONS'
,p_display_name=>'Collapsible Button Icons'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Determines which arrows to use to represent the icons for the collapse and expand button.'
,p_null_text=>'Arrows'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687941021009591897)
,p_theme_id=>42
,p_name=>'REGION_TITLE'
,p_display_name=>'Region Title'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the source of the Title Bar region''s title.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687941811016591898)
,p_theme_id=>42
,p_name=>'HEADING_FONT'
,p_display_name=>'Heading Font'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the font-family of the heading for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687942250731591904)
,p_theme_id=>42
,p_name=>'BODY_STYLE'
,p_display_name=>'Body Style'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the region''s body container.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687944426294591907)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON'
,p_display_name=>'Display Icon'
,p_display_sequence=>50
,p_template_types=>'REGION'
,p_help_text=>'Display the Hero Region icon.'
,p_null_text=>'Yes (Default)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687945218204591908)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REGION'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Rounded Corners'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687947022010591910)
,p_theme_id=>42
,p_name=>'IMAGE_FILTER'
,p_display_name=>'Filter'
,p_display_sequence=>40
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687948658056591912)
,p_theme_id=>42
,p_name=>'IMAGE_RATIO'
,p_display_name=>'Ratio'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687949869363591914)
,p_theme_id=>42
,p_name=>'IMAGE_SCALE'
,p_display_name=>'Scale'
,p_display_sequence=>20
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687950817800591915)
,p_theme_id=>42
,p_name=>'IMAGE_SHAPE'
,p_display_name=>'Shape'
,p_display_sequence=>30
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687954639321591919)
,p_theme_id=>42
,p_name=>'DIALOG_SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687960050803591926)
,p_theme_id=>42
,p_name=>'REGION_POSITION'
,p_display_name=>'Position'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687963490267591930)
,p_theme_id=>42
,p_name=>'CALLOUT_POSITION'
,p_display_name=>'Callout Position'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Determines where the callout for the popup will be positioned relative to its parent.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687970010575591938)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER'
,p_display_name=>'Login Header'
,p_display_sequence=>10
,p_template_types=>'REGION'
,p_help_text=>'Controls the display of the Login region header.'
,p_null_text=>'Icon and Title (Default)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687981424469591952)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687981856101591952)
,p_theme_id=>42
,p_name=>'TAB_STYLE'
,p_display_name=>'Tab Style'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687982610249591953)
,p_theme_id=>42
,p_name=>'TABS_SIZE'
,p_display_name=>'Tabs Size'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687989761218591964)
,p_theme_id=>42
,p_name=>'HIDE_STEPS_FOR'
,p_display_name=>'Hide Steps For'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687990961362591978)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687991311398591979)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Determines the layout of Cards in the report.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687993350914591981)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the overall style for the component.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687995172617591984)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'REPORT'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687996923809591986)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>70
,p_template_types=>'REPORT'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687997735652591987)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Controls how to handle icons in the report.'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(687999102424591989)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'REPORT'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688000357537591990)
,p_theme_id=>42
,p_name=>'COMMENTS_STYLE'
,p_display_name=>'Comments Style'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Determines the style in which comments are displayed.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688001551976591992)
,p_theme_id=>42
,p_name=>'DISPLAY_ITEMS'
,p_display_name=>'Display Items'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_null_text=>'Inline (Default)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688001912785591992)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS'
,p_display_name=>'Display Labels'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_null_text=>'Inline (Default)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688002580065591994)
,p_theme_id=>42
,p_name=>'ALTERNATING_ROWS'
,p_display_name=>'Alternating Rows'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Shades alternate rows in the report with slightly different background colors.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688003127709591994)
,p_theme_id=>42
,p_name=>'ROW_HIGHLIGHTING'
,p_display_name=>'Row Highlighting'
,p_display_sequence=>20
,p_template_types=>'REPORT'
,p_help_text=>'Determines whether you want the row to be highlighted on hover.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688003525746591995)
,p_theme_id=>42
,p_name=>'REPORT_BORDER'
,p_display_name=>'Report Border'
,p_display_sequence=>30
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of the Report''s borders.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688005308134591998)
,p_theme_id=>42
,p_name=>'COL_ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>150
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688005718041591998)
,p_theme_id=>42
,p_name=>'CONTENT_ALIGNMENT'
,p_display_name=>'Content Alignment'
,p_display_sequence=>90
,p_template_types=>'REPORT'
,p_null_text=>'Center (Default)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688006114843591999)
,p_theme_id=>42
,p_name=>'COL_CONTENT_DESCRIPTION'
,p_display_name=>'Description'
,p_display_sequence=>130
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688006542307591999)
,p_theme_id=>42
,p_name=>'COL_ICON'
,p_display_name=>'Icon'
,p_display_sequence=>110
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688006950024592000)
,p_theme_id=>42
,p_name=>'COL_MISC'
,p_display_name=>'Misc'
,p_display_sequence=>140
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688007369231592000)
,p_theme_id=>42
,p_name=>'COL_SELECTION'
,p_display_name=>'Selection'
,p_display_sequence=>100
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688007945740592001)
,p_theme_id=>42
,p_name=>'COL_CONTENT_TITLE'
,p_display_name=>'Title'
,p_display_sequence=>120
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688010375707592005)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>35
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688011919226592007)
,p_theme_id=>42
,p_name=>'LABEL_WIDTH'
,p_display_name=>'Label Width'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688015763414592016)
,p_theme_id=>42
,p_name=>'LAYOUT'
,p_display_name=>'Layout'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688016909444592017)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>10
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688018133271592018)
,p_theme_id=>42
,p_name=>'BADGE_SIZE'
,p_display_name=>'Badge Size'
,p_display_sequence=>70
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688019926786592021)
,p_theme_id=>42
,p_name=>'BODY_TEXT'
,p_display_name=>'Body Text'
,p_display_sequence=>40
,p_template_types=>'LIST'
,p_help_text=>'Determines the height of the card body.'
,p_null_text=>'Auto'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688021965593592023)
,p_theme_id=>42
,p_name=>'ANIMATION'
,p_display_name=>'Animation'
,p_display_sequence=>80
,p_template_types=>'LIST'
,p_help_text=>'Sets the hover and focus animation.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688022528271592024)
,p_theme_id=>42
,p_name=>'ICONS'
,p_display_name=>'Icons'
,p_display_sequence=>20
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688023910561592026)
,p_theme_id=>42
,p_name=>'ICON_SHAPE'
,p_display_name=>'Icon Shape'
,p_display_sequence=>60
,p_template_types=>'LIST'
,p_help_text=>'Determines the shape of the icon.'
,p_null_text=>'Circle'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688026734333592030)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>1
,p_template_types=>'LIST'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688029721473592035)
,p_theme_id=>42
,p_name=>'MOBILE'
,p_display_name=>'Mobile'
,p_display_sequence=>100
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a mobile-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688030372045592036)
,p_theme_id=>42
,p_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_sequence=>90
,p_template_types=>'LIST'
,p_help_text=>'Determines the display for a desktop-sized screen'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688032151474592038)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_null_text=>'No Icons'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688035915967592044)
,p_theme_id=>42
,p_name=>'LABEL_DISPLAY'
,p_display_name=>'Label Display'
,p_display_sequence=>50
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688038721215592049)
,p_theme_id=>42
,p_name=>'COLLAPSE_STYLE'
,p_display_name=>'Collapse Mode'
,p_display_sequence=>30
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688041441942592056)
,p_theme_id=>42
,p_name=>'REQUIRED_INDICATOR'
,p_display_name=>'Required Indicator'
,p_display_sequence=>1
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688043167053592061)
,p_theme_id=>42
,p_name=>'ICON_HOVER_ANIMATION'
,p_display_name=>'Icon Hover Animation'
,p_display_sequence=>55
,p_template_types=>'BUTTON'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688044337925592063)
,p_theme_id=>42
,p_name=>'ICON_POSITION'
,p_display_name=>'Icon Position'
,p_display_sequence=>50
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the position of the icon relative to the label.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688046883351592107)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL'
,p_display_name=>'Heading Level'
,p_display_sequence=>1
,p_template_types=>'REGION'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688048295684592109)
,p_theme_id=>42
,p_name=>'BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the bottom margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688048634867592110)
,p_theme_id=>42
,p_name=>'REGION_BOTTOM_MARGIN'
,p_display_name=>'Bottom Margin'
,p_display_sequence=>210
,p_template_types=>'REGION'
,p_help_text=>'Set the bottom margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688050218869592112)
,p_theme_id=>42
,p_name=>'LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'FIELD'
,p_help_text=>'Set the left margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688050654803592112)
,p_theme_id=>42
,p_name=>'REGION_LEFT_MARGIN'
,p_display_name=>'Left Margin'
,p_display_sequence=>220
,p_template_types=>'REGION'
,p_help_text=>'Set the left margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688052216624592114)
,p_theme_id=>42
,p_name=>'RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'FIELD'
,p_help_text=>'Set the right margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688052601206592115)
,p_theme_id=>42
,p_name=>'REGION_RIGHT_MARGIN'
,p_display_name=>'Right Margin'
,p_display_sequence=>230
,p_template_types=>'REGION'
,p_help_text=>'Set the right margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688054267089592123)
,p_theme_id=>42
,p_name=>'TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'FIELD'
,p_help_text=>'Set the top margin for this field.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688054670842592123)
,p_theme_id=>42
,p_name=>'REGION_TOP_MARGIN'
,p_display_name=>'Top Margin'
,p_display_sequence=>200
,p_template_types=>'REGION'
,p_help_text=>'Set the top margin for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688056230739592125)
,p_theme_id=>42
,p_name=>'TYPE'
,p_display_name=>'Type'
,p_display_sequence=>20
,p_template_types=>'BUTTON'
,p_null_text=>'Normal'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688056617903592126)
,p_theme_id=>42
,p_name=>'SPACING_BOTTOM'
,p_display_name=>'Spacing Bottom'
,p_display_sequence=>100
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the bottom of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688057070279592126)
,p_theme_id=>42
,p_name=>'SPACING_LEFT'
,p_display_name=>'Spacing Left'
,p_display_sequence=>70
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the left of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688057482620592127)
,p_theme_id=>42
,p_name=>'SPACING_RIGHT'
,p_display_name=>'Spacing Right'
,p_display_sequence=>80
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the right of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688057826490592127)
,p_theme_id=>42
,p_name=>'SPACING_TOP'
,p_display_name=>'Spacing Top'
,p_display_sequence=>90
,p_template_types=>'BUTTON'
,p_help_text=>'Controls the spacing to the top of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688058275256592128)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the size of the button.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688058662975592128)
,p_theme_id=>42
,p_name=>'STYLE'
,p_display_name=>'Style'
,p_display_sequence=>30
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the style of the button. Use the "Simple" option for secondary actions or sets of buttons. Use the "Remove UI Decoration" option to make the button appear as text.'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688060056465592130)
,p_theme_id=>42
,p_name=>'BUTTON_SET'
,p_display_name=>'Button Set'
,p_display_sequence=>40
,p_template_types=>'BUTTON'
,p_help_text=>'Enables you to group many buttons together into a pill. You can use this option to specify where the button is within this set. Set the option to Default if this button is not part of a button set.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688061449589592132)
,p_theme_id=>42
,p_name=>'WIDTH'
,p_display_name=>'Width'
,p_display_sequence=>60
,p_template_types=>'BUTTON'
,p_help_text=>'Sets the width of the button.'
,p_null_text=>'Auto - Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688062659637592133)
,p_theme_id=>42
,p_name=>'LABEL_POSITION'
,p_display_name=>'Label Position'
,p_display_sequence=>140
,p_template_types=>'REGION'
,p_help_text=>'Sets the position of the label relative to the form item.'
,p_null_text=>'Inline - Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688063040522592133)
,p_theme_id=>42
,p_name=>'ITEM_SIZE'
,p_display_name=>'Item Size'
,p_display_sequence=>110
,p_template_types=>'REGION'
,p_help_text=>'Sets the size of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688063456691592134)
,p_theme_id=>42
,p_name=>'LABEL_ALIGNMENT'
,p_display_name=>'Label Alignment'
,p_display_sequence=>130
,p_template_types=>'REGION'
,p_help_text=>'Set the label text alignment for items within this region.'
,p_null_text=>'Right'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688063886684592134)
,p_theme_id=>42
,p_name=>'ITEM_PADDING'
,p_display_name=>'Item Spacing'
,p_display_sequence=>100
,p_template_types=>'REGION'
,p_help_text=>'Sets the padding around items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688064616626592135)
,p_theme_id=>42
,p_name=>'ITEM_WIDTH'
,p_display_name=>'Item Width'
,p_display_sequence=>120
,p_template_types=>'REGION'
,p_help_text=>'Sets the width of the form items within this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688065248110592136)
,p_theme_id=>42
,p_name=>'SIZE'
,p_display_name=>'Size'
,p_display_sequence=>10
,p_template_types=>'FIELD'
,p_null_text=>'Default'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688065680329592136)
,p_theme_id=>42
,p_name=>'ITEM_POST_TEXT'
,p_display_name=>'Item Post Text'
,p_display_sequence=>30
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Post Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688066099801592138)
,p_theme_id=>42
,p_name=>'ITEM_PRE_TEXT'
,p_display_name=>'Item Pre Text'
,p_display_sequence=>20
,p_template_types=>'FIELD'
,p_help_text=>'Adjust the display of the Item Pre Text'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688066493889592138)
,p_theme_id=>42
,p_name=>'RADIO_GROUP_DISPLAY'
,p_display_name=>'Item Group Display'
,p_display_sequence=>300
,p_template_types=>'FIELD'
,p_help_text=>'Determines the display style for radio and check box items.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688067282358592140)
,p_theme_id=>42
,p_name=>'CONTENT_PADDING'
,p_display_name=>'Content Padding'
,p_display_sequence=>1
,p_template_types=>'PAGE'
,p_help_text=>'Sets the Content Body padding for the page.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
wwv_flow_imp_shared.create_template_opt_group(
 p_id=>wwv_flow_imp.id(688067683653592140)
,p_theme_id=>42
,p_name=>'PAGINATION_DISPLAY'
,p_display_name=>'Pagination Display'
,p_display_sequence=>10
,p_template_types=>'REPORT'
,p_help_text=>'Controls the display of pagination for this region.'
,p_null_text=>'Default'
,p_is_advanced=>'Y'
);
end;
/
prompt --application/shared_components/user_interface/template_options
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687875846779591798)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_EXTRA_LARGE'
,p_display_name=>'Extra Large'
,p_display_sequence=>40
,p_page_template_id=>wwv_flow_imp.id(687874409053591774)
,p_css_classes=>'js-dialog-class-t-Drawer--xl'
,p_group_id=>wwv_flow_imp.id(687875610093591797)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687876039196591798)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_page_template_id=>wwv_flow_imp.id(687874409053591774)
,p_css_classes=>'js-dialog-class-t-Drawer--lg'
,p_group_id=>wwv_flow_imp.id(687875610093591797)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687876251135591799)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(687874409053591774)
,p_css_classes=>'js-dialog-class-t-Drawer--md'
,p_group_id=>wwv_flow_imp.id(687875610093591797)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687876496071591799)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_imp.id(687874409053591774)
,p_css_classes=>'js-dialog-class-t-Drawer--sm'
,p_group_id=>wwv_flow_imp.id(687875610093591797)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687876818601591800)
,p_theme_id=>42
,p_name=>'POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(687874409053591774)
,p_css_classes=>'js-dialog-class-t-Drawer--pullOutEnd'
,p_group_id=>wwv_flow_imp.id(687876651248591799)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687877039527591800)
,p_theme_id=>42
,p_name=>'POSITION_START'
,p_display_name=>'Start'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_imp.id(687874409053591774)
,p_css_classes=>'js-dialog-class-t-Drawer--pullOutStart'
,p_group_id=>wwv_flow_imp.id(687876651248591799)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687877243058591800)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(687874409053591774)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687880963144591808)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(687877383996591801)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687884655222591813)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(687881049462591809)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687888048316591817)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(687884731653591813)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687892023049591822)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(687888105356591817)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687896024827591826)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(687892152347591822)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687899445087591837)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(687896191391591826)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687901220410591839)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_1'
,p_display_name=>'Background 1'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_imp.id(687899521300591837)
,p_css_classes=>'t-LoginPage--bg1'
,p_group_id=>wwv_flow_imp.id(687901056479591839)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687901400121591839)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_2'
,p_display_name=>'Background 2'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(687899521300591837)
,p_css_classes=>'t-LoginPage--bg2'
,p_group_id=>wwv_flow_imp.id(687901056479591839)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687901684009591840)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_3'
,p_display_name=>'Background 3'
,p_display_sequence=>30
,p_page_template_id=>wwv_flow_imp.id(687899521300591837)
,p_css_classes=>'t-LoginPage--bg3'
,p_group_id=>wwv_flow_imp.id(687901056479591839)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687902046822591840)
,p_theme_id=>42
,p_name=>'PAGE_LAYOUT_SPLIT'
,p_display_name=>'Split'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_imp.id(687899521300591837)
,p_css_classes=>'t-LoginPage--split'
,p_group_id=>wwv_flow_imp.id(687901882093591840)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687903385653591842)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(687902126178591840)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687903558928591842)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_imp.id(687902126178591840)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687904897450591844)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(687903671179591843)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687905091895591844)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_imp.id(687903671179591843)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687907241174591854)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687905156087591845)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687907628474591854)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687905156087591845)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_imp.id(687907420660591854)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687908035440591855)
,p_theme_id=>42
,p_name=>'HIDDENHEADER'
,p_display_name=>'Hidden but Accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687905156087591845)
,p_css_classes=>'t-Alert--accessibleHeading'
,p_group_id=>wwv_flow_imp.id(687907898944591855)
,p_template_types=>'REGION'
,p_help_text=>'Visually hides the alert title, but assistive technologies can still read it.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687908245654591855)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687905156087591845)
,p_css_classes=>'t-Alert--removeHeading js-removeLandmark'
,p_group_id=>wwv_flow_imp.id(687907898944591855)
,p_template_types=>'REGION'
,p_help_text=>'Hides the Alert Title from being displayed.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687908635989591856)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687905156087591845)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_imp.id(687908498324591855)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687909004725591856)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687905156087591845)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(687908820425591856)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687909215722591857)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687905156087591845)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_imp.id(687907420660591854)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687909450565591857)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687905156087591845)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_imp.id(687908498324591855)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687909697426591857)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(687905156087591845)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_imp.id(687907420660591854)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687909826320591857)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687905156087591845)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_imp.id(687908498324591855)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687910083853591858)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687905156087591845)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_imp.id(687907420660591854)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687910214249591858)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687905156087591845)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(687908820425591856)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687916320444591865)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687913189876591861)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687916743500591865)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_imp.id(687913189876591861)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(687916554831591865)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687916925940591866)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_imp.id(687913189876591861)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687917197241591866)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_imp.id(687913189876591861)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(687916554831591865)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687917342839591866)
,p_theme_id=>42
,p_name=>'STICK_TO_BOTTOM'
,p_display_name=>'Stick to Bottom for Mobile'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687913189876591861)
,p_css_classes=>'t-ButtonRegion--stickToBottom'
,p_template_types=>'REGION'
,p_help_text=>'This will position the button container region to the bottom of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687918669074591868)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687917412769591866)
,p_css_classes=>'u-colors'
,p_template_types=>'REGION'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687918811576591868)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687917412769591866)
,p_css_classes=>'t-CardsRegion--styleA'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687919096728591868)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687917412769591866)
,p_css_classes=>'t-CardsRegion--styleB'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687919285175591869)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Style C'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687917412769591866)
,p_css_classes=>'t-CardsRegion--styleC'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687923172432591873)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_imp.id(687922930016591873)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687923364391591874)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_imp.id(687922930016591873)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687923597576591874)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_imp.id(687922930016591873)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687923979241591875)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_imp.id(687923714622591874)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687924167032591875)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_imp.id(687923714622591874)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687924386055591875)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_imp.id(687923714622591874)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687924504596591876)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_imp.id(687922930016591873)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687924796080591876)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_imp.id(687923714622591874)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687925116001591876)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687925359580591877)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687925582901591877)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687925713576591877)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687925915144591878)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687926315753591878)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_imp.id(687926100871591878)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687926716551591879)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_imp.id(687926504629591878)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687926996686591879)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(687926100871591878)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687927188491591879)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687927321011591880)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687927589794591880)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687927766161591880)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_imp.id(687926504629591878)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687927971948591880)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687928123854591881)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687928333914591881)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687928763870591882)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_imp.id(687928531233591881)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687928992452591882)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_imp.id(687928531233591881)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687929189346591882)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687919363460591869)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687932288825591886)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_imp.id(687923714622591874)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687932422572591886)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_imp.id(687923714622591874)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687932612300591887)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_imp.id(687923714622591874)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687932800731591887)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_imp.id(687923714622591874)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687933014792591887)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687933283263591888)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687933440750591888)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687933612320591888)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687933864302591889)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687934026679591889)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687934213903591889)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687934466016591889)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687934625177591890)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687934881067591890)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687935065123591890)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
end;
/
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687935292703591890)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687935496707591891)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687935641882591891)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687935822827591891)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687936228922591892)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(687936094520591891)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687936647967591892)
,p_theme_id=>42
,p_name=>'CONRTOLS_POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--controlsPosEnd'
,p_group_id=>wwv_flow_imp.id(687936423010591892)
,p_template_types=>'REGION'
,p_help_text=>'Position the expand / collapse button to the end of the region header.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687936889079591892)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(687936094520591891)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687937026744591893)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_imp.id(687926504629591878)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687937488318591893)
,p_theme_id=>42
,p_name=>'ICONS_PLUS_OR_MINUS'
,p_display_name=>'Plus or Minus'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--hideShowIconsMath'
,p_group_id=>wwv_flow_imp.id(687937205520591893)
,p_template_types=>'REGION'
,p_help_text=>'Use the plus and minus icons for the expand and collapse button.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687937675628591893)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687937853507591894)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687938034242591894)
,p_theme_id=>42
,p_name=>'REMEMBER_COLLAPSIBLE_STATE'
,p_display_name=>'Remember Collapsible State'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
,p_help_text=>'This option saves the current state of the collapsible region for the duration of the session.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687938290364591894)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687938440694591894)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_imp.id(687926504629591878)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687938662577591895)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687929279730591883)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687940887340591897)
,p_theme_id=>42
,p_name=>'ADD_BODY_PADDING'
,p_display_name=>'Add Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687938702962591895)
,p_css_classes=>'t-ContentBlock--padded'
,p_template_types=>'REGION'
,p_help_text=>'Adds padding to the region''s body container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687941245681591897)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H1'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687938702962591895)
,p_css_classes=>'t-ContentBlock--h1'
,p_group_id=>wwv_flow_imp.id(687941021009591897)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687941472245591898)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H2'
,p_display_name=>'Medium'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687938702962591895)
,p_css_classes=>'t-ContentBlock--h2'
,p_group_id=>wwv_flow_imp.id(687941021009591897)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687941671676591898)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H3'
,p_display_name=>'Small'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687938702962591895)
,p_css_classes=>'t-ContentBlock--h3'
,p_group_id=>wwv_flow_imp.id(687941021009591897)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687942037569591899)
,p_theme_id=>42
,p_name=>'HEADING_FONT_ALTERNATIVE'
,p_display_name=>'Alternative'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687938702962591895)
,p_css_classes=>'t-ContentBlock--headingFontAlt'
,p_group_id=>wwv_flow_imp.id(687941811016591898)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687942422563591904)
,p_theme_id=>42
,p_name=>'LIGHT_BACKGROUND'
,p_display_name=>'Light Background'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687938702962591895)
,p_css_classes=>'t-ContentBlock--lightBG'
,p_group_id=>wwv_flow_imp.id(687942250731591904)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly lighter background.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687942627376591904)
,p_theme_id=>42
,p_name=>'SHADOW_BACKGROUND'
,p_display_name=>'Shadow Background'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687938702962591895)
,p_css_classes=>'t-ContentBlock--shadowBG'
,p_group_id=>wwv_flow_imp.id(687942250731591904)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly darker background.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687942847619591905)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687938702962591895)
,p_css_classes=>'t-ContentBlock--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687944691770591907)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON_NO'
,p_display_name=>'No'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687942932784591905)
,p_css_classes=>'t-HeroRegion--hideIcon'
,p_group_id=>wwv_flow_imp.id(687944426294591907)
,p_template_types=>'REGION'
,p_help_text=>'Hide the Hero Region icon.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687944860288591907)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687942932784591905)
,p_css_classes=>'t-HeroRegion--featured'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687945032516591908)
,p_theme_id=>42
,p_name=>'HEADING_FONT_ALTERNATIVE'
,p_display_name=>'Alternative'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687942932784591905)
,p_css_classes=>'t-HeroRegion--headingFontAlt'
,p_group_id=>wwv_flow_imp.id(687941811016591898)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687945476544591908)
,p_theme_id=>42
,p_name=>'ICONS_CIRCULAR'
,p_display_name=>'Circle'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687942932784591905)
,p_css_classes=>'t-HeroRegion--iconsCircle'
,p_group_id=>wwv_flow_imp.id(687945218204591908)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a circle.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687945694456591908)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687942932784591905)
,p_css_classes=>'t-HeroRegion--iconsSquare'
,p_group_id=>wwv_flow_imp.id(687945218204591908)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a square.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687945816123591909)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687942932784591905)
,p_css_classes=>'t-HeroRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the hero region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687946056693591909)
,p_theme_id=>42
,p_name=>'STACKED_FEATURED'
,p_display_name=>'Stacked Featured'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687942932784591905)
,p_css_classes=>'t-HeroRegion--featured t-HeroRegion--centered'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687947238156591910)
,p_theme_id=>42
,p_name=>'FILTER_BLUR'
,p_display_name=>'Blur'
,p_display_sequence=>430
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--blur'
,p_group_id=>wwv_flow_imp.id(687947022010591910)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687947408032591911)
,p_theme_id=>42
,p_name=>'FILTER_GRAYSCALE'
,p_display_name=>'Grayscale'
,p_display_sequence=>410
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--grayscale'
,p_group_id=>wwv_flow_imp.id(687947022010591910)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687947675383591911)
,p_theme_id=>42
,p_name=>'FILTER_INVERT'
,p_display_name=>'Invert'
,p_display_sequence=>440
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--invert'
,p_group_id=>wwv_flow_imp.id(687947022010591910)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687947846210591911)
,p_theme_id=>42
,p_name=>'FILTER_NONE'
,p_display_name=>'None'
,p_display_sequence=>400
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--noFilter'
,p_group_id=>wwv_flow_imp.id(687947022010591910)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687948014948591911)
,p_theme_id=>42
,p_name=>'FILTER_SATURATE'
,p_display_name=>'Saturate'
,p_display_sequence=>450
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--saturate'
,p_group_id=>wwv_flow_imp.id(687947022010591910)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687948291279591912)
,p_theme_id=>42
,p_name=>'FILTER_SEPIA'
,p_display_name=>'Sepia'
,p_display_sequence=>420
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--sepia'
,p_group_id=>wwv_flow_imp.id(687947022010591910)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687948426389591912)
,p_theme_id=>42
,p_name=>'IMAGE_STRETCH'
,p_display_name=>'Image Stretch'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--stretch'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687948807300591912)
,p_theme_id=>42
,p_name=>'RATIO_16_9'
,p_display_name=>'16:9 (Widescreen)'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--16x9'
,p_group_id=>wwv_flow_imp.id(687948658056591912)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687949052049591913)
,p_theme_id=>42
,p_name=>'RATIO_1_1'
,p_display_name=>'1:1 (Square)'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--1x1'
,p_group_id=>wwv_flow_imp.id(687948658056591912)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687949275235591913)
,p_theme_id=>42
,p_name=>'RATIO_2_1'
,p_display_name=>'2:1 (Univisium)'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--2x1'
,p_group_id=>wwv_flow_imp.id(687948658056591912)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687949470057591913)
,p_theme_id=>42
,p_name=>'RATIO_4_3'
,p_display_name=>'4:3 (Standard)'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--4x3'
,p_group_id=>wwv_flow_imp.id(687948658056591912)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687949671149591913)
,p_theme_id=>42
,p_name=>'RATIO_AUTO'
,p_display_name=>'Auto'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--auto'
,p_group_id=>wwv_flow_imp.id(687948658056591912)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687950032285591914)
,p_theme_id=>42
,p_name=>'SCALE_CONTAIN'
,p_display_name=>'Contain'
,p_display_sequence=>200
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--contain'
,p_group_id=>wwv_flow_imp.id(687949869363591914)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687950236455591914)
,p_theme_id=>42
,p_name=>'SCALE_COVER'
,p_display_name=>'Cover'
,p_display_sequence=>210
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--cover'
,p_group_id=>wwv_flow_imp.id(687949869363591914)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687950439074591914)
,p_theme_id=>42
,p_name=>'SCALE_DOWN'
,p_display_name=>'Scale Down'
,p_display_sequence=>230
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--scale-down'
,p_group_id=>wwv_flow_imp.id(687949869363591914)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687950658486591915)
,p_theme_id=>42
,p_name=>'SCALE_FILL'
,p_display_name=>'Fill'
,p_display_sequence=>220
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--fill'
,p_group_id=>wwv_flow_imp.id(687949869363591914)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687951063880591915)
,p_theme_id=>42
,p_name=>'SHAPE_CIRCLE'
,p_display_name=>'Circle'
,p_display_sequence=>320
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--circle'
,p_group_id=>wwv_flow_imp.id(687950817800591915)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687951299338591915)
,p_theme_id=>42
,p_name=>'SHAPE_ROUNDED'
,p_display_name=>'Rounded'
,p_display_sequence=>310
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--rounded'
,p_group_id=>wwv_flow_imp.id(687950817800591915)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687951494276591916)
,p_theme_id=>42
,p_name=>'SHAPE_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>300
,p_region_template_id=>wwv_flow_imp.id(687946126223591909)
,p_css_classes=>'t-ImageRegion--square'
,p_group_id=>wwv_flow_imp.id(687950817800591915)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687954228000591919)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687951501074591916)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687954458147591919)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687951501074591916)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687954888200591919)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687951501074591916)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_imp.id(687954639321591919)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687955019175591920)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687951501074591916)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_imp.id(687954639321591919)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687955262574591920)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687951501074591916)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687955401238591920)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_imp.id(687951501074591916)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_imp.id(687954639321591919)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687955686954591920)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_imp.id(687951501074591916)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687955830136591921)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687951501074591916)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687956035835591921)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687951501074591916)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_imp.id(687954639321591919)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687958845443591925)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_EXTRA_LARGE'
,p_display_name=>'Extra Large'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(687956127198591921)
,p_css_classes=>'js-dialog-class-t-Drawer--xl'
,p_group_id=>wwv_flow_imp.id(687954639321591919)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687959047056591925)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687956127198591921)
,p_css_classes=>'js-dialog-class-t-Drawer--lg'
,p_group_id=>wwv_flow_imp.id(687954639321591919)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687959232315591925)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687956127198591921)
,p_css_classes=>'js-dialog-class-t-Drawer--md'
,p_group_id=>wwv_flow_imp.id(687954639321591919)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687959417298591926)
,p_theme_id=>42
,p_name=>'DRAWER_SIZE_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687956127198591921)
,p_css_classes=>'js-dialog-class-t-Drawer--sm'
,p_group_id=>wwv_flow_imp.id(687954639321591919)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687959614254591926)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687956127198591921)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687959880993591926)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None (Auto)'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_imp.id(687956127198591921)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_imp.id(687954639321591919)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687960255603591927)
,p_theme_id=>42
,p_name=>'POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687956127198591921)
,p_css_classes=>'js-dialog-class-t-Drawer--pullOutEnd'
,p_group_id=>wwv_flow_imp.id(687960050803591926)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687960412476591927)
,p_theme_id=>42
,p_name=>'POSITION_START'
,p_display_name=>'Start'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687956127198591921)
,p_css_classes=>'js-dialog-class-t-Drawer--pullOutStart'
,p_group_id=>wwv_flow_imp.id(687960050803591926)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687960638375591927)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_imp.id(687956127198591921)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687963609175591931)
,p_theme_id=>42
,p_name=>'ABOVE'
,p_display_name=>'Above'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687960717156591927)
,p_css_classes=>'js-popup-pos-above'
,p_group_id=>wwv_flow_imp.id(687963490267591930)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout above or typically on top of the parent.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687963891796591931)
,p_theme_id=>42
,p_name=>'AFTER'
,p_display_name=>'After'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687960717156591927)
,p_css_classes=>'js-popup-pos-after'
,p_group_id=>wwv_flow_imp.id(687963490267591930)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout after or typically to the right of the parent.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687964089922591931)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687960717156591927)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687964271000591932)
,p_theme_id=>42
,p_name=>'BEFORE'
,p_display_name=>'Before'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687960717156591927)
,p_css_classes=>'js-popup-pos-before'
,p_group_id=>wwv_flow_imp.id(687963490267591930)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout before or typically to the left of the parent.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687964459378591932)
,p_theme_id=>42
,p_name=>'BELOW'
,p_display_name=>'Below'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(687960717156591927)
,p_css_classes=>'js-popup-pos-below'
,p_group_id=>wwv_flow_imp.id(687963490267591930)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout below or typically to the bottom of the parent.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687964649325591932)
,p_theme_id=>42
,p_name=>'DISPLAY_POPUP_CALLOUT'
,p_display_name=>'Display Popup Callout'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(687960717156591927)
,p_css_classes=>'js-popup-callout'
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add display a callout for the popup. Note that callout will only be displayed if the data-parent-element custom attribute is defined.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687964870151591932)
,p_theme_id=>42
,p_name=>'INSIDE'
,p_display_name=>'Inside'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(687960717156591927)
,p_css_classes=>'js-popup-pos-inside'
,p_group_id=>wwv_flow_imp.id(687963490267591930)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout inside of the parent. This is useful when the parent is sufficiently large, such as a report or large region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687965065557591933)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687960717156591927)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_imp.id(687954639321591919)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687965282590591933)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687960717156591927)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_imp.id(687954639321591919)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687965414511591933)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687960717156591927)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_imp.id(687954639321591919)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687965686932591933)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687960717156591927)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687965846981591934)
,p_theme_id=>42
,p_name=>'REMOVE_PAGE_OVERLAY'
,p_display_name=>'Remove Page Overlay'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687960717156591927)
,p_css_classes=>'js-popup-noOverlay'
,p_template_types=>'REGION'
,p_help_text=>'This option will display the inline dialog without an overlay on the background.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687966020877591934)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687960717156591927)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_imp.id(687954639321591919)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687967920038591936)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687966107370591934)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687968136202591936)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687966107370591934)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687970279079591938)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER_ICON'
,p_display_name=>'Icon'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687968214451591936)
,p_css_classes=>'t-Login-region--headerIcon'
,p_group_id=>wwv_flow_imp.id(687970010575591938)
,p_template_types=>'REGION'
,p_help_text=>'Displays only the Region Icon in the Login region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687970494433591939)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER_TITLE'
,p_display_name=>'Title'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687968214451591936)
,p_css_classes=>'t-Login-region--headerTitle js-removeLandmark'
,p_group_id=>wwv_flow_imp.id(687970010575591938)
,p_template_types=>'REGION'
,p_help_text=>'Displays only the Region Title in the Login region.'
);
end;
/
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687970655678591939)
,p_theme_id=>42
,p_name=>'LOGO_HEADER_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687968214451591936)
,p_css_classes=>'t-Login-region--headerHidden js-removeLandmark'
,p_group_id=>wwv_flow_imp.id(687970010575591938)
,p_template_types=>'REGION'
,p_help_text=>'Hides both the Region Icon and Title from the Login region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687974626807591944)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_imp.id(687923714622591874)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687974891024591944)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_imp.id(687923714622591874)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687975096963591944)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_imp.id(687923714622591874)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687975218746591944)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_imp.id(687923714622591874)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687975451907591945)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687975648320591945)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687975821198591945)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687976042436591945)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687976218716591946)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687976443790591946)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687976695375591946)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687976830961591946)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687977010584591947)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687977259653591947)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687977442633591947)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687977661866591947)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687977834063591948)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687978039015591948)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687978267607591948)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_imp.id(687924980769591876)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687978471568591948)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--removeHeader js-removeLandmark'
,p_group_id=>wwv_flow_imp.id(687926100871591878)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687978687068591949)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_imp.id(687926504629591878)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687978846495591949)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(687926100871591878)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687979007953591949)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687979267757591949)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687979498031591950)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687979685700591950)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_imp.id(687926504629591878)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687979896650591950)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687980025209591950)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687980227946591950)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687980449902591951)
,p_theme_id=>42
,p_name=>'TEXT_CONTENT'
,p_display_name=>'Text Content'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(687970755600591939)
,p_css_classes=>'t-Region--textContent'
,p_group_id=>wwv_flow_imp.id(687916157574591865)
,p_template_types=>'REGION'
,p_help_text=>'Useful for displaying primarily text-based content, such as FAQs and more.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687981659132591952)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687980512404591951)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_imp.id(687981424469591952)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687982067100591953)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687980512404591951)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_imp.id(687981856101591952)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687982263679591953)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687980512404591951)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687982430745591953)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687980512404591951)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_imp.id(687981856101591952)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687982879070591954)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687980512404591951)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_imp.id(687982610249591953)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687983088692591954)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687980512404591951)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_imp.id(687982610249591953)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687987089062591959)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687983117087591954)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_imp.id(687941021009591897)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687987230423591960)
,p_theme_id=>42
,p_name=>'HEADING_FONT_ALTERNATIVE'
,p_display_name=>'Alternative'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687983117087591954)
,p_css_classes=>'t-BreadcrumbRegion--headingFontAlt'
,p_group_id=>wwv_flow_imp.id(687941811016591898)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687987462249591960)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687983117087591954)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687987699893591960)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(687983117087591954)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_imp.id(687941021009591897)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687987842021591961)
,p_theme_id=>42
,p_name=>'USE_COMPACT_STYLE'
,p_display_name=>'Use Compact Style'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687983117087591954)
,p_css_classes=>'t-BreadcrumbRegion--compactTitle'
,p_template_types=>'REGION'
,p_help_text=>'Uses a compact style for the breadcrumbs.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687989912115591965)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(687987915785591961)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_imp.id(687989761218591964)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687990108694591965)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687987915785591961)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_imp.id(687989761218591964)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687990345920591965)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(687987915785591961)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687991156624591978)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(687990961362591978)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687991571338591979)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687991740252591979)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(687990961362591978)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687991910049591979)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687992138768591979)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(687990961362591978)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687992336237591980)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687992507770591980)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687992783392591980)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(687990961362591978)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687992954427591981)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(687990961362591978)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687993165973591981)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687993520025591981)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_imp.id(687993350914591981)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687993760681591981)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687993970918591982)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687994180868591982)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687994341755591982)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_imp.id(687993350914591981)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687994528318591982)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(687990640577591977)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687994909052591983)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687995342223591984)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_imp.id(687995172617591984)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687995596960591984)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687995774542591984)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_imp.id(687995172617591984)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687995997532591985)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687996190711591985)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_imp.id(687995172617591984)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687996374654591985)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687996544447591985)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_imp.id(687993350914591981)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687996715237591986)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_imp.id(687993350914591981)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687997115862591986)
,p_theme_id=>42
,p_name=>'CARDS_COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_imp.id(687996923809591986)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687997382648591986)
,p_theme_id=>42
,p_name=>'CARD_RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_imp.id(687996923809591986)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687997543135591987)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_imp.id(687993350914591981)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687997961712591987)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_imp.id(687997735652591987)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687998139854591987)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_imp.id(687997735652591987)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687998370791591988)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687998552818591988)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_imp.id(687993350914591981)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687998785778591988)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687998915340591988)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_imp.id(687995172617591984)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687999388313591989)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_imp.id(687999102424591989)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687999503462591989)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_imp.id(687999102424591989)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687999743066591989)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(687999953429591990)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(687994618453591983)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688000581814591990)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(688000039762591990)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_imp.id(688000357537591990)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688000785562591991)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(688000039762591990)
,p_css_classes=>'t-Comments--iconsRounded'
,p_group_id=>wwv_flow_imp.id(687999102424591989)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
end;
/
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688000939725591991)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688000039762591990)
,p_css_classes=>'t-Comments--iconsSquare'
,p_group_id=>wwv_flow_imp.id(687999102424591989)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688001104739591991)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688000039762591990)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_imp.id(688000357537591990)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688001734348591992)
,p_theme_id=>42
,p_name=>'DISPLAY_ITEMS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(688001249407591991)
,p_css_classes=>'t-ContextualInfo-item--stacked'
,p_group_id=>wwv_flow_imp.id(688001551976591992)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688002125251591993)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(688001249407591991)
,p_css_classes=>'t-ContextualInfo-label--stacked'
,p_group_id=>wwv_flow_imp.id(688001912785591992)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688002759360591994)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688002269772591993)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(688002580065591994)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688002960784591994)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(688002269772591993)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_imp.id(688002580065591994)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688003380559591994)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(688002269772591993)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(688003127709591994)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688003726400591995)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688002269772591993)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(688003525746591995)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688003946701591995)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(688002269772591993)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(688003525746591995)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688004147382591996)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(688002269772591993)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_imp.id(688003525746591995)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688004323488591996)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688002269772591993)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_imp.id(688003127709591994)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688004521136591996)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(688002269772591993)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688004784079591996)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688002269772591993)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(688003525746591995)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688005584433591998)
,p_theme_id=>42
,p_name=>'ACTIONS_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(688005083983591997)
,p_css_classes=>'t-ContentRow--hideActions'
,p_group_id=>wwv_flow_imp.id(688005308134591998)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Actions column from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688005978560591998)
,p_theme_id=>42
,p_name=>'ALIGNMENT_TOP'
,p_display_name=>'Top'
,p_display_sequence=>100
,p_report_template_id=>wwv_flow_imp.id(688005083983591997)
,p_css_classes=>'t-ContentRow--alignTop'
,p_group_id=>wwv_flow_imp.id(688005718041591998)
,p_template_types=>'REPORT'
,p_help_text=>'Aligns the content to the top of the row. This is useful when you expect that yours rows will vary in height (e.g. some rows will have longer descriptions than others).'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688006335894591999)
,p_theme_id=>42
,p_name=>'DESCRIPTION_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(688005083983591997)
,p_css_classes=>'t-ContentRow--hideDescription'
,p_group_id=>wwv_flow_imp.id(688006114843591999)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Description from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688006762829591999)
,p_theme_id=>42
,p_name=>'ICON_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688005083983591997)
,p_css_classes=>'t-ContentRow--hideIcon'
,p_group_id=>wwv_flow_imp.id(688006542307591999)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Icon from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688007131631592000)
,p_theme_id=>42
,p_name=>'MISC_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(688005083983591997)
,p_css_classes=>'t-ContentRow--hideMisc'
,p_group_id=>wwv_flow_imp.id(688006950024592000)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Misc column from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688007560835592001)
,p_theme_id=>42
,p_name=>'SELECTION_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(688005083983591997)
,p_css_classes=>'t-ContentRow--hideSelection'
,p_group_id=>wwv_flow_imp.id(688007369231592000)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Selection column from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688007781487592001)
,p_theme_id=>42
,p_name=>'STYLE_COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(688005083983591997)
,p_css_classes=>'t-ContentRow--styleCompact'
,p_group_id=>wwv_flow_imp.id(687993350914591981)
,p_template_types=>'REPORT'
,p_help_text=>'This option reduces the padding and font sizes to present a compact display of the same information.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688008151656592001)
,p_theme_id=>42
,p_name=>'TITLE_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(688005083983591997)
,p_css_classes=>'t-ContentRow--hideTitle'
,p_group_id=>wwv_flow_imp.id(688007945740592001)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Title from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688008532269592002)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(688008286013592002)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_imp.id(687993350914591981)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact version of timeline with smaller text and fewer columns.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688008935400592003)
,p_theme_id=>42
,p_name=>'2_COLUMN_GRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(688008698673592002)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688009119369592003)
,p_theme_id=>42
,p_name=>'3_COLUMN_GRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688008698673592002)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688009375855592004)
,p_theme_id=>42
,p_name=>'4_COLUMN_GRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(688008698673592002)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688009505836592004)
,p_theme_id=>42
,p_name=>'5_COLUMN_GRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(688008698673592002)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688009763272592004)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(688008698673592002)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688009993440592005)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(688008698673592002)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_imp.id(687999102424591989)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688010130802592005)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688008698673592002)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_imp.id(687999102424591989)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688010551518592006)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688008698673592002)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_imp.id(688010375707592005)
,p_template_types=>'REPORT'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688010784542592006)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(688008698673592002)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688010991493592006)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688008698673592002)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688011131716592006)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(688008698673592002)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688011367829592007)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(688008698673592002)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688011531532592007)
,p_theme_id=>42
,p_name=>'STACK'
,p_display_name=>'Stack'
,p_display_sequence=>5
,p_report_template_id=>wwv_flow_imp.id(688008698673592002)
,p_css_classes=>'t-MediaList--stack'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688012137035592008)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(688011608304592007)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_imp.id(688011919226592007)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688012386861592008)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688011608304592007)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_imp.id(688011919226592007)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688012535425592008)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(688011608304592007)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_imp.id(688011919226592007)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688012716803592008)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(688011608304592007)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688012912605592009)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688011608304592007)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688013170494592009)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(688011608304592007)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_imp.id(688011919226592007)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688013392488592009)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(688011608304592007)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_imp.id(688011919226592007)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688013562473592009)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(688011608304592007)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_imp.id(688011919226592007)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688013951179592010)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(688013669207592009)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_imp.id(688011919226592007)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688014101145592010)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688013669207592009)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_imp.id(688011919226592007)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688014318615592010)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(688013669207592009)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_imp.id(688011919226592007)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688014539977592011)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(688013669207592009)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688014781146592011)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(688013669207592009)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_imp.id(687991311398591979)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688014989091592011)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(688013669207592009)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_imp.id(688011919226592007)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688015164443592011)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(688013669207592009)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_imp.id(688011919226592007)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688015376729592012)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(688013669207592009)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_imp.id(688011919226592007)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688015946334592016)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688016137592592016)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688016310428592016)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688016599258592017)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688016751373592017)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688017182454592017)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_imp.id(688016909444592017)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688017349962592018)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688017579064592018)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688017744168592018)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688017930172592018)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_imp.id(688016909444592017)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688018396566592019)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(688018133271592018)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688018572910592019)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(688018133271592018)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688018735933592019)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(688018133271592018)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688018970415592019)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688019194732592020)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(688018133271592018)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688019320934592020)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(688015497177592012)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(688018133271592018)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688019778221592020)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688020189694592021)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_imp.id(688019926786592021)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688020347788592021)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688020561791592021)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_imp.id(688019926786592021)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688020769986592022)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688020990337592022)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_imp.id(688019926786592021)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688021125383592022)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688021326316592022)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_imp.id(688016909444592017)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688021550288592023)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_imp.id(688016909444592017)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688021706018592023)
,p_theme_id=>42
,p_name=>'CARDS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--stacked'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_help_text=>'Stacks the cards on top of each other.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688022175177592023)
,p_theme_id=>42
,p_name=>'COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_imp.id(688021965593592023)
,p_template_types=>'LIST'
,p_help_text=>'Fills the card background with the color of the icon or default link style.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688022396254592024)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_imp.id(688016909444592017)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688022718345592024)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_imp.id(688022528271592024)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688022952092592024)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_imp.id(688022528271592024)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688023162173592025)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688023351053592025)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_imp.id(688016909444592017)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688023523097592025)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
);
end;
/
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688023722452592026)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_imp.id(688019926786592021)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688024116679592026)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_imp.id(688023910561592026)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688024355277592027)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_imp.id(688023910561592026)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688024537021592027)
,p_theme_id=>42
,p_name=>'RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_imp.id(688021965593592023)
,p_template_types=>'LIST'
,p_help_text=>'Raises the card so it pops up.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688024773441592027)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688024933045592027)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688019485032592020)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688025338808592028)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688025035401592028)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688025598187592028)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688025035401592028)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688025774138592029)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688025035401592028)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688025999771592029)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(688025035401592028)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688026102189592029)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(688025035401592028)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies colors from the Theme''s color palette to icons in the list.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688026366788592029)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688025035401592028)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_imp.id(688023910561592026)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688026575830592030)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688025035401592028)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_imp.id(688023910561592026)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688026926077592030)
,p_theme_id=>42
,p_name=>'LIST_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688025035401592028)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_imp.id(688026734333592030)
,p_template_types=>'LIST'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688027130966592030)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688025035401592028)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688027382818592031)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688025035401592028)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688027545699592031)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688025035401592028)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Display an icon next to the list item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688027726975592031)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(688025035401592028)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688028164492592032)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688027803965592031)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_imp.id(688022528271592024)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688028329891592033)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(688027803965592031)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688028521475592033)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688027803965592031)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_imp.id(688022528271592024)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688028740164592033)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688027803965592031)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_imp.id(688026734333592030)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688028945224592034)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688027803965592031)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_imp.id(688016909444592017)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688029122291592034)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688027803965592031)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_imp.id(688016909444592017)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688029378649592034)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_imp.id(688027803965592031)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_imp.id(688026734333592030)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688029963460592035)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_SM'
,p_display_name=>'Display labels'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(688029480686592034)
,p_css_classes=>'t-NavTabs--displayLabels-sm'
,p_group_id=>wwv_flow_imp.id(688029721473592035)
,p_template_types=>'LIST'
,p_help_text=>'Displays the label for the list items below the icon'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688030178683592035)
,p_theme_id=>42
,p_name=>'HIDE_LABELS_SM'
,p_display_name=>'Do not display labels'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(688029480686592034)
,p_css_classes=>'t-NavTabs--hiddenLabels-sm'
,p_group_id=>wwv_flow_imp.id(688029721473592035)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688030588713592036)
,p_theme_id=>42
,p_name=>'LABEL_ABOVE_LG'
,p_display_name=>'Display labels above'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688029480686592034)
,p_css_classes=>'t-NavTabs--stacked'
,p_group_id=>wwv_flow_imp.id(688030372045592036)
,p_template_types=>'LIST'
,p_help_text=>'Display the label stacked above the icon and badge'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688030791603592036)
,p_theme_id=>42
,p_name=>'LABEL_INLINE_LG'
,p_display_name=>'Display labels inline'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688029480686592034)
,p_css_classes=>'t-NavTabs--inlineLabels-lg'
,p_group_id=>wwv_flow_imp.id(688030372045592036)
,p_template_types=>'LIST'
,p_help_text=>'Display the label inline with the icon and badge'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688030918423592036)
,p_theme_id=>42
,p_name=>'NO_LABEL_LG'
,p_display_name=>'Do not display labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688029480686592034)
,p_css_classes=>'t-NavTabs--hiddenLabels-lg'
,p_group_id=>wwv_flow_imp.id(688030372045592036)
,p_template_types=>'LIST'
,p_help_text=>'Hides the label for the list item'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688031324826592037)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688031061475592036)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_imp.id(688016909444592017)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688031599980592037)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688031061475592036)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688031776361592038)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688031061475592036)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688031939155592038)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688031061475592036)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688032310908592038)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688031061475592036)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(688032151474592038)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688032535247592039)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688031061475592036)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(688032151474592038)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688032937168592040)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(688032684641592039)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688033138585592040)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688032684641592039)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688033336808592040)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(688032684641592039)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688033584638592041)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688032684641592039)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688033919941592042)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688033652354592041)
,p_css_classes=>'t-MegaMenu--layout2Cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688034138735592042)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688033652354592041)
,p_css_classes=>'t-MegaMenu--layout3Cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688034346153592042)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688033652354592041)
,p_css_classes=>'t-MegaMenu--layout4Cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688034533085592043)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(688033652354592041)
,p_css_classes=>'t-MegaMenu--layout5Cols'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688034751397592043)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(688033652354592041)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688034973769592043)
,p_theme_id=>42
,p_name=>'CUSTOM'
,p_display_name=>'Custom'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_imp.id(688033652354592041)
,p_css_classes=>'t-MegaMenu--layoutCustom'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688035153421592043)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688033652354592041)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Displays a callout arrow that points to where the menu was activated from.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688035398917592044)
,p_theme_id=>42
,p_name=>'FULL_WIDTH'
,p_display_name=>'Full Width'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688033652354592041)
,p_css_classes=>'t-MegaMenu--fullWidth'
,p_template_types=>'LIST'
,p_help_text=>'Stretches the menu to fill the width of the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688035536571592044)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_imp.id(688033652354592041)
,p_css_classes=>'t-MegaMenu--layoutStacked'
,p_group_id=>wwv_flow_imp.id(688015763414592016)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688036127794592045)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688035698365592044)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_imp.id(688035915967592044)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688036316253592045)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688035698365592044)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_imp.id(688035915967592044)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688036500823592045)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688035698365592044)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_imp.id(688035915967592044)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688036767704592046)
,p_theme_id=>42
,p_name=>'VERTICAL_LIST'
,p_display_name=>'Vertical Orientation'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688035698365592044)
,p_css_classes=>'t-WizardSteps--vertical'
,p_template_types=>'LIST'
,p_help_text=>'Displays the wizard progress list in a vertical orientation and is suitable for displaying within a side column of a page.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688036926664592046)
,p_theme_id=>42
,p_name=>'WIZARD_PROGRESS_LINKS'
,p_display_name=>'Make Wizard Steps Clickable'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(688035698365592044)
,p_css_classes=>'js-wizardProgressLinks'
,p_template_types=>'LIST'
,p_help_text=>'This option will make the wizard steps clickable links.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688037352874592046)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688037061632592046)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Enables you to define a keyboard shortcut to activate the menu item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688037584182592047)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688037061632592046)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu. Note that callout will only be displayed if the data-parent-element custom attribute is defined.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688037923719592047)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688037669725592047)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688038358409592048)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(688038045094592047)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688038525784592049)
,p_theme_id=>42
,p_name=>'COLLAPSED_DEFAULT'
,p_display_name=>'Collapsed by Default'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688038045094592047)
,p_css_classes=>'js-defaultCollapsed'
,p_template_types=>'LIST'
,p_help_text=>'This option will load the side navigation menu in a collapsed state by default.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688038924801592049)
,p_theme_id=>42
,p_name=>'COLLAPSE_STYLE_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688038045094592047)
,p_css_classes=>'js-navCollapsed--hidden'
,p_group_id=>wwv_flow_imp.id(688038721215592049)
,p_template_types=>'LIST'
,p_help_text=>'Completely hide the navigation menu when it is collapsed.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688039139766592050)
,p_theme_id=>42
,p_name=>'ICON_DEFAULT'
,p_display_name=>'Icon'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688038045094592047)
,p_css_classes=>'js-navCollapsed--default'
,p_group_id=>wwv_flow_imp.id(688038721215592049)
,p_template_types=>'LIST'
,p_help_text=>'Display icons when the navigation menu is collapsed for large screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688039349758592050)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(688038045094592047)
,p_css_classes=>'t-TreeNav--styleA'
,p_group_id=>wwv_flow_imp.id(688016909444592017)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation A'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688039551470592050)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(688038045094592047)
,p_css_classes=>'t-TreeNav--styleB'
,p_group_id=>wwv_flow_imp.id(688016909444592017)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation B'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688039737656592050)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Classic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(688038045094592047)
,p_css_classes=>'t-TreeNav--classic'
,p_group_id=>wwv_flow_imp.id(688016909444592017)
,p_template_types=>'LIST'
,p_help_text=>'Classic Style'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688040140466592051)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(688039855456592050)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688040358924592051)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(688039855456592050)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688040571823592051)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(688039855456592050)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688040719127592052)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(688039855456592050)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688041612532592056)
,p_theme_id=>42
,p_name=>'INDICATOR_ASTERISK'
,p_display_name=>'Asterisk'
,p_display_sequence=>10
,p_field_template_id=>wwv_flow_imp.id(688041239658592055)
,p_css_classes=>'t-Form-fieldContainer--indicatorAsterisk'
,p_group_id=>wwv_flow_imp.id(688041441942592056)
,p_template_types=>'FIELD'
,p_help_text=>'Displays an asterisk * on required items.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688041813126592056)
,p_theme_id=>42
,p_name=>'INDICATOR_LABEL'
,p_display_name=>'Inline Label'
,p_display_sequence=>20
,p_field_template_id=>wwv_flow_imp.id(688041239658592055)
,p_css_classes=>'t-Form-fieldContainer--indicatorLabel'
,p_group_id=>wwv_flow_imp.id(688041441942592056)
,p_template_types=>'FIELD'
,p_help_text=>'Displays "Required" inline.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688042148463592057)
,p_theme_id=>42
,p_name=>'INDICATOR_ASTERISK'
,p_display_name=>'Asterisk'
,p_display_sequence=>10
,p_field_template_id=>wwv_flow_imp.id(688041976198592056)
,p_css_classes=>'t-Form-fieldContainer--indicatorAsterisk'
,p_group_id=>wwv_flow_imp.id(688041441942592056)
,p_template_types=>'FIELD'
,p_help_text=>'Displays an asterisk * on required items.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688042348810592057)
,p_theme_id=>42
,p_name=>'INDICATOR_LABEL'
,p_display_name=>'Inline Label'
,p_display_sequence=>20
,p_field_template_id=>wwv_flow_imp.id(688041976198592056)
,p_css_classes=>'t-Form-fieldContainer--indicatorLabel'
,p_group_id=>wwv_flow_imp.id(688041441942592056)
,p_template_types=>'FIELD'
,p_help_text=>'Displays "Required" inline.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688042664931592058)
,p_theme_id=>42
,p_name=>'INDICATOR_ASTERISK'
,p_display_name=>'Asterisk'
,p_display_sequence=>10
,p_field_template_id=>wwv_flow_imp.id(688042453563592057)
,p_css_classes=>'t-Form-fieldContainer--indicatorAsterisk'
,p_group_id=>wwv_flow_imp.id(688041441942592056)
,p_template_types=>'FIELD'
,p_help_text=>'Displays an asterisk * on required items.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688042807996592058)
,p_theme_id=>42
,p_name=>'INDICATOR_LABEL'
,p_display_name=>'Inline Label'
,p_display_sequence=>20
,p_field_template_id=>wwv_flow_imp.id(688042453563592057)
,p_css_classes=>'t-Form-fieldContainer--indicatorLabel'
,p_group_id=>wwv_flow_imp.id(688041441942592056)
,p_template_types=>'FIELD'
,p_help_text=>'Displays "Required" inline.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688043316966592061)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_imp.id(688042978229592059)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_imp.id(688043167053592061)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688043551614592062)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(688042978229592059)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_imp.id(688043167053592061)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688043937502592062)
,p_theme_id=>42
,p_name=>'HIDE_ICON_ON_DESKTOP'
,p_display_name=>'Hide Icon on Desktop'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_imp.id(688043785445592062)
,p_css_classes=>'t-Button--desktopHideIcon'
,p_template_types=>'BUTTON'
,p_help_text=>'This template options hides the button icon on large screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688044116463592063)
,p_theme_id=>42
,p_name=>'HIDE_LABEL_ON_MOBILE'
,p_display_name=>'Hide Label on Mobile'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(688043785445592062)
,p_css_classes=>'t-Button--mobileHideLabel'
,p_template_types=>'BUTTON'
,p_help_text=>'This template options hides the button label on small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688044509520592063)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(688043785445592062)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(688044337925592063)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688044706092592063)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_imp.id(688043785445592062)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_imp.id(688043167053592061)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
end;
/
begin
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688044913787592064)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_imp.id(688043785445592062)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_imp.id(688044337925592063)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688045178159592064)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(688043785445592062)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_imp.id(688043167053592061)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688047072630592107)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H1'
,p_display_name=>'H1'
,p_display_sequence=>10
,p_css_classes=>'js-headingLevel-1'
,p_group_id=>wwv_flow_imp.id(688046883351592107)
,p_template_types=>'REGION'
,p_help_text=>'H1'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688047216887592108)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H2'
,p_display_name=>'H2'
,p_display_sequence=>20
,p_css_classes=>'js-headingLevel-2'
,p_group_id=>wwv_flow_imp.id(688046883351592107)
,p_template_types=>'REGION'
,p_help_text=>'H2'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688047466705592108)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H3'
,p_display_name=>'H3'
,p_display_sequence=>30
,p_css_classes=>'js-headingLevel-3'
,p_group_id=>wwv_flow_imp.id(688046883351592107)
,p_template_types=>'REGION'
,p_help_text=>'H3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688047607467592108)
,p_theme_id=>42
,p_name=>'H4'
,p_display_name=>'H4'
,p_display_sequence=>40
,p_css_classes=>'js-headingLevel-4'
,p_group_id=>wwv_flow_imp.id(688046883351592107)
,p_template_types=>'REGION'
,p_help_text=>'H4'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688047816299592108)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H5'
,p_display_name=>'H5'
,p_display_sequence=>50
,p_css_classes=>'js-headingLevel-5'
,p_group_id=>wwv_flow_imp.id(688046883351592107)
,p_template_types=>'REGION'
,p_help_text=>'H5'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688048056670592109)
,p_theme_id=>42
,p_name=>'HEADING_LEVEL_H6'
,p_display_name=>'H6'
,p_display_sequence=>60
,p_css_classes=>'js-headingLevel-6'
,p_group_id=>wwv_flow_imp.id(688046883351592107)
,p_template_types=>'REGION'
,p_help_text=>'H6'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688048474736592110)
,p_theme_id=>42
,p_name=>'FBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_imp.id(688048295684592109)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large bottom margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688048826851592110)
,p_theme_id=>42
,p_name=>'RBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_imp.id(688048634867592110)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large bottom margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688049083630592110)
,p_theme_id=>42
,p_name=>'FBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_imp.id(688048295684592109)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium bottom margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688049232521592110)
,p_theme_id=>42
,p_name=>'RBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_imp.id(688048634867592110)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium bottom margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688049471472592111)
,p_theme_id=>42
,p_name=>'FBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_imp.id(688048295684592109)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the bottom margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688049686827592111)
,p_theme_id=>42
,p_name=>'RBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_imp.id(688048634867592110)
,p_template_types=>'REGION'
,p_help_text=>'Removes the bottom margin for this region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688049834551592111)
,p_theme_id=>42
,p_name=>'FBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_imp.id(688048295684592109)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small bottom margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688050055751592111)
,p_theme_id=>42
,p_name=>'RBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_imp.id(688048634867592110)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small bottom margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688050440061592112)
,p_theme_id=>42
,p_name=>'FLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_imp.id(688050218869592112)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large left margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688050852374592112)
,p_theme_id=>42
,p_name=>'RLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_imp.id(688050654803592112)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688051016011592113)
,p_theme_id=>42
,p_name=>'FLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_imp.id(688050218869592112)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium left margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688051227713592113)
,p_theme_id=>42
,p_name=>'RLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_imp.id(688050654803592112)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688051485785592113)
,p_theme_id=>42
,p_name=>'FLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_imp.id(688050218869592112)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the left margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688051627153592113)
,p_theme_id=>42
,p_name=>'RLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_imp.id(688050654803592112)
,p_template_types=>'REGION'
,p_help_text=>'Removes the left margin from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688051869890592114)
,p_theme_id=>42
,p_name=>'FLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_imp.id(688050218869592112)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small left margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688052011509592114)
,p_theme_id=>42
,p_name=>'RLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_imp.id(688050654803592112)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small left margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688052444464592114)
,p_theme_id=>42
,p_name=>'FRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_imp.id(688052216624592114)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large right margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688052879027592115)
,p_theme_id=>42
,p_name=>'RRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_imp.id(688052601206592115)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688053072606592115)
,p_theme_id=>42
,p_name=>'FRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_imp.id(688052216624592114)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium right margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688053219488592115)
,p_theme_id=>42
,p_name=>'RRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_imp.id(688052601206592115)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688053494849592115)
,p_theme_id=>42
,p_name=>'FRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_imp.id(688052216624592114)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the right margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688053639608592116)
,p_theme_id=>42
,p_name=>'RRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_imp.id(688052601206592115)
,p_template_types=>'REGION'
,p_help_text=>'Removes the right margin from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688053893252592116)
,p_theme_id=>42
,p_name=>'FRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_imp.id(688052216624592114)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small right margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688054068182592123)
,p_theme_id=>42
,p_name=>'RRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_imp.id(688052601206592115)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688054409422592123)
,p_theme_id=>42
,p_name=>'FTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_imp.id(688054267089592123)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large top margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688054802695592124)
,p_theme_id=>42
,p_name=>'RTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_imp.id(688054670842592123)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large top margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688055000385592124)
,p_theme_id=>42
,p_name=>'FTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_imp.id(688054267089592123)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium top margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688055252312592124)
,p_theme_id=>42
,p_name=>'RTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_imp.id(688054670842592123)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium top margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688055448513592124)
,p_theme_id=>42
,p_name=>'FTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_imp.id(688054267089592123)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the top margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688055608131592125)
,p_theme_id=>42
,p_name=>'RTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_imp.id(688054670842592123)
,p_template_types=>'REGION'
,p_help_text=>'Removes the top margin for this region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688055830455592125)
,p_theme_id=>42
,p_name=>'FTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_imp.id(688054267089592123)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small top margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688056093816592125)
,p_theme_id=>42
,p_name=>'RTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_imp.id(688054670842592123)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small top margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688056459000592126)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_imp.id(688056230739592125)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688056847655592126)
,p_theme_id=>42
,p_name=>'LARGEBOTTOMMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapBottom'
,p_group_id=>wwv_flow_imp.id(688056617903592126)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688057220039592126)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(688057070279592126)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688057645650592127)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(688057482620592127)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688058052566592127)
,p_theme_id=>42
,p_name=>'LARGETOPMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapTop'
,p_group_id=>wwv_flow_imp.id(688057826490592127)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688058444849592128)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_imp.id(688058275256592128)
,p_template_types=>'BUTTON'
,p_help_text=>'A large button.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688058810861592128)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_LINK'
,p_display_name=>'Display as Link'
,p_display_sequence=>30
,p_css_classes=>'t-Button--link'
,p_group_id=>wwv_flow_imp.id(688058662975592128)
,p_template_types=>'BUTTON'
,p_help_text=>'This option makes the button appear as a text link.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688059020114592129)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_imp.id(688058662975592128)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688059224621592129)
,p_theme_id=>42
,p_name=>'SMALLBOTTOMMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padBottom'
,p_group_id=>wwv_flow_imp.id(688056617903592126)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688059449107592129)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(688057070279592126)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688059676870592129)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_imp.id(688057482620592127)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688059832675592129)
,p_theme_id=>42
,p_name=>'SMALLTOPMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padTop'
,p_group_id=>wwv_flow_imp.id(688057826490592127)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688060281733592130)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_imp.id(688060056465592130)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688060439117592130)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(688060056465592130)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688060684109592131)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(688060056465592130)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688060833597592131)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_imp.id(688056230739592125)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688061076922592131)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_imp.id(688058662975592128)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688061298675592131)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_imp.id(688058275256592128)
,p_template_types=>'BUTTON'
,p_help_text=>'A small button.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688061635005592132)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_imp.id(688061449589592132)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688061869245592132)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_imp.id(688056230739592125)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688062097316592132)
,p_theme_id=>42
,p_name=>'TINY'
,p_display_name=>'Tiny'
,p_display_sequence=>10
,p_css_classes=>'t-Button--tiny'
,p_group_id=>wwv_flow_imp.id(688058275256592128)
,p_template_types=>'BUTTON'
,p_help_text=>'A very small button.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688062251249592133)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_imp.id(688056230739592125)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688062496146592133)
,p_theme_id=>42
,p_name=>'DEFERRED_PAGE_RENDERING'
,p_display_name=>'Deferred Page Rendering'
,p_display_sequence=>1
,p_css_classes=>'t-DeferredRendering'
,p_template_types=>'PAGE'
,p_help_text=>'Defer page rendering until all page components have finished loading.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688062826360592133)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(688062659637592133)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688063259082592134)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_imp.id(688063040522592133)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688063625598592134)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(688063456691592134)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688064058206592135)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'None'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_imp.id(688063886684592134)
,p_template_types=>'REGION'
,p_help_text=>'Removes spacing between items.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688064264435592135)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_imp.id(688063886684592134)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item spacing.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688064464684592135)
,p_theme_id=>42
,p_name=>'FORMSTANDARDPADDING'
,p_display_name=>'Standard'
,p_display_sequence=>5
,p_css_classes=>'t-Form--standardPadding'
,p_group_id=>wwv_flow_imp.id(688063886684592134)
,p_template_types=>'REGION'
,p_help_text=>'Uses the standard spacing between items.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688064829793592136)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_imp.id(688064616626592135)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688065041513592136)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_imp.id(688063040522592133)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688065494877592136)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_imp.id(688065248110592136)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688065803106592137)
,p_theme_id=>42
,p_name=>'POST_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--postTextBlock'
,p_group_id=>wwv_flow_imp.id(688065680329592136)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Post Text in a block style immediately after the item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688066263611592138)
,p_theme_id=>42
,p_name=>'PRE_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--preTextBlock'
,p_group_id=>wwv_flow_imp.id(688066099801592138)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Pre Text in a block style immediately before the item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688066640732592139)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_PILL_BUTTON'
,p_display_name=>'Display as Pill Button'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--radioButtonGroup'
,p_group_id=>wwv_flow_imp.id(688066493889592138)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the radio buttons to look like a button set / pill button.  Note that the the radio buttons must all be in the same row for this option to work.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688066870450592139)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688067029545592140)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_imp.id(688065248110592136)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688067496994592140)
,p_theme_id=>42
,p_name=>'REMOVE_PADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>1
,p_css_classes=>'t-PageBody--noContentPadding'
,p_group_id=>wwv_flow_imp.id(688067282358592140)
,p_template_types=>'PAGE'
,p_help_text=>'Removes padding from the content region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(688067860940592141)
,p_theme_id=>42
,p_name=>'HIDE_WHEN_ALL_ROWS_DISPLAYED'
,p_display_name=>'Hide when all rows displayed'
,p_display_sequence=>10
,p_css_classes=>'t-Report--hideNoPagination'
,p_group_id=>wwv_flow_imp.id(688067683653592140)
,p_template_types=>'REPORT'
,p_help_text=>'This option will hide the pagination when all rows are displayed.'
);
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(687873015688591758)
,p_build_option_name=>'Commented Out'
,p_build_option_status=>'EXCLUDE'
);
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/security/authentications/oracle_apex_accounts
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(687873397416591762)
,p_name=>'Oracle APEX Accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
prompt --application/user_interfaces
begin
wwv_flow_imp_shared.create_user_interface(
 p_id=>wwv_flow_imp.id(688068535258592148)
,p_ui_type_name=>'DESKTOP'
,p_display_name=>'Desktop'
,p_display_seq=>10
,p_use_auto_detect=>false
,p_is_default=>true
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&SESSION.'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(687874136119591768)
,p_navigation_list_position=>'TOP'
,p_navigation_list_template_id=>wwv_flow_imp.id(688039855456592050)
,p_nav_list_template_options=>'#DEFAULT#:js-tabLike'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(688068288401592147)
,p_nav_bar_list_template_id=>wwv_flow_imp.id(688037669725592047)
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_imp_page.create_page(
 p_id=>0
,p_user_interface_id=>wwv_flow_imp.id(688068535258592148)
,p_name=>'Global Page'
,p_step_title=>'Global Page'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_page_component_map=>'14'
,p_last_updated_by=>'JON@CLOUDNUEVA.COM'
,p_last_upd_yyyymmddhh24miss=>'20220727225138'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_imp.id(688068535258592148)
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'APEX Social Signon'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>':root {--ut-hero-region-icon-background-color: transparent;}'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
,p_last_updated_by=>'JON@CLOUDNUEVA.COM'
,p_last_upd_yyyymmddhh24miss=>'20220728173755'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(688077084978592286)
,p_plug_name=>'APEX Office 365 Integration'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(687942932784591905)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_query_num_rows=>15
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'Y'
);
end;
/
prompt --application/pages/page_00010
begin
wwv_flow_imp_page.create_page(
 p_id=>10
,p_user_interface_id=>wwv_flow_imp.id(688068535258592148)
,p_name=>'Select User'
,p_alias=>'SELECT-USER'
,p_step_title=>'Select User'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_last_updated_by=>'JON@CLOUDNUEVA.COM'
,p_last_upd_yyyymmddhh24miss=>'20220728181054'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(585060804679896441)
,p_plug_name=>'Tenant Users'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(687966107370591934)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(688147527547932923)
,p_plug_source_type=>'NATIVE_IR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Tenant Users'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(585060907774896442)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'JON@CLOUDNUEVA.COM'
,p_internal_uid=>585060907774896442
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585061017008896443)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Select User'
,p_column_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:20:AI_USER_ID,AI_USER_NAME:#ID#,#DISPLAY_NAME#'
,p_column_linktext=>'<span aria-hidden="true" class="t-Icon fa fa-check-circle"></span>'
,p_column_link_attr=>'title="Select User" class="t-Button t-Button--noLabel t-Button--icon t-Button--hot t-Button--stretch"'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585061171412896444)
,p_db_column_name=>'DISPLAY_NAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Display Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585061276858896445)
,p_db_column_name=>'EMAIL_ADDRESS'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Email Address'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(585061340612896446)
,p_db_column_name=>'JOB_TITLE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Job Title'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(688154429336021718)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6881545'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ID:DISPLAY_NAME:EMAIL_ADDRESS:JOB_TITLE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(688144676035925083)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(687983117087591954)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(687873674147591764)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(688045225431592065)
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(585061420932896447)
,p_name=>'P10_TARGET_PAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(585060804679896441)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
end;
/
prompt --application/pages/page_00020
begin
wwv_flow_imp_page.create_page(
 p_id=>20
,p_user_interface_id=>wwv_flow_imp.id(688068535258592148)
,p_name=>'Office Calendar'
,p_alias=>'OFFICE-CALENDAR'
,p_step_title=>'Office Calendar'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'08'
,p_last_updated_by=>'JON@CLOUDNUEVA.COM'
,p_last_upd_yyyymmddhh24miss=>'20220803231155'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(688158340546038185)
,p_plug_name=>'Default Calendar for [&AI_USER_NAME.]'
,p_icon_css_classes=>'fa-calendar-user'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(687942932784591905)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(687873674147591764)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(688045225431592065)
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(688170226224151316)
,p_plug_name=>'Calendar'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(687910334526591858)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_location=>'WEB_SOURCE'
,p_web_src_module_id=>wwv_flow_imp.id(688310530616818955)
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CSS_CALENDAR'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'START_DATE_TIME'
,p_attribute_02=>'END_DATE_TIME'
,p_attribute_03=>'SUBJECT'
,p_attribute_04=>'EVENT_ID'
,p_attribute_07=>'N'
,p_attribute_11=>'month:week:day:list:navigation'
,p_attribute_13=>'Y'
,p_attribute_16=>'&BODY!RAW.'
,p_attribute_17=>'Y'
,p_attribute_18=>'12'
,p_attribute_19=>'Y'
,p_attribute_20=>'7'
,p_attribute_21=>'10'
,p_attribute_22=>'Y'
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(688170835239151322)
,p_page_id=>20
,p_web_src_param_id=>wwv_flow_imp.id(688320199858144776)
,p_page_plug_id=>wwv_flow_imp.id(688170226224151316)
,p_value_type=>'STATIC'
,p_value=>'start/dateTime gt ''2022-07-29T07:00:00Z'''
);
wwv_flow_imp_shared.create_web_source_comp_param(
 p_id=>wwv_flow_imp.id(688171019402151324)
,p_page_id=>20
,p_web_src_param_id=>wwv_flow_imp.id(688311108727818961)
,p_page_plug_id=>wwv_flow_imp.id(688170226224151316)
,p_value_type=>'ITEM'
,p_value=>'AI_USER_ID'
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_imp_page.create_page(
 p_id=>9999
,p_user_interface_id=>wwv_flow_imp.id(688068535258592148)
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'APEX Social Signon - Log In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>':root {--ut-component-icon-background-color: transparent;}'
,p_step_template=>wwv_flow_imp.id(687899521300591837)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
,p_last_updated_by=>'JON@CLOUDNUEVA.COM'
,p_last_upd_yyyymmddhh24miss=>'20220728173529'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(688072583053592246)
,p_plug_name=>'APEX Office 365 Integration'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(687968214451591936)
,p_plug_display_sequence=>10
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(688074212483592265)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(688072583053592246)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(688043625660592062)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'NEXT'
,p_button_alignment=>'LEFT'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(688073028502592257)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(688072583053592246)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(688040895460592052)
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(688073435867592259)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(688072583053592246)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(688040895460592052)
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(688073872993592263)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(688072583053592246)
,p_prompt=>'Remember me'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(688040895460592052)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(688075046271592268)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P9999_USERNAME),',
'    p_consent  => :P9999_REMEMBER = ''Y'' );'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(688074692051592268)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P9999_USERNAME,',
'    p_password => :P9999_PASSWORD,',
'    p_set_persistent_auth => NVL(:P9999_REMEMBER,''N'') = ''Y'');'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(688075822764592270)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(688075472751592269)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
);
end;
/
prompt --application/deployment/definition
begin
null;
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
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

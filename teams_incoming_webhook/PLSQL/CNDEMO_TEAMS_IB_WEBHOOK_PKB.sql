SET DEFINE OFF;
CREATE OR REPLACE PACKAGE BODY CNDEMO_TEAMS_IB_WEBHOOK_PK AS
-------------------------------------------------------------------------------
-- NAME        : cndemo_teams_ib_webhook_pk
-- FILE NAME   : CNDEMO_TEAMS_IB_WEBHOOK_PKB.sql
-- REVISION    : $2022.1.0$
-- PURPOSE     : Package containing code for the MS Teams Incoming Webhook Demo.
--
-- DELIVERED BY: $jdixon$
--               
-- Revision History:
-- VER        DATE         AUTHOR           DESCRIPTION
-- ========   ===========  ================ =======================================
-- 2022.1.0   13-JUL-2022  jdixon           Created.
-----------------------------------------------------------------------------------

  GC_SCOPE_PREFIX  CONSTANT VARCHAR2(100) := 'demo.'||LOWER($$plsql_unit) || '.';

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE capture_card_response
 (p_request        IN CLOB, 
  p_respone_token  IN VARCHAR2,
  x_status        OUT NUMBER) IS

  l_logger_scope        logger_logs.SCOPE%TYPE := GC_SCOPE_PREFIX || utl_call_stack.subprogram(1)(2);
  l_logger_params       logger.tab_param;
  l_payload_object      JSON_OBJECT_T;
  l_comment             VARCHAR2(4000);
  
BEGIN

  x_status := 200;

  logger.log('Start', l_logger_scope, NULL, l_logger_params);

  -- Verify the Response Token matches. In real life, you should generate a new otken for every card,
  --  and store it in a table. Then check the table here to verify you are getting the correct token.
  IF NVL(p_respone_token,'X') <> GC_CARD_RESPONSE_TOKEN THEN
    logger.append_param(l_logger_params, 'respone_token', p_respone_token);
    logger.log_error('Invalid Response Token Received', l_logger_scope, NULL, l_logger_params);
    x_status := 401;
    RETURN;
  END IF;
  
  -- Parse the Response and get the value for button_clicked
  l_payload_object := JSON_OBJECT_T.PARSE(p_request);
  l_comment        := l_payload_object.get_String('comment');
  logger.append_param(l_logger_params, 'Entered Comment', l_comment);
  logger.log('End', l_logger_scope, NULL, l_logger_params);

EXCEPTION WHEN OTHERS THEN
  x_status := 400;
  logger.log_error('Unhandled Error[ '||SQLERRM||']', l_logger_scope, NULL, l_logger_params);
END capture_card_response;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
PROCEDURE automation_apex_alert
 (p_last_run_time TIMESTAMP WITH TIME ZONE) IS

  CURSOR cr_slow_pages IS
    SELECT application_id
    ,      page_id
    ,      COUNT(1)            count_ocurrences
    ,      ROUND(MAX(elapsed_time),2)   longest_time
    FROM   apex_workspace_activity_log
    WHERE  elapsed_time   >= 2
    AND    view_date BETWEEN p_last_run_time -1 AND SYSTIMESTAMP
    AND    page_id IS NOT NULL
    AND page_id IN (7021,100)
    GROUP BY application_id, page_id
    ORDER BY application_id, page_id;

  l_logger_scope        logger_logs.SCOPE%TYPE := GC_SCOPE_PREFIX || utl_call_stack.subprogram(1)(2);
  l_logger_params       logger.tab_param;
  l_count_apps          PLS_INTEGER;
  l_teams_json          CLOB;
  l_teams_response      CLOB;
  l_sid_pdb_name        CONSTANT VARCHAR2(100) := SYS_CONTEXT('USERENV', 'CON_NAME');
  l_time_range          VARCHAR2(250);
  http_request_failed   exception;
  pragma exception_init (http_request_failed, -29273); 
  
BEGIN

  logger.append_param(l_logger_params, 'last_run_time', p_last_run_time);
  logger.log('Start', l_logger_scope, NULL, l_logger_params);

  -- Check to see if there are any slow running pages.
  SELECT COUNT(1) INTO l_count_apps
  FROM   apex_workspace_activity_log
  WHERE  elapsed_time  >= 2
  AND    page_id IS NOT NULL
  AND    view_date BETWEEN p_last_run_time -2 AND SYSTIMESTAMP;
  
  IF l_count_apps > 0 THEN

    -- Generate a Message and Send it To Teams.
    apex_json.initialize_clob_output (p_indent => 0);
    apex_json.open_object; -- {
    apex_json.write('@type', 'MessageCard');
    apex_json.write('@context', 'https://schema.org/extensions');
    apex_json.write('title', 'APEX Slow Page Alert ['||l_sid_pdb_name||']');
    apex_json.write('summary', 'APEX Slow Page Alert');
    apex_json.write('themeColor', '0078D7');

    apex_json.open_array('sections');
    -- Loop through Applications that have pages that have elapsed times >= 2 seconds.
    FOR r_page IN cr_slow_pages LOOP

      apex_json.open_object; -- {
      apex_json.write('startGroup', TRUE);
      apex_json.write('activityTitle', 'Application ID: ['||r_page.application_id||']');
      apex_json.write('activitySubtitle', 'Page ID: ['||r_page.page_id||']');
      apex_json.write('activityImage', 'https://objectstorage.us-ashburn-1.oraclecloud.com/n/nueva/b/nueva-public/o/Blog%20Public%20Files%2FTeams%20Incoming%20Webhooks%2FAPEX%20Rounded%20Corners.png');

      apex_json.open_array('facts');
      apex_json.open_object; -- {
      apex_json.write('name', 'Number of Ocurrences');
      apex_json.write('value', r_page.count_ocurrences);
      apex_json.close_object; -- } 
      apex_json.open_object; -- {
      apex_json.write('name', 'Max. Duration (seconds)');
      apex_json.write('value', ROUND(r_page.longest_time,2));
      apex_json.close_object; -- } 
      apex_json.close_array; -- ] facts
      apex_json.close_object; -- } 

    END LOOP;

    apex_json.open_object; -- {
    apex_json.write('startGroup', TRUE);
    l_time_range := TO_CHAR(p_last_run_time, 'DD-MON-YYYY HH:MI:SS pm') || ' and ' || TO_CHAR(SYSTIMESTAMP, 'DD-MON-YYYY HH:MI:SS pm');
    apex_json.write('activitySubtitle', 'Issues detected between ' || l_time_range || ' UTC');
    apex_json.close_object; -- } 
    apex_json.close_array; -- ] sections
    apex_json.open_array('potentialAction');
    apex_json.open_object; -- {
    apex_json.write('@type', 'ActionCard');
    apex_json.write('name', 'Add Comments');
      apex_json.open_array('inputs');
      apex_json.open_object; -- {
      apex_json.write('@type', 'TextInput');
      apex_json.write('id', 'comment');
      apex_json.write('title', 'Comment');
      apex_json.write('isMultiline', TRUE);
      apex_json.close_object; -- }
      apex_json.close_array; -- } inputs
      apex_json.open_array('actions');
      apex_json.open_object; -- {
      apex_json.write('@type', 'HttpPOST');
      apex_json.write('name', 'Submit');
      -- Send a response URL on the card. This ORDS end point will be called when the user clicks the Acknowledge button on the card.
      apex_json.write('target', 'https://www.cloudnueva.com/ords/dev/cndemo/teams/incoming_webhook_response?response_token='||GC_CARD_RESPONSE_TOKEN);
      -- You can put anything you want in the body, this will be passed back as a JSON Payload when the above URL is called.
      apex_json.write ('body', '{"comment":"{{comment.value}}"}');
      apex_json.close_object; -- }
      apex_json.close_array; -- ] actions
    apex_json.close_object; -- }
    apex_json.close_array; -- ] potentialAction

    -- Close out JSON and return CLOB.  
    apex_json.close_object; -- }
    l_teams_json := apex_json.get_clob_output;
    apex_json.free_output;

logger.log(SUBSTR(l_teams_json,1,4000), l_logger_scope, NULL, l_logger_params);
logger.log(SUBSTR(l_teams_json,4001,4000), l_logger_scope, NULL, l_logger_params);
logger.log(SUBSTR(l_teams_json,8001,4000), l_logger_scope, NULL, l_logger_params);

    BEGIN
      -- Post JSON Message to MS Teams.
      l_teams_response := apex_web_service.make_rest_request
       (p_url         => GC_TEAMS_CHANNEL_URL,
        p_http_method => 'POST',
        p_body        => l_teams_json);

      -- Check if the call was sucessful.
      IF apex_web_service.g_status_code != 200 THEN
        logger.append_param(l_logger_params, 'response_code', apex_web_service.g_status_code);
        logger.append_param(l_logger_params, 'teams_response', l_teams_response);
        logger.log_error('Error from Teams', l_logger_scope, NULL, l_logger_params);
        apex_automation.log_error ('Post to Teams Timed Out');
        RETURN;
      END IF;

    EXCEPTION WHEN http_request_failed THEN
      logger.append_param(l_logger_params, 'teams_response', l_teams_response);
      logger.log_error('Post to Teams Timed Out', l_logger_scope, NULL, l_logger_params);
      apex_automation.log_error ('Post to Teams Timed Out');
      RETURN;
    END;

    apex_automation.log_info ('Message Posted to Teams');

  END IF;
  
  logger.log('End', l_logger_scope, NULL, l_logger_params);

EXCEPTION WHEN OTHERS THEN
  logger.log_error('Unhandled Error[ '||SQLERRM||']', l_logger_scope, NULL, l_logger_params);
END automation_apex_alert;

END CNDEMO_TEAMS_IB_WEBHOOK_PK;
/
SHOW ERR;
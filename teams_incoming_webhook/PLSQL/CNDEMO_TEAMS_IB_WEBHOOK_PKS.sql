CREATE OR REPLACE PACKAGE CNDEMO_TEAMS_IB_WEBHOOK_PK AS
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

  ---------------------------------------
  -- Constants that need to be changed --
  ---------------------------------------
  -- Note: You should change the below to match the URL provided in MS Teams when you created the Incoming Webhook.
  GC_TEAMS_CHANNEL_URL       CONSTANT VARCHAR2(500)   := 'https://example.webhook.office.com/webhookb2/abcdef/IncomingWebhook/abcdef';
  GC_CARD_RESPONSE_TOKEN     CONSTANT VARCHAR2(50)    := 'CHANGE_ME';

-- Procedure called from Automation to generate JSON for a MS Teams card and POST it to the Teams Channel.
PROCEDURE automation_apex_alert
  (p_last_run_time TIMESTAMP WITH TIME ZONE);

-- Procedure called from the MS Teams Card when user clicks the Acknowledge button on the card.  
PROCEDURE capture_card_response
 (p_request        IN CLOB, 
  p_respone_token  IN VARCHAR2,
  x_status        OUT NUMBER);
  
END CNDEMO_TEAMS_IB_WEBHOOK_PK;
/
SHOW ERR;
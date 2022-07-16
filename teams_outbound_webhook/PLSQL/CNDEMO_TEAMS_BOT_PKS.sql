CREATE OR REPLACE PACKAGE CNDEMO_TEAMS_BOT_PK AS
-------------------------------------------------------------------------------
-- NAME        : CNDEMO_TEAMS_BOT_PK
-- FILE NAME   : CNDEMO_TEAMS_BOT_PKB.sql
-- REVISION    : $2022.1.0$
-- PURPOSE     : Package containing code for the MS Teams Outbound Webhook Demo.
--
-- DELIVERED BY: $jdixon$
--               
-- Revision History:
-- VER        DATE         AUTHOR           DESCRIPTION
-- ========   ===========  ================ =======================================
-- 2022.1.0   10-JUL-2022  jdixon           Created.
-- 2022.1.1   12-JUL-2022  jdixon           Removed key values.
-------------------------------------------------------------------------------

  -- Status Record Type used to pass status information between procedures.
  TYPE status_rec IS RECORD
   (status_code   VARCHAR2(1)   := 'S',
    status_msg    VARCHAR2(32767));

  TYPE teams_msg_rec IS RECORD
   (json_payload          CLOB,
    type                  VARCHAR2(100),
    channel_id            VARCHAR2(100),
    from_id               VARCHAR2(100),
    from_name             VARCHAR2(100),
    from_aad_object_id    VARCHAR2(1000),
    text_format           VARCHAR2(100),
    text                  VARCHAR2(32767),
    tenant_id             VARCHAR2(1000),
    teams_channel_id      VARCHAR2(1000),
    teams_team_id         VARCHAR2(1000),
    city                  VARCHAR2(100),
    state                 VARCHAR2(100));
           
  TYPE elocation_rec IS RECORD
   (city_in       VARCHAR2(100),
    state_in      VARCHAR2(100),
    latitude      NUMBER,
    longitude     NUMBER,
    found_city    VARCHAR2(100),
    found_state   VARCHAR2(100),
    extra_info    VARCHAR2(1000));

  TYPE weather_rec IS RECORD
   (latitude      NUMBER,
    longitude     NUMBER,
    forecast_json CLOB);

  ---------------------------------------
  -- Constants that need to be changed --
  ---------------------------------------
  -- Note: You should change the below to match the name of your Outbound Webhook.
  GC_BOT_NAME_RAW             CONSTANT VARCHAR2(500)   := '<at>Weather</at>';
  -- Note: You should change the below to match the 'Security Key' displayed when you created the Outbound Webhook in Teams.
  GC_TEAM_SECURITY_TOKEN      CONSTANT VARCHAR2(500)   := 'YOUR_VALUE_HERE';
  -- Note: The below is used by the weather.gov API to uniquely identify your client. Change to a value that is unique to you.
  GC_WEATHER_API_USER_AGENT  CONSTANT VARCHAR2(25)     := 'YOUR_VALUE_HERE';
  
  -----------------------------
  -- Error Message Constants --
  -----------------------------
  GC_ERR_INVALID_CITY_STATE  CONSTANT VARCHAR2(500)   := 'Please enter a valid City a comma and a State e.g. San Diego, CA';
  GC_ERR_ELOCATION           CONSTANT VARCHAR2(500)   := 'Unable to locate the City and State.';
  GC_ERR_PARSE_TEAMS_JSON    CONSTANT VARCHAR2(500)   := 'Unable to parse the message from Teams.';
  GC_ERR_WEATHER             CONSTANT VARCHAR2(500)   := 'Unable to get get the forecast from weather.gov.';

  ---------------------------
  -- Weather API Constants --
  ---------------------------
  GC_POINTS_URL              CONSTANT VARCHAR2(500)   := 'https://api.weather.gov/points/';
  GC_WEATHER_TIMEOUT_SECS    CONSTANT PLS_INTEGER     := 5;

  -------------------------------------
  -- Oracle eLocation API Constants. --
  -------------------------------------
  GC_ELOCATION_URL            CONSTANT VARCHAR2(500)   := 'https://elocation.oracle.com/geocoder/gcserver'; 
  GC_ADDR_WS_TIMEOUT_SECS     CONSTANT PLS_INTEGER     := 5;
  GC_XML_REQUEST              CONSTANT VARCHAR2(32767) := '<?xml version="1.0" standalone="yes"?>
<geocode_request vendor="elocation">
  <address_list>
    <input_location id="999">
      <input_address match_mode="relax_street_type">
        <us_form2 city="#CITY#" state="#STATE#"/>
      </input_address>
    </input_location>
  </address_list>
</geocode_request>';

-- Procedure called by ORDS Handler.
PROCEDURE teams_weather
 (p_request        IN CLOB, 
  p_provided_hmac  IN VARCHAR2,
  x_status        OUT NUMBER);

END CNDEMO_TEAMS_BOT_PK;
/
SHOW ERR;
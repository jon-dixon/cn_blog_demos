-- Auto-generated script to export table DDLs from current schema.
-- Writes each CREATE TABLE statement to TABLES/<table_name>.sql
SET TERMOUT OFF
SET FEEDBACK OFF
SET VERIFY OFF
SET HEADING OFF
SET ECHO OFF
SET PAGESIZE 0
SET TRIMOUT ON
SET TRIMSPOOL ON
SET LONG 2000000
SET LONGCHUNKSIZE 2000000
SET LINESIZE 32767

BEGIN
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'STORAGE', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'TABLESPACE', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SEGMENT_ATTRIBUTES', FALSE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'CONSTRAINTS', TRUE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'REF_CONSTRAINTS', TRUE);
  DBMS_METADATA.SET_TRANSFORM_PARAM(DBMS_METADATA.SESSION_TRANSFORM, 'SQLTERMINATOR', TRUE);
END;
/

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/aifn_customers.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'AIFN_CUSTOMERS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/aifn_customer_users.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'AIFN_CUSTOMER_USERS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/aifn_products.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'AIFN_PRODUCTS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/aifn_sales_order_lines.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'AIFN_SALES_ORDER_LINES') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/aifn_sales_orders.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'AIFN_SALES_ORDERS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/api_credentials.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'API_CREDENTIALS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/canadian_provinces.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CANADIAN_PROVINCES') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/cnba_blog_posts.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CNBA_BLOG_POSTS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/cnba_blog_posts_hyb.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CNBA_BLOG_POSTS_HYB') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/cnba_post_chunks.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CNBA_POST_CHUNKS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/cnba_rag_search_dtls.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CNBA_RAG_SEARCH_DTLS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/cnba_rag_searches.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CNBA_RAG_SEARCHES') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/cncd_deployment_lines.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CNCD_DEPLOYMENT_LINES') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/cncd_deployment_path_inst.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CNCD_DEPLOYMENT_PATH_INST') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/cncd_deployment_paths.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CNCD_DEPLOYMENT_PATHS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/cncd_deployment_requests.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CNCD_DEPLOYMENT_REQUESTS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/cncd_deployments.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CNCD_DEPLOYMENTS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/cncd_instance_access.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CNCD_INSTANCE_ACCESS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/cn_document_chunks.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CN_DOCUMENT_CHUNKS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/cn_documents.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CN_DOCUMENTS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/countries.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'COUNTRIES') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/customers.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CUSTOMERS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/customer_users.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'CUSTOMER_USERS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dbtools_execution_history.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DBTOOLS$EXECUTION_HISTORY') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dbtools_mcp_log.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DBTOOLS$MCP_LOG') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dm_p5all_minilm_l12_v2.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DM$P5ALL_MINILM_L12_V2') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dm_p8all_minilm_l12_v2.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DM$P8ALL_MINILM_L12_V2') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dm_p9all_minilm_l12_v2.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DM$P9ALL_MINILM_L12_V2') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dm_paall_minilm_l12_v2.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DM$PAALL_MINILM_L12_V2') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dr_cnba_blog_posts_hyb2_b.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DR$CNBA_BLOG_POSTS_HYB2$B') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dr_cnba_blog_posts_hyb2_c.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DR$CNBA_BLOG_POSTS_HYB2$C') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dr_cnba_blog_posts_hyb2_d.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DR$CNBA_BLOG_POSTS_HYB2$D') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dr_cnba_blog_posts_hyb2_g.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DR$CNBA_BLOG_POSTS_HYB2$G') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dr_cnba_blog_posts_hyb2_i.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DR$CNBA_BLOG_POSTS_HYB2$I') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dr_cnba_blog_posts_hyb2_k.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DR$CNBA_BLOG_POSTS_HYB2$K') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dr_cnba_blog_posts_hyb2_n.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DR$CNBA_BLOG_POSTS_HYB2$N') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dr_cnba_blog_posts_hyb2_q.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DR$CNBA_BLOG_POSTS_HYB2$Q') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dr_cnba_blog_posts_hyb2_u.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DR$CNBA_BLOG_POSTS_HYB2$U') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/dr_cnba_blog_posts_hyb2_vr.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'DR$CNBA_BLOG_POSTS_HYB2$VR') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/gen_ai_configs.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'GEN_AI_CONFIGS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/gen_ai_config_tools.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'GEN_AI_CONFIG_TOOLS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/gen_ai_instructions.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'GEN_AI_INSTRUCTIONS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/gen_ai_logs.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'GEN_AI_LOGS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/gen_ai_tool_params.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'GEN_AI_TOOL_PARAMS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/gen_ai_tools.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'GEN_AI_TOOLS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/hx5_visitor_portal_devices.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'HX5_VISITOR_PORTAL_DEVICES') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/in_line_dl_files.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'IN_LINE_DL_FILES') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/ms_calendar_entries.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'MS_CALENDAR_ENTRIES') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/ms_calendar_sync_users.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'MS_CALENDAR_SYNC_USERS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/products.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'PRODUCTS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/sales_order_lines.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'SALES_ORDER_LINES') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/sales_orders.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'SALES_ORDERS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/sr_email_digest_q.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'SR_EMAIL_DIGEST_Q') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/us_states.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'US_STATES') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/vector_dr_cnba_blog_posts_hyb2_vi_142865_142876_0_ivf_flat_centroids.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'VECTOR$DR$CNBA_BLOG_POSTS_HYB2$VI$142865_142876_0$IVF_FLAT_CENTROIDS') FROM dual;
SPOOL OFF

SPOOL "/Users/jdixon/Documents/GitHub/CN/cn_blog_demos/TABLES/vector_dr_cnba_blog_posts_hyb2_vi_142865_142876_0_ivf_flat_centroid_partitions.sql"
SELECT DBMS_METADATA.GET_DDL('TABLE', 'VECTOR$DR$CNBA_BLOG_POSTS_HYB2$VI$142865_142876_0$IVF_FLAT_CENTROID_PARTITIONS') FROM dual;
SPOOL OFF

SET TERMOUT ON
SET FEEDBACK ON
SET VERIFY ON
SET HEADING ON
SET ECHO ON
PROMPT Table DDL export complete.

-- View Name: cndemo_addresses_v
CREATE OR REPLACE VIEW CNDEMO_ADDRESSES_V AS
SELECT address_id           
,      source_ref
,      status_code  
,      CASE status_code
         WHEN 'PENDING' THEN 'Pending'
         WHEN 'WIP' THEN 'In Process'
         WHEN 'PROCESSED' THEN 'Processed'
         WHEN 'ERROR' THEN 'Error'
       END status_name         
,      address_name         
,      iso_country_code     
,      street               
,      city                 
,      region               
,      postal_code          
,      match_count
,      match_address_json
,      CASE match_code
         WHEN 0	 THEN 'No Matches Found'
         WHEN 1	 THEN 'Exact Match'
         WHEN 2	 THEN 'Matched City, Postal Code, City, Street, House # - (Not Street Type, Suffix or Prefix)'
         WHEN 3	 THEN 'Matched City, Postal Code, City, Street - (Not House #)'
         WHEN 4	 THEN 'Matched City, Postal Code - (Not Street Address)'
         WHEN 10 THEN 'Matched City - (Not Postal Code)'
         WHEN 11 THEN 'Matched Postal Code - (Not City)'
         WHEN 12 THEN 'Matched Region - (Not City, Postal Code)'
         ELSE NULL
       END match_value
,      CASE match_code
         WHEN 0	 THEN 'u-danger-text'
         WHEN 1	 THEN 'u-success-text'
         WHEN 2	 THEN 'u-warning-text'
         WHEN 3	 THEN 'u-warning-text'
         WHEN 4	 THEN 'u-danger-text'
         WHEN 10 THEN 'u-danger-text'
         WHEN 11 THEN 'u-danger-text'
         WHEN 12 THEN 'u-danger-text'
         ELSE NULL
       END match_icon
,      CASE match_code
         WHEN 0	 THEN 0
         WHEN 1	 THEN 100
         WHEN 2	 THEN 90
         WHEN 3	 THEN 80
         WHEN 4	 THEN 50
         WHEN 10 THEN 10
         WHEN 11 THEN 10
         WHEN 12 THEN 10
         ELSE NULL
       END match_pct
,      match_code  sort_order
,      match_code           
,      match_vector         
,      match_longitude      
,      match_latitude       
,      match_error_message  
,      match_message        
,      status_date_time     
,      status_msg           
,      creation_date         
,      created_by            
,      last_update_date      
,      last_updated_by       
FROM   cndemo_addresses
/
SHOW ERR;
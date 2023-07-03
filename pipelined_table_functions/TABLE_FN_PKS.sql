CREATE OR REPLACE PACKAGE TABLE_FN_PK AUTHID DEFINER AS

-- Record Type used to define columns for the pipelined output.
TYPE rec_evs_sold IS RECORD
(year_sold      ev_sales_by_year.data_year%TYPE,
 make           ev_sales_by_year.make%TYPE,
 vehicles_sold  NUMBER,
 top_model      ev_sales_by_year.model%TYPE,
 top_model_pct  NUMBER);

-- Table type used to define the table output.
TYPE tt_rec_evs_sold IS TABLE OF rec_evs_sold;

-- 
TYPE rec_evs_sold1 IS RECORD
(year_sold      ev_sales_by_year.data_year%TYPE,
 make           ev_sales_by_year.make%TYPE,
 vehicles_sold  NUMBER,
 model          ev_sales_by_year.model%TYPE);
TYPE tt_rec_evs_sold1 IS TABLE OF rec_evs_sold1;

-- Function to generate the pipelined output.
FUNCTION evs_sold_by_year
  (p_fuel_type IN ev_sales_by_year.fuel_type%TYPE) RETURN tt_rec_evs_sold PIPELINED;

FUNCTION evs_sold_by_year_all RETURN tt_rec_evs_sold1 PIPELINED;

END TABLE_FN_PK;
/
SHOW ERR;

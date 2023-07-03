SET DEFINE OFF;
CREATE OR REPLACE PACKAGE BODY TABLE_FN_PK AS

FUNCTION evs_sold_by_year
  (p_fuel_type IN ev_sales_by_year.fuel_type%TYPE) RETURN tt_rec_evs_sold PIPELINED IS

  -- Cursor to generate total vehicles sold by make and year.
  CURSOR cr_evs_sold IS
    SELECT data_year
    ,      make
    ,      SUM(number_of_vehicles) vehicles_sold
    FROM   ev_sales_by_year
    WHERE  fuel_type = p_fuel_type
    GROUP BY data_year,make
    ORDER BY data_year DESC, vehicles_sold DESC;

  lr_ev             rec_evs_sold;
  l_top_model_sold  NUMBER;

BEGIN

  -- Only attempt to fetch data if the fuel type is Electric or Hydrogen
  -- This highlights an advantage of Pipelined Functions, you can decide which
  --   logic to execute based on the scenario.
  IF p_fuel_type IN ('Electric','Hydrogen') THEN

    -- Loop through the total vehicles sold by make and year.
    FOR r_ev_sold IN cr_evs_sold LOOP
      -- Start populating the record which will be piped out later.
      lr_ev.year_sold     := r_ev_sold.data_year;
      lr_ev.make          := r_ev_sold.make;
      lr_ev.vehicles_sold := r_ev_sold.vehicles_sold;
      
      -- Get the Top Selling Model for the Make, Year and Fuel Type.
      -- This code is here to illustrate that you can call various SQL, 
      --   procedures, functions, even REST APIs to calculate the output.
      SELECT model, SUM(number_of_vehicles) top_model_count
      INTO   lr_ev.top_model, l_top_model_sold
      FROM   ev_sales_by_year
      WHERE  fuel_type = p_fuel_type
      AND    make      = r_ev_sold.make
      AND    data_year = r_ev_sold.data_year
      GROUP BY model
      ORDER BY top_model_count DESC
      FETCH FIRST 1 ROW ONLY;
      
      -- Calculate the percentage the model makes up of the the total for the make.
      lr_ev.top_model_pct := ROUND((l_top_model_sold / r_ev_sold.vehicles_sold) * 100,0);

      -- Emit the row to the SELECT statement that called the pipelined function.
      pipe row(lr_ev);

    END LOOP;
 
  END IF;
  
EXCEPTION WHEN NO_DATA_NEEDED THEN
  -- Swallow this exception as we don't want to log this.
  NULL;
WHEN OTHERS THEN
  -- Log Error to Logging Framework.
  RAISE;
END evs_sold_by_year;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
FUNCTION evs_sold_by_year_all RETURN tt_rec_evs_sold1 PIPELINED IS

  -- Cursor to generate total vehicles sold by make and year.
  CURSOR cr_evs_sold IS
    SELECT *
    FROM   ev_sales_by_year;

  lr_ev             rec_evs_sold1;

BEGIN

  FOR r_ev_sold IN cr_evs_sold LOOP
    lr_ev.year_sold     := r_ev_sold.data_year;
    lr_ev.make          := r_ev_sold.make;
    lr_ev.model         := r_ev_sold.model;
    lr_ev.vehicles_sold := r_ev_sold.number_of_vehicles;
    pipe row(lr_ev);

  END LOOP;
  
EXCEPTION WHEN NO_DATA_NEEDED THEN
  -- Swallow this exception as we don't want to log this.
  NULL;
WHEN OTHERS THEN
  -- Log Error to Logging Framework.
  RAISE;
END evs_sold_by_year_all;

END TABLE_FN_PK;
/
SHOW ERR;
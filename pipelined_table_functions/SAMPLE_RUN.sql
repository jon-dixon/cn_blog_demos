SELECT year_sold
,      make
,      vehicles_sold
,      top_model
,      top_model_pct
FROM   table_fn_pk.evs_sold_by_year (p_fuel_type => 'Electric')
WHERE  vehicles_sold > 10000
AND    year_sold     > 2019;

SELECT *
FROM   table_fn_pk.evs_sold_by_year_all();
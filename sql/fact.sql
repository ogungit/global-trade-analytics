/* =========================================================
   File: fact.sql
   Purpose: Create analytics-ready fact table for BI reporting
   ========================================================= */

DROP TABLE IF EXISTS global_trade.fact_trade;

CREATE TABLE global_trade.fact_trade AS
SELECT
  ref_year,
  reporter_country,
  partner_country,
  trade_flow,
  product_code,
  product_desc,
  trade_value_usd
FROM global_trade.raw_trade_uncomtrade
WHERE trade_value_usd IS NOT NULL;

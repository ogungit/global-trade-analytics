/* =========================================================
   File: raw.sql
   Purpose: Create raw layer with standardized naming
   ========================================================= */

DROP TABLE IF EXISTS global_trade.raw_trade_uncomtrade;

CREATE TABLE global_trade.raw_trade_uncomtrade AS
SELECT
  ref_year,
  reporter_desc  AS reporter_country,
  partner_desc   AS partner_country,
  trade_flow,
  product_code,
  product_desc,
  trade_value_usd,
  agg_level
FROM global_trade.stage_trade_uncomtrade;

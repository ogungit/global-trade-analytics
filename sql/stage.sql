
/* =========================================================
   File: stage.sql
   Purpose: Create staging table for UN Comtrade CSV ingestion
   Notes:
   - Mirrors the cleaned CSV schema
   - Load the CSV into this table using pgAdmin Import/Export
   ========================================================= */

DROP TABLE IF EXISTS global_trade.stage_trade_uncomtrade;

CREATE TABLE global_trade.stage_trade_uncomtrade (
  ref_year        INTEGER,
  reporter_desc   TEXT,
  partner_desc    TEXT,
  trade_flow      TEXT,
  product_code    TEXT,
  product_desc    TEXT,
  trade_value_usd NUMERIC,
  agg_level       INTEGER
);

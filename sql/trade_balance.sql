/* =========================================================
   File: trade_balance.sql
   Purpose: Annual trade balance KPI (Exports - Imports)
   ========================================================= */

CREATE OR REPLACE VIEW global_trade.v_trade_balance_year AS
SELECT
  ref_year,
  SUM(CASE WHEN trade_flow = 'Export' THEN trade_value_usd ELSE 0 END) AS exports_usd,
  SUM(CASE WHEN trade_flow = 'Import' THEN trade_value_usd ELSE 0 END) AS imports_usd,
  SUM(CASE WHEN trade_flow = 'Export' THEN trade_value_usd ELSE 0 END)
    - SUM(CASE WHEN trade_flow = 'Import' THEN trade_value_usd ELSE 0 END) AS trade_balance_usd
FROM global_trade.fact_trade
GROUP BY ref_year
ORDER BY ref_year;

/* =========================================================
   File: analytics_views.sql
   Purpose: Analytical views for Top-N and trend reporting
   Notes:
   - Uses window functions for Top-N analysis per year
   ========================================================= */

-- Trade value by year and flow (Import vs Export trend)
CREATE OR REPLACE VIEW global_trade.v_trade_year_flow AS
SELECT
  ref_year,
  trade_flow,
  SUM(trade_value_usd) AS trade_value_usd
FROM global_trade.fact_trade
GROUP BY ref_year, trade_flow
ORDER BY ref_year, trade_flow;


-- Top 10 products per year (exactly 10 per year)
CREATE OR REPLACE VIEW global_trade.v_top10_products_each_year AS
SELECT
  ref_year,
  product_code,
  product_desc,
  total_trade_usd
FROM (
  SELECT
    ref_year,
    product_code,
    product_desc,
    SUM(trade_value_usd) AS total_trade_usd,
    ROW_NUMBER() OVER (
      PARTITION BY ref_year
      ORDER BY SUM(trade_value_usd) DESC
    ) AS rnk
  FROM global_trade.fact_trade
  GROUP BY ref_year, product_code, product_desc
) t
WHERE rnk <= 10;


-- Top 10 reporter countries per year (exactly 10 per year)
CREATE OR REPLACE VIEW global_trade.v_top10_countries_each_year AS
SELECT
  ref_year,
  reporter_country,
  total_trade_usd
FROM (
  SELECT
    ref_year,
    reporter_country,
    SUM(trade_value_usd) AS total_trade_usd,
    ROW_NUMBER() OVER (
      PARTITION BY ref_year
      ORDER BY SUM(trade_value_usd) DESC
    ) AS rnk
  FROM global_trade.fact_trade
  GROUP BY ref_year, reporter_country
) t
WHERE rnk <= 10;

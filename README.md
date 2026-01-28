Global Trade Analytics Dashboard
PostgreSQL | Advanced SQL | Power BI

Project Overview

This project delivers an end-to-end analytics solution for global trade data sourced from the UN Comtrade dataset. The objective was to design a robust data pipeline that transforms raw CSV files into analytics-ready fact tables and delivers meaningful insights through interactive Power BI dashboards.

The project emphasizes real-world data challenges such as schema mismatches, data type inconsistencies, and scalable aggregation strategies commonly encountered in enterprise analytics environments.
Architecture
CSV Source  
   → Staging Layer  
   → Raw Data Layer  
   → Fact Table  
   → SQL Analytics Views  
   → Power BI Dashboard
Each layer is purpose-built to ensure data reliability, performance, and analytical clarity.

Tools and Technologies
 PostgreSQL
 Advanced SQL (aggregations, window functions, analytical views)
 Power BI (DAX, interactive visuals)
 GitHub (version control and documentation)

Data Modeling Approach
  Staging Layer
Mirrors the CSV schema exactly for safe data ingestion
Handles raw, unvalidated data without transformations
Raw Layer
Standardizes column naming conventions
Applies consistent data types
Serves as a stable source of truth

  Fact Layer
Optimized for analytical queries and BI consumption
Contains clean measures and dimensional attributes
Supports efficient aggregations and slicing
 
  Analytics Views
Pre-aggregated views for common business questions
Improves Power BI performance
Simplifies dashboard logic

 Key Analytics Implemented
Import vs Export trends over time
Top 10 traded products per year using window functions
Top 10 trading countries per year
Annual trade balance (Exports minus Imports)
Year-over-Year trade growth using Power BI DAX measures

  SQL Highlights
Multi-layer data modeling (stage → raw → fact)
Window functions (ROW_NUMBER, DENSE_RANK) for Top-N analysis
Conditional aggregations for financial metrics
Performance-oriented grouping and filtering strategies

  Power BI Dashboard Features
Interactive line charts for trade trends
Bar charts highlighting top countries and products
Trade balance visualizations
Year and trade flow slicers for dynamic analysis
Clean separation between SQL logic and DAX calculations

 Key Learnings
Designed a scalable analytics pipeline following industry best practices
Resolved real-world CSV ingestion and schema alignment issues
Applied advanced SQL patterns for ranking and aggregation
Determined appropriate placement of logic between SQL and Power BI
Built executive-ready dashboards focused on clarity and performance

---Query 1: First 10 Records---
SELECT * FROM sales_virtual_report_db.hol9raw_data
LIMIT 10;

-- Query 2: Orders by Product Category
SELECT category, COUNT(*) AS order_count
FROM sales_virtual_report_db.hol9raw_data
GROUP BY category
ORDER BY order_count DESC
LIMIT 10;

-- Query 3: Revenue and Quantity by Fulfilment Method
SELECT fulfilment,
       COUNT(*) AS total_orders,
       SUM(CAST(qty AS INT)) AS total_units_sold,
       SUM(CAST(amount AS DOUBLE)) AS total_revenue
FROM sales_virtual_report_db.hol9raw_data
WHERE status NOT IN ('Cancelled', 'Pending')
GROUP BY fulfilment
ORDER BY total_revenue DESC
LIMIT 10;

-- Query 4: Monthly Sales Trend
-- Dates are in MM-DD-YY format; extract YY-MM for ordering
SELECT SUBSTR(date, 7, 2) || '-' || SUBSTR(date, 1, 2) AS month,
       COUNT(*) AS total_orders,
       SUM(CAST(amount AS DOUBLE)) AS total_revenue
FROM sales_virtual_report_db.hol9raw_data
WHERE status NOT IN ('Cancelled', 'Pending')
GROUP BY SUBSTR(date, 7, 2) || '-' || SUBSTR(date, 1, 2)
ORDER BY month ASC
LIMIT 10;

-- Query 5: Top 5 Best-Selling SKUs per Category
WITH ranked_skus AS (
  SELECT category,
         sku,
         SUM(CAST(amount AS DOUBLE)) AS total_revenue,
         SUM(CAST(qty AS INT)) AS total_units_sold,
         ROW_NUMBER() OVER (
           PARTITION BY category
           ORDER BY SUM(CAST(amount AS DOUBLE)) DESC
         ) AS rank
  FROM sales_virtual_report_db.hol9raw_data
  WHERE status NOT IN ('Cancelled', 'Pending')
    AND CAST(qty AS INT) > 0
  GROUP BY category, sku
)
SELECT category, sku, total_revenue, total_units_sold, rank
FROM ranked_skus
WHERE rank <= 5
LIMIT 10;

-- ====================================================================
-- PROJECT: Global Marketing & Sales Data Pipeline
-- PURPOSE: Production Data Validation & Analytical Queries
-- ====================================================================

-- --------------------------------------------------------------------
-- QUERY 1: Top 5 Revenue-Generating Products
-- --------------------------------------------------------------------
SELECT product_name, category, SUM(total_sales_inr) as total_revenue
FROM marketing_sales_db.global_sales
GROUP BY product_name, category
ORDER BY total_revenue DESC
LIMIT 5;

/*  METRIC RESULT:
1. Samsung 49-Inch Monitor   | Electronics | 122,806,771.91 INR
2. John Hardy Dragon Chain   | Jewelry     |  95,276,160.00 INR
3. Acer SB220Q 21.5" Monitor | Electronics |  74,367,048.00 INR
4. Solid Gold Petite Ring    | Jewelry     |  21,224,448.00 INR
5. WD 4TB Gaming Drive       | Electronics |  16,221,744.00 INR
*/


-- --------------------------------------------------------------------
-- QUERY 2: Country-wise Sales, Volume, and Customer Satisfaction
-- --------------------------------------------------------------------
SELECT Customer_Country, 
       SUM(Quantity) as Total_Units_Sold, 
       ROUND(SUM(Total_Sales_INR), 2) as Total_Revenue_INR,
       ROUND(AVG(Product_Rating), 2) as Avg_Rating
FROM marketing_sales_db.global_sales
GROUP BY Customer_Country
ORDER BY Total_Revenue_INR DESC;

/*  METRIC RESULT:
Country   | Units Sold | Total Revenue (INR) | Avg Rating
----------+------------+---------------------+------------
UK        | 5281       | 72,473,033.64       | 3.59
Germany   | 5296       | 71,558,261.88       | 3.56
USA       | 5331       | 70,893,932.76       | 3.60
India     | 5317       | 70,274,135.40       | 3.56
Canada    | 5234       | 67,463,031.72       | 3.58
Australia | 5201       | 66,562,942.32       | 3.58
*/


-- --------------------------------------------------------------------
-- QUERY 3: Distribution of Transactions across Payment Methods
-- --------------------------------------------------------------------
SELECT payment_method,
       COUNT(order_id) as Total_transactions,
       ROUND(SUM(total_sales_inr), 2) as total_sales
FROM marketing_sales_db.global_sales
GROUP BY payment_method
ORDER BY Total_transactions DESC;

/* METRIC RESULT:
Method       | Transactions | Total Sales (INR)
-------------+--------------+------------------
UPI          | 2686         | 107,588,133.24
Credit Card  | 2610         | 107,679,568.08
PayPal       | 2628         | 103,990,356.96
Net Banking  | 2576         |  99,967,279.44
[Blank/Null] |   69         |            --0.00
*/

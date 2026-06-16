-- ====================================================================
-- PROJECT: Global Marketing & Sales Data Pipeline
-- PURPOSE: Creating an External Table in Amazon Athena with OpenCSVSerde
--          to prevent data shifting/mixing issues.
-- ====================================================================

-- Step 1: Drop the table if it already exists to clear bad metadata/cache
DROP TABLE IF EXISTS marketing_sales_db.global_sales;

-- Step 2: Create the external table with correct data types and strict CSV schema mapping
CREATE EXTERNAL TABLE IF NOT EXISTS marketing_sales_db.global_sales (
    Order_ID STRING,
    Order_Date STRING,
    Product_ID INT,
    Product_Name STRING,
    Category STRING,
    Price_INR DOUBLE,
    Quantity INT,
    Total_Sales_INR DOUBLE,
    Customer_Country STRING,
    Payment_Method STRING,
    Product_Rating DOUBLE,
    Pipeline_Run_Time STRING
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
STORED AS TEXTFILE
LOCATION 's3://utkarsh-marketing-sales-data/'
TBLPROPERTIES ('skip.header.line.count'='1');
  

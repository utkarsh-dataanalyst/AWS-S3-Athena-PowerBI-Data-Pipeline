# AWS Data Pipeline and Business Intelligence Dashboard

An enterprise-grade data pipeline designed to automate synthetic data extraction, cloud storage, schema architecture, serverless data warehousing, and interactive executive reporting.

---

## System Architecture and Data Flow

1. **Data Generation:** Python script simulating over 10,500 global marketing and sales records.
2. **Cloud Storage (Data Lake):** Secure raw landing zone built using Amazon S3.
3. **Data Warehousing (Serverless SQL):** Amazon Athena connects directly to S3 to structure, clean, and run analytical queries using standard ANSI SQL.
4. **BI Integration Bypass:** Developed a custom programmatic Python connection within Power BI Desktop to securely stream data via AWS APIs, bypassing traditional local ODBC/DSN driver limitations.
5. **Executive Visualizations:** Interactive Power BI Dashboard tracking high-level revenue KPIs and regional performance.

---

## Tech Stack
* **Languages:** Python (Pandas, Boto3, Matplotlib), SQL (HiveQL / Amazon Athena)
* **Cloud Platform:** AWS (S3, Athena, IAM security policies)
* **Business Intelligence:** Power BI Desktop

---

## Key Insights from Athena Analytics

### 1. Revenue Performance (Top Products)
* The Samsung 49-Inch Curved Gaming Monitor emerged as the highest revenue driver, generating over 12.2 Crore INR. High-ticket tech items dominate the overall market share in this dataset.

### 2. Global Market Stability
* Sales volume is evenly distributed across global regions (UK, Germany, USA, India, Canada, Australia), with each country contributing approximately 5,200 to 5,300 units sold.
* Customer satisfaction remains uniform, maintaining an average rating of 3.58/5 across all territories.

### 3. Payment Infrastructure and Data Integrity
* Digital payment distribution is highly competitive: UPI leads transaction counts (2,686), followed closely by PayPal (2,628) and Credit Cards (2,610).
* **Data Engineering Observation:** Detected 69 transactions with blank payment methods during the validation phase. Handled schema alignment programmatically to preserve pipeline execution and prevent analytical skew.

---

## Production Challenges and Resolutions

* **The Challenge:** Athena experienced schema shifting and data corruption (columns mixing) due to standard comma separation discrepancies in text files.
* **The Resolution:** Rewrote the Data Definition Language (DDL) using `OpenCSVSerde` with strict separation and quote character settings to lock column parameters.
* **The Challenge:** Power BI threw authentication and driver dependency errors when using standard web URLs and local DSN paths.
* **The Resolution:** Built a secure programmatic ingestion bypass utilizing Python's `boto3` client inside Power BI to handle authentication directly via encrypted AWS IAM keys.

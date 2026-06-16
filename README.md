# AWS Data Pipeline and Business Intelligence Dashboard

An enterprise-grade data pipeline designed to automate synthetic data extraction, cloud storage, schema architecture, serverless data warehousing, and interactive executive reporting.

---

## System Architecture and Data Flow

*   **Data Generation:** Python script simulating over 10,500 global marketing and sales records.
*   **Cloud Storage (Data Lake):** Secure raw landing zone built using Amazon S3.
*   **Data Warehousing (Serverless SQL):** Amazon Athena connects directly to S3 to structure, clean, and run analytical queries using standard ANSI SQL.
*   **BI Integration Bypass:** Developed a custom programmatic Python connection within Power BI Desktop to securely stream data via AWS APIs, bypassing traditional local ODBC/DSN driver limitations.
*   **Executive Visualizations:** Interactive Power BI Dashboard tracking high-level revenue KPIs and regional performance.

---

## Tech Stack

*   **Languages:** Python (Pandas, Boto3, Matplotlib), SQL (HiveQL / Amazon Athena)
*   **Cloud Platform:** AWS (S3, Athena, IAM security policies)
*   **Business Intelligence:** Power BI Desktop

---

## Production-Ready Executive Dashboard

Below is the production-ready interactive dashboard built for executive decision-making. It features dynamic category and date filter controls, optimized UI/UX alignment, and clean financial scaling.

![Executive Dashboard Insights](AWS Data Pipeline and Business Intelligence Dashboard.png)

---

## Key Insights from Athena and Power BI Analytics

### 1. Financial Performance and Scale
The total pipeline volume successfully processed 10.5K orders, yielding a consolidated Total Revenue of 419.22M INR. Complex decimal loads were cleaned and capped at two decimal places across all critical metrics to ensure high-level readability for leadership.

### 2. Global Market and Rating Analysis
The sales volume demonstrates a well-distributed pattern across primary global regions including the UK, Germany, USA, India, Canada, and Australia. The global consumer response remains steady with an Average Customer Rating stabilized at 3.67 out of 5.

### 3. Payment Infrastructure and Data Integrity
Digital payment distribution shows high competitive density. UPI drives the highest volume with 2.69K transactions, followed closely by PayPal (2.63K), Credit Cards (2.61K), and Net Banking (2.58K). 
*Data Engineering Observation:* Operational validation successfully isolated 69 transaction anomalies containing missing or blank payment methods. These were processed programmatically during the ETL stage to preserve downstream reporting accuracy and avoid metric skew.

---

## Production Challenges and Resolutions

*   **The Challenge:** Athena experienced schema shifting and data corruption (columns mixing) due to standard comma separation discrepancies in text files.
    *   *The Resolution:* Rewrote the Data Definition Language (DDL) using OpenCSVSerde with strict separation and quote character settings to lock column parameters.
*   **The Challenge:** Power BI threw authentication and driver dependency errors when using standard web URLs and local DSN paths.
    *   *The Resolution:* Built a secure programmatic ingestion bypass utilizing Python's boto3 client inside Power BI to handle authentication directly via encrypted AWS IAM keys.

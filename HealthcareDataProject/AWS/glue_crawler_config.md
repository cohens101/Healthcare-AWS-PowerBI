Glue crawler config (crawler target, database, and table prefix)

Crawler name
- healthcare-raw-crawler

Purpose
- Detect schemas from raw CSV files in S3 and register them as tables in the Glue Data Catalog.

Data source
- Data store: S3
- Include path:
  - s3://healthcareawspowerbi/healthcare/raw/
- Exclude patterns (recommended)
  - **/athena-results/**
  - **/curated/**
  - **/_temporary/**
  - **/_SUCCESS**

Crawler settings
- IAM role
  - Use a Glue service role that can read the bucket and write to the Data Catalog
  - Minimum S3 permissions:
    - s3:ListBucket on healthcareawspowerbi
    - s3:GetObject on healthcare/raw/*
- Data catalog settings
  - Database: healthcare_raw
  - Table prefix: raw_   (example: raw_dim_patient, raw_fact_claim_line)
  - Create a single schema per folder (one table per dataset folder)

Classifier
- CSV classifier (if Glue does not infer correctly)
  - Delimiter: ,
  - Quote: "
  - Header: present (skip header line count = 1)
Notes
- If the crawler creates wrong column types, rerun after:
  - deleting the table in Glue (not the S3 files)
  - fixing the CSV headers or data format
- Keep raw folders stable. Changing column order across files causes bad schemas.

How to verify
- Glue Console
  - Data Catalog > Databases > healthcare_raw
  - Confirm tables exist for your raw folders
  - Open a table > Schema tab to confirm columns look correct

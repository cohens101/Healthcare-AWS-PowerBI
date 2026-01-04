S3 layout plan (raw, curated, athena-results)

Bucket
- s3://healthcareawspowerbi/

Root project prefix
- s3://healthcareawspowerbi/healthcare/

Folders
1) Raw (landing zone for source files)
- s3://healthcareawspowerbi/healthcare/raw/
- One folder per dataset/table
  - healthcare/raw/dim_patient/
  - healthcare/raw/dim_facility/
  - healthcare/raw/dim_payer/
  - healthcare/raw/fact_claim_line/
  - healthcare/raw/fact_encounter/
  - healthcare/raw/fact_patient_experience_monthly/
Notes
- Keep files in CSV format here
- Keep headers in the CSV files
- If you upload multiple files per table, keep the same column order

2) Curated (analytics-ready outputs)
- s3://healthcareawspowerbi/healthcare/curated/
- One folder per curated table or view output (CTAS results)
  - healthcare/curated/curated_claim_line/
  - healthcare/curated/curated_encounter/
  - healthcare/curated/curated_patient_experience/
Notes
- Prefer Parquet for curated outputs
- If using Athena CTAS, each table needs a clean, dedicated folder
- If you rerun CTAS and get HIVE_PATH_ALREADY_EXISTS, delete the objects inside the table folder and rerun

3) Athena results (query output only)
- s3://healthcareawspowerbi/healthcare/athena-results/
Notes
- This folder is only for Athena workgroup results
- Do not point Glue crawlers at this folder

Optional (recommended)
- healthcare/glue-temp/   (Glue job temp directory)
- healthcare/logs/        (optional storage for exported logs)

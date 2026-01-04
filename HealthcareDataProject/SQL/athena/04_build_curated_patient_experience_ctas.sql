CREATE TABLE healthcare_curated.curated_patient_experience
WITH (
  format = 'PARQUET',
  external_location = 's3://<S3_BUCKET>/<CURATED_PREFIX>/curated_patient_experience/',
  parquet_compression = 'SNAPPY',
  partitioned_by = ARRAY['px_year','px_month']
) AS
SELECT
  DATE_PARSE(CONCAT(month, '-01'), '%Y-%m-%d') AS month_date,
  CAST(SUBSTR(month, 1, 4) AS integer) AS px_year,
  CAST(SUBSTR(month, 6, 2) AS integer) AS px_month,
  facility_id,
  domain,
  COALESCE(top_box_percent, 0.0) AS top_box_percent,
  COALESCE(respondents, 0) AS respondents
FROM healthcare_raw.fact_patient_experience_monthly;

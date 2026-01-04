CREATE TABLE healthcare_curated.curated_encounter
WITH (
  format = 'PARQUET',
  external_location = 's3://<S3_BUCKET>/<CURATED_PREFIX>/curated_encounter/',
  parquet_compression = 'SNAPPY',
  partitioned_by = ARRAY['admit_year','admit_month']
) AS
SELECT
  encounter_id,
  patient_id,
  facility_id,
  provider_id,
  DATE_PARSE(admit_date, '%Y-%m-%d') AS admit_date,
  DATE_PARSE(discharge_date, '%Y-%m-%d') AS discharge_date,
  CAST(SUBSTR(admit_date, 1, 4) AS integer) AS admit_year,
  CAST(SUBSTR(admit_date, 6, 2) AS integer) AS admit_month,
  encounter_type,
  primary_diagnosis_code,
  DATE_DIFF('day', DATE_PARSE(admit_date, '%Y-%m-%d'), DATE_PARSE(discharge_date, '%Y-%m-%d')) AS length_of_stay_days
FROM healthcare_raw.fact_encounter;

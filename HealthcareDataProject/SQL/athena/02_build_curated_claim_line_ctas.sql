CREATE TABLE healthcare_curated.curated_claim_line
WITH (
  format = 'PARQUET',
  external_location = 's3://<S3_BUCKET>/<CURATED_PREFIX>/curated_claim_line/',
  parquet_compression = 'SNAPPY',
  partitioned_by = ARRAY['service_year','service_month']
) AS
SELECT
  claim_line_id,
  claim_id,
  patient_id,
  facility_id,
  payer_id,
  DATE_PARSE(service_date, '%Y-%m-%d') AS service_date,
  CAST(SUBSTR(service_date, 1, 4) AS integer) AS service_year,
  CAST(SUBSTR(service_date, 6, 2) AS integer) AS service_month,
  hcpcs_code,
  revenue_code,
  COALESCE(units, 0) AS units,
  COALESCE(charge_amount, 0.0) AS charge_amount,
  COALESCE(allowed_amount, 0.0) AS allowed_amount,
  COALESCE(paid_amount, 0.0) AS paid_amount,
  CASE WHEN COALESCE(denied_flag, 0) = 1 THEN 1 ELSE 0 END AS denied_flag,
  denial_reason_code
FROM healthcare_raw.fact_claim_line;

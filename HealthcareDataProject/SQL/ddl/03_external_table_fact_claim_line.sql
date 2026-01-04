-- Example external table for raw CSV (only if you are not using Glue Crawler)
CREATE EXTERNAL TABLE IF NOT EXISTS healthcare_raw.fact_claim_line (
  claim_line_id      string,
  claim_id           string,
  patient_id         string,
  facility_id        string,
  payer_id           string,
  service_date       string,
  hcpcs_code         string,
  revenue_code       string,
  units              int,
  charge_amount      double,
  allowed_amount     double,
  paid_amount        double,
  denied_flag        int,
  denial_reason_code string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ('separatorChar' = ',', 'quoteChar'='"', 'escapeChar'='\\')
LOCATION 's3://<S3_BUCKET>/<RAW_PREFIX>/fact_claim_line/'
TBLPROPERTIES ('skip.header.line.count'='1');

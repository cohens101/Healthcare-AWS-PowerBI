-- Example external table for raw CSV (only if you are not using Glue Crawler)
CREATE EXTERNAL TABLE IF NOT EXISTS healthcare_raw.fact_patient_experience_monthly (
  month           string,
  facility_id     string,
  domain          string,
  top_box_percent double,
  respondents     int
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ('separatorChar' = ',', 'quoteChar'='"', 'escapeChar'='\\')
LOCATION 's3://<S3_BUCKET>/<RAW_PREFIX>/fact_patient_experience_monthly/'
TBLPROPERTIES ('skip.header.line.count'='1');

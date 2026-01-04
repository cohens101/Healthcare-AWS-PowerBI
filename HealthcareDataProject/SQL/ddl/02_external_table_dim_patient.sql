-- Example external table for raw CSV (only if you are not using Glue Crawler)
CREATE EXTERNAL TABLE IF NOT EXISTS healthcare_raw.dim_patient (
  patient_id string,
  first_name string,
  last_name  string,
  gender     string,
  birth_date string,
  city       string,
  state      string,
  zip        string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ('separatorChar' = ',', 'quoteChar'='"', 'escapeChar'='\\')
LOCATION 's3://<S3_BUCKET>/<RAW_PREFIX>/dim_patient/'
TBLPROPERTIES ('skip.header.line.count'='1');

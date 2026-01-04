-- Example external table for raw CSV (only if you are not using Glue Crawler)
CREATE EXTERNAL TABLE IF NOT EXISTS healthcare_raw.fact_encounter (
  encounter_id           string,
  patient_id             string,
  facility_id            string,
  provider_id            string,
  admit_date             string,
  discharge_date         string,
  encounter_type         string,
  primary_diagnosis_code string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES ('separatorChar' = ',', 'quoteChar'='"', 'escapeChar'='\\')
LOCATION 's3://<S3_BUCKET>/<RAW_PREFIX>/fact_encounter/'
TBLPROPERTIES ('skip.header.line.count'='1');

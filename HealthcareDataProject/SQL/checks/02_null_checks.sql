SELECT
  SUM(CASE WHEN claim_line_id IS NULL OR claim_line_id = '' THEN 1 ELSE 0 END) AS null_claim_line_id,
  SUM(CASE WHEN claim_id      IS NULL OR claim_id = ''      THEN 1 ELSE 0 END) AS null_claim_id,
  SUM(CASE WHEN patient_id    IS NULL OR patient_id = ''    THEN 1 ELSE 0 END) AS null_patient_id,
  SUM(CASE WHEN service_date  IS NULL                       THEN 1 ELSE 0 END) AS null_service_date
FROM healthcare_curated.curated_claim_line;

SELECT
  SUM(CASE WHEN encounter_id IS NULL OR encounter_id = '' THEN 1 ELSE 0 END) AS null_encounter_id,
  SUM(CASE WHEN patient_id   IS NULL OR patient_id = ''   THEN 1 ELSE 0 END) AS null_patient_id,
  SUM(CASE WHEN admit_date   IS NULL                      THEN 1 ELSE 0 END) AS null_admit_date
FROM healthcare_curated.curated_encounter;

SELECT
  SUM(CASE WHEN month_date  IS NULL THEN 1 ELSE 0 END) AS null_month_date,
  SUM(CASE WHEN facility_id IS NULL OR facility_id = '' THEN 1 ELSE 0 END) AS null_facility_id,
  SUM(CASE WHEN domain      IS NULL OR domain = ''      THEN 1 ELSE 0 END) AS null_domain
FROM healthcare_curated.curated_patient_experience;

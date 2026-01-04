CREATE OR REPLACE VIEW healthcare_curated.vw_revenue_cycle_monthly AS
SELECT
  DATE_TRUNC('month', service_date) AS month_start,
  payer_id,
  facility_id,
  SUM(charge_amount)  AS total_charges,
  SUM(allowed_amount) AS total_allowed,
  SUM(paid_amount)    AS total_paid,
  SUM(CASE WHEN denied_flag = 1 THEN 1 ELSE 0 END) AS denied_lines,
  COUNT(*) AS total_lines
FROM healthcare_curated.curated_claim_line
GROUP BY 1,2,3;

CREATE OR REPLACE VIEW healthcare_curated.vw_utilization_monthly AS
SELECT
  DATE_TRUNC('month', admit_date) AS month_start,
  facility_id,
  encounter_type,
  COUNT(*) AS total_encounters,
  AVG(length_of_stay_days) AS avg_los_days
FROM healthcare_curated.curated_encounter
GROUP BY 1,2,3;

CREATE OR REPLACE VIEW healthcare_curated.vw_patient_experience_monthly AS
SELECT
  month_date,
  facility_id,
  domain,
  top_box_percent,
  respondents
FROM healthcare_curated.curated_patient_experience;

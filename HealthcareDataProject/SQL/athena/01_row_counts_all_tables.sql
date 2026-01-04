SELECT 'dim_patient' AS table_name, COUNT(*) AS row_count FROM healthcare_raw.dim_patient
UNION ALL SELECT 'dim_facility', COUNT(*) FROM healthcare_raw.dim_facility
UNION ALL SELECT 'dim_payer', COUNT(*) FROM healthcare_raw.dim_payer
UNION ALL SELECT 'fact_claim_line', COUNT(*) FROM healthcare_raw.fact_claim_line
UNION ALL SELECT 'fact_encounter', COUNT(*) FROM healthcare_raw.fact_encounter
UNION ALL SELECT 'fact_patient_experience_monthly', COUNT(*) FROM healthcare_raw.fact_patient_experience_monthly
ORDER BY table_name;

SELECT 'raw_fact_claim_line' AS table_name, COUNT(*) AS row_count FROM healthcare_raw.fact_claim_line
UNION ALL SELECT 'curated_claim_line', COUNT(*) FROM healthcare_curated.curated_claim_line
UNION ALL SELECT 'raw_fact_encounter', COUNT(*) FROM healthcare_raw.fact_encounter
UNION ALL SELECT 'curated_encounter', COUNT(*) FROM healthcare_curated.curated_encounter
UNION ALL SELECT 'raw_fact_patient_experience_monthly', COUNT(*) FROM healthcare_raw.fact_patient_experience_monthly
UNION ALL SELECT 'curated_patient_experience', COUNT(*) FROM healthcare_curated.curated_patient_experience
ORDER BY table_name;

SELECT COUNT(*) AS orphan_claim_lines_patient
FROM healthcare_curated.curated_claim_line c
LEFT JOIN healthcare_raw.dim_patient p
  ON c.patient_id = p.patient_id
WHERE p.patient_id IS NULL;

SELECT COUNT(*) AS orphan_encounters_facility
FROM healthcare_curated.curated_encounter e
LEFT JOIN healthcare_raw.dim_facility f
  ON e.facility_id = f.facility_id
WHERE f.facility_id IS NULL;

SELECT COUNT(*) AS orphan_px_facility
FROM healthcare_curated.curated_patient_experience x
LEFT JOIN healthcare_raw.dim_facility f
  ON x.facility_id = f.facility_id
WHERE f.facility_id IS NULL;

SELECT claim_line_id, COUNT(*) AS cnt
FROM healthcare_curated.curated_claim_line
GROUP BY claim_line_id
HAVING COUNT(*) > 1
ORDER BY cnt DESC;

SELECT encounter_id, COUNT(*) AS cnt
FROM healthcare_curated.curated_encounter
GROUP BY encounter_id
HAVING COUNT(*) > 1
ORDER BY cnt DESC;

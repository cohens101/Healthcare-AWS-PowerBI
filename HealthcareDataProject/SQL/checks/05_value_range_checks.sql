SELECT
  SUM(CASE WHEN charge_amount  < 0 THEN 1 ELSE 0 END) AS neg_charge_rows,
  SUM(CASE WHEN allowed_amount < 0 THEN 1 ELSE 0 END) AS neg_allowed_rows,
  SUM(CASE WHEN paid_amount    < 0 THEN 1 ELSE 0 END) AS neg_paid_rows
FROM healthcare_curated.curated_claim_line;

SELECT
  SUM(CASE WHEN denied_flag NOT IN (0,1) THEN 1 ELSE 0 END) AS invalid_denied_flag
FROM healthcare_curated.curated_claim_line;

SELECT
  SUM(CASE WHEN length_of_stay_days < 0 THEN 1 ELSE 0 END) AS negative_los
FROM healthcare_curated.curated_encounter;

Athena settings (query result location and workgroup settings)

Workgroup
- Use a dedicated workgroup for the project (recommended)
  - Name: healthcare-powerbi
- If you use the default workgroup, still set the results location.

Query result location (required)
- s3://healthcareawspowerbi/healthcare/athena-results/

Recommended workgroup options
- Enforce workgroup settings: ON
- Query result location: set to the path above
- Encryption: SSE-S3 (simple, good default)
- Publish CloudWatch metrics: ON (optional but nice proof)

Engine
- Athena engine version: v3 (recommended)

How to set it
1) Athena Console
2) Workgroups
3) Select your workgroup (or create one)
4) Edit
5) Set query result location to:
   s3://healthcareawspowerbi/healthcare/athena-results/
6) Save

Quick checks
- Run a simple query:
  SELECT COUNT(*) FROM healthcare_raw.dim_patient;
- Confirm an output file appears under:
  healthcare/athena-results/
- If Power BI is connecting via ODBC:
  - Workgroup name in the DSN should match your workgroup
  - Your IAM user/role must have athena:GetWorkGroup permission

# Healthcare AWS + Power BI Analytics

## Overview
Healthcare analytics project using AWS and Power BI. Purpose: move from raw CSV files in S3 to curated Athena outputs, then build a multi-page Power BI dashboard for revenue cycle, utilization, and patient experience.


Full write-up and visuals live in `Documents/`.

## What this project shows
- S3 data lake layout (raw → curated → athena-results)
- Glue crawler setup to create tables in the AWS Data Catalog
- Athena SQL for row-count validation, data quality checks, and curated outputs
- Power BI star schema + measures to support interactive reporting
- Jira-driven delivery tracking (export included)

## Dashboard pages
- Page 1: Revenue Cycle
- Page 2: Utilization and Quality
- Page 3: Clinical and Experience

## Key docs
- Project summary: `Documents/HealthcareAWSSummary.pdf`
- KPI definitions: `Documents/HealthcareKPIDefinitions.pdf`
- Architecture diagram: `Documents/Architecture.png`

## How to view the dashboard
- Open the Power BI file: `Dashboard/HealthcareAWSPowerBI.pbix`
- If you only want a quick view, check the screenshots:
  - `Dashboard/HealthcareDash1.png`
  - `Dashboard/HealthcareDash2.png`
  - `Dashboard/HealthcareDash3.png`
 
## Key findings
- Denials ran at 10.16%, with $3.85M paid out of $11.00M in total charges
- Medicare led paid amount at ~28.4%
- 30-day readmissions were 10.29% across 12.0K encounters
- Patient experience scored 73.58 top box vs an 80 target, based on 219K respondents


## Repo structure
```text
HealthcareDataProject/
├─ AWS/
│  ├─ s3_layout.md
│  ├─ glue_crawler_config.md
│  └─ athena_settings.md
│
├─ Dashboard/
│  ├─ HealthcareAWSPowerBI.pbix
│  ├─ HealthcareDash1.png
│  ├─ HealthcareDash2.png
│  └─ HealthcareDash3.png
│
├─ Documents/
│  ├─ Architecture.png
│  ├─ HealthcareAWSSummary.pdf
│  └─ HealthcareKPIDefinitions.pdf
│
├─ Images/
│  ├─ AWS Console/
│  └─ Jira/
│
├─ Project Management/
│  └─ Jira.csv
│
└─ SQL/
   ├─ athena/
   ├─ ddl/
   └─ checks/

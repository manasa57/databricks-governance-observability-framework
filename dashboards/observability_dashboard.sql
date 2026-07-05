-- ===========================================================
-- OBSERVABILITY DASHBOARD
-- Databricks Governance & Observability Framework
-- ===========================================================

--------------------------------------------------------------
-- Executive KPI Cards
--------------------------------------------------------------

SELECT
COUNT(*) AS total_tables
FROM platform_monitoring.asset_health;

--------------------------------------------------------------

SELECT
COUNT(*) AS total_jobs
FROM platform_monitoring.job_health;

--------------------------------------------------------------

SELECT
COUNT(*) AS active_alerts
FROM platform_monitoring.alerts
WHERE alert_status='ACTIVE';

--------------------------------------------------------------

SELECT
ROUND(AVG(success_rate),2) AS average_job_success_rate
FROM platform_monitoring.job_health;

--------------------------------------------------------------
-- Asset Health Overview
--------------------------------------------------------------

SELECT
table_name,
health_status,
days_unused,
total_accesses
FROM platform_monitoring.asset_health
ORDER BY total_accesses DESC;

--------------------------------------------------------------
-- Read vs Write Activity
--------------------------------------------------------------

SELECT
table_name,
read_count,
write_count
FROM platform_monitoring.asset_health
ORDER BY read_count DESC;

--------------------------------------------------------------
-- Most Accessed Tables
--------------------------------------------------------------

SELECT
table_name,
total_accesses
FROM platform_monitoring.asset_health
ORDER BY total_accesses DESC
LIMIT 10;

--------------------------------------------------------------
-- Least Accessed Tables
--------------------------------------------------------------

SELECT
table_name,
total_accesses
FROM platform_monitoring.asset_health
ORDER BY total_accesses ASC
LIMIT 10;

--------------------------------------------------------------
-- Job Health
--------------------------------------------------------------

SELECT
job_name,
success_rate,
failed_runs,
avg_runtime,
job_health_status
FROM platform_monitoring.job_health
ORDER BY success_rate ASC;

--------------------------------------------------------------
-- Failed Jobs
--------------------------------------------------------------

SELECT
job_name,
failed_runs
FROM platform_monitoring.job_health
ORDER BY failed_runs DESC;

--------------------------------------------------------------
-- Average Runtime
--------------------------------------------------------------

SELECT
job_name,
avg_runtime
FROM platform_monitoring.job_health
ORDER BY avg_runtime DESC;
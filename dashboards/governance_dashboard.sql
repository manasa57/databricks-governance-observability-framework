-- ===========================================================
-- GOVERNANCE DASHBOARD
-- Databricks Governance & Observability Framework
-- ===========================================================

--------------------------------------------------------------
-- Total Governance Violations
--------------------------------------------------------------

SELECT
COUNT(*) AS total_violations
FROM platform_monitoring.governance_violations;

--------------------------------------------------------------
-- Violations by Severity
--------------------------------------------------------------

SELECT
severity,
COUNT(*) AS total
FROM platform_monitoring.governance_violations
GROUP BY severity
ORDER BY total DESC;

--------------------------------------------------------------
-- Violations by Type
--------------------------------------------------------------

SELECT
violation_type,
COUNT(*) AS total
FROM platform_monitoring.governance_violations
GROUP BY violation_type
ORDER BY total DESC;

--------------------------------------------------------------
-- Open Violations
--------------------------------------------------------------

SELECT
object_name,
object_type,
severity,
violation_type,
recommendation
FROM platform_monitoring.governance_violations
WHERE status='OPEN'
ORDER BY severity DESC;

--------------------------------------------------------------
-- Active Alerts
--------------------------------------------------------------

SELECT
severity,
COUNT(*) AS active_alerts
FROM platform_monitoring.alerts
GROUP BY severity
ORDER BY active_alerts DESC;

--------------------------------------------------------------
-- Alert Details
--------------------------------------------------------------

SELECT
object_name,
severity,
alert_message,
alert_time
FROM platform_monitoring.alerts
ORDER BY alert_time DESC;

--------------------------------------------------------------
-- Data Quality Overview
--------------------------------------------------------------

SELECT
quality_status,
COUNT(*) AS total_tables
FROM platform_monitoring.data_quality_metrics
GROUP BY quality_status
ORDER BY total_tables DESC;

--------------------------------------------------------------
-- Tables with Data Quality Issues
--------------------------------------------------------------

SELECT
table_name,
null_percentage,
duplicate_rows,
quality_status
FROM platform_monitoring.data_quality_metrics
ORDER BY null_percentage DESC;

--------------------------------------------------------------
-- Storage Overview
--------------------------------------------------------------

SELECT
table_name,
estimated_size_mb,
estimated_monthly_cost_usd,
storage_status
FROM platform_monitoring.storage_metrics
ORDER BY estimated_size_mb DESC;

--------------------------------------------------------------
-- Highest Storage Cost
--------------------------------------------------------------

SELECT
table_name,
estimated_monthly_cost_usd
FROM platform_monitoring.storage_metrics
ORDER BY estimated_monthly_cost_usd DESC;

--------------------------------------------------------------
-- Stale Tables
--------------------------------------------------------------

SELECT
table_name,
days_unused,
health_status
FROM platform_monitoring.asset_health
WHERE health_status <> 'HEALTHY'
ORDER BY days_unused DESC;
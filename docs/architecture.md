# System Architecture

## High-Level Flow

```text
Business Delta Tables
        │
        ▼
Metadata Collection
        │
        ▼
table_metadata
        │
        ▼
Access Log Generator
        │
        ▼
access_logs
        │
        ▼
Asset Monitoring
        │
        ▼
asset_health
        │
        ▼
Job History Simulator
        │
        ▼
job_history
        │
        ▼
Job Monitoring
        │
        ▼
job_health
        │
        ▼
Governance Rule Engine
        │
        ▼
governance_violations
        │
        ▼
Alert Engine
        │
        ▼
alerts
        │
 ┌──────┼───────────┐
 ▼      ▼           ▼
Data Quality   Storage Metrics   SQL Dashboards
        │
        ▼
Enterprise Governance Dashboard
```

---

# Architecture Components

## Metadata Collection

Collects metadata from all business Delta tables including:

- Row count
- Schema
- Column count
- Owner
- Collection timestamp

---

## Asset Monitoring

Analyzes access logs to determine:

- Last access time
- Read count
- Write count
- Days unused
- Asset health status

---

## Job Monitoring

Processes simulated job execution history to calculate:

- Success rate
- Failed runs
- Average runtime
- Job health status

---

## Governance Rule Engine

Evaluates governance rules across the platform and identifies violations.

Examples include:

- Stale datasets
- Low usage assets
- Low job success rate
- Long-running jobs

---

## Alert Engine

Generates alerts from governance violations and categorizes them by severity.

---

## Data Quality Monitoring

Calculates:

- Row count
- Duplicate rows
- Null percentage
- Overall quality status

---

## Storage Monitoring

Estimates:

- Storage size
- Monthly storage cost
- Storage classification

---

## Dashboards

The framework exposes monitoring data through Databricks SQL Dashboards providing:

- Executive KPIs
- Platform Health
- Governance Metrics
- Job Monitoring
- Data Quality
- Storage Monitoring

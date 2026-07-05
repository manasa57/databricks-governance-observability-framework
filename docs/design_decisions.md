# Design Decisions

This document explains the architectural and implementation decisions made while building the Governance & Observability Framework.

---

# Why Databricks?

Databricks provides a unified platform for data engineering, analytics, and machine learning. It simplifies distributed data processing through Apache Spark while offering native Delta Lake support.

---

# Why Delta Lake?

Delta Lake was selected because it provides:

- ACID transactions
- Schema enforcement
- Reliable table storage
- Efficient reads and writes

These capabilities closely resemble enterprise production environments.

---

# Why PySpark?

PySpark enables scalable distributed data processing and is the standard language used for Databricks-based data engineering.

---

# Why Simulated Access Logs?

Databricks Community Edition does not provide enterprise System Tables.

To demonstrate governance capabilities, synthetic access logs were generated to simulate:

- Table reads
- Table writes
- User activity
- Access timestamps

This allows realistic monitoring scenarios without requiring enterprise licensing.

---

# Why Simulated Job History?

Community Edition does not expose production Job Run History.

A synthetic job history dataset was created containing:

- Successful jobs
- Failed jobs
- Runtime statistics

This enables realistic observability dashboards.

---

# Why Estimated Storage Metrics?

Actual storage usage metrics require enterprise features.

Storage size and monthly costs are estimated using row counts to simulate platform cost monitoring.

---

# Governance Rule Engine

The Governance Rule Engine evaluates platform health using configurable rules such as:

- Stale tables
- Low usage
- Failed jobs
- Low job success rate
- Storage monitoring
- Data quality

Violations are stored in dedicated Delta tables for downstream reporting.

---

# Dashboard Design

Separate dashboards were created for:

- Platform Observability
- Governance
- Data Quality
- Storage Monitoring

This separation follows enterprise dashboard design principles.
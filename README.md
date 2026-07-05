# 🚀 Enterprise Data Platform Governance & Observability Framework

![Databricks](https://img.shields.io/badge/Databricks-Platform_Engineering-EF3E42?logo=databricks&logoColor=white)
![PySpark](https://img.shields.io/badge/PySpark-3.x-orange?logo=apache-spark)
![Delta Lake](https://img.shields.io/badge/Delta-Lake-00ADD8)
![SQL](https://img.shields.io/badge/SQL-Databricks-blue)
![GitHub](https://img.shields.io/badge/GitHub-Portfolio_Project-black?logo=github)

---

## 📌 Project Overview

This project is an enterprise-style **Data Governance & Observability Framework** built on **Databricks Community Edition** using **PySpark**, **Delta Lake**, and **Databricks SQL**.

It simulates how Platform Engineering teams monitor the health of enterprise data platforms by collecting metadata, tracking data usage, evaluating governance rules, monitoring jobs, generating alerts, assessing data quality, estimating storage costs, and exposing operational insights through interactive dashboards.

Although developed on the free version of Databricks, the architecture mirrors patterns commonly used in enterprise environments.

---

## 🎯 Problem Statement

Modern data platforms contain hundreds or thousands of datasets and scheduled jobs.

Without centralized governance, organizations often face:

- Stale and unused datasets
- Repeated ETL failures
- Poor visibility into platform health
- Low data quality
- Increasing storage costs
- Lack of centralized monitoring

This project demonstrates how these challenges can be addressed using Databricks.

---

# 🏗️ Solution Architecture

![Architecture](docs/architecture.png)

The framework continuously monitors platform assets and stores governance information in Delta tables that power SQL dashboards.

---

# 🔄 End-to-End Workflow

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
Job History Generator
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
       ┌────────────┬────────────┐
       ▼            ▼            ▼
Data Quality   Storage Metrics   SQL Dashboards
       │
       ▼
Enterprise Governance Dashboard
```

---

# ✨ Features

### ✅ Metadata Collection

- Collects table metadata
- Row counts
- Schema information
- Column counts
- Collection timestamps

---

### ✅ Asset Monitoring

Tracks:

- Last access
- Read count
- Write count
- Total accesses
- Days unused
- Asset health

---

### ✅ Job Monitoring

Monitors:

- Total runs
- Failed runs
- Success rate
- Average runtime
- Job health status

---

### ✅ Governance Rule Engine

Detects:

- Stale datasets
- Low usage tables
- Low job success rate
- Governance violations

---

### ✅ Alert Engine

Generates alerts with:

- Severity
- Object type
- Alert message
- Alert status
- Timestamp

---

### ✅ Data Quality Monitoring

Evaluates:

- Duplicate rows
- Null percentage
- Quality status
- Row counts

---

### ✅ Storage Monitoring

Estimates:

- Storage size
- Monthly storage cost
- Storage health

---

### ✅ SQL Dashboards

Interactive dashboards for:

- Executive KPIs
- Platform Health
- Governance
- Data Quality
- Storage Monitoring
- Alerts

---

# 🛠️ Technology Stack

| Component | Technology |
|------------|------------|
| Platform | Databricks Community Edition |
| Language | Python |
| Processing | PySpark |
| Storage | Delta Lake |
| Query Engine | Databricks SQL |
| Version Control | Git |
| Repository | GitHub |

---

# 📂 Project Structure

```text
databricks-governance-observability-framework/

├── notebooks/
│   ├── 01_create_sample_tables.py
│   ├── 02_generate_metadata.py
│   ├── 03_generate_access_logs.py
│   ├── 04_asset_monitoring.py
│   ├── 05_generate_job_history.py
│   ├── 06_job_monitoring.py
│   ├── 07_governance_rule_engine.py
│   ├── 08_alert_engine.py
│   ├── 09_data_quality_monitoring.py
│   └── 10_storage_monitoring.py
│
├── dashboards/
│   ├── governance_dashboard.sql
│   └── observability_dashboard.sql
│
├── docs/
│   ├── architecture.md
│   ├── design_decisions.md
│   ├── project_overview.md
│   ├── architecture.drawio
│   └── architecture.png
│
├── screenshots/
│
└── README.md
```

---

# 📊 Delta Tables Created

| Table | Purpose |
|---------|----------|
| table_metadata | Stores metadata for business tables |
| access_logs | Simulated user access logs |
| asset_health | Platform asset monitoring |
| job_history | Simulated ETL execution history |
| job_health | Job monitoring metrics |
| governance_violations | Governance rule results |
| alerts | Generated platform alerts |
| data_quality_metrics | Data quality assessment |
| storage_metrics | Storage and cost estimation |

---


# ▶️ Running the Project

1. Create a Databricks Community Edition workspace.
2. Create the `platform_monitoring` schema.
3. Import all notebooks from the `notebooks/` directory.
4. Run the notebooks in numerical order.
5. Execute the SQL files in Databricks SQL.
6. Create dashboard visualizations.
7. Review the generated monitoring tables and alerts.

---

# 📈 Sample Monitoring Capabilities

The framework can identify scenarios such as:

- Tables not accessed for more than 90 days
- Jobs with low success rates
- Repeated ETL failures
- Data quality issues
- High storage consumption
- Active governance violations

---

# 🚀 Future Enhancements

Potential extensions include:

- Unity Catalog integration
- Databricks System Tables
- Real-time streaming observability
- Auto Loader support
- Delta Live Tables (DLT)
- Email or Slack alert notifications
- Role-based governance
- Automated remediation workflows
- Historical trend analysis

---

# 📚 Learning Outcomes

This project demonstrates practical experience with:

- Databricks Platform Engineering
- Delta Lake
- PySpark
- SQL Analytics
- Metadata Management
- Data Governance
- Platform Observability
- Data Quality Monitoring
- Storage Optimization
- Git-based project organization

---

# 👤 Author

**Manasa Hasavathu**

Platform Engineer | Data Engineer


---

## ⭐ If you found this project useful, consider giving it a star.

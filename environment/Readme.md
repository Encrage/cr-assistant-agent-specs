# CR Assistant Agent – Environment Documentation (v3.6 Baseline)

**Maintainer:** Michael Schwaermer  
**Environment Owner:** cr_agent_admin  
**Version Tag:** design/v3.6‑baseline  

---

## 📘 Overview
This folder documents the **technical environment** used to host and operate the CR Assistant Agent.  
It defines the virtual machine setup, installed software stack, PostgreSQL schema, and connection configuration required for future development and testing.

The environment represents the **current operational baseline (v3.6)** and will serve as the foundation for the **v3.7 Data Persistence Prototype**.

---

## 📂 Contents

| File | Description |
|------|--------------|
| [`ubuntu_vm_setup.md`](ubuntu_vm_setup.md) | Describes Ubuntu VM configuration, system overview, user setup, and maintenance steps. |
| [`software_stack.md`](software_stack.md) | Defines installed software, Python environment, and core packages used by the agent. |
| [`postgres_schema.md`](postgres_schema.md) | Specifies database tables, relationships, and privacy rules for session metadata storage. |
| [`connection_config_sample.env`](connection_config_sample.env) | Template showing required environment variables for database connection and agent configuration (no real credentials). |

---

## 🧠 Purpose of Each Component

### 🖥️ Ubuntu VM Setup
- Base system: Ubuntu 24.04.3 LTS (Noble Numbat).  
- Dedicated service account: `cr_agent_admin`.  
- Directory structure under `/opt/cr-assistant-agent/`.  
- Periodic updates and backups documented.  

### ⚙️ Software Stack
- Python 3.12 runtime and virtual environment.  
- Git for version control.  
- PostgreSQL 15 for metadata storage.  
- Core packages: `psycopg2`, `sqlalchemy`, `pandas`, `openai`, `fastapi`, `pytest`, `python-dotenv`.  
- Defines update and maintenance commands.  

### 🧩 PostgreSQL Schema
- Two main tables: `session_metadata` and `trend_summary`.  
- Anonymized engineer tracking via salted SHA‑256 hashes.  
- Indexes for `engineer_code`, `created_at`, and `issue_category`.  
- QA validation and trend thresholds planned for v3.7.  

### 🔐 Connection Configuration
- Environment variables stored in a local `.env` file on the VM.  
- Sample template provided in `connection_config_sample.env`.  
- Includes database host, port, name, and application salt for anonymization.  
- Actual credentials never committed to GitHub.  

---

## 🧭 Maintenance and Backup
Run monthly updates:
```bash
sudo apt update && sudo apt upgrade -y

Database backup:
pg_dump cr_assistant > backup.sql

Restore:
psql cr_assistant < backup.sql
---

📈 Next Phase (v3.7 Enhancement)
When development starts: - Activate data persistence prototype and trend analysis modules.
- Add validation_log and trend_thresholds tables to schema.
- Link environment variables to FastAPI service for secure runtime access.

Documentation updates will be tagged as design/v3.7-draft.

🧾 Cross‑References
- Specs: ../specs/README.md
- Roadmaps: ../roadmap/roadmap_v3_6.md | ../roadmap/roadmap_v3_7.md
- Docs: ../docs/

🔒 Internal Use Notice
For internal use only – Veeam Customer Care Management and People Manager.
© Veeam Software 2025 – All Rights Reserved.

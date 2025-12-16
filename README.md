# CR Assistant Agent – Specification Repository
**Version:** 3.6 Operational Baseline  
**Maintainer:** Michael Schwaermer, Senior Teamlead, Veeam Customer Care Technical Support  

---

## 📘 Overview
This repository contains the **design and functional specifications** of the **CR Assistant Agent**,  
Veeam’s internal AI‑driven coaching‑analysis assistant.

The repository serves as the **single source of truth** for:
- Agent workflow logic and validation rules  
- Output structure definitions (Engineer Report, Team Report, Coaching Email)  
- Localization and sentiment analysis specifications  
- Technical environment (backend VM and database schema)  
- Roadmaps and focus‑group feedback integration plans  

At this stage, the repository documents the **operational v3.6 design** and the **planned v3.7 enhancements**.  
Executable code implementation will follow after the focus group review (02 Jan 2026).

---

## 🧠 Purpose
The CR Assistant Agent is designed to:
1. Guide People Leaders through a structured feedback workflow  
2. Analyze sentiment and root causes within coaching records  
3. Generate consistent, localized summary outputs  
4. Support management visibility through trend and quality analysis  

---

## 🧩 Repository Structure
cr-assistant-agent-specs/ │ ├── README.md # This file ├── roadmap/ │ ├── roadmap_v3_6.md # Operational phase description │ └── roadmap_v3_7.md # Enhancement phase plan │ ├── specs/ │ ├── workflow_steps.md # Step-by-step agent workflow │ ├── validation_rules.md # Input validation logic │ ├── output_definitions.md # Engineer/Team/Email output formats │ ├── localization_matrix.md # Supported languages and translation logic │ └── sentiment_rootcause_logic.md # Sentiment and root-cause model mapping │ ├── docs/ │ ├── FocusGroup_Overview_v3.6.docx │ ├── CR_Assistant_UserGuide_v3.6.docx │ ├── CR_Assistant_TechSpecs_v3.6.docx │ └── Feedback_Analysis_Pipeline.md │ ├── environment/ │ ├── ubuntu_vm_setup.md # Ubuntu environment preparation │ ├── postgres_schema.md # Database schema and connections │ └── connection_config_sample.env # Example environment variables │ └── .gitignore


---

## 🚦 Current Status – v3.6 (Operational Phase)
**Core Capabilities**
- Interactive guided workflow (Steps 1–7) with full input validation  
- Automated sentiment and root‑cause analysis (GPT‑4.1 / GPT‑5 models)  
- Structured output generation (Engineer Report, Team Report, Coaching Email)  
- Multilingual localization (EN, DE, FR, IT, ES, TR, CS, PL)  
- Confidence Rating and Translation Confidence systems  
- Session‑memory storage for temporary data (no PII retention)  
- Optional enhancements defined for future versions  

---

## 🧭 Next Milestone – v3.7 (Enhancement Phase)
**Objective:** Expand the agent beyond single‑session use by introducing secure data persistence and trend visibility.

**Planned Features**
- Import/Export of anonymized metadata (CSV / JSON)  
- Historical comparison per engineer (`Compare History` command)  
- Session validation log and error summary for QA review  
- Initial trend thresholds (recurring issue detection)  
- Lightweight dashboard concept for management visibility  

---

## 🧮 Development Infrastructure
| Component | Description |
|------------|-------------|
| **Ubuntu VM** | Static‑IP host for staging and testing environment |
| **PostgreSQL DB** | Stores session metadata and trend data (no PII) |
| **GitHub Repo** | Holds design documents and future code |
| **Claude Code / Tracer AI** | Used for code review and runtime trace analysis once development starts |

---

## 🧭 Versioning and Roadmap Tags
| Tag | Meaning |
|------|----------|
| `design/v3.6-baseline` | Current operational specification state |
| `design/v3.7-draft` | Next planned enhancement spec |
| `dev/v3.7.0` | Start of code implementation phase |
| `release/v3.7.x` | Milestone releases after implementation |

---

## ✅ Next Actions
1. Upload existing documentation (User Guide, Tech Specs, Focus Group Overview).  
2. Add agent instruction files under `/specs`.  
3. Tag repository as `design/v3.6-baseline`.  
4. After focus group results (02 Jan 2026), update and tag `design/v3.7-draft`.  
5. Begin development milestone M1 (data persistence prototype).  

---

## 📄 Internal Use Notice
For internal use only – Veeam Customer Care Management and People Manager.  
© Veeam Software 2025 – All Rights Reserved.

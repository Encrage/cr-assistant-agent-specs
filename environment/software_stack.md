# CR Assistant Agent – Software Stack (v3.6 Baseline)

**Maintainer:** Michael Schwaermer  
**Environment Owner:** cr_agent_admin  
**Location:** Ubuntu 24.04.3 LTS VM (172.24.224.65)

---

## 🧾 Purpose
This document defines the core software stack used to host and develop the CR Assistant Agent.  
It ensures reproducibility and provides a reference for environment re‑creation or troubleshooting.

---

## ⚙️ Core System Components
| Component | Version | Purpose |
|------------|----------|----------|
| Ubuntu Server | 24.04.3 LTS | Base operating system |
| Kernel | 6.8.0‑90‑generic | Standard LTS kernel |
| Python | 3.12.2 | Runtime for agent scripts and analysis |
| Git | 2.43.0 or newer/latest | Version control and repo sync |
| PostgreSQL | 16.11 or newer | Metadata and trend data storage |
| pip | 25.3 or newer/latest | Python package manager |
| venv | builtin | Virtual environment isolation |

---

## 🧠 Python Environment Setup
Create a virtual environment under `/opt/cr-assistant-agent/venv`:

```bash
sudo apt install python3-venv -y
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip

📦 Python Packages
List of core packages (to be expanded when development starts):

 Package 	 Purpose 
 psycopg2 	 PostgreSQL database connector 
 sqlalchemy 	 ORM and query management 
 pandas 	 Data handling and analysis 
 openai 	 GPT model API integration 
 fastapi 	 (Planned) Lightweight API layer for agent integration 
 pytest 	 Testing framework 
 python-dotenv 	 Environment variable management 

Install packages via:
pip install psycopg2 sqlalchemy pandas openai fastapi pytest python-dotenv

🧰 Development and Monitoring Tools (optional)
 Tool 	               Usage 
 VS Code or PyCharm 	 Local development and debugging 
 Tracer AI 	           Runtime behavior and log analysis 
 Claude Code 	         AI pair‑programming and refactor support 
 GitHub Actions 	     CI/CD automation for testing and deployment 

🔐 Version Control and Automation
- Repository: https://github.com/<yourname>/cr-assistant-agent-specs.git
- Branching Model: main → design baselines, dev/* → development branches.
- Tagging Convention: design/v3.x for specs, dev/v3.x.x for code releases.
- (Planned) GitHub Action pipeline → auto‑deploy to VM after successful tests.

🧩 Maintenance
Keep stack updated monthly:

sudo apt update && sudo apt upgrade -y
source venv/bin/activate && pip list --outdated
pip install --upgrade <package>

📄 Change Log
 Date 	 Change 	 Author 
 Dec 2025 	 Initial stack definition 	 M. Schwaermer 
 (Next) 	 Add FastAPI and SQLAlchemy integration for v3.7 	 TBD 
Internal Use Only – Veeam Customer Care Management and People Manager
© Veeam Software 2025 – All Rights Reserved.

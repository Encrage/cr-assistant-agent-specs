# 🧑‍💻 Solo‑Developer Workflow – CR Assistant Agent Environment

**Version:** v3.6.1 – Development Mode  
**Maintainer:** Michael Schwaermer (`cr_agent_admin`)  
**Scope:** Internal Development and AI‑Assisted Code Generation  

---

## 🧭 Purpose
This document defines the streamlined GitHub‑based workflow for single‑maintainer development of the CR Assistant Agent environment.  
It ensures version control, traceability, and compatibility with AI tools (Traycer AI / Claude) while minimizing overhead.

---

## ⚙️ Toolchain Overview
| Tool | Purpose |
|-------|----------|
| PostgreSQL 16 (Ubuntu 24.04) | Primary database instance |
| pgAdmin (Windows) | DB management via SSH tunnel |
| GitHub Repository | Version control & issue tracking |
| Traycer AI / Claude | Contextual prompt‑based code generation |
| Markdown Docs | Operational & environment documentation |

---

## 🧩 Development Loop

| Step | Action | Output |
|------|---------|--------|
| 1 | Create a new issue using the **Development Step / AI Integration** template | Defines task objective and AI prompt context |
| 2 | Implement code locally with Traycer AI / Claude assistance | Feature branch (`feature/<short‑desc>`) |
| 3 | Commit and open PR (using pull_request_template.md) | Documents code changes and test results |
| 4 | Merge PR → `main` branch | Auto‑closes linked issue |
| 5 | Tag new version (`vX.Y.Z`) in GitHub Releases | Creates snapshot of state |
| 6 | Update documentation (`/environment/*.md`) | Maintains traceability |

---

## 🧠 AI Integration Guidelines
- Each development issue includes a clear **AI Prompt Context** block for Traycer AI or Claude.  
- Generated code is committed manually after review and testing.  
- All AI‑assisted commits should reference the originating issue (`Implements #<id>`).  
- Keep prompts and AI output summaries inside the issue thread for transparency.

---

## 🧾 Branch and Versioning Conventions
| Type | Example | Purpose |
|-------|----------|----------|
| Main branch | `main` | Stable working state |
| Feature branch | `feature/trend‑summary‑schema` | Individual development step |
| Hotfix branch | `hotfix/ssh‑config‑reload` | Bug or configuration fix |
| Release tag | `v3.7.0‑alpha` | Milestone snapshot |

---

## 🧩 Documentation Structure
/environment/ ├── postgres_instance_setup.md ├── checklists/ │ └── postgres_deployment_checklist.md └── solo_dev_workflow.md <-- you are here


---

## 🧰 Validation and Testing
- Run manual tests on VM after each feature merge.  
- Maintain a simple `tests/` folder for SQL and Python validation snippets.  
- Record test results in PR Verification section.  

---

## 🧱 Release Process
1. Merge all completed PRs into `main`.  
2. Update `postgres_instance_setup.md` version.  
3. Tag release and generate release notes.  
4. Snapshot/backup VM state.  
5. Push release tag to GitHub.  

---

## 🧩 Maintenance Tasks
| Task | Frequency | Command / Action |
|------|------------|-----------------|
| Backup PostgreSQL cluster | Weekly | `pg_dumpall > /var/backups/pg16_full_$(date +%F).sql` |
| Reboot VM for patches | Monthly | `sudo apt update && sudo reboot` |
| Validate pgAdmin SSH tunnel | After reboot | Connect via pgAdmin |
| Commit documentation updates | After each feature | `git add . && git commit -m "Update docs"` |

---

## ✅ Workflow Advantages
- Single‑person efficiency with full traceability  
- AI‑assisted development ready  
- Version control and documentation in sync  
- Easily scalable if team members are added  

---

## 🧠 Appendix – AI Prompt Guidelines (Traycer AI / Claude)

### 🎯 Purpose
To ensure consistent, high‑quality AI‑assisted code generation, all development issues and prompts must follow a clear structure.  
These guidelines describe how to compose prompts that Traycer AI or Claude can interpret effectively.

---

### 🧩 Prompt Structure
Each prompt should contain five components:

| Section | Purpose | Example |
|----------|----------|----------|
| **Goal** | Define what you want the AI to produce | “Generate SQL schema for session_metadata table.” |
| **Context** | Provide environment info, dependencies, and existing files | “PostgreSQL 16 on Ubuntu 24.04, database cr_assistant; schema_design.md defines trend_summary layout.” |
| **Inputs** | List tables, variables, columns, or logic requirements | “Columns: session_id UUID, start_time timestamp, end_time timestamp, status varchar(20)” |
| **Constraints** | Specify rules for output | “Use snake_case names, add primary key, foreign key to trend_summary.” |
| **Expected Output** | Describe exactly what format the AI should return | “Return SQL CREATE TABLE statement + Python SQLAlchemy model.” |

---

### 🧩 Example Prompt – Database Schema
```text
Goal: Create PostgreSQL schema for session_metadata table.
Context: CR Assistant environment, PostgreSQL 16.11 on Ubuntu 24.04, database 'cr_assistant'.
Inputs:
- Columns: session_id UUID, start_time TIMESTAMP, end_time TIMESTAMP, status VARCHAR(20)
Constraints:
- PRIMARY KEY(session_id)
- Use snake_case for column names
Expected Output:
- SQL CREATE TABLE statement
- Python SQLAlchemy ORM model with matching structure

🧩 Example Prompt – Backend Logic
Goal: Generate Python function to insert a new session record into session_metadata.
Context: Uses psycopg2 to connect through pgAdmin SSH tunnel; database 'cr_assistant'.
Inputs: session_id, start_time, end_time, status
Constraints: Return success/failure message and handle exceptions gracefully.
Expected Output: Python code snippet implementing the function using psycopg2.

💡 Best Practices
- Keep prompts short but specific — avoid vague goals like “create backend”.
- Always include environment context (PostgreSQL version, OS, connection method).
- Use consistent naming (align with your schema docs).
- For complex tasks, split into smaller issues and prompts (step by step).
- Attach each prompt and AI response in the corresponding GitHub Issue for traceability.

🧩 Prompt Checklist
 Item 	 Check 
 Goal clearly stated 	 ✅ 
 Environment context included 	 ✅ 
 Inputs defined 	 ✅ 
 Constraints specified 	 ✅ 
 Expected output format listed 	 ✅ 
By following this prompt structure, Traycer AI and Claude will generate code that aligns perfectly with your environment, schema, and version control workflow.

© Veeam Software 2025 – Internal Use Only

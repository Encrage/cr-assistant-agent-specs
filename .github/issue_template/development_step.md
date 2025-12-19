---
name: "Development Step / AI Integration"
about: "Create a traceable development task for CR Assistant Agent environment"
title: "[Step‑#] <Concise Title>"
labels: ["development", "ai-assisted", "infra", "db-schema", "testing"]
assignees: ["cr_agent_admin"]
---

## 🧭 Summary
Provide a one‑sentence description of this task.  
Example: *Implement the session_metadata table schema and validation logic for CR Assistant Agent.*

---

## 🎯 Objective
What should this development step achieve?  
Describe the desired outcome clearly.

---

## ⚙️ Environment Context
| Component | Details |
|------------|----------|
| VM Name | `Mschw-PAR20` |
| OS Version | Ubuntu 24.04 LTS |
| PostgreSQL Version | 16.11 |
| Connection Method | SSH Tunnel (pgAdmin on Windows) |
| Database | `cr_assistant` |
| Cluster | `16 main` |

---

## 🧩 Implementation Steps
1. Describe setup or coding steps in sequence.  
2. Include relevant SQL, Python, or configuration snippets.  
3. Mark each sub‑task with `- [ ]` so it can be checked off.

Example:
```bash
- [ ] Define table structure in schema_design.md
- [ ] Create SQL migration script
- [ ] Test in pgAdmin

💡 AI Prompt Context (for Traycer AI / Claude)
Provide specific context for AI code generation — this section helps Traycer AI understand what to produce.

Goal: Generate PostgreSQL CREATE TABLE statement for session_metadata
Columns: session_id (UUID), start_time (timestamp), end_time (timestamp), status (varchar)
Constraints: PRIMARY KEY(session_id)
Return: SQL + Python ORM model (SQLAlchemy)

🔐 Dependencies
List related issues, commits, or environment files that must exist before starting.

Example:
Depends on [#002] Cluster Setup Validation
Requires postgres_instance_setup.md v3.6.1
Needs access to cr_assistant database

🧠 Expected Output
Define what success looks like — code, config files, log entries, or database artifacts.

Example:
Verified SQL schema applied successfully
Data persistence validated in trend_summary table
Traycer AI prompt and Claude response attached to issue

🧾 Verification Checklist
 Check 	 Status 
 Code compiles/runs 	 ✅ 
 Database schema applied 	 ✅ 
 pgAdmin validation 	 ✅ 
 Documentation updated 	 ✅ 

🧱 Post‑Completion Actions
Commit changes to feature branch: feature/<short-description>
Reference issue ID in commit message: #issue‑<number>
Update documentation (postgres_instance_setup.md)
Notify reviewers / environment owner

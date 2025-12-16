# PostgreSQL Schema – CR Assistant Agent (v3.6 → v3.7)

**Maintainer:** Michael Schwaermer  
**Environment Owner:** cr_agent_admin  
**Location:** Ubuntu 24.04.3 LTS VM (172.24.224.65)

---

## 🧾 Overview
The CR Assistant Agent uses PostgreSQL to store anonymized session metadata and analysis results.  
No PII data is kept; records support trend analysis, QA validation, and confidence tracking.

---

## 🧩 Schema Definition

### Table: `session_metadata`
| Column | Type | Description |
|---------|------|--------------|
| session_id | UUID PRIMARY KEY | Unique identifier for session |
| engineer_code | TEXT | Hashed identifier derived from engineer name or ID for anonymized tracking. Consistent per engineer but non‑reversible. |
| case_number | TEXT | 8‑digit case identifier |
| sentiment_score | FLOAT | Sentiment value (0–1) |
| root_cause | TEXT | Detected root cause category |
| language | TEXT | Language code (EN, DE, FR, IT, ES, TR, CS, PL) |
| confidence_rating | FLOAT | Overall analysis confidence |
| translation_confidence | FLOAT | Localization accuracy indicator |
| created_at | TIMESTAMP DEFAULT CURRENT_TIMESTAMP | Time of analysis |
| session_log | JSONB | Validation and error summary |

### Table: `trend_summary`
| Column | Type | Description |
|---------|------|--------------|
| trend_id | SERIAL PRIMARY KEY | Auto‑increment identifier |
| engineer_code | TEXT | Anonymized engineer reference |
| issue_category | TEXT | Recurring issue type |
| occurrence_count | INT | Number of times appeared |
| confidence_avg | FLOAT | Average confidence across records |
| trend_flag | TEXT | Positive / Negative / Recurring |
| last_updated | TIMESTAMP | Last trend update timestamp |

### Engineer Reference Policy
- Each engineer is represented by a salted SHA‑256 hash (`engineer_code`).  
- The salt value is stored securely outside the database in the VM environment variables.  
- This approach allows consistent trend tracking per engineer while preventing PII exposure.  
- Future versions may introduce a restricted lookup table for authorized re‑identification.
---

## 🧮 Relationships
- `session_metadata.case_number` ↔ `trend_summary.engineer_code` (optional join for trend reports).  
- No foreign keys required initially for v3.7 prototype (simplified design).  

---

## ⚙️ Indexing and Performance
```sql
CREATE INDEX idx_engineer_code ON session_metadata (engineer_code);
CREATE INDEX idx_created_at ON session_metadata (created_at);
CREATE INDEX idx_issue_category ON trend_summary (issue_category);
🔒 Security and Privacy
- All engineer identifiers anonymized before storage.
- No personal names or emails retained.
- Temporary session data cleared via command CR Resolved.
- Database access restricted to cr_agent_admin and authorized applications.

🧰 Maintenance Commands
Backup:
pg_dump cr_assistant > backup.sql

Restore:
psql cr_assistant < backup.sql

🧩 Next Planned Enhancements (v3.7)
- Add validation_log table for QA review.
- Add trend_thresholds configuration table.
- Integrate data persistence commands (Import/Export CSV/JSON).

Internal Use Only – Veeam Customer Care Management and People Manager
© Veeam Software 2025 – All Rights Reserved.

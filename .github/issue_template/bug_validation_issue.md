---
name: "Bug / Validation Issue"
about: "Report an error, validation failure, or unexpected behavior in the CR Assistant Agent environment"
title: "[Bug‑#] <Short description of issue>"
labels: ["bug", "validation", "testing"]
assignees: ["cr_agent_admin"]
---

## 🧭 Summary
Briefly describe the issue and where it occurred.  
Example: *pgAdmin connection intermittently fails after VM restart.*

---

## ⚙️ Environment Context
| Component | Details |
|------------|----------|
| VM Name | `Mschw‑PAR20` |
| OS Version | Ubuntu 24.04 LTS |
| PostgreSQL Version | 16.11 |
| Connection Method | SSH Tunnel (pgAdmin on Windows) |
| Database | `cr_assistant` |
| Cluster | `16 main` |
| Related GitHub Issue | #(if applicable) |

---

## 🧾 Steps to Reproduce
List the exact steps to trigger the issue:
1. …
2. …
3. …

---

## 🧠 Expected Behavior
Describe what *should* have happened.

---

## ⚠️ Actual Behavior / Error Message
Paste the error message, log snippet, or screenshot reference if available.

```text
<error output or stack trace here>
💡 Preliminary Analysis / Notes
(Optional) Describe any initial findings or suspected cause.

🧩 AI Prompt Context (for Traycer AI / Claude)
Provide a structured summary so AI tools can assist with analysis or code fixes.

Example:
Goal: Diagnose intermittent pgAdmin SSH tunnel disconnect after VM restart.
Inputs: sshd_config, PostgreSQL logs, systemctl status.
Expected: Determine if AllowTcpForwarding resets on reboot.

🔐 Dependencies / Impact
- Affected modules: e.g., SSH, pgAdmin, PostgreSQL service
- Severity: 🟢 Low / 🟠 Medium / 🔴 High
- Blocks development steps: #(link issue if any)

🧱 Resolution / Fix
(To be filled once resolved)

- Root cause: …
- Fix implemented in commit: <hash or PR link>
- Validated on: YYYY‑MM‑DD

✅ Verification Checklist
 Check 	 Status 
 Reproduced in lab environment 	 ✅ 
 Fix applied and validated 	 ✅ 
 Documentation updated 	 ✅ 
 Regression tested 	 ✅ 
© Veeam Software 2025 – Internal Use Only

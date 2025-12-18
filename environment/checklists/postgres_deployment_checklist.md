# PostgreSQL Deployment Checklist – CR Assistant Agent Environment

**Version:** v3.6.1 (Snapshot Validated)  
**Maintainer:** Michael Schwaermer  
**Environment Owner:** cr_agent_admin  

---

## 🧭 Purpose
This checklist ensures consistent configuration, validation, and documentation of PostgreSQL instances deployed for CR Assistant Agent environments.  
Use it for new VM setups, rebuilds, or version upgrades.

---

## ✅ Deployment Checklist

| Step | Description | Status | Date |
|------|--------------|--------|------|
| 1 | Install PostgreSQL 16 on Ubuntu 24.04 LTS | ✅ | YYYY‑MM‑DD |
| 2 | Verify cluster status (`sudo pg_lsclusters`) | ✅ | YYYY‑MM‑DD |
| 3 | Configure `listen_addresses = '*'` and `port = 5432` | ✅ | YYYY‑MM‑DD |
| 4 | Define authentication rules in `pg_hba.conf` | ✅ | YYYY‑MM‑DD |
| 5 | Enable SSH TCP Forwarding (`AllowTcpForwarding yes`) | ✅ | YYYY‑MM‑DD |
| 6 | Test local connection (`psql -h 127.0.0.1`) | ✅ | YYYY‑MM‑DD |
| 7 | Test remote connection (pgAdmin via SSH Tunnel) | ✅ | YYYY‑MM‑DD |
| 8 | Validate database roles and permissions | ✅ | YYYY‑MM‑DD |
| 9 | Confirm backup procedure (`pg_dumpall`) | ✅ | YYYY‑MM‑DD |
| 10 | Take VM snapshot or export backup | ✅ | YYYY‑MM‑DD |
| 11 | Update documentation (`postgres_instance_setup.md`) | ✅ | YYYY‑MM‑DD |

---

## 🧩 Verification Commands
```bash
sudo pg_lsclusters
sudo systemctl status postgresql
psql -U cr_agent_admin -h 127.0.0.1 -d cr_assistant -c "SELECT version();"

🧱 Storage and Versioning
- Primary location: /environment/checklists/postgres_deployment_checklist.md
- Backup copy: /var/backups/docs/postgres_deployment_checklist_<date>.md
- Version tracking: Commit to your internal Git repository or configuration‑documentation share (e.g., infra-configs repo).
- Reference: Link this file at the end of postgres_instance_setup.md using:

▶ See Deployment Checklist [v3.6.1] (/environment/checklists/postgres_deployment_checklist.md)

🧠 Usage Notes
- Keep a copy per VM instance or environment.
- Update the Status and Date columns after each validation.
- Use the same checklist for future PostgreSQL version upgrades or migrations.

© Veeam Software 2025 – Internal Use Only

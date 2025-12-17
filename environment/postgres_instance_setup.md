# PostgreSQL Instance Setup – CR Assistant Agent Environment

**Version:** v3.6 Baseline Setup (Operational)  
**Maintainer:** Michael Schwaermer  
**Environment Owner:** cr_agent_admin  

---

## 🧭 Overview
This document records the setup and configuration of the PostgreSQL instance used by the CR Assistant Agent environment.  
It defines the cluster version, database creation steps, authentication rules, verification commands, and secure remote‑access configuration through an SSH tunnel.

---

## ⚙️ PostgreSQL Cluster Details
| Property | Value |
|-----------|--------|
| Cluster Version | PostgreSQL 16.11 (Ubuntu 24.04 LTS) |
| Cluster Status | ✅ Online |
| Port | 5432 |
| Service | `postgresql@16-main.service` |
| Owner | `postgres` |
| Data Directory | `/var/lib/postgresql/16/main` |
| Log File | `/var/log/postgresql/postgresql-16-main.log` |

---

## 🧩 Database and Role Configuration
```sql
CREATE DATABASE cr_assistant;
CREATE USER cr_agent_admin WITH ENCRYPTED PASSWORD 'your_secure_password';
GRANT ALL PRIVILEGES ON DATABASE cr_assistant TO cr_agent_admin;

🧾 Current Databases
 Name 	 Owner 	 Encoding 	 Port 	 Privileges 
 cr_assistant 	 postgres 	 UTF8 	 5432 	 cr_agent_admin CTc/postgres 
 par20 	 par_user 	 UTF8 	 5432 	 par_user CTc/par_user 
 postgres 	 postgres 	 UTF8 	 5432 	 CTc/postgres 

🔐 Authentication Settings
File: /etc/postgresql/16/main/pg_hba.conf

# Local connections
local   all             postgres                                peer
local   all             cr_agent_admin                           scram-sha-256

# IPv4 local connections
host    all             all             127.0.0.1/32              scram-sha-256

# Allow connections from the lab network (VMware)
host    all             all             172.24.0.0/16             scram-sha-256

Reload command after changes:
sudo systemctl reload postgresql


🧩 SSH Daemon Configuration (for pgAdmin tunnel)
File: /etc/ssh/sshd_config
AllowTcpForwarding yes
PermitRootLogin no

Reload SSH after any change:
sudo systemctl reload ssh


🧩 pgAdmin Remote Access via SSH Tunnel (Windows → Ubuntu VM)
pgAdmin on the Windows system connects securely to the PostgreSQL server on the Ubuntu VM through SSH port forwarding.

Connection Tab
 Setting 	 Value 
 Host name/address 	 127.0.0.1 
 Port 	 5432 
 Maintenance database 	 postgres (or cr_assistant) 
 Username 	 cr_agent_admin 
 Password 	 cr_agent_pass 

SSH Tunnel Tab
 Setting 	 Value 
 Use SSH tunnel 	 ✅ Checked 
 Tunnel host 	 172.24.224.65 
 Port 	 22 
 Username 	 cr_agent_admin 
 Authentication 	 Password or SSH private key 


🧠 Verification Commands
# Check cluster status
sudo pg_lsclusters

# Connect as postgres
sudo -i -u postgres
psql -c "SELECT version();"

# Connect as cr_agent_admin
psql -U cr_agent_admin -h 127.0.0.1 -d cr_assistant
Expected result:

PostgreSQL 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
🧩 Backup and Maintenance
 Task 	 Command 
 Full cluster dump 	 sudo -i -u postgres pg_dumpall > /var/backups/pg16_full_$(date +%F).sql 
 Restore 	 psql -f /var/backups/pg16_full_<date>.sql 
 Restart service 	 sudo systemctl restart postgresql 

🧰 Troubleshooting
🔹 SSH Tunnel fails or pgAdmin shows random port errors
Cause: TCP forwarding disabled

Fix:
sudo nano /etc/ssh/sshd_config

# Ensure line reads:
AllowTcpForwarding yes
sudo systemctl reload ssh

Manual test:
ssh -L 5433:127.0.0.1:5432 cr_agent_admin@172.24.224.65
psql -h 127.0.0.1 -p 5433 -U cr_agent_admin -d postgres

🔹 “No pg_hba.conf entry for host…” errors
Cause: Windows client IP not covered by subnet rules
Fix:
host all all 172.24.0.0/16 scram-sha-256
Reload PostgreSQL:
sudo systemctl reload postgresql

🔹 “psql not recognized” in PowerShell
Cause: PostgreSQL client tools missing or not in PATH
Fix: Install from https://www.postgresql.org/download/windows/
Add to PATH:
C:\Program Files\PostgreSQL\<version>\bin

🔹 SSH authentication issues
Cause: Invalid credentials or unsupported key format
Fix: - Verify manual SSH login works
- Use OpenSSH‑formatted keys (id_rsa, id_ed25519)
- Ensure pgAdmin SSH tab matches username and key

🔹 Firewall blocking port 22
If SSH doesn’t connect:
sudo ufw allow 22/tcp
sudo ufw reload


✅ Final Sanity Check
sudo systemctl restart postgresql
sudo systemctl restart ssh
Then reconnect in pgAdmin.

📈 Next Phase Preparation (v3.7)
- Create tables session_metadata and trend_summary from schema documentation.
- Add validation log and trend threshold tables for data persistence prototype.
- Update connection settings in .env file.

✅ Verification Status
 Check 	 Result 
 Cluster online 	 ✅ 
 Database exists 	 ✅ 
 User role active 	 ✅ 
 pgAdmin connection 	 ✅ 
 Backup tested 	 🟠 (to be verified) 
© Veeam Software 2025 – Internal Use Only

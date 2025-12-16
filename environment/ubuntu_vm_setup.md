# Ubuntu VM Setup – CR Assistant Agent Environment

## 🧾 System Overview
| Item | Value |
|------|--------|
| OS Version | Ubuntu 24.04.3 LTS (Noble Numbat) |
| Kernel | 6.8.0‑90‑generic |
| Hostname | Mschw‑PAR20.support2.veeam.local |
| Static IP | 172.24.224.65 |
| Disk | 38 GB total / 6 GB used / 32 GB free |
| Primary User | Michael |
| Project Service User | cr_agent_admin |

## ⚙️ User Setup
The dedicated project account `cr_agent_admin` has been created for the CR Assistant Agent environment.
It owns the project directory `/opt/cr-assistant-agent` and has sudo rights for maintenance.

If the environment is re‑provisioned, recreate this user as follows:
```bash
sudo adduser cr_agent_admin
sudo usermod -aG sudo cr_agent_admin
sudo mkdir -p /opt/cr-assistant-agent
sudo chown cr_agent_admin:cr_agent_admin /opt/cr-assistant-agent

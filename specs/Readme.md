# CR Assistant Agent – Specifications Index (v3.6)

**Maintainer:** Michael Schwaermer  
**Department:** Veeam Customer Care Management and People Manager  
**Version Tag:** design/v3.6‑baseline  

---

## 📘 Purpose
This folder contains the detailed **functional and design specifications** of the **CR Assistant Agent**.  
It defines the workflow, validation logic, analytical structure, and localization standards for version 3.6 and serves as the blueprint for all future development.

The content here represents the **operational baseline** used in the v3.6 Focus Group phase (Dec 2025 – Jan 2026).  
Feedback from that phase will inform v3.7 (feature enhancement and data persistence).

---

## 📂 Specification Files

| File | Description |
|------|--------------|
| [`workflow_steps.md`](workflow_steps.md) | Defines the guided 7‑step interaction flow used for data collection and analysis startup. |
| [`validation_rules.md`](validation_rules.md) | Lists all field‑level validation rules, error messages, and auto‑correction/restart logic. |
| [`output_definitions.md`](output_definitions.md) | Describes report structures (Engineer, Manager, Coaching Email) and confidence scoring. |
| [`localization_matrix.md`](localization_matrix.md) | Details language support, tone profiles, and localization consistency rules. |
| [`sentiment_rootcause_logic.md`](sentiment_rootcause_logic.md) | Explains sentiment analysis methodology, root cause classification, and trend metrics. |

---

## 🧮 Usage Guidelines
1. Each file is self‑contained and cross‑linked with related specs.  
2. All content is non‑PII and intended for internal reference only.  
3. Modifications should include a version note at the top of the changed file (e.g., `Updated for v3.7 – Data Persistence Prototype`).  
4. When a spec is updated, tag a new design version (e.g., `design/v3.7‑draft`).  

---

## 🧩 Cross‑References
- Roadmaps: [roadmap_v3_6.md](../roadmap/roadmap_v3_6.md) | [roadmap_v3_7.md](../roadmap/roadmap_v3_7.md)  
- Environment Setup: [../environment/postgres_schema.md](../environment/postgres_schema.md)  
- Documentation Hub: [../docs/](../docs/)  

---

## 🔒 Internal Use Notice
For internal use only – Veeam Customer Care Management and People Manager.  
© Veeam Software 2025 – All Rights Reserved.

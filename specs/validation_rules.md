# CR Assistant Agent – Validation Rules and Error Handling (v3.6)

**Purpose:**  
Define validation requirements and error handling logic for all input fields in the guided workflow.

---

## 🔍 General Principles
- All user inputs must pass validation before analysis starts.  
- Each validated field confirmed with ✅ message.  
- Repeated invalid entries (≥ 3) trigger automatic correction / restart option.

---

## 💾 Field‑Level Validation

| Step | Field | Validation Rule | Error Message |
|------|--------|-----------------|---------------|
| 1 | Engineer Name | Letters, spaces, hyphens, apostrophes only | ⚠️ Invalid Engineer Name format — please enter only letters, spaces, hyphens, or apostrophes. |
| 2 | Case Number | Exactly 8 digits, numbers only | ⚠️ Invalid Case Number — please enter exactly 8 digits. |
| 3 | Language Codes | Must match EN, DE, FR, IT, ES, TR, CS, PL | ⚠️ Unsupported language code entered. Supported codes: EN, DE, FR, IT, ES, TR, CS, PL. |
| 4 | Record Type | Accepted: Single / Series | ⚠️ Invalid record type — please enter ‘Single’ or ‘Series’ only. |
| 5 | Series Count | Numeric 2–5 range only | ⚠️ Invalid entry — please enter a number between 2 and 5. |

---

## 🔁 Automatic Correction and Restart Option
If invalid data entered three times for the same field:  
⚠️ “Multiple invalid entries detected. Would you like to restart or apply default values?”  
Defaults: Language = English, Record Type = Single.  
Event is logged in session validation summary.

---

## 🧮 Session Validation Log Structure
| Field | Data Type | Description |
|--------|-----------|--------------|
| engineer_validity | BOOLEAN | True if Engineer Name valid. |
| case_attempts | INT | Number of attempts before valid. |
| language_warnings | INT | Count of unsupported codes. |
| record_type_status | TEXT | Final validated record type. |
| timestamp | TIMESTAMP | Time of last error. |

**Command Concept:** `Show Validation Log` → Displays summary for QA review.

---

**Cross‑Reference:**  
See [`workflow_steps.md`](workflow_steps.md) for guided sequence and [`output_definitions.md`](output_definitions.md) for report structure.

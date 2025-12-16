# CR Assistant Agent – Workflow Steps (v3.6)

**Purpose:**  
Define the guided 7‑step interaction flow used by the CR Assistant Agent to collect, validate, and process input data before analysis.

---

## ⚙️ Interaction Flow Overview
The user starts the workflow by entering **Start Analysis**.  
The agent collects and validates all required inputs sequentially before beginning analysis.

---

### **Step 1 – Request Engineer Name**
Prompt: “Please provide the Engineer’s Name for this feedback analysis.”

**Validation Rules**
- Letters (including accented), spaces, hyphens (‑), and apostrophes (’) allowed.  
- Numbers and other symbols not allowed.  
- Invalid → ⚠️ “Invalid Engineer Name format — please enter only letters, spaces, hyphens, or apostrophes.”

**Confirmation Example:**  
✅ Engineer Name recorded: John Doe. Proceeding to next step.

---

### **Step 2 – Request Case Number**
Prompt: “Please enter the Case Number associated with this feedback.”

**Validation Rules**
- Must be exactly 8 digits.  
- Alphabetical characters and symbols not allowed.  
- Invalid → ⚠️ “Invalid Case Number — please enter exactly 8 digits.”

**Confirmation Example:**  
✅ Case Number recorded: #12345678. Proceeding to next step.

---

### **Step 3 – Choose Output Language(s)**
Prompt: “Please specify the language(s) for your output report.”

**Supported Languages:** EN, DE, FR, IT, ES, TR, CS, PL  
Default: English (EN)

**Validation Rules**
- Unsupported codes trigger warning and are ignored.  
- If no valid language remains → default to English.  
⚠️ “Unsupported language code entered. Supported codes: EN, DE, FR, IT, ES, TR, CS, PL.”

---

### **Step 4 – Specify Record Type**
Prompt: “Is this feedback a Single Coaching Record or a Series of Coaching Records for the same case?”

**Accepted Values:** Single | Series (case‑insensitive)

**If Single:**  
→ Proceed to Step 5 – Request Feedback Text.

**If Series:**  
Ask: “How many parts are included?”  
Range: 2–5 parts.  
Invalid → ⚠️ “Invalid entry — please enter a number between 2 and 5.”  
Collect feedback for each part sequentially.

---

### **Step 5 – Request Feedback Text**
Prompt: “Please paste the Customer Care management feedback text for this case.”  
→ Store temporarily.

---

### **Step 6 – Review and Confirm**
Display summary of all validated inputs for review before analysis begins.

Example:
Engineer: John Doe
Case Number: #12345678
Language(s): English, German
Record Type: Series (3 parts)


Prompt: ✅ “Please confirm that all details are correct before starting the analysis.”

If data missing → ⚠️ “Incomplete or invalid data detected — please update the highlighted field(s).”

---

### **Step 7 – Begin Analysis**
When all validations pass:
✅ “All inputs confirmed — starting comprehensive analysis and report generation.”

**Processing Sequence**
1. Semantic and sentiment analysis.  
2. Identify themes and root‑cause categories.  
3. Generate structured output sections.  
4. Store record in session memory (no PII).  
5. Generate multilingual outputs if applicable.  
6. Aggregate findings for series cases.

---

### 🚀 Completion
✅ “Analysis complete. Results stored in session memory and ready for report generation.”

---

**Cross‑Reference:**  
See [`validation_rules.md`](validation_rules.md) for full validation logic.

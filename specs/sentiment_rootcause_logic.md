# CR Assistant Agent – Sentiment and Root Cause Logic (v3.6)

**Purpose:**  
Describe how the agent interprets feedback sentiment and classifies root causes behind negative survey results.

---

## 🧠 Sentiment Analysis Logic
- Perform semantic and tone analysis using GPT‑4.1 / GPT‑5 models.  
- Assign sentiment score (0–1) and tone label (Positive, Neutral, Negative).  
- Aggregate multi‑part series scores into average sentiment per case.  
- Store results in session memory with timestamp and confidence rating.  

---

## 🧩 Root Cause Categories
| Category | Definition |
|-----------|-------------|
| Communication Issue | Misalignment in tone, timing, or clarity with customer. |
| Knowledge Gap | Missing technical depth or incorrect information provided. |
| Analytical Error | Faulty case assessment or incomplete problem diagnosis. |
| Process Issue | Deviation from standard support workflow or escalation procedure. |
| Other | Unclassified or context‑specific anomalies. |

---

## 🎯 Purpose and Goals
- Identify root causes behind negative feedback.  
- Extract main improvement themes.  
- Develop clear, measurable action steps.  
- Support structured coaching and continuous improvement.  
- Align Engineer and Manager report perspectives.  

---

## 🧮 Data Model Summary (additional clarity)
| Field | Type | Description |
|--------|------|-------------|
| engineer | TEXT | Anonymized Engineer identifier |
| case_number | TEXT | 8‑digit case ID |
| sentiment_score | FLOAT | 0–1 value of sentiment strength |
| issue_category | TEXT | Primary root cause classification |
| confidence_rating | FLOAT | Overall confidence after validation |
| timestamp | TIMESTAMP | Date and time of analysis |

---

## 🧩 Trend Thresholds and Performance Metrics
- Same Issue Category appears ≥ 3 records → flag Recurring Trend.  
- Confidence drops > 15 % month‑to‑month → flag Performance Decline.  
- Same category improves ≥ 3 consecutive records → flag Positive Trend.  

---

**Cross‑Reference:**  
See [`workflow_steps.md`](workflow_steps.md) for analysis trigger and [`output_definitions.md`](output_definitions.md) for report usage.

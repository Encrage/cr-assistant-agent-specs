# CR Assistant Agent – Localization Matrix and Tone Profiles (v3.6)

**Purpose:**  
Define supported languages, tone styles, and localization rules for multilingual output generation.

---

## 🌍 Supported Languages
| Code | Language | Tone Profile |
|------|-----------|--------------|
| EN | English | Empathetic, structured, supportive |
| DE | German | Formal, precise, encouraging |
| FR | French | Diplomatic, balanced, uplifting |
| IT | Italian | Warm, expressive, motivational |
| ES | Spanish | Warm, respectful, motivating |
| TR | Turkish | Respectful, concise, professional |
| CS | Czech | Professional, pragmatic |
| PL | Polish | Respectful, direct, confident |

Default Language: English (EN)

---

## 🗣️ Localization Rules
- Apply phrasing from localization guides instead of literal translations.  
- Adapt idioms and sentence flow per language style.  
- Maintain tone consistency across outputs.  
- Validate register (formal/informal) per context (report vs email).  
- Limit sentence length to natural readability for each language.  

---

## 🧠 Localization Quality Checklist
| Criterion | Pass Condition |
|------------|----------------|
| Tone | Friendly, professional, naturally fluent |
| Grammar | Correct structure and punctuation |
| Clarity | Short, active, precise |
| Idioms | Localized expressions |
| Consistency | Same structure and content as English version |

---

## 🧩 Localization Confidence Metric
Integrate translation confidence into overall Confidence Rating.  
Formula: `Overall Confidence = (Analysis × 0.7) + (Translation × 0.3)`

---

**Cross‑Reference:**  
See [`output_definitions.md`](output_definitions.md) for report formats and [`validation_rules.md`](validation_rules.md) for language code validation.

/*
===========================================================
CR Assistant Agent – PostgreSQL Schema (v3.7 Prototype)
Author : Michael Schwaermer
Maintainer : cr_agent_admin
Version : 3.7-draft
===========================================================
*/

-- =============================
-- Database Context
-- =============================
\connect cr_assistant

-- ============================================================
-- 1️⃣  SESSION METADATA TABLE
-- ============================================================
CREATE TABLE IF NOT EXISTS session_metadata (
    session_id         UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    agent_id           VARCHAR(64) NOT NULL,
    user_id            VARCHAR(64) NOT NULL,
    session_start      TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    session_end        TIMESTAMP,
    duration_seconds   INTEGER GENERATED ALWAYS AS (
                           EXTRACT(EPOCH FROM (session_end - session_start))
                       ) STORED,
    sentiment_score    NUMERIC(5,2),
    root_cause         VARCHAR(128),
    language_code      VARCHAR(16) DEFAULT 'en',
    region             VARCHAR(64),
    feedback_notes     TEXT,
    created_at         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE session_metadata IS 'Stores anonymized session-level metadata for CR Assistant Agent interactions.';


-- ============================================================
-- 2️⃣  TREND SUMMARY TABLE
-- ============================================================
CREATE TABLE IF NOT EXISTS trend_summary (
    trend_id           SERIAL PRIMARY KEY,
    week_start         DATE NOT NULL,
    week_end           DATE NOT NULL,
    average_sentiment  NUMERIC(5,2),
    most_common_root   VARCHAR(128),
    sessions_count     INTEGER NOT NULL,
    language_code      VARCHAR(16),
    region             VARCHAR(64),
    created_at         TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

COMMENT ON TABLE trend_summary IS 'Aggregated weekly trend metrics derived from session_metadata.';


-- ============================================================
-- 3️⃣  VALIDATION LOG TABLE (v3.7 Prototype)
-- ============================================================
CREATE TABLE IF NOT EXISTS validation_log (
    validation_id      SERIAL PRIMARY KEY,
    validation_date    TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    agent_id           VARCHAR(64),
    validation_type    VARCHAR(64),
    validation_result  VARCHAR(32),
    details            TEXT,
    triggered_by       VARCHAR(64),
    notes              TEXT
);

COMMENT ON TABLE validation_log IS 'Records validation events and outcomes for session data integrity checks.';


-- ============================================================
-- 4️⃣  INDEXES & RELATIONS
-- ============================================================
CREATE INDEX IF NOT EXISTS idx_session_language ON session_metadata(language_code);
CREATE INDEX IF NOT EXISTS idx_trend_region ON trend_summary(region);
CREATE INDEX IF NOT EXISTS idx_validation_agent ON validation_log(agent_id);

-- Optional foreign keys (for data persistence prototype)
ALTER TABLE trend_summary
    ADD CONSTRAINT fk_trend_language FOREIGN KEY (language_code)
    REFERENCES session_metadata(language_code)
    ON DELETE SET NULL;

-- ============================================================
-- 5️⃣  VIEW EXAMPLES
-- ============================================================
CREATE OR REPLACE VIEW weekly_sentiment_view AS
SELECT
    week_start,
    week_end,
    average_sentiment,
    most_common_root,
    sessions_count,
    region
FROM trend_summary
ORDER BY week_start DESC;

-- ============================================================
-- 6️⃣  TEST DATA (Optional)
-- ============================================================
-- INSERT INTO session_metadata (agent_id, user_id, session_end, sentiment_score, root_cause, region)
-- VALUES ('AG001', 'USR001', CURRENT_TIMESTAMP, 0.82, 'Performance', 'EMEA');

-- INSERT INTO trend_summary (week_start, week_end, average_sentiment, most_common_root, sessions_count, region)
-- VALUES ('2025-12-01', '2025-12-07', 0.75, 'Performance', 120, 'EMEA');

-- ============================================================
-- 7️⃣  END OF SCHEMA
-- ============================================================

-- Up
CREATE TABLE IF NOT EXISTS Users (
    uuid TEXT PRIMARY KEY,
    email TEXT UNIQUE NOT NULL,
    newEmail TEXT UNIQUE,
    emailToken TEXT,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    lastUsed TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    kdfSalt BLOB NOT NULL,
    srpSalt BLOB NOT NULL,
    srpVerifier BLOB NOT NULL,
    totpSecret BLOB NOT NULL
);

CREATE INDEX IF NOT EXISTS user_email_idx ON Users (email);

-- Down
DROP INDEX IF EXISTS user_email_idx;
DROP TABLE IF EXISTS Users;
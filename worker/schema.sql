CREATE TABLE IF NOT EXISTS stores (
  id         TEXT PRIMARY KEY,
  store      TEXT NOT NULL,
  salt       TEXT NOT NULL,
  hash       TEXT NOT NULL,
  state      TEXT,
  rev        INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

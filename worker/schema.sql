CREATE TABLE IF NOT EXISTS stores (
  id         TEXT PRIMARY KEY,
  store      TEXT NOT NULL,
  salt       TEXT NOT NULL,
  hash       TEXT NOT NULL,
  state      TEXT,
  rev        INTEGER NOT NULL DEFAULT 0,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);

CREATE TABLE IF NOT EXISTS receipts (
  id         INTEGER PRIMARY KEY AUTOINCREMENT,
  store_id   TEXT NOT NULL,
  supplier   TEXT,
  total      INTEGER NOT NULL DEFAULT 0,
  items      TEXT NOT NULL,
  image      TEXT NOT NULL,
  created_at TEXT NOT NULL DEFAULT (datetime('now'))
);
CREATE INDEX IF NOT EXISTS idx_receipts_store ON receipts (store_id, id DESC);

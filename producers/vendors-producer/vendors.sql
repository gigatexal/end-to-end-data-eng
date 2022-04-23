CREATE TABLE IF NOT EXISTS currency(
  id INTEGER PRIMARY KEY,
  currency_code TEXT
  ) STRICT;

CREATE TABLE IF NOT EXISTS country (
  id INTEGER NOT NULL PRIMARY KEY,
  name TEXT NOT NULL,
  currency_code INTEGER NOT NULL REFERENCES currency(id)
  is_online INTEGER NOT NULL,
  active_at TEXT DEFAULT '2010-01-01',
  deactivated_at TEXT DEFAULT NULL
  ) STRICT;

CREATE UNIQUE INDEX IF NOT EXISTS uq_idx_name_currency_code ON country (name, currency_code);

CREATE UNIQUE INDEX IF NOT EXISTS uq_idx_currency_code ON currency (currency_code);

CREATE TABLE IF NOT EXISTS vendor (
  id INTEGER PRIMARY KEY,
  name TEXT,
  is_online INTEGER,
  country_id INTEGER REFERENCES country(id)
) STRICT;

CREATE UNIQUE INDEX IF NOT EXISTS uq_idx_vendor ON vendor (name, country_id);

CREATE TABLE IF NOT EXISTS vendor_currency_code(
  vendor_id INTEGER REFERENCES vendor(id),
  currency_id INTEGER REFERENCES currency(id)
) STRICT;

CREATE UNIQUE INDEX IF NOT EXISTS uq_vendor_currency_code_pk ON vendor_currency_code( vendor_id, currency_id );

CREATE TABLE IF NOT EXISTS vendor_item ( 
  vendor_id INTEGER PRIMARY KEY REFERENCES vendor(id),
  parent_group_1 TEXT,
  sub_group_1 TEXT,
  sub_group_2 TEXT,
  sub_group_3 TEXT,
  sub_group_4 TEXT,
  value REAL NOT NULL,
  currency_id INTEGER REFERENCES currency(id)
) STRICT;

CREATE UNIQUE INDEX IF NOT EXISTS uq_vendor_item_all ON vendor_item (
  vendor_id,
  parent_group_1,
  sub_group_1,
  sub_group_2,
  sub_group_3,
  sub_group_4,
  value,
  currency_id);


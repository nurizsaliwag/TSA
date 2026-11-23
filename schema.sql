PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS members (
    member_id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    membership_type TEXT NOT NULL CHECK (membership_type IN ('STUDENT','FACULTY','GUEST'))
);

CREATE TABLE IF NOT EXISTS books (
    isbn TEXT PRIMARY KEY,
    title TEXT NOT NULL,
    status TEXT NOT NULL CHECK (status IN ('AVAILABLE','CHECKED_OUT'))
);

CREATE TABLE IF NOT EXISTS loans (
    loan_id TEXT PRIMARY KEY,
    member_id TEXT NOT NULL REFERENCES members(member_id),
    isbn TEXT NOT NULL REFERENCES books(isbn),
    loan_days INTEGER NOT NULL CHECK (loan_days BETWEEN 1 AND 30),
    status TEXT NOT NULL CHECK (status IN ('ACTIVE','RETURNED')),
    late_days INTEGER NOT NULL DEFAULT 0 CHECK (late_days >= 0),
    issued_at TEXT NOT NULL,
    returned_at TEXT
);

CREATE UNIQUE INDEX IF NOT EXISTS one_active_loan_per_book ON loans(isbn) WHERE status = 'ACTIVE';

CREATE TABLE IF NOT EXISTS reservations (
    reservation_id INTEGER PRIMARY KEY AUTOINCREMENT,
    member_id TEXT NOT NULL REFERENCES members(member_id),
    isbn TEXT NOT NULL REFERENCES books(isbn),
    created_at TEXT NOT NULL,
    UNIQUE(member_id, isbn)
);

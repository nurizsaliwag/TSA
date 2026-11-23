CREATE DATABASE IF NOT EXISTS bookbridge;
USE bookbridge;

CREATE TABLE IF NOT EXISTS members (
    member_id VARCHAR(30) PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    membership_type ENUM('STUDENT','FACULTY','GUEST') NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS books (
    isbn VARCHAR(30) PRIMARY KEY,
    title VARCHAR(180) NOT NULL,
    total_copies INT NOT NULL DEFAULT 1 CHECK (total_copies > 0),
    available_copies INT NOT NULL DEFAULT 1 CHECK (available_copies >= 0 AND available_copies <= total_copies),
    status ENUM('AVAILABLE','CHECKED_OUT') NOT NULL DEFAULT 'AVAILABLE',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS loans (
    loan_id VARCHAR(30) PRIMARY KEY,
    member_id VARCHAR(30) NOT NULL,
    isbn VARCHAR(30) NOT NULL,
    loan_days INT NOT NULL CHECK (loan_days BETWEEN 1 AND 30),
    status ENUM('ACTIVE','RETURNED') NOT NULL DEFAULT 'ACTIVE',
    late_days INT NOT NULL DEFAULT 0 CHECK (late_days >= 0),
    issued_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    returned_at TIMESTAMP NULL,
    active_isbn VARCHAR(30) AS (IF(status = 'ACTIVE', isbn, NULL)) STORED,
    CONSTRAINT fk_loan_member FOREIGN KEY (member_id) REFERENCES members(member_id),
    CONSTRAINT fk_loan_book FOREIGN KEY (isbn) REFERENCES books(isbn)
);

CREATE UNIQUE INDEX one_active_loan_per_book ON loans(active_isbn);

CREATE TABLE IF NOT EXISTS reservations (
    reservation_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    member_id VARCHAR(30) NOT NULL,
    isbn VARCHAR(30) NOT NULL,
    status ENUM('WAITING','CANCELLED','FULFILLED') NOT NULL DEFAULT 'WAITING',
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_reservation_member FOREIGN KEY (member_id) REFERENCES members(member_id),
    CONSTRAINT fk_reservation_book FOREIGN KEY (isbn) REFERENCES books(isbn),
    UNIQUE KEY one_waiting_reservation (member_id, isbn, status)
);

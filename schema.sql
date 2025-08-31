-- Schema
-- Drop tables if they exist
DROP TABLE transactions CASCADE CONSTRAINTS;
DROP TABLE accounts CASCADE CONSTRAINTS;
DROP TABLE customers CASCADE CONSTRAINTS;

-- Customers Table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    full_name   VARCHAR2(50),
    mobile      VARCHAR2(15),
    adhar       VARCHAR2(12) CHECK (LENGTH(adhar) = 12),
    pan         VARCHAR2(10) CHECK (LENGTH(pan) = 10),
    address     VARCHAR2(100)
);

-- Accounts Table
CREATE TABLE accounts (
    account_no   NUMBER PRIMARY KEY,
    customer_id  NUMBER REFERENCES customers(customer_id),
    account_type VARCHAR2(20),
    balance      NUMBER(12,2)
);

-- Transactions Table
CREATE TABLE transactions (
    transaction_id   NUMBER PRIMARY KEY,
    account_no       NUMBER REFERENCES accounts(account_no),
    transaction_type VARCHAR2(10),
    amount           NUMBER(12,2),
    transaction_date DATE DEFAULT SYSDATE
);

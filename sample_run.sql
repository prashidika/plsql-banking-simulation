-- Sample execution commands
-- Add Customers
INSERT INTO customers VALUES (customer_seq.NEXTVAL, 'Rahul Sharma', '9876543210', '123456789012', 'ABCDE1234F', 'Delhi');
INSERT INTO customers VALUES (customer_seq.NEXTVAL, 'Priya Verma', '9123456780', '987654321098', 'PQRSX5678Y', 'Mumbai');

-- Open Accounts
EXEC proc_open_account(1, 'SAVINGS', 1000);
EXEC proc_open_account(2, 'CURRENT', 2000);

-- Deposit
EXEC proc_deposit(1001, 500);

-- Withdraw
EXEC proc_withdraw(1001, 200);

-- Transfer
EXEC proc_transfer(1001, 1002, 300);

-- Check balances
SELECT * FROM accounts;
SELECT * FROM transactions;

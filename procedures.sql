-- Stored Procedures for Banking Simulation
-- Open Account
CREATE OR REPLACE PROCEDURE proc_open_account(
    p_customer_id    NUMBER,
    p_account_type   VARCHAR2,
    p_initial_deposit NUMBER
) AS
    v_account_no NUMBER;
BEGIN
    v_account_no := account_seq.NEXTVAL;

    INSERT INTO accounts(account_no, customer_id, account_type, balance)
    VALUES (v_account_no, p_customer_id, p_account_type, p_initial_deposit);

    INSERT INTO transactions(transaction_id, account_no, transaction_type, amount)
    VALUES (transaction_seq.NEXTVAL, v_account_no, 'DEPOSIT', p_initial_deposit);

    DBMS_OUTPUT.PUT_LINE('Account created with Account No: ' || v_account_no);
END;
/

-- Deposit
CREATE OR REPLACE PROCEDURE proc_deposit(
    p_account_no NUMBER,
    p_amount     NUMBER
) AS
BEGIN
    UPDATE accounts
    SET balance = balance + p_amount
    WHERE account_no = p_account_no;

    INSERT INTO transactions(transaction_id, account_no, transaction_type, amount)
    VALUES (transaction_seq.NEXTVAL, p_account_no, 'DEPOSIT', p_amount);
END;
/

-- Withdraw
CREATE OR REPLACE PROCEDURE proc_withdraw(
    p_account_no NUMBER,
    p_amount     NUMBER
) AS
    v_balance NUMBER;
BEGIN
    SELECT balance INTO v_balance FROM accounts WHERE account_no = p_account_no;

    IF v_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20001, 'Insufficient balance');
    ELSE
        UPDATE accounts
        SET balance = balance - p_amount
        WHERE account_no = p_account_no;

        INSERT INTO transactions(transaction_id, account_no, transaction_type, amount)
        VALUES (transaction_seq.NEXTVAL, p_account_no, 'WITHDRAW', p_amount);
    END IF;
END;
/

-- Transfer
CREATE OR REPLACE PROCEDURE proc_transfer(
    p_from_acc NUMBER,
    p_to_acc   NUMBER,
    p_amount   NUMBER
) AS
BEGIN
    -- Withdraw from source
    proc_withdraw(p_from_acc, p_amount);

    -- Deposit into target
    proc_deposit(p_to_acc, p_amount);
END;
/

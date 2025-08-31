-- Demonstration of exception handling in withdrawal

CREATE OR REPLACE PROCEDURE proc_safe_withdraw(
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

        DBMS_OUTPUT.PUT_LINE('Withdrawal successful');
    END IF;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Account not found');
END;
/

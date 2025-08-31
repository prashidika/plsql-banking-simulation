-- Trigger to prevent negative balance

CREATE OR REPLACE TRIGGER trg_prevent_negative_balance
BEFORE UPDATE OF balance ON accounts
FOR EACH ROW
BEGIN
    IF :NEW.balance < 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Balance cannot go below zero');
    END IF;
END;
/

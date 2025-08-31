# PL/SQL Banking Simulation

A mini banking system built using Oracle PL/SQL to simulate basic banking operations.

## Features
- Tables: Customers, Accounts, Transactions (with constraints & foreign keys)
- Sequences: Auto-increment for Customer ID, Account No, Transaction ID
- Procedures: Account opening, deposit, withdrawal, transfer
- Triggers: Prevent negative balance
- Exception Handling: Handles insufficient funds during withdrawal

## Files
- `schema.sql` → Table creation with constraints
- `sequences.sql` → Sequences for auto IDs
- `procedures.sql` → Stored procedures
- `triggers.sql` → Business rule triggers
- `sample_run.sql` → Sample EXEC calls

## How to Run
1. Open Oracle SQL Developer.
2. Run `schema.sql` (creates tables).
3. Run `sequences.sql` (creates sequences).
4. Run `triggers.sql` (creates triggers).
5. Run `procedures.sql` (creates procedures).
6. Test with `sample_run.sql`.

## Example Execution
```sql
EXEC proc_open_account(1, 'SAVINGS', 1000);
EXEC proc_deposit(1001, 500);
EXEC proc_withdraw(1001, 200);


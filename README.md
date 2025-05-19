# DataAnalytics-Assessment

### Question 1: High-Value Customers with Multiple Products
**Approach:** Joined savings and investment tables on owner ID, filtered for funded plans, aggregated and sorted by deposits.

### Question 2: Transaction Frequency Analysis
**Approach:** Calculated transaction tenure in months and average monthly transactions, then bucketed customers into frequency segments.

### Question 3: Account Inactivity Alert
**Approach:** Identified latest inflow dates for each plan, flagged those with >365 days since last inflow.

### Question 4: Customer Lifetime Value (CLV)
**Approach:** Estimated tenure since signup, profit from transactions, and projected CLV using simplified formula.

## Challenges
- Ensuring date differences are accurate across varying DBMS (MySQL, PostgreSQL).
- Handling NULL or division by zero in tenure/average calculations.
- Clarifying business logic for categorization and transaction types.


# DataAnalytics-Assessment

This repository contains solutions for the SQL Proficiency Assessment, designed to evaluate data analysis and query optimization skills.

##  Questions & Approach

### Question 1: High-Value Customers with Multiple Products

**Objective**: Identify customers with at least one funded savings plan and one funded investment plan, sorted by total deposits.

**Approach**:
- **Joins**: Combined `users_customuser`, `savings_savingsaccount`, and `plans_plan` tables using `owner_id`.
- **Filters**: Selected records where `confirmed_amount` > 0 for both savings and investment plans.
- **Aggregation**: Counted the number of savings and investment plans per customer.
- **Calculation**: Summed `confirmed_amount` for total deposits, converting from kobo to naira.
- **Ordering**: Sorted results by `total_deposits` in descending order.

### Question 2: Transaction Frequency Analysis

**Objective**: Categorize customers based on average number of transactions per month.

**Approach**:
- **Aggregation**: Calculated total transactions and determined the tenure in months for each customer.
- **Calculation**: Computed average transactions per month.
- **Categorization**:
  - High Frequency: ≥10 transactions/month
  - Medium Frequency: 3–9 transactions/month
  - Low Frequency: ≤2 transactions/month

### Question 3: Account Inactivity Alert

**Objective**: Identify active accounts with no inflow transactions in the last 365 days.

**Approach**:
- **Data Retrieval**: Extracted the latest transaction date for each plan from `savings_savingsaccount` and `plans_plan`.
- **Calculation**: Determined the number of days since the last transaction using `DATEDIFF`.
- **Filtering**: Selected accounts where inactivity exceeded 365 days.

### Question 4: Customer Lifetime Value (CLV) Estimation

**Objective**: Estimate CLV based on account tenure and transaction volume.

**Approach**:
- **Tenure Calculation**: Computed the number of months since each customer's `date_joined`.
- **Transaction Analysis**: Counted total transactions per customer.
- **Profit Estimation**: Assumed profit per transaction as 0.1% of the transaction value.
- **CLV Calculation**: 
- **Ordering**: Sorted customers by estimated CLV in descending order.

##  Challenges Encountered

- **Date Calculations**: Ensured accurate tenure and inactivity calculations by handling cases where tenure could be zero to avoid division by zero errors.
- **Data Conversion**: Converted monetary values from kobo to naira by dividing by 100 for readability and consistency.
- **Categorization Logic**: Defined clear thresholds for transaction frequency categories to ensure accurate segmentation.




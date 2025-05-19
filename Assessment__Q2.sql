SELECT
    CASE
        WHEN avg_txns_per_month >= 10 THEN 'High Frequency'
        WHEN avg_txns_per_month BETWEEN 3 AND 9 THEN 'Medium Frequency'
        ELSE 'Low Frequency'
    END AS frequency_category,
    COUNT(*) AS customer_count,
    ROUND(AVG(avg_txns_per_month), 1) AS avg_transactions_per_month
FROM (
    SELECT 
        s.owner_id,
        COUNT(*) AS total_txns,
        GREATEST(TIMESTAMPDIFF(MONTH, MIN(s.transaction_date), MAX(s.transaction_date)), 1) AS tenure_months,
        COUNT(*) / GREATEST(TIMESTAMPDIFF(MONTH, MIN(s.transaction_date), MAX(s.transaction_date)), 1) AS avg_txns_per_month
    FROM savings_savingsaccount s
    GROUP BY s.owner_id
) AS txn_summary
GROUP BY frequency_category;

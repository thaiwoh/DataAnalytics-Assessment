SELECT 
    plan_id,
    owner_id,
    type,
    last_transaction_date,
    DATEDIFF(CURDATE(), last_transaction_date) AS inactivity_days
FROM (
    SELECT 
        id AS plan_id,
        owner_id,
        'Savings' AS type,
        MAX(transaction_date) AS last_transaction_date
    FROM savings_savingsaccount
    GROUP BY id, owner_id

    UNION ALL

    SELECT 
        id AS plan_id,
        owner_id,
        'Investment' AS type,
        MAX(start_date) AS last_transaction_date
    FROM plans_plan
    GROUP BY id, owner_id
) AS combined
WHERE DATEDIFF(CURDATE(), last_transaction_date) > 365;

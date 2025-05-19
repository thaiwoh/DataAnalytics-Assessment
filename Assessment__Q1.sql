SELECT 
    u.id AS owner_id,
    CONCAT(u.first_name, ' ', u.last_name) AS name,
    COUNT(DISTINCT s.id) AS savings_count,
    COUNT(DISTINCT p.id) AS investment_count,
    ROUND(SUM(s.confirmed_amount) / 100, 2) AS total_deposits
FROM users_customuser u
JOIN savings_savingsaccount s ON u.id = s.owner_id AND s.confirmed_amount > 0
JOIN plans_plan p ON u.id = p.owner_id AND p.is_a_fund = 1 AND p.amount > 0
GROUP BY u.id, name
HAVING savings_count >= 1 AND investment_count >= 1
ORDER BY total_deposits DESC;

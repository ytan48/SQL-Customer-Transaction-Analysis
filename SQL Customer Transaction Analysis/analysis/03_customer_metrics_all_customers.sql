-- TARGET:
-- Customer-level transaction count and total transaction amount

SELECT
    c.customer_id,
    COALESCE(COUNT(t.transaction_id), 0) AS transaction_count,
    COALESCE(SUM(t.amount), 0) AS total_amount
FROM customers AS c
LEFT JOIN transactions AS t
    ON c.customer_id = t.customer_id
GROUP BY
    c.customer_id
ORDER BY
    total_amount DESC;

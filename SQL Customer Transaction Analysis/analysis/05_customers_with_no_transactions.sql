--TARGET: 
-- Identify customers who have never made a transaction

SELECT
    c.customer_id
FROM customers AS c
LEFT JOIN transactions AS t
    ON c.customer_id = t.customer_id
WHERE t.transaction_id IS NULL
ORDER BY c.customer_id;
-- TARGET: 
-- The number of transactions, total transaction amount, and average transaction amount for each customer.

SELECT
    customer_id,
    count(*) AS transcation_count,
    sum(amount) AS total_amount,
    avg(amount) AS avg_amount
FROM transactions
GROUP BY customer_id
ORDER BY total_amount DESC;

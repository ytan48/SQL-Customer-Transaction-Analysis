-- TARGET: 
-- Compare transaction performance by customer_status (active vs inactive)

SELECT
	c.customer_status,
	COUNT(*) AS customer_count,
	COUNT(DISTINCT CASE 
		WHEN t.transaction_id IS NOT NULL 
		THEN c.customer_id END) AS customers_with_transactions,
	COUNT(t.transaction_id) AS transaction_id_count,
	COALESCE(SUM(t.amount), 0) AS total_transaction_amount
FROM customers AS c
LEFT JOIN transactions t
	ON c.customer_id = t.customer_id
GROUP BY c.customer_status
ORDER By total_transaction_amount DESC;
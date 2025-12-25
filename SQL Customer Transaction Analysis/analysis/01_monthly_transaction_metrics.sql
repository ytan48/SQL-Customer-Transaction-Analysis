-- TARGET:
-- Calculate the number of transactions and total transaction amount on a monthly basis.
SELECT
    month,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
FROM (
      SELECT
	  date_trunc('month', transaction_date) AS month,
	  amount
	  FROM transactions) t
GROUP BY
    month
ORDER BY
    month ASC;

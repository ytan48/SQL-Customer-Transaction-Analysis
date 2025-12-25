-- insert customers
INSERT INTO customers (customer_id, signup_date, customer_status)
SELECT
    id,
    DATE '2023-01-01' + (id % 365),
    CASE
        WHEN id % 5 = 0 THEN 'inactive'
        ELSE 'active'
    END
FROM generate_series(1, 500) AS id;

-- insert transcations
INSERT INTO transactions (transaction_id, customer_id, transaction_date, amount)
SELECT
    t_id,
    (t_id % 500) + 1,
    DATE '2023-01-01' + (t_id % 365),
    ROUND((RANDOM() * 200)::numeric, 2)
FROM generate_series(1, 5000) AS t_id;


-- check
SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM transactions;
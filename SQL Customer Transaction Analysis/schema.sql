SELECT current_database();

-- customers table
CREATE TABLE customers (
    customer_id INTEGER PRIMARY KEY,
    signup_date DATE NOT NULL,
    customer_status TEXT NOT NULL
);

-- transactions table
CREATE TABLE transactions (
    transaction_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    transaction_date DATE NOT NULL,
    amount NUMERIC(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- check
SELECT * FROM customers LIMIT 1;
SELECT * FROM transactions LIMIT 1;




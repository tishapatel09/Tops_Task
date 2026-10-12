-- task 1 

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    payment_method VARCHAR(20),
    amount DECIMAL(10,2)
);

INSERT INTO Orders (order_id, user_id, payment_method, amount)
VALUES
(101, 1, 'UPI', 450.00),
(102, 2, 'Card', 1200.50),
(103, 3, 'Wallet', 650.00),
(104, 1, 'COD', 800.00),
(105, 4, 'UPI', 350.00),
(106, 5, 'Card', 2200.00),
(107, 3, 'COD', 550.00),
(108, 6, 'Wallet', 900.00);

-- task 2 

SELECT payment_method, COUNT(*) AS total_orders
FROM Orders
GROUP BY payment_method;

-- task 3 

SELECT user_id, SUM(amount) AS total_spend
FROM Orders
GROUP BY user_id;

-- task 4 

SELECT payment_method, AVG(amount) AS average_amount
FROM Orders
GROUP BY payment_method
HAVING AVG(amount) > 300;

-- task 5 

SELECT *
FROM Orders
WHERE amount > 500;

-- WHERE filters rows.

SELECT user_id, SUM(amount) AS total_spend
FROM Orders
GROUP BY user_id
HAVING SUM(amount) > 1000;

-- HAVING filters groups/results of aggregation.
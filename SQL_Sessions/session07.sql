-- task 1 

CREATE TABLE Orderss (
    order_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    total_amount DECIMAL(10,2),
    order_date DATE
);

INSERT INTO Orderss (order_id, user_name, total_amount, order_date)
VALUES
(1, 'Rahul', 450.00, '2026-09-25'),
(2, 'Priya', 800.50, '2026-09-26'),
(3, 'Amit', NULL, '2026-09-27'),
(4, 'Sneha', 1200.00, '2026-09-28'),
(5, 'Vikas', 350.75, '2026-09-29');


-- task 2 

SELECT user_name, COUNT(*) AS order_count
FROM Orderss
GROUP BY user_name;

-- task 3 

SELECT AVG(total_amount) AS average_amount
FROM Orderss;


-- task 4

SELECT 
    MAX(total_amount) AS highest_amount,
    MIN(total_amount) AS lowest_amount
FROM Orderss;

-- task 5 

SELECT SUM(total_amount) AS total_sales
FROM Orderss
WHERE total_amount IS NOT NULL;



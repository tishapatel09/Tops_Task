-- task 1 

INSERT INTO Restaurants (id, name, cuisine, rating, city , cost_for_two)
VALUES
(7, 'Spice Garden', 'North Indian', 4.5, 'Ahmedabad',100),
(8, 'Pizza Palace', 'Italian', 4.2, 'Mumbai',200),
(9, 'Biryani House', 'Biryani', 4.7, 'Delhi',300),
(10, 'South Tadka', 'South Indian', 4.3, 'Bengaluru',400),
(51, 'Burger Hub', 'Fast Food', 4.0, 'Pune',500);


-- task 2 

SELECT *
FROM Restaurants
WHERE rating > 4.0 AND (city = 'Ahmedabad' OR city = 'Surat');

-- task 3 

SELECT *
FROM Restaurants
WHERE name LIKE 'Swa%';


-- task 4 

SELECT *
FROM Restaurants
WHERE rating BETWEEN 3.5 AND 4.5;

-- task 5 

SELECT *
FROM Restaurants
WHERE cuisine IN ('Chinese', 'Italian', 'South Indian');
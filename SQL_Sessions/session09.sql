-- task 1 

CREATE DATABASE restaurant;
use restaurant;

CREATE TABLE detail_restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE dishes (
    id INT PRIMARY KEY,
    restaurant_id INT,
    dish_name VARCHAR(100),
    price DECIMAL(10,2),
    FOREIGN KEY (restaurant_id) REFERENCES detail_restaurants(id)
);

INSERT INTO detail_restaurants (id, name, city)
VALUES
(1, 'Spice Garden', 'Ahmedabad'),
(2, 'Pizza Palace', 'Mumbai'),
(3, 'Biryani House', 'Delhi');

INSERT INTO dishes (id, restaurant_id, dish_name, price)
VALUES
(1, 1, 'Paneer Tikka', 250.00),
(2, 1, 'Butter Naan', 80.00),
(3, 1, 'Dal Makhani', 220.00),

(4, 2, 'Margherita Pizza', 350.00),
(5, 2, 'Farmhouse Pizza', 450.00),
(6, 2, 'Garlic Bread', 180.00),

(7, 3, 'Chicken Biryani', 300.00),
(8, 3, 'Mutton Biryani', 400.00),
(9, 3, 'Raita', 70.00);

-- task 2 

SELECT 
    dishes.dish_name,
    detail_restaurants.name AS restaurant_name,
    detail_restaurants.city
FROM dishes
INNER JOIN detail_restaurants
    ON dishes.restaurant_id = detail_restaurants.id;
    
    
-- task 3 

SELECT 
    detail_restaurants.name AS restaurant_name,
    detail_restaurants.city,
    dishes.dish_name,
    dishes.price
FROM detail_restaurants
LEFT JOIN dishes
    ON detail_restaurants.id = dishes.restaurant_id;  
    
    
-- task 4 

SELECT 
    dishes.dish_name,
    dishes.price,
    detail_restaurants.name AS restaurant_name
FROM detail_restaurants
RIGHT JOIN dishes
    ON detail_restaurants.id = dishes.restaurant_id;    
    
-- task 5 

SELECT r.name , d.dish_name FROM detail_restaurants as r 
LEFT JOIN
dishes as d on r.id = d.restaurant_id;   
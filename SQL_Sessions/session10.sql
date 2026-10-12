-- task 1 
use company;


CREATE TABLE Influencers (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Collaborations (
    id INT PRIMARY KEY,
    influencer1_id INT,
    influencer2_id INT,
    collab_date DATE
);

INSERT INTO Influencers (id, name)
VALUES
(1, 'Aman'),
(2, 'Priya'),
(3, 'Rahul'),
(4, 'Sneha'),
(5, 'Vikas');


INSERT INTO Collaborations
(id, influencer1_id, influencer2_id, collab_date)
VALUES
(1, 1, 2, '2026-09-20'),
(2, 2, 3, '2026-09-22'),
(3, 4, 99, '2026-09-25');


SELECT
    i1.name AS influencer,
    i2.name AS collaboration_partner
FROM Influencers i1
LEFT JOIN Collaborations c
    ON i1.id = c.influencer1_id
LEFT JOIN Influencers i2
    ON c.influencer2_id = i2.id

UNION

SELECT
    i2.name AS influencer,
    i1.name AS collaboration_partner
FROM Influencers i2
RIGHT JOIN Collaborations c
    ON i2.id = c.influencer2_id
LEFT JOIN Influencers i1
    ON c.influencer1_id = i1.id;
    
    
-- task 2 

CREATE TABLE Playlists (
    id INT PRIMARY KEY,
    user_id INT,
    playlist_name VARCHAR(100),
    parent_playlist_id INT
);   

INSERT INTO Playlists
(id, user_id, playlist_name, parent_playlist_id)
VALUES
(1, 101, 'My Music', NULL),
(2, 101, 'Workout Songs', 1),
(3, 101, 'Party Songs', 1),
(4, 102, 'Chill Songs', NULL),
(5, 102, 'Evening Chill', 4); 
    
SELECT
    p.playlist_name AS playlist,
    parent.playlist_name AS parent_playlist
FROM Playlists p
LEFT JOIN Playlists parent
    ON p.parent_playlist_id = parent.id;    
    
-- task 3 

CREATE TABLE Users (
    id INT PRIMARY KEY,
    username VARCHAR(50)
);

CREATE TABLE Orders (
    id INT PRIMARY KEY,
    user_id INT,
    order_date DATE,
    FOREIGN KEY (user_id) REFERENCES Users(id)
);

CREATE TABLE Payments (
    id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(id)
);

INSERT INTO Users (id, username)
VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit'),
(4, 'Sneha');  


INSERT INTO Orders (id, user_id, order_date)
VALUES
(101, 1, '2026-09-25'),
(102, 1, '2026-09-27'),
(103, 2, '2026-09-28');

INSERT INTO Payments (id, order_id, amount)
VALUES
(201, 101, 500.00),
(202, 102, 750.00);

SELECT
    Users.username,
    Orders.order_date,
    Payments.amount
FROM Users
LEFT JOIN Orders
    ON Users.id = Orders.user_id
LEFT JOIN Payments
    ON Orders.id = Payments.order_id;  
    
    
    
-- task 4 

CREATE TABLE Restaurants (
    id INT PRIMARY KEY,
    name VARCHAR(100)
);



CREATE TABLE Reviews (
    id INT PRIMARY KEY,
    restaurant_id INT,
    rating DECIMAL(2,1),
    review_text VARCHAR(255)
); 

INSERT INTO Restaurants (id, name)
VALUES
(1, 'Spice Garden'),
(2, 'Pizza Palace'),
(3, 'Biryani House'); 

INSERT INTO Reviews (id, restaurant_id, rating, review_text)
VALUES
(101, 1, 4.5, 'Great food'),
(102, 1, 4.0, 'Good service'),
(103, 2, 4.2, 'Nice pizza'),
(104, 2, 4.5, 'Very tasty');

SELECT
    Restaurants.name,
    Reviews.rating
FROM Restaurants
JOIN Reviews
    ON Restaurants.id = Reviews.restaurant_id;  
    
-- Remove duplicate restaurant names    


SELECT DISTINCT
    Restaurants.name
FROM Restaurants
JOIN Reviews
    ON Restaurants.id = Reviews.restaurant_id;  
    
-- task 5 


CREATE TABLE Categories (
    id INT PRIMARY KEY,
    category_name VARCHAR(100)
);   

CREATE TABLE Products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
); 

INSERT INTO Categories (id, category_name)
VALUES
(10, 'Mobiles'),
(20, 'Laptops'),
(30, 'Televisions'),
(40, 'Headphones');

INSERT INTO Products (id, product_name, category_id)
VALUES
(1, 'iPhone 15', 10),
(2, 'Samsung Galaxy S24', 10),
(3, 'HP Laptop', 20),
(4, 'Dell Laptop', 20),
(5, 'Sony TV', 30),
(6, 'Boat Headphones', 40);

-- JOIN Query 1 — Using IDs
SELECT
    p.product_name,
    c.category_name
FROM Products p
JOIN Categories c
    ON p.category_id = c.id;
    
-- JOIN Query 2 — Using two columns in the condition

SELECT
    p.product_name,
    c.category_name
FROM Products p
JOIN Categories c
    ON p.category_id = c.id
    AND c.id > 20; 
    
    
    
    
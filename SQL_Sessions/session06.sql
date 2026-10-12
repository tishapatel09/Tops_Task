CREATE TABLE products (
    id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO products (id, product_name, price)
VALUES
(1, 'Laptop', 55000),
(2, 'Headphones', 1500),
(3, 'Mouse', 700),
(4, 'Keyboard', 1200),
(5, 'Smartphone', 25000);

-- task 1


SELECT *
FROM products
ORDER BY price ASC;


-- task 2 

SELECT *
FROM products
ORDER BY price DESC
LIMIT 5;

-- task 3 

SELECT * FROM movies
ORDER BY name DESC , rating DESC;

-- task 4 

SELECT name FROM movies 
ORDER BY name ASC
LIMIT 10;


-- task 5 


USE music_streaming_app;

CREATE TABLE songs (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    play_count INT,
    added_date DATE
);

INSERT INTO songs (id, song_name, artist, play_count, added_date)
VALUES
(1, 'Blinding Lights', 'The Weeknd', 5000, '2026-09-20'),
(2, 'Shape of You', 'Ed Sheeran', 7000, '2026-09-15'),
(3, 'Levitating', 'Dua Lipa', 5000, '2026-09-25'),
(4, 'Perfect', 'Ed Sheeran', 4500, '2026-09-28'),
(5, 'Stay', 'The Kid LAROI', 6000, '2026-09-30'),
(6, 'Believer', 'Imagine Dragons', 5000, '2026-09-27');

SELECT *
FROM songs
ORDER BY play_count DESC, added_date DESC
LIMIT 3;


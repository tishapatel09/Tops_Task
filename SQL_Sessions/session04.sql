use music_streaming_app;


-- task 1 

CREATE TABLE MusicPlaylist (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    genre VARCHAR(50),
    duration INT
);

INSERT INTO MusicPlaylist (id, song_name, artist, genre, duration)
VALUES
(1, 'Excuses', 'AP Dhillon', 'Punjabi', 163),
(2, 'Brown Munde', 'AP Dhillon', 'Punjabi', 248),
(3, 'Kesariya', 'Arijit Singh', 'Bollywood', 268),
(4, 'Heeriye', 'Jasleen Royal', 'Pop', 191),
(5, 'Blinding Lights', 'The Weeknd', 'Pop', 200);

SELECT *FROM MusicPlaylist;

-- task 2 

SELECT song_name, artist FROM MusicPlaylist
LIMIT 3;

-- task 3 
USE zomato;

SELECT DISTINCT name FROM restaurants;

-- task 4 

SELECT name as restaurants_name , rating as number FROM restaurants;

-- task 5 

SELECT DISTINCT name , city
FROM restaurants
LIMIT 2;



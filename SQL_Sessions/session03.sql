USE music_streaming_app;

-- task 1 

CREATE TABLE Playlists (
    id INT PRIMARY KEY,
    song_name VARCHAR(100),
    artist VARCHAR(100),
    duration INT
);

INSERT INTO Playlists (id, song_name, artist, duration)
VALUES (1, 'Excuses', 'AP Dhillon', 163);


-- task 2 

INSERT INTO Playlists (id, song_name, artist, duration)
VALUES
(2, 'Brown Munde', 'yo yo ', 248),
(3, 'Kesariya', 'Arijit Singh', 268),
(4, 'Heeriye', 'Jasleen Royal', 191);

SELECT * FROM Playlists;


-- task 3 

UPDATE Playlists
SET artist = 'shreya gosal'
WHERE artist = 'Arijit Singh';

-- task 4 

DELETE FROM Playlists
WHERE duration < 120;

-- task 5 

UPDATE Playlists
SET song_name = CONCAT(song_name, ' (Remix)')
WHERE artist = 'yo yo '
AND duration > 162;
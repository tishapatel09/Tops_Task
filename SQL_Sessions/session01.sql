-- task 1

CREATE DATABASE music_streaming_app;
USE music_streaming_app;


-- task 2 

CREATE TABLE playlist(
	playlist_id INT PRIMARY KEY,
    name VARCHAR(20),
    created_by VARCHAR(20)
    );
    
    
-- task 3 

INSERT INTO playlist(playlist_id, name, created_by)
VALUES
(1, 'Bollywood Hits', 'Amit'),
(2, 'Chill Vibes', 'Rahul'),
(3, 'Workout Mix', 'Priya');    


-- task 4 

SELECT * FROM playlist;

SELECT * FROM playlist
WHERE created_by = "Amit";


-- task 5 

/*


In SQL, a table is used to store related data,
a row represents one complete record,
and a column represents one specific type of information.

For example, in a Zomato food delivery app,
an orders table could contain order_id, customer_name,
restaurant, and amount.

Table = collection of data
Row = one record
Column = one type of information
*/



    



-- Use the albums_db database.

USE `albums_db`;

-- Explore the structure of the albums table. 

DESCRIBE albums;

-- a. How many rows are in the albums table?

SELECT * 
FROM albums;

-- 31

-- b. How many unique artist names are in the albums table?

SELECT DISTINCT artist
FROM albums;

-- 23

-- c. What is the primary key for the albums table?

-- id

-- d. What is the oldest release date for any album in the albums table? What is the most recent release date?

SELECT max(release_date), min(release_date)
FROM albums;

-- 1967, 2011

-- Write queries to find the following information:

-- a. The name of all albums by Pink Floyd

SELECT name, artist 
FROM albums
WHERE artist LIKE 'Pink F%';

-- b. The year Sgt. Pepper's Lonely Hearts Club Band was released

SELECT name, release_date
FROM albums
WHERE name LIKE "%Lonely Hearts Club%";

-- 1967

-- c. The genre for the album Nevermind

SELECT name, genre
FROM albums
WHERE name LIKE '%Nevermind%';

-- Grunge, Alternative Rock

-- d. Which albums were released in the 1990s

SELECT name, release_date
FROM albums
WHERE release_date LIKE '199%';

-- e. Which albums had less than 20 million certified sales

SELECT name, sales
FROM albums
WHERE sales <= 21;

-- f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?

SELECT name, genre
FROM albums
WHERE genre = "Rock";

-- Because literal string specified.
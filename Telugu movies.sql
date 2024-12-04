CREATE DATABASE telugu_movies;
USE  telugu_movies;
CREATE TABLE genres (
Genre_id INT auto_increment primary key,
Name varchar(100) NOT NULL 
);
CREATE TABLE directors(
Director_id INT auto_increment primary key,
Name VARCHAR(255) NOT NULL 
);
CREATE TABLE movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    genre_id INT,
    director_id INT,
    hero_name VARCHAR(255),
    rating DECIMAL(3,1),
    FOREIGN KEY (genre_id) REFERENCES genres(genre_id),
    FOREIGN KEY (director_id) REFERENCES directors(director_id)
);
CREATE TABLE movie_actors (
    movie_id INT,
    actor_id INT,
    PRIMARY KEY (movie_id, actor_id),
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);
INSERT INTO genres (name) VALUES
('Romance'),
('Drama'),
('Action'),
('Comedy'),
('Thriller'),
('Family'),
('Fantasy');
select * from genres;
INSERT INTO directors (name) VALUES
('Lakshmi Sowjanya'),
('Trivikram Srinivas'),
('Venky Atluri'),
('Vikram K. Kumar'),
('K. S. Ravindra (Bobby)'),
('Dasarath'),
('Radha Krishna Kumar'),
('Sukumar'),
('Vamsi Paidipally'),
('K. V. Rajendra Prasad'),
('Karunakaran'),
('Sekhar Kammula'),
('Rakesh Sashi'),
('Palnati Surya Pratap'),
('C. Prem Kumar'),
('B.V. Nandini Reddy'),
('Bhaskar'),
('Sekhar Kammula'),
('Subbu'),
('Bharat Kamma'),
('Tharun Bhascker');
select * from directors;
INSERT INTO movies (title, release_year, genre_id, director_id, hero_name, rating) VALUES
('Varudu Kavalenu', 2021, 1, 1, 'Naga Shaurya', 6.5),
('Aravinda Sameta', 2018, 2, 2, 'Jr. NTR', 7.9),
('Mr Majnu', 2019, 1, 3, 'Akhil Akkineni', 6.0),
('Hello', 2017, 1, 4, 'Akhil Akkineni', 7.2),
('Darling', 2010, 1, 5, 'Prabhas', 7.6),
('Mr Perfect', 2011, 1, 6, 'Prabhas', 7.7),
('Raadhe Shyam', 2022, 1, 7, 'Prabhas', 5.9),
('Nannaku Prematho', 2016, 2, 8, 'NTR Jr.', 7.8),
('Oopiri', 2016, 3, 9, 'Nagarjuna Akkineni', 8.0),
('Awara', 2018, 1, 10, 'Sai Dharam Tej', 6.2),
('Tholi Prema', 2018, 1, 11, 'Varun Tej', 7.9),
('Fidaa', 2017, 1, 12, 'Varun Tej', 8.0),
('The Family Star', 2023, 2, 13, 'Allari Naresh', 6.3),
('18 Pages', 2022, 1, 14, 'Nikhil Siddhartha', 7.4),
('Jaanu', 2020, 1, 15, 'Sharwanand', 7.3),
('Oh Baby', 2019, 1, 16, 'Samantha Akkineni', 7.6),
('Bommarillu', 2006, 1, 17, 'Siddharth', 8.2),
('Godavari', 2006, 1, 12, 'Kamalini Mukherjee', 7.1),
('Anand', 2004, 2, 12, 'Rajeev Kanakala', 7.5),
('Oy!', 2009, 1, 18, 'Siddharth', 6.8),
('Dear Comrade', 2019, 2, 19, 'Vijay Deverakonda', 7.9),
('Pelli Choopulu', 2016, 1, 20, 'Vijay Deverakonda', 7.6),
('Endukante Premanta', 2012, 1, 11, 'Ram', 5.5);
select * from movies ;
SELECT title, release_year, rating FROM movies;
SELECT title FROM movies WHERE rating > 7.0;
SELECT title, release_year FROM movies WHERE rating > 7.0 AND release_year > 2015;
SELECT title FROM movies WHERE title LIKE 'A%';  
SELECT title, rating FROM movies ORDER BY rating DESC;
SELECT title, release_year FROM movies ORDER BY release_year DESC LIMIT 5;
SELECT COUNT(*) FROM movies;
SELECT SUM(rating) FROM movies;
SELECT AVG(rating) FROM movies;
SELECT MIN(rating), MAX(rating) FROM movies;
SELECT genre_id, AVG(rating) FROM movies GROUP BY genre_id;
SELECT genre_id, AVG(rating) FROM movies GROUP BY genre_id HAVING AVG(rating) > 7.5;
SELECT CONCAT(title, ' - ', release_year) AS movie_details FROM movies;
SELECT UPPER(title) FROM movies;
SELECT LOWER(hero_name) FROM movies;
SELECT m.title, d.name AS director
FROM movies m
INNER JOIN directors d ON m.director_id = d.director_id;
SELECT m.title, d.name AS director
FROM movies m
LEFT JOIN directors d ON m.director_id = d.director_id;
SELECT m.title, d.name AS director
FROM movies m
RIGHT JOIN directors d ON m.director_id = d.director_id;  
SELECT m.title, d.name AS director
FROM movies m
full outer JOIN directors d ON m.director_id = d.director_id;
SELECT a.title AS movie_1, b.title AS movie_2
FROM movies a, movies b
WHERE a.release_year = b.release_year AND a.movie_id != b.movie_id;
SELECT title, (SELECT name FROM directors WHERE director_id = movies.director_id) AS director
FROM movies;
SELECT title FROM movies WHERE rating > (SELECT AVG(rating) FROM movies);
SELECT title FROM movies WHERE EXISTS (SELECT 1 FROM directors WHERE directors.director_id = movies.director_id);
SELECT DISTINCT genre_id FROM movies;
SELECT title FROM movies WHERE genre_id IN (1, 2, 3);
SELECT title, 
       CASE 
           WHEN rating > 8 THEN 'Excellent'
           WHEN rating BETWEEN 7 AND 8 THEN 'Good'
           ELSE 'Average'
       END AS rating_category
FROM movies;
SELECT title FROM movies WHERE rating > 8
UNION
SELECT title FROM movies WHERE rating < 5;
CREATE TABLE example_table (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    created_at DATE
);
ALTER TABLE movies ADD COLUMN duration INT;
 select * from movies;
 ALTER TABLE movies DROP COLUMN duration;
 ALTER TABLE movies RENAME COLUMN rating TO movie_rating;
DROP TABLE example_table;
START TRANSACTION;
COMMIT;
ROLLBACK;
SAVEPOINT my_savepoint;
ROLLBACK TO my_savepoint;












 














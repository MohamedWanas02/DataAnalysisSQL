SELECT*FROM film
DESCRIBE film;
SELECT *FROM film LIMIT 20
SELECT COUNT(film_id) FROM film
SELECT COUNT(title) FROM film
SELECT * FROM film WHERE film_id IS NULL OR title IS NULL

-- Removing Duplicates
WITH FilmIDs AS (
    SELECT MIN(film_id) AS min_film_id
    FROM film
    GROUP BY title, description
)
DELETE FROM film
WHERE film_id NOT IN (
    SELECT min_film_id
    FROM MinFilmIDs
);

-- Handling Missing Values

DELETE FROM film
WHERE film_id IS NULL OR title IS NULL;

UPDATE film
SET rental_rate=0
WHERE rental_rate IS NULL 

SELECT * FROM address WHERE phone IS NULL

UPDATE address
SET phone = '000-000-0000'
WHERE phone IS NULL


-- Data Formats

UPDATE film
SET title = UPPER(title)

UPDATE customer
SET email = LOWER(TRIM(email))


SELECT film_id, title, DATE_FORMAT(last_update, '%d/%m/%Y') AS formatted_last_update
FROM film;        

-- Handling Outliers

-- Identifying Outliers

   SELECT *
FROM payment
WHERE amount > (
    SELECT AVG(amount)
    FROM payment
);

SELECT *
FROM payment
WHERE amount> (
    SELECT AVG(amount) + 3 * STDDEV(amount)
    FROM payment
);

-- Removing Outliers

DELETE FROM paymet
WHERE amount > (SELECT AVG(amount) + 3 * STDDEV(amount) FROM payment)










SELECT * FROM film;
SELECT*FROM payment
DESCRIBE film;
SELECT * FROM film LIMIT 20;
SELECT COUNT(title) FROM film;
SELECT release_year FROM film;
WHERE original_language_id IS NULL;


-- Retrieve the maximum, minimum, and average payment amount  from 'payment' table.
SELECT MAX(amount) AS MAX,
       MIN(amount) AS MIN,
       AVG(amount) AS AVG
FROM payment;


-- Retrieve assign quartiles, rank, and dense rank based on payment amount.
SELECT 
    c.first_name, 
    c.last_name, 
    p.amount AS payment_amount, 
    NTILE(4) OVER (ORDER BY p.amount DESC) AS payment_quartile,
    RANK() OVER (ORDER BY p.amount DESC) AS payment_rank,
    DENSE_RANK() OVER (ORDER BY p.amount DESC) AS payment_dense_rank
FROM payment AS p 
RIGHT JOIN customer AS c 
USING(customer_id) 
ORDER BY p.amount DESC;


-- Count number of films for each rating.
SELECT rating, COUNT(*) 
FROM film 
GROUP BY rating
ORDER BY COUNT(*) DESC;


-- Retrieve quartiles based on rental rate.
SELECT
    film_id,
    title,
    description,
    rental_rate,
    NTILE(4) OVER (ORDER BY rental_rate DESC) AS qu
FROM film
ORDER BY rental_rate DESC;


-- count films for each rental rate.
SELECT DISTINCT 
       rental_rate,
       COUNT(title) OVER (PARTITION BY rental_rate) AS film_count
FROM film;


-- Retrieve customer's first and last names, payment amount, and quartiles based on payment amount.
SELECT
    c.first_name,
    c.last_name,
    p.amount AS payment_amount,
    NTILE(4) OVER (ORDER BY p.amount DESC) AS payment_quartile
FROM payment AS p 
RIGHT JOIN customer AS c
USING(customer_id)
ORDER BY p.amount DESC;


--  joining 'category', 'film_category', and 'film' tables.
SELECT
   fc.film_id,
   f.title,
   c.category_id,
   c.name 
FROM category AS c
INNER JOIN film_category AS fc
ON fc.category_id = c.category_id 
INNER JOIN film AS f
ON f.film_id = fc.film_id;


-- Retrieve and rank the films by rental rate.
SELECT 
    film_id, 
    title, 
    rental_rate,
    RANK() OVER (ORDER BY rental_rate) AS rental_rank 
FROM film;


-- Top ten rental rate
SELECT rental_rate, title, description
FROM film 
WHERE rental_rate > 4 
LIMIT 10;

-- Top replacement_cost 
SELECT replacement_cost, rental_rate 
FROM film 
ORDER BY replacement_cost 
LIMIT 10;



-- Retrieve 'title' and 'special_features' from the 'film' table, ordered by 'rental_rate' .
SELECT title,
       special_features 
FROM film 
ORDER BY rental_rate DESC;



-- joining 'film' and 'language' tables.
SELECT
   f.title,
   f.language_id,
   l.name AS language
FROM language AS l 
RIGHT JOIN film AS f
USING(language_id);

-- Retrieve 'rental_rate', 'title', and the maximum rental rate from the 'film' table.
SELECT rental_rate, title,
       MAX(rental_rate) OVER() AS max_rate
FROM film;




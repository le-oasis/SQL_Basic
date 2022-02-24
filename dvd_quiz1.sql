-- Quiz Time 
-- Test your knowledge

-- How many transactions were > $5
SELECT COUNT(amount) FROM payment
WHERE amount > 5;

-- Actors with the first name that starts with letter P 
SELECT COUNT(*) FROM actor
WHERE first_name LIKE 'P%';

-- how many unique districts are our customers from?
SELECT COUNT(DISTINCT district)
FROM address;

-- Retrieve the list of names for those distinct districts from the previous question.
SELECT DISTINCT district
FROM address;

-- How many films have a rating of R and a replacement cost between $5 and $15?
SELECT * FROM film
WHERE rating = 'R' 
AND replacement_cost >= 5 AND replacement_cost <= 15;
--
SELECT * FROM film
WHERE rating = 'R' 
AND replacement_cost BETWEEN 5 AND 15;

--How many films have the word Truman somewhere in the title?
SELECT COUNT(*) FROM film
WHERE title LIKE '%Truman%';





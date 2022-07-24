-- Hello World, Welcome to the Oasis --

-- Hello everyone, welcome to your first assessment test.
-- You've actually had a lot of challenges along the way
-- so this isn't gonna be a very long assessment test.
-- It's actually just gonna be three quick questions
-- and it's also gonna be in article lecture format.



-- Q1
-- 1. Return the customer IDs of customers who have spent
-- at least $110 with the staff member who has an ID of 2.
-- The answer should be customers 187 and 148.
SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >= 110 ;


-- Q2
-- 2. How many films begin with the letter J?
-- The answer should be 20.
SELECT COUNT(title)
FROM film
WHERE title LIKE 'J%';


-- Q3
-- 3. What customer has the highest customer ID number whose name
-- starts with an 'E' and has an address ID lower than 500?
-- The answer is Eddie Tomlin
SELECT first_name, last_name
FROM customer
WHERE first_name LIKE 'E%'
AND address_id < 500
ORDER BY customer_id DESC
LIMIT 1;
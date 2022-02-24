-- JOINS
-- INNER JOIN

-- Here we want to
-- Join the payment table with the customer table in order to 
-- get maybe the customer table associated with a specific payment 
SELECT * FROM payment;
--
SELECT * FROM payment
INNER JOIN customer -- getting results where that a particular customer is in the customer and payment table.
ON payment.customer_id = customer.customer_id; -- join the column thats associated w payment n customer.


-- select certain columns: trim look
SELECT payment_id, payment.customer_id, first_name
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id;

-- FULL OUTER JOINS.
-- all the payments we have is associated with the current customer.
-- Pivacy Policy: we don't have any payment information, not associated with some
-- customer, and we also, more importantly, don't have 
-- any customers information who has never made a payment.
SELECT * FROM customer 
FULL OUTER JOIN payment -- fully join the customer table and the payment table.
ON customer.customer_id = payment.customer_id
WHERE customer.customer_id IS null -- filter to find rows that are either only unique to customer table(customer whos never made payment)
OR payment.payment_id IS null; -- .
--empty means we're in compliance with new privacy policy



-- other way 
SELECT COUNT(DISTINCT customer_id) FROM payment;

-- order is symmetrical  - left outer join 
SELECT * FROM inventory;

-- a film_id(unique identifier for the film), as well as the title.
SELECT film.film_id, title, inventory_id, store_id
FROM film 
LEFT JOIN inventory ON 
inventory.film_id = film.film_id
WHERE inventory.film_id IS null;






















-- FIRST WE DEAL WITH AS.

-- AS -- give the resulting column a new name / alias.
-- renaming the resulting column.
SELECT COUNT(amount) AS num_transactions 
FROM payment;

-- GROUP BY
-- showing how much each customer has spent
SELECT customer_id, SUM(amount)
FROM payment 
GROUP BY customer_id;

-- showing how much each customer has spent
-- AS comes after what kind of function call I want to rename.
SELECT customer_id, SUM(amount) AS total_spent 
FROM payment 
GROUP BY customer_id
ORDER BY SUM(amount) DESC ;

-- Clarify on the sum amount
-- filtering - where 
-- aliases get asigned at the very end and you cannot use them to filter by.
SELECT customer_id, 
SUM(amount) AS total_spent
FROM payment 
GROUP BY customer_id
HAVING SUM(amount) > 100 ;

--
SELECT customer_id, amount
FROM payment
WHERE amount > 2;


-- GROUP BY & Aggregate.
-- Most common Aggregate functions:
-- AVG() - returns average value
-- COUNT() - returns number of values
-- MAX() - returns maximum value
-- MIN() - returns minmum value
-- SUM() - returns the sum of all values

-- Aggregate function calls happen only in the
-- SELECT clause or the HAVING clause.

SELECT * FROM film;

-- what the minimum replacement cost was
SELECT MIN(replacement_cost) FROM film; 

-- whats the most we can expect to pay to replace a film.
SELECT MAX(replacement_cost) FROM film;

-- max and min 
SELECT MAX(replacement_cost), MIN(replacement_cost) 
FROM film;

-- average replacement cost
SELECT AVG(replacement_cost)
FROM film;

-- round to 2 decimal places
SELECT ROUND (AVG(replacement_cost), 2)
FROM film;

-- sum of the replacement cost
SELECT SUM(replacement_cost)
FROM film;

-- in order to call other columns we use the GROUP BY statement.
-- GROUP BY splits table up into a 'per category' basis
-- Basic Group BY call syntax 
-- SELECT category_col, AGG(data_col)
-- FROM table
-- GROUP BY category_col

--GROUP BY clause must appear 
-- must appear after FROM or WHERE statement.

-- In practise, you can filter(WHERE) before using a GROUP BY statement.
-- if its in SELECT, it gotta be in GROUP BY 

--TEKKERS - A WAY OF SELECTING THE DISTINCT CUSTOMER IDs
SELECT customer_id FROM payment
GROUP BY customer_id;

-- order by the customer_id column, it changes
SELECT customer_id FROM payment
GROUP BY customer_id
ORDER BY customer_id;


-- what customer is spending the most money in total.
-- take the customer_id column, sum of the amount column 
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id;


--amount per(,) customer_id
-- you have to order by sum amount not amount
-- its the sum of the amount column [per] customer_id.
-- per helps what the GROUP BY is doing
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) ;


-- sum is the total amount of dollars transacted. 
-- count is the amount of time the transaction occured.


-- order by descending
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;

-- count the number of transactions they're having.
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC;

-- using GROUP BY on multiple columns.
--SELECT * 

-- total amount spent per staff, per customer.
-- display: staff_id comes first
SELECT  staff_id, customer_id,  SUM(amount) AS total_amt_spent  FROM payment
GROUP BY staff_id, customer_id;

-- display: customer_id comes first
SELECT customer_id, staff_id, SUM(amount) AS total_amt_spent  FROM payment
GROUP BY staff_id, customer_id;

-- most likely gonna select columns you are grouping by.


-- how much each customer spent with each staff memeber.
SELECT customer_id, staff_id, SUM(amount) AS total_amt_spent  FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id;


-- desc order 
SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY SUM(amount) DESC;

-- how much each customer spent with each staff member.
SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY staff_id;

-- GROUP BY multiple columns.
-- how much each customer spent with each staff member.
SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY staff_id, customer_id;

-- to remove to time stamp seconds.
SELECT DATE(payment_date) FROM payment;

-- how much is being processed each day.
SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
-- highest to lowest
ORDER BY SUM(amount) DESC;


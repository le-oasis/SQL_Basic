-- WELCOME TO THE OASIS -- 

-- KEY NOTE
-- total dollar amount = SUM
-- number of times / occurences = COUNT

-- HAVING clause
-- HAVING clause allows us to filter after an aggregation has already taken place.
-- HAVING COMES AFTER GROUP BY 

-- SELECT 
-- FROM 
--WHERE 
-- GROUP BY 
-- HAVING
-- ORDER BY

-- HAVING allows us to use the aggregate result as a filter along with a GROUP BY.

-- 
SELECT * FROM payment; 
--

-- total sum amount per customer 
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id;

--filter some customers
-- what you CANNOT do is filter on a WHERE statement with SUM amounts.
--sum amount is not gonna happen till after you call the group BY
SELECT customer_id, SUM(amount) FROM payment
WHERE customer_id NOT IN (184,87,477)
GROUP BY customer_id;

-- sum of customer per amount
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id;


-- filter the sum agg function 
-- greater than 100
-- magic of having
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;

-- Having comes after GROUP BY
-- Having comes before ORDER BY
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100
ORDER BY SUM(amount) DESC;

-- total count of customers per store
SELECT store_id, COUNT(*) total_cust_count FROM customer
GROUP BY store_id;

-- stores that had more than 300 customers
-- this is HAVING filtering an agg 
SELECT store_id, COUNT(*) FROM customer
GROUP BY store_id
HAVING COUNT(*) > 300;

-- customers with >= 40 payments
SELECT * FROM payment;


-- Quiz



SELECT customer_id,  -- customer column
COUNT(*) FROM payment  -- count the payment table
GROUP BY customer_id  -- group by customer_id
HAVING COUNT(*) >= 40;   -- where payment >= 40

-- platinum = amount >= 40
-- what customer_ids are eligible for platinum status.
SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40;

-- what are customer ids of customers who 
-- have sent more than $100 in payment transactions 
-- with our staff_id member 2.

SELECT customer_id, SUM(amount)
FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) >100;
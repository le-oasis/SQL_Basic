-- Quiz Time 
--Test you HAVING KNOWLEDGE

--NOTE 
-- ANY COLUMN CAN BE PASSED INTO A COUNT CALL

-- What customer_ids are eligble for premium status (>=40)
SELECT customer_id,  -- customer column
COUNT(*) FROM payment  -- count the amount/* from payment table
GROUP BY customer_id  -- per customer
HAVING COUNT(*) >= 40;   -- payment >= 40.

--What are the customer_ids of customers who have spent > 100 
-- in payments with staff_id = 2
SELECT customer_id,  -- customer column
SUM(amount) FROM payment  -- count the amount/* from payment table
WHERE staff_id = 2 -- first filter
GROUP BY customer_id  -- per customer
HAVING SUM(amount) > 100; -- last filter.
   

-- cleaner
SELECT customer_id,  -- customer column
SUM(amount) FROM payment  -- count the amount/* from payment table
WHERE staff_id = 2 -- first filter
GROUP BY customer_id  -- per customer
HAVING SUM(amount) > 100 -- last filter.
ORDER BY SUM(amount) DESC ;   




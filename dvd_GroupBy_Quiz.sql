-- Quiz Time 
-- Test your knowledge

-- Challenge 
-- We have two staff memebers, 
-- staff_id = 1,2
-- bonus to staff member that held the most payments.
-- how many payments of did each staff member handle and who gets the bonus.
SELECT staff_id, COUNT(amount) 
FROM payment
GROUP BY staff_id;

-- count the total number of rows associated with the [per] staff_id
SELECT staff_id, COUNT(*) 
FROM payment
GROUP BY staff_id;

-- What is the average replacement cost per MPAA rating.
SELECT rating, ROUND(AVG(replacement_cost),2)
FROM film
GROUP BY rating;

--What are the customer ids of the top 5 customers by total spend
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;





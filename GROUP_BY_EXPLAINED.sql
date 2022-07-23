-- Hello World --
-- Welcome to the Oasis --
-- We're going to be learning GROUP BY & Aggregate Functions in SQL --
---------------------------------------------------------------------------
-- GROUP BY is a SQL statement that will allow us to aggregate data and simply
-- apply functions to better understand how data is distributed
-- per category.
---------------------------------------------------------------------------
---------------------------------------------------------------------------
-- Aggregate Functions --
-- Most common Aggregate functions:
-- AVG() - returns average value
-- COUNT() - returns number of values
-- MAX() - returns maximum value
-- MIN() - returns minimum value
-- SUM() - returns the sum of all values
---------------------------------------------------------------------------
-- Aggregate function calls happen only in the
-- SELECT clause or the HAVING clause.
---------------------------------------------------------------------------
-- Special Notes
-- AVG() returns a floating point value. many decimal places(e.g. 2.342418)
-- You can use ROUND() to specify precision after the decimal.
-- Count() simply returns the number of rows, which means by convention we just use COUNT(*)
---------------------------------------------------------------------------
-- Let's Start By Exploring the Film Table.
SELECT * FROM film;
---------------------------------------------------------------------------
-- You have been given a set of Queries (Q) below.
---------------------------------------------------------------------------

-- Q1
-- what the minimum replacement cost was
SELECT MIN(replacement_cost) FROM film;

-- Q2
-- whats the most we can expect to pay to replace a film.
SELECT MAX(replacement_cost) FROM film;

-- Q3
-- max and min
SELECT MAX(replacement_cost), MIN(replacement_cost)
FROM film;

---------------------------------------------------------------------------
-- In order to call other columns we use the GROUP BY statement.
---------------------------------------------------------------------------

-- Q4
-- average replacement cost
SELECT AVG(replacement_cost)
FROM film;

-- Q5
-- round to 2 decimal places
-- Syntax ROUND(AVG(__),2)
SELECT ROUND (AVG(replacement_cost), 2)
FROM film;

---------------------------------------------------------------------------
-- SUM -- AGGREGATE FUNCTION.
---------------------------------------------------------------------------
-- Q6
-- sum of the replacement cost
SELECT SUM(replacement_cost)
FROM film;

---------------------------------------------------------------------------
-- GROUP BY -- PT1.
-- GROUP BY allows us to aggregate columns per some category.
-- SYNTAX
-- SELECT category_col, AGG(data_col)
-- FROM table
-- GROUP BY category_col

-- GROUP BY clause must appear right after a
-- FROM or WHERE statement.
---------------------------------------------------------------------------
-- In the SELECT statement, columns must either have an
-- aggregate function or be in the GROUP BY call.
-- SYNTAX
-- SELECT company,division, SUM(sales)
-- FROM finance_table
-- GROUP BY company,division
---------------------------------------------------------------------------
-- Hint: You see a query with the word 'per' in it
-- It's a group by function.
-- This will return the total number of sales, per division, per company
-- SELECT company,division,SUM(sales)
-- FROM finance_table
-- GROUP BY company,division
---------------------------------------------------------------------------
-- USING A WHERE statement in conjunction with a GROUP BY
-- WHERE should not make a reference to what is being Aggregated.
-- That's what HAVING statement is for, we will learn about that later.
---------------------------------------------------------------------------
-- BASIC GROUP BY SYNTAX
-- GROUP BY the actual customer_id.
-- Similar to selecting the distinct customer_ids.
SELECT customer_id
FROM payment
GROUP BY customer_id;

-- Grab customer_id from payment and GROUP BY customer_id.
-- Then order by customer_id.
SELECT customer_id
FROM payment
GROUP BY customer_id
ORDER BY customer_id;
---------------------------------------------------------------------------

-- Q7
-- what customer is spending the most amount of money in total.
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) ;
-- order by descending
SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC;
---------------------------------------------------------------------------
-- Q8
-- count the number of transactions they're having.
SELECT customer_id, COUNT(amount)
FROM payment
GROUP BY customer_id
ORDER BY COUNT(amount) DESC;
---------------------------------------------------------------------------
-- using GROUP BY on multiple columns.
-- Q9
-- Total amount spent per staff, per customer.
SELECT customer_id, staff_id, SUM(amount)
FROM payment
GROUP BY staff_id, customer_id;

-- IN ORDER
SELECT customer_id, staff_id, SUM(amount)
FROM payment
GROUP BY staff_id, customer_id
ORDER BY customer_id;
---------------------------------------------------------------------------
/* Group BY statement is used to group the rows that have the same value.
   Whereas Order BY statement sort the result-set either in ascending or in descending order.*/
---------------------------------------------------------------------------
-- Q10
-- desc order
SELECT customer_id, staff_id, SUM(amount) FROM payment
GROUP BY staff_id, customer_id
ORDER BY SUM(amount) DESC;
---------------------------------------------------------------------------
-- GROUP BY -- DATE COLUMN
SELECT DATE(payment_date) FROM payment;
---------------------------------------------------------------------------
-- Q11
-- how much is being processed each day.
SELECT DATE(payment_date), SUM(amount) FROM payment
GROUP BY DATE(payment_date)
-- highest to lowest
ORDER BY SUM(amount) DESC;
---------------------------------------------------------------------------
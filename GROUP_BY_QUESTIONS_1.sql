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
---------------------------------------------------------------------------
/* Group BY statement is used to group the rows that have the same value.
   Whereas Order BY statement sort the result-set either in ascending or in descending order.*/
---------------------------------------------------------------------------
---------------------------------------------------------------------------
-- GROUP BY.
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


---------------------------------------------------------------------------
-- Let's Start By Exploring the Film Table.
SELECT * FROM film;
---------------------------------------------------------------------------
-- You have been given a set of Queries (Q) below.
---------------------------------------------------------------------------

-- Q1
-- what the minimum replacement cost was


-- Q2
-- whats the most we can expect to pay to replace a film.



-- Q3
-- max and min


-- Q4
-- average replacement cost


-- Q5
-- round average replacement cost to 2 decimal places
-- Syntax ROUND(AVG(__),2)



-- Q6
-- sum of the replacement cost



-- Q7
-- what customer is spending the most amount of money in total.

-- order by descending



-- Q8
-- count the number of transactions they're having.



-- Q9
-- using GROUP BY on multiple columns.
-- Grab me the total amount spent per staff, per customer, from highest to lowest amount spent



---------------------------------------------------------------------------
-- GROUP BY -- DATE COLUMN
-- FIRST WE WILL FORMATE THE TIMESTAMP COLUMN INTO A DATE COLUMN
SELECT DATE(payment_date)
FROM payment;


---------------------------------------------------------------------------
-- Q11
-- how much is being processed each day.

---------------------------------------------------------------------------
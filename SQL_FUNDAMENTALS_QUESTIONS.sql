-- Welcome to the Oasis --
-- Today's lesson is SQL fundamentals --
-- You have been given a set of Queries (Q) to answer below.

-- Syntax for SELECT statement --
-- tables {actor,customer,film,payment}
-- Asking for an entire table  --
-- (*) - returns back all the columns --

-- Q1
-- Grab all from actor table


-- Q2
-- Grab First & Last Name from actor table.


-- Q3
-- Challenge: we want to send out a promo email to our existing customers --
-- Grab first, last & email from customer table


-- SELECT DISTINCT --
-- DISTINCT keyword can be used to return only distinct values
-- in a column --

-- Q4
-- Grab unique release_years from film table

-- Q5
-- Grab unique rating from film table



-- COUNT --

-- Q6
-- what are the number of rows in the payment table?

-- Q7
-- how many rows there are in the amount column from the payment table.



-- Q8
-- how many distinct amounts being payed --
-- distinct amount happens first before count.



-- This is a hint --
-- SELECT WHERE --
SELECT * FROM customer
-- looking for customer named Jared.
WHERE first_name ='Jared';

-- combining conditions with logical operators. --

-- Q9
-- find all the rental rates that are higher than $4 --
-- replacement cost > 19.99
-- WE ONLY WANT THE R movies --


-- Q10
-- count how many times where the conditions above happen to be true.


-- Q11
-- we want the title and rating of movies that have an R rating or PG-13


-- Q12
-- how many films have an R rating or PG-13 rating.


-- Q13
-- Grab all from film where rating not equal to R

-- Q14
-- Grab email from the customer with the name  (first)Nancy (last)Thomas

-- Q15
-- Grab description for the movie "Outlaw Hanky" from film table

-- Q16
-- Grab the phone number for the customer who lives at 259 Ipoh Drive


-- ORDER BY --
-- Q17
-- Grab the all from customer
-- order by first name desc order


-- Q18
-- We want the store_id, first & last name
-- Order store id in desc ,first name ascending order.


-- THIS IS A HINT --
-- TEKKERS --
-- you can order by a column and not select it in your select statement.
SELECT first_name, last_name FROM customer
ORDER BY store_id DESC, first_name ASC;



-- LIMIT -
-- limit the amount of rows it returns in a query.
-- goes at the very end of a query request.
-- can use ORDER BY & LIMIT to get the top end rows of something.

-- Q19
-- select all from payment where amount is not equal to 0.
-- order by payment date in desc
-- limit 5.



-- Q20
-- limit the last result by 1


-- Grab customer_id, payment_id & payment date from payment table
-- order by payment date ASC order Limit 10;
-- essentially, first 10 customers (ASC) who made a payment --


-- A Customer wants to quickly rent a video to watch over their short lunch break.
-- What are the titleS of the 5 shortest (in length of time) movies & the release year.

-- Q21
-- count the title of the film where length is <= 50
-- If the previous customer can watch any movie that is
-- 50 minutes or less in run time, how much options does she have?


-- BETWEEN OPERATOR
-- can be used to match a value against a range of values:
--value BETWEEN low AND high;
--value >= low AND value <= high;
-- You can also combine BETWEEN with the NOT logical operator:
-- value NOT BETWEEN low AND high

-- Q22
-- Grab all from payment where amount is between 8 and 9


-- Q22
---- i.e >= 8 and <=9


-- Q23
-- What are the the total amount of rows that are between 8 and 9.


-- Q24
-- not between 8 & 9 dollars.



-- Q25
-- Grab all from payment where payment
-- date is between Feb 1st 2007 & Feb 15th 2007.


-- Q26
-- exclusivity. >= / <=




-- IN OPERATOR --
-- to create a condition to quickly checks to see if a value is included in a list of multiple options.
-- SYNTAX
-- SELECT *
-- FROM ____
-- WHERE __ IN ('','','');

-- Q27
-- Grab all from customer, where first_name John, Jake & Julie

-- Q28
-- Grab all from payment, where amount 0.99,1.98,1.99

-- Q29
-- Grab all from payment, where amount 0.99,1.98,1.99, order amount in desc

-- Q30
-- Grab all from payment, where amount not in  0.99,1.98,1.99,


-- Q31
--how many payments actually occurred
--that happened to be one of these three values
-- count & amount in



-- LIKE and ILIKE --
-- pattern matching with string data.
-- WHERE name LIKE '%a'  -- any sequence of characters can come before the.

-- Q32
-- everyone in customer table with the first name : letter starts with J


-- Q33
-- everyone in customer table with the first name that ends with s

-- Q34
-- how many customers names start with letter J
-- count(*)

--65 people


-- Q35
-- how many instances where first name starts with J and  last name starts with an "S"
-- 5 people



-- ilike is case insensitive
-- the following will give you 0 rows
SELECT * FROM customer
WHERE first_name LIKE 'j%' AND last_name ILIKE 's%';

-- Now using ILIKE
SELECT * FROM customer
WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%';

-- Q36
-- Grab the people who have the sequence of characters 'er' in their firstname.


-- Q37
-- Grab all from customer where first name starts with A
-- and last name does not start with B
-- order by last name ASC



-- % - for a long sequence of characters
-- _ - for a single replacement of characters.
SELECT * FROM customer
WHERE first_name LIKE '%_her%';



-- Challenge
-- Q38
-- How many payment transactions were > $5.00.

-- Q39
-- How many actors have a first name that starts with the letter P?

-- Q40
--How many unique districts are our customers from?


-- Q41
-- retrieve a list of names for those distinct districts
-- from the previous question.

-- Q42
-- how many films are there where
-- rating of R and
-- replacement cost between $5 and $15

-- Q43
-- how many films have the word Truman somewhere in the title?

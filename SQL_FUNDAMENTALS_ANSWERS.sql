-- Welcome to the Oasis --
-- Today's lesson is SQL fundamentals --
-- You have been given a set of Queries (Q) to answer below.

-- Syntax for SELECT statement --
-- tables {actor,customer,film,payment}
-- Asking for an entire table  --
-- (*) - returns back all the columns --

-- Q1
-- Grab all from actor table
SELECT * FROM actor;


-- Q2
-- Grab First & Last Name from actor table.
SELECT first_name, last_name
FROM actor;


-- Q3
-- Challenge: we want to send out a promo email to our existing customers --
-- Grab first, last & email from customer table.
SELECT first_name, last_name, email
FROM customer
order by email;

-- SELECT DISTINCT --
-- DISTINCT keyword can be used to return only distinct values
-- in a column --

-- Q4
-- Grab unique release_years from film table
SELECT DISTINCT release_year
FROM film;

-- Q5
-- Grab unique rating from film table
SELECT DISTINCT rating
FROM film;


-- COUNT --
-- Q6
-- what are the number of rows in the payment table?
SELECT COUNT(*) FROM payment;

-- Q7
-- how many rows there are in the amount column from the payment table.
SELECT COUNT(amount)
FROM payment;


-- Q8
-- how many distinct amounts being payed --
-- distinct amount happens first before count.
SELECT COUNT(DISTINCT amount)
FROM payment;


-- SELECT WHERE --
SELECT * FROM customer
-- looking for customer named Jared.
WHERE first_name ='Jared';

-- combining conditions with logical operators. --

-- Q9
-- find all the rental rates that are higher than $4 --
-- replacement cost > 19.99
-- WE ONLY WANT THE R movies --
SELECT *
FROM film
WHERE replacement_cost > 19.99
AND rental_rate >4
AND rating = 'R';

-- Q10
-- count how many times where the conditions above happen to be true
SELECT COUNT(*)
FROM film
WHERE replacement_cost > 19.99
AND rental_rate >4
AND rating = 'R';

-- Q11
-- we want the title and rating of movies that have an R rating or PG-13
SELECT title, rating
FROM film
WHERE rating = 'R' OR rating = 'PG-13';


-- Q12
-- how many films have an R rating or PG-13 rating.
SELECT COUNT(*)
FROM film
WHERE rating = 'R' OR rating = 'PG-13';

-- Q13
-- Grab all from film where rating not equal to R
SELECT COUNT(*)
FROM film
WHERE rating != 'R';

-- Q14
-- Grab email from the customer with the name  (first)Nancy (last)Thomas
SELECT email
FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

-- Q15
-- Grab description for the movie "Outlaw Hanky" from film table
SELECT description
FROM film
WHERE title = 'Outlaw Hanky';

-- Q16
-- Grab the phone number for the customer who lives at 259 Ipoh Drive
SELECT phone
FROM address
WHERE address = '259 Ipoh Drive';


-- ORDER BY --
-- Q17
-- Grab the all from customer
-- order by first name desc order
SELECT * FROM customer
ORDER BY first_name DESC ;


-- Q18
-- We want the store_id, first & last name
-- Order store id in desc ,first name ascending order.
SELECT store_id, first_name, last_name
FROM customer
ORDER BY  store_id DESC, first_name ASC;

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
SELECT *
FROM payment
WHERE amount != 0
ORDER BY payment_date DESC
LIMIT 5;


-- Q20
-- limit the last result by 1
SELECT *
FROM payment
WHERE amount != 0
ORDER BY payment_date DESC
LIMIT 1;


-- Grab customer_id, payment_id & payment date from payment table
-- order by payment date ASC order Limit 10;
-- essentially, first 10 customers (ASC) who made a payment --
SELECT customer_id,payment_id, payment_date FROM payment
ORDER BY payment_date ASC
LIMIT 10;

-- A Customer wants to quickly rent a video to watch over their short lunch break.
-- What are the titles of the 5 shortest (in length of time) movies & the release year.
SELECT title, length
FROM film
ORDER BY length ASC
LIMIT 5;

-- Q21
-- count the title of the film where length is <= 50
-- If the previous customer can watch any movie that is
-- 50 minutes or less in run time, how much options does she have?
SELECT COUNT(title)
FROM film
WHERE length <=50;

-- BETWEEN OPERATOR
-- can be used to match a value against a range of values:
--value BETWEEN low AND high;
--value >= low AND value <= high;
-- You can also combine BETWEEN with the NOT logical operator:
-- value NOT BETWEEN low AND high

-- Q22
-- Grab all from payment where amount is between 8 and 9
SELECT * FROM payment
WHERE amount BETWEEN 8 AND 9;


-- Q22
---- i.e >= 8 and <=9
SELECT * FROM payment
WHERE amount >= 8 AND amount <= 9;


-- Q23
-- What are the the total amount of rows that are between 8 and 9.
SELECT count(*)
FROM payment
WHERE amount BETWEEN 8 AND 9;

-- OR
SELECT COUNT(*) FROM payment
WHERE amount >= 8 AND amount <= 9;


-- Q24
-- not between 8 & 9 dollars.
SELECT COUNT(*) FROM payment
WHERE amount NOT BETWEEN 8 AND 9;


-- Q25
-- Grab all from payment where payment
-- date is between Feb 1st 2007 & Feb 15th 2007.
SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';


-- Q26
-- exclusivity. >= / <=
SELECT * FROM payment
WHERE payment_date >= '2007-02-01' AND payment_date <= '2007-02-15';

-- IN OPERATOR --
-- to create a condition to quickly checks to see if a value is included in a list of multiple options.


-- Q27
-- Grab all from customer, where first_name IN John, Jake & Julie.
-- SYNTAX
-- SELECT *
-- FROM ____
-- WHERE __ IN ('','','');
SELECT *
FROM customer
WHERE first_name IN('John', 'Jake', 'Julie');

-- Q28
-- Grab all from payment, where amount 0.99,1.98,1.99
SELECT *
FROM payment
WHERE amount IN(0.99, 1.98, 1.98);

-- Q29
-- Grab all from payment, where amount 0.99,1.98,1.99, order amount in desc
SELECT *
FROM payment
WHERE amount IN(0.99, 1.98, 1.98)
ORDER BY amount DESC;

-- Q30
-- Grab all from payment, where amount not in  0.99,1.98,1.99,
SELECT *
FROM payment
WHERE amount NOT IN(0.99, 1.98, 1.98);


-- Q31
--how many payments actually occurred
--that happened to be one of these three values
-- count & amount in
SELECT COUNT(*)
FROM payment
WHERE amount IN(0.99, 1.98, 1.98);


-- LIKE and ILIKE --
-- pattern matching with string data.
-- WHERE name LIKE '%a'  -- any sequence of characters can come before the.

-- Q32
-- everyone in customer table with the first name : letter starts with J
SELECT *
FROM customer
WHERE first_name LIKE 'J%';

-- Q33
-- everyone in customer table with the first name that ends with s
SELECT *
FROM customer
WHERE first_name LIKE '%s';

-- Q34
-- how many customers names start with letter J
-- count(*)
SELECT COUNT(*)
FROM customer
WHERE first_name LIKE 'J%';
--65 people


-- Q35
-- how many instances where first name starts with J and  last name starts with an "S"
-- 5 people
SELECT COUNT(*)
FROM customer
WHERE first_name LIKE 'J%'
AND last_name LIKE 'S%';



-- ilike is case insensitive
-- the following will give you 0 rows
SELECT * FROM customer
WHERE first_name LIKE 'j%' AND last_name ILIKE 's%';

-- Now using ILIKE
SELECT * FROM customer
WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%';

-- Q36
-- Grab the people who have the sequence of characters 'er' in their firstname.
SELECT *
FROM customer
WHERE first_name ILIKE '%er%';

-- Q37
-- Grab all from customer where first name starts with A
-- and last name does not start with B
-- order by last name ASC
SELECT * FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;


-- % - for a long sequence of characters
-- _ - for a single replacement of characters.
SELECT * FROM customer
WHERE first_name LIKE '%_her%';



-- Challenge
-- Q38
-- How many payment transactions were > $5.00.
SELECT COUNT(*)
FROM payment
WHERE amount >5;

-- Q39
-- How many actors have a first name that starts with the letter P?
SELECT COUNT(*)
FROM actor
WHERE first_name LIKE 'P%';

-- Q40
--How many unique districts are our customers from?
SELECT COUNT(DISTINCT district)
FROM address;

-- Q41
-- retrieve a list of names for those distinct districts
-- from the previous question.
SELECT DISTINCT(district) FROM address;

-- Q42
-- how many films are there where
-- rating of R and
-- replacement cost between $5 and $15
SELECT COUNT(*)
FROM film
WHERE rating = 'R'
AND replacement_cost BETWEEN 5 AND 15;

-- Q43
-- how many films have the word Truman somewhere in the title?
SELECT COUNT(*)
FROM film
WHERE title LIKE '%Truman%';
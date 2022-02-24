-- Welcome to the Oasis -- 
-- Today's lesson is SQL fundamentals -- 

-- Syntax for SELECT statement -- 
-- tables {actor,customer,film,payment}
-- Asking for an entire table  -- 
-- (*) - returns back all the columns -- 

SELECT * FROM actor;
SELECT first_name, last_name FROM actor;

-- Challenge: we want to send out a promo email to our existing customers -- 
SELECT first_name, last_name, email FROM customer;

-- SELECT DISTINCT --
-- DISTINCT keyword can be used to return only distinct values
-- in a column -- 
SELECT DISTINCT (release_year) FROM film;
SELECT DISTINCT (rating) FROM film;

-- COUNT -- 
-- how many rows there are in the payment table.
SELECT * FROM payment;
SELECT COUNT(*) FROM payment;

-- how many rows there are in the amount column fromt the payment table.
SELECT COUNT(amount) FROM payment;
SELECT amount FROM payment;

-- how many distinct amounts being payed --
-- distinct amount happens first before count.
SELECT COUNT (DISTINCT amount) FROM payment;


-- SELECT WHERE -- 
SELECT * FROM customer
-- looking for customer named Jared.
WHERE first_name ='Jared';

-- combining conditions with logical operators. -- 
SELECT * FROM film
-- find all the rental rates that are higher than $4 -- 
-- replacement cost > 19.99 
WHERE rental_rate > 4 AND replacement_cost >= 19.99
-- WE ONLY WANT THE R movies -- 
AND rating='R';

-- how many titles there are where these conditions happen to be true
-- how many rows would it return that satisfy these positions.
SELECT COUNT(*) FROM film
WHERE rental_rate > 4 AND replacement_cost >= 19.99
AND rating='R';

-- we want movies that have an R rating or PG-13

SELECT title, rating 
FROM film 
WHERE rating='R' OR rating = 'PG-13'; 

-- how many films have an R rating or PG-13 rating.
SELECT COUNT(*) FROM film
WHERE rating='R' OR rating = 'PG-13';


-- not equal to 
SELECT * FROM film
WHERE rating !='R';

-- email for the customer with the name Nancy Thomas 
SELECT email FROM customer 
WHERE first_name = 'Nancy'
AND last_name = 'Thomas';

-- description for the movie "Outlaw Hanky"
SELECT description FROM film 
WHERE title = 'Outlaw Hanky';

-- get the phone number for the customer who lives at 259 Ipoh Drive
SELECT phone FROM address
WHERE address = '259 Ipoh Drive' ;

-- ORDER BY --

SELECT * FROM customer 
ORDER BY first_name DESC;

-- ORDER BY store_id -- all the first_name are in alphabetical order 
SELECT store_id, first_name, last_name FROM customer 
ORDER BY store_id, first_name;

-- ORDER BY store_id -- ASC, DESC 
SELECT store_id, first_name, last_name FROM customer 
ORDER BY store_id DESC, first_name ASC;

-- TEKKERS-- you can order by a column and not select it in your select statment.
SELECT first_name, last_name FROM customer 
ORDER BY store_id DESC, first_name ASC;

-- LIMIT - limit the amount of rows it returns in a query.
-- goes at the very end of a query request.
-- can use ORDER BY & LIMIT to get the top end rows of something.
SELECT * FROM payment
WHERE amount != 0.00 
ORDER BY payment_date DESC
LIMIT 5;

-- general layout of a table
SELECT * FROM payment
WHERE amount != 0.00 
ORDER BY payment_date DESC
LIMIT 1;

-- goal : customer_id : of : first 10 customers who
-- made a payment --
SELECT * FROM payment;

SELECT customer_id,payment_id, payment_date FROM payment
ORDER BY payment_date ASC
LIMIT 10;

-- A Ccustomer wants to quickly rent a video to watch over their
-- short lunch break.
-- What are the title of the 5 shortest (in lenght of time) movies nd the release year
SELECT * FROM film;
--
SELECT title, release_year, length 
FROM film
ORDER BY length ASC
LIMIT 5;

-- If the previous customer can watch any movie that is 
-- 50 minutes or less in run time, how much options does she have?
SELECT COUNT(title) 
FROM film
WHERE length <= 50;

-- BETWEEN OPERATOR
-- can be used to macth a value against a range of values:
--value BETWEEN low AND high;
--value >= low AND value <= high;
-- You can also combine BETWEEN with the NOT logical operator:
-- value NOT BETWEEN low AND high
SELECT * FROM payment
WHERE amount BETWEEN 8 AND 9;
--
SELECT * FROM payment
WHERE amount >= 8 AND amount <= 9;

-- know the total amount of rows 
SELECT COUNT(*) FROM payment
WHERE amount BETWEEN 8 AND 9;

-- wasn't between 8 & 9 dollars.
SELECT COUNT(*) FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

-- payment date.
SELECT  * FROM payment
WHERE payment_date  BETWEEN '2007-02-01' AND '2007-02-15';

-- exclusivity.
SELECT  * FROM payment
WHERE payment_date >= '2007-02-01' AND payment_date <= '2007-02-15';



-- IN OPERATOR -- 
-- to create a condition to quickly checks to see if a value is included in a list of multiple options.
SELECT * FROM customer
WHERE first_name IN('John','Jake', 'Julie');
--
SELECT * FROM payment
WHERE amount IN (0.99,1.98,1.99);
--
SELECT * FROM payment
WHERE amount NOT IN (0.99,1.98,1.99);

--how many payments actually occured 
--that happened to be one of these three values
SELECT COUNT(*) FROM payment
WHERE amount  IN (0.99,1.98,1.99);


-- LIKE and ILIKE -- 
-- pattern matching with string data.
-- WHERE name LIKE '%a'  -- any sequence of characters can come before the 
-- everyone in customer table with the first name : letter J
-- %__%- for a long sequence of characters 
-- _X% - for a single replacemnt of characters.

SELECT * FROM customer 
WHERE first_name LIKE 'J%';

-- everyone in customer table with the first name that ends with S
SELECT * FROM customer 
WHERE first_name LIKE '%s';

-- how many people 
SELECT COUNT(*) FROM customer 
WHERE first_name LIKE 'J%';
--65 people

-- and last name starts with an "S"
-- 5 people
SELECT COUNT(*) FROM customer 
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

-- let's explore them
SELECT * FROM customer 
WHERE first_name LIKE 'J%' AND last_name LIKE 'S%';

-- ilike is case insensitive
SELECT * FROM customer 
WHERE first_name ILIKE 'j%' AND last_name ILIKE 's%';

-- people who have the sequence of characters 'her' in their name
SELECT * FROM customer 
WHERE first_name LIKE '%her%';

-- one character is allowed(_) before the her
SELECT * FROM customer 
WHERE first_name LIKE '_her%';

--first name starts with A but does not start with B
SELECT * FROM customer 
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;








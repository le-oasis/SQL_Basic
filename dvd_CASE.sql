-- CASE statement goes in after select
-- CASE Statement is followed by at least one pair of WHEN and THEN statements
-- finish with END {results in bool being printed in fb}
-- check each row to see if channel meets the condition, {channel = facebook}
-- CASE WHEN channel = 'facebook' THEN 'yes' END AS is_facebook.
--
-- QUERY to fill in nulls with "no".
-- CASE WHEN channel = 'facebook' THEN 'yes' ELSE 'no' END AS is_facebook {yes/no filled}
-- a way to capture values not specified in the WHEN THEN statement

-- query both facebook & direct {channel takes in two arguments}
--  CASE WHEN channel = 'facebook' OR channel = 'direct' THEN 'yes' ELSE 'no' END AS is_facebook {yes/no filled}
-- doing WHEN statements make sure they do not overlap. 

-- the WHEN statement is a logical condition, similar to what you would put in WHERE
-- SQL's equiv of "IF" "THEN"



-- Welcome to the Oasis. 
-- We can use CASE statement to only execute code when certain conditions are met.
-- similar to IF/ELSE in other languages. 

-- there's a case statement or 
-- case operation.

SELECT * FROM customer;


-- CASE statement
SELECT * FROM customer;
--
SELECT customer_id,
CASE 
	WHEN (customer_id <= 100) THEN 'Premium' 
	WHEN (customer_id BETWEEN 100 AND 200) THEN 'Plus'
	ELSE 'Normal'
END AS customer_class
FROM customer;



-- CASE expression 
SELECT customer_id,
CASE customer_id  -- write customer id one time
	WHEN (2) THEN 'Winner' -- never write customer -- check the result for the value themselves
	WHEN (5) THEN 'Loser'
	ELSE 'Normal'
END AS raffle_results
FROM customer;

-- perfrom calculations on the result of CASE statement.
SELECT 
CASE rental_rate
				WHEN 0.99 THEN 1 
				ELSE 0 
END AS rate_result
FROM film;

-- ask for the original rental rate column to compare.
SELECT rental_rate,
CASE rental_rate
				WHEN 0.99 THEN 1 
				ELSE 0 
END AS rate_result
FROM film;


-- sum of the rate_result coloumn to see how many 99 cent movies I have.
SELECT
SUM(CASE rental_rate
				WHEN 0.99 THEN 1 -- 99 cent films are a bargain. so it counts as 1. -- we're summing up all 
				ELSE 0 
END) AS bargains
FROM film;


-- query more 
SELECT
SUM(CASE rental_rate
				WHEN 0.99 THEN 1 
				ELSE 0 
END) AS bargains,  -- sum of 99 cent movies as bargains
SUM(CASE rental_rate
   				WHEN 2.99 THEN 1
   				ELSE 0
END) AS regular, -- sum of 2.99 movies as regular
SUM(CASE rental_rate
   				WHEN 4.99 THEN 1
   				ELSE 0
END) AS premium  -- sum of 4.99 movies as premium
FROM film;










  
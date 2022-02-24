-- Welcome to the Oasis -- 
-- In today's lecture we'll be touching on Aggregation Functions -- 

-- Aggregate function calls happen only in the
-- SELECT clause or the HAVING clause.

-- -- GROUP BY & Aggregate.
-- Most common Aggregate functions:
-- AVG() - returns average value
-- COUNT() - returns number of values
-- MAX() - returns maximum value
-- MIN() - returns minmum value
-- SUM() - returns the sum of all values


-- COUNT the Number of Rows in a Table
--Try your hand at finding the number of rows in each table. Here is an example of finding all the rows in the accounts table.
SELECT COUNT(*)
FROM accounts;

-- SUM
-- Find the total amount of poster_qty paper ordered in the orders table.
SELECT SUM(o.poster_qty) AS total_poster_sales
FROM orders o;

--Find the total amount of standard_qty paper ordered in the orders table.
SELECT SUM(o.standard_qty) AS total_standard_sales
FROM orders o;

--Find the total dollar amount of sales using the total_amt_usd in the orders table.
SELECT SUM(o.total_amt_usd) AS total_dollar_sales
FROM orders o;

--Find the total amount spent on standard_amt_usd and gloss_amt_usd paper for each order in the orders table. 
--This should give a dollar amount for each order in the table.
SELECT SUM(o.standard_amt_usd) + SUM(o.gloss_amt_usd) AS total_standard_sum
FROM orders o;

--Find the standard_amt_usd per unit of standard_qty paper. 
--Your solution should use both an aggregation and a mathematical operator.
SELECT SUM(standard_amt_usd)/SUM(standard_qty) AS sum_per_unit
FROM orders o;


-- MIN MAX AVG 
--When was the earliest order ever placed? You only need to return the date.
SELECT MIN(occurred_at)
FROM orders 
LIMIT 1;

--Try performing the same query as in question 1 without using an aggregation function. 
SELECT (occurred_at)
FROM orders 
ORDER BY occurred_at
LIMIT 1;

--When did the most recent (latest) web_event occur?
SELECT MIN(occurred_at)
FROM web_events 
LIMIT 1;

--Try to perform the result of the previous query without using an aggregation function.
SELECT (occurred_at)
FROM web_events 
ORDER BY occurred_at
LIMIT 1;

-- Find the mean (AVERAGE) amount spent per order on each paper type, as well as the mean amount of each paper type purchased per order. 
--Your final answer should have 6 values - one for each paper type for the average number of sales, as well as the average amount.
SELECT AVG(standard_qty) AS std_mean,
AVG(gloss_qty) AS gloss_mean,
AVG(poster_qty) AS poster_mean,
AVG(standard_amt_usd) AS std_mean_price ,
AVG(gloss_amt_usd) AS gloss_mean_price,
AVG(poster_amt_usd) AS post_mean_price
FROM orders;

-- Median 
SELECT COUNT(total_amt_usd) FROM orders; -- frist see the total amt in column.
--
SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;


-- The key GROUP BY  takeaways here:

-- GROUP BY can be used to aggregate data within subsets of the data. 
-- For example, grouping for different accounts, different regions, or different sales representatives.

-- Any column in the SELECT statement that is not within an aggregator must be in the GROUP BY clause.

-- The GROUP BY always goes between WHERE and ORDER BY.
-- ORDER BY works like SORT in spreadsheet software.

--GROUP BY - Expert Tips
-- The order of column names in your GROUP BY clause doesn’t matter—the results will be the same regardless. 
-- If we run the same query and reverse the order in the GROUP BY clause, you can see we get the same results.

-- As with ORDER BY, you can substitute numbers for column names in the GROUP BY clause. 
-- It’s generally recommended to do this only when you’re grouping many columns, 
-- or if something else is causing the text in the GROUP BY clause to be excessively long.

-- A reminder here that any column that is not within an aggregation must show up in your GROUP BY statement. 
--If you forget, you will likely get an error. However, in the off chance that your query does work, you might not like the results!


-- For each account, determine the average amount of each type of paper they purchased across their orders. 
--Your result should have four columns - one for the account name 
--and one for the average quantity purchased for each of the paper types for each account. 
SELECT a.name, AVG(o.standard_qty) avg_stand, AVG(o.gloss_qty) avg_gloss, AVG(o.poster_qty) avg_post
FROM accounts a 
JOIN orders o 
ON a.id = o.account_id
GROUP BY a.name;

-- For each account, determine the average amount spent per order on each paper type. 
--Your result should have four columns - 
--one for the account name and one for the average amount spent on each paper type.--
SELECT a.name, AVG(o.standard_amt_usd) avg_stand, AVG(o.gloss_amt_usd) avg_gloss, AVG(o.poster_amt_usd) avg_post
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;
-- -- 

-- Determine the number of times a particular channel was used in the web_events table for each sales rep. 
-- Your final table should have three columns - the name of the sales rep, the channel, and the number of occurrences. 
--Order your table with the highest number of occurrences first.
SELECT s.name, w.channel, COUNT(*) num_events
FROM accounts a -- from one
JOIN web_events w -- to many 
ON a.id = w.account_id
JOIN sales_reps s -- from one
ON s.id = a.sales_rep_id -- to many
GROUP BY s.name, w.channel
ORDER BY num_events DESC;

-- Determine the number of times a particular channel was used in the web_events table for each region. Y
--Your final table should have three columns - the region name, the channel, and the number of occurrences. 
--Order your table with the highest number of occurrences first.
SELECT r.name, w.channel, COUNT(*) num_events
FROM accounts a -- accounts one
JOIN web_events w -- sales rep many
ON a.id = w.account_id
JOIN sales_reps s  -- sales rep one
ON s.id = a.sales_rep_id -- many accounts
JOIN region r -- region one 
ON r.id = s.region_id -- many in sales rep which is connected to account
GROUP BY r.name, w.channel
ORDER BY num_events DESC;

--DISTINCT
-- Use DISTINCT to test if there are any accounts associated with more than one region.
SELECT DISTINCT id, name
FROM accounts;
--
SELECT a.id as "account id", r.id as "region id", 
a.name as "account name", r.name as "region name"
FROM accounts a -- many accounts
JOIN sales_reps s  -- sales rep one
ON s.id = a.sales_rep_id -- many accounts
JOIN region r -- region one 
ON r.id = s.region_id;-- many in sales rep which is connected to account

--How many sales reps worked with more than one account 
SELECT DISTINCT id, name
FROM sales_reps;

--
SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
ORDER BY num_accounts;

-- HAVING - Expert Tip
-- HAVING is the “clean” way to filter a query that has been aggregated, but this is also commonly done using a subquery. 
-- Essentially, any time you want to perform a WHERE on an element of your query that was created by an aggregate, you need to use HAVING instead.


-- QUIZ QUESTION
-- WHERE subsets the returned data based on a logical condition.
-- WHERE appears after the FROM, JOIN, and ON clauses, but before GROUP BY.
-- HAVING appears after the GROUP BY clause, but before the ORDER BY clause.
-- HAVING is like WHERE, but it works on logical statements involving aggregations.

--How many of the sales reps have more than 5 accounts that they manage?
SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
GROUP BY s.id, s.name
HAVING COUNT(*) > 5
ORDER BY num_accounts;


--How many accounts have more than 20 orders?
SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a -- ONE 
JOIN orders o -- MANY
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY num_orders;

--Which account has the most orders?
SELECT a.id, a.name, COUNT(*) num_orders
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY num_orders DESC
LIMIT 1;


--Which accounts spent more than 30,000 usd total across all orders?
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) > 30000
ORDER BY total_spent;

--Which accounts spent less than 1,000 usd total across all orders?
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_spent;

--Which account has spent the most with us?
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent DESC
LIMIT 1;

--Which account has spent the least with us?
SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent ASC
LIMIT 1;

--Which accounts used facebook as a channel to contact customers more than 6 times?
SELECT a.id, a.name, w.channel, COUNT(*) AS use_of_channel
FROM accounts a 
JOIN web_events w 
ON w.account_id = a.id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY use_of_channel;

--Which account used facebook most as a channel? 
SELECT a.id, a.name, w.channel, COUNT(*) AS use_of_channel
FROM accounts a 
JOIN web_events w 
ON w.account_id = a.id
GROUP BY a.id, a.name, w.channel
HAVING w.channel = 'facebook'
ORDER BY use_of_channel DESC
LIMIT 1;


--Which channel was most frequently used by most accounts?
SELECT a.id, a.name, w.channel, COUNT(*) AS use_of_channel
FROM accounts a 
JOIN web_events w 
ON w.account_id = a.id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 1;

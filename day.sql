-- this is a comment

SELECT * FROM actor;

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'Bob'; --DOUBLE QUOTES THROWS AN ERROR

--LIKE is used WHERE
-- now we can use things other than a literal string

--MODULE:
--this is % is a true wildcard for strings in sql
--ANY number of characters


SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'B%'; --everything cap B taken

--UNDERSCORE:
-- _ is the wildcard for exactly one character

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'B___%'; -- 3 underscores, cap B and 4 long

SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'B__'; --2 underscores, cap B and 2 more characters

--Comparrison operators

-- = and LIKE as shown above
-- Greater > less <
-- with equals? yep >= or <=
-- NOT equals <>

SELECT *
FROM payment;

SELECT customer_id, amount
FROM payment
WHERE amount > 0;

SELECT customer_id, amount
FROM payment
WHERE amount < 0;

SELECT customer_id, amount
FROM payment
WHERE amount <= -411.01; --inclusive

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN 2 AND 200;

SELECT customer_id, amount
FROM payment
WHERE amount BETWEEN -500 AND -400;

SELECT customer_id, amount
FROM payment
WHERE amount > 200 OR amount < -400

SELECT customer_id, amount
FROM payment
WHERE amount > 2
ORDER BY amount DESC --ASC by default but put descending in

SELECT customer_id, amount
FROM payment
WHERE amount <> -406.01
ORDER BY amount DESC

-- ORDER MATTERS!!

SELECT * 
from payment

SELECT * 
from payment
where amount > 200
ORDER BY amount

SELECT *
from customer

SELECT first_name, last_name, email
from customer
WHERE customer_id = 1

--AGGREGATIONS
-- SUM(),  AVG(), COUNT(), MIN(), MAX()

SELECT * FROM payment

SELECT SUM(amount)
from payment


SELECT AVG(amount)
from payment
where amount < -400

SELECT COUNT(payment)
from payment
where amount = -411.01

SELECT MIN(payment)
from payment

SELECT MAX(payment)
from payment

SELECT COUNT(DISTINCT amount) -- count unique values
from payment
where amount > 2

SELECT COUNT(DISTINCT amount) AS unique_pos_value -- aliasing
from payment
where amount > 2

--GROUP BY
-- any column selected not in aggregate must be in group by
--used with aggregates to modify how the rows go together

SELECT amount, COUNT(amount), SUM(amount)
from payment
GROUP BY amount
ORDER BY SUM(amount) DESC

SELECT amount
from payment
where amount= -416.00

SELECT amount, COUNT(amount)
from payment
GROUP BY amount
ORDER BY COUNT(amount) DESC

SELECT *
FROM customer
WHERE email LIKE '%.white@%.org'

SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE '%.white@%.org'
GROUP BY email
HAVING COUNT(customer_id) > 0 --having is like where,but for aggregates,  it has to be in this order



SELECT customer_id, SUM(amount) -- what columns do we want to see/use?
FROM payment                    -- from what table?
                                -- these are out basic building blocks
WHERE customer_id BETWEEN 1 AND 198 --this is how or filter for our columns
GROUP BY customer_id            -- using aggregates with other columns
HAVING SUM(amount)  < 0         -- filtering based on aggregate
                                -- cannot come before the GROUP BY
ORDER BY customer_id            -- changing how our returned table looks
LIMIT 5                         --CONTRAINT?
OFFSET 2                        -- chops off number of rows





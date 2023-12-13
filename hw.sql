-- Week 5 - Monday Questions

-- 1. How many actors are there with the last name ‘Wahlberg’?

SELECT *
FROM actor
WHERE last_name LIKE 'Wahlberg'

There are 2

-- 2. How many payments were made between $3.99 and $5.99?

SELECT amount
FROM payment
WHERE amount BETWEEN 3.99 AND 5.99

There are no payments made

-- 3. What film does the store have the most of? (search in inventory)

SELECT film_id
from inventory
GROUP BY film_id
having count(film_id) >7

The store has multiple movies having a high 8 of each


-- 4. How many customers have the last name ‘William’?

SELECT *
from customer
WHERE last_name Like 'William'

none

-- 5. What store employee (get the id) sold the most rentals?

SELECT COUNT(staff_id)
from rental
where staff_id = 1

SELECT COUNT(staff_id)
from rental
where staff_id = 2

staff 1 with 8040
staff 2 = 8004

-- 6. How many different district names are there?

SELECT COUNT(district)
from address

603

-- 7. What film has the most actors in it? (use film_actor table and get film_id)

SELECT film_id
from film_actor
GROUP BY film_id
ORDER BY COUNT(film_id) DESC

movie 508

-- 8. From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

SELECT last_name
from customer
where store_id = 1 and last_name LIKE '%es'

12

-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)

SELECT amount, count(amount)
from payment
where customer_id BETWEEN 380 and 430
GROUP BY amount
HAVING count(amount) > 250

3

-- 10. Within the film table, how many rating categories are there? And what rating has the most
--movies total?



SELECT COUNT(rating)
from film
where rating = 'R'

R = 196

SELECT COUNT(rating)
from film
where rating = 'G'

G = 178

SELECT COUNT(rating)
from film
where rating = 'PG'

PG = 194

SELECT COUNT(rating)
from film
where rating = 'PG-13'

PG-13 = 224

SELECT COUNT(rating)
from film
where rating = 'NC-17'

NC-17 = 209

5 CATEGORIES
PG-13 HAS THE MOST




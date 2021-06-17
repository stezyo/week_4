-- 1. List all customers who live in Texas (use JOINs)
SELECT first_name, last_name, district
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE address.district = 'Texas'

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT first_name, last_name
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
WHERE payment.amount > 6.99

-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT last_name, first_name, customer_id
FROM customer
WHERE customer_id IN(
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
	)
GROUP BY customer_id

-- 4. List all customers that live in Nepal (use the city table)
SELECT customer.first_name, customer.last_name, country.country
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON city.country_id = country.country_id
WHERE country = 'Nepal'

-- 5. Which staff member had the most transactions?
SELECT first_name, last_name, COUNT(s.staff_id)
FROM staff AS s
INNER JOIN payment AS pa
ON s.staff_id = pa.staff_id
GROUP BY first_name, last_name

-- 6. How many movies of each rating are there?
SELECT rating, COUNT(rating)
FROM film
GROUP BY rating

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
SELECT COUNT(numOfPayments)
FROM(
	SELECT customer_id, first_name, last_name, COUNT(amount) as numOfPayments
	FROM (
		SELECT payment.customer_id, customer.first_name, customer.last_name, payment.amount
		FROM payment
		INNER JOIN customer
		ON payment.customer_id = customer.customer_id
		WHERE amount > 6.99
		) AS SUB1
		GROUP BY customer_id, first_name, last_name
		HAVING COUNT(amount) = 1
	) AS SUB2

-- 8. How many free rentals did our stores give away?
SELECT amount, COUNT(amount)
FROM payment
WHERE amount = 0
GROUP BY amount

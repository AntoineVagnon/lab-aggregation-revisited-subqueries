#Here are the customer who rented movies 
SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id;

#Here are the customer who rented movies with a concatenation of first name and last name
SELECT p.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name, AVG(p.amount) AS average_payment
FROM payment p
JOIN customer c ON p.customer_id = c.customer_id
GROUP BY p.customer_id, customer_name;


#Here are the querie to identify the people who rented a movie with category "action"
SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customers c
JOIN rentals r ON c.customer_id = r.customer_id
JOIN movies m ON r.movie_id = m.movie_id
WHERE m.genre = 'Action';

SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customer c
JOIN rental r ON c.customer_id = r.customer_id
JOIN film f ON f.film_id = r.inventory_id
JOIN film_category fc ON fc.film_id = f.film_id
JOIN category ca ON ca.category_id = fc.category_id
WHERE ca.name = 'Action';

SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customer c
WHERE c.customer_id IN (
    SELECT r.customer_id
    FROM rental r
    JOIN film f ON f.film_id = r.inventory_id
    JOIN film_category fc ON fc.film_id = f.film_id
    JOIN category ca ON ca.category_id = fc.category_id
    WHERE ca.name = 'Action'
);

#here is the new column to identify the level of transaction 

SELECT payment_id, customer_id, amount,
CASE 
    WHEN amount BETWEEN 0 AND 2 THEN 'low'
    WHEN amount BETWEEN 2 AND 4 THEN 'medium'
    ELSE 'high'
END AS transaction_label
FROM payment;




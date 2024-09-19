-- 1. Determine the number of copies of the film "Hunchback Impossible" that exist in the inventory system.
SELECT
	f.title as film,
	count(i.film_id) as copies
FROM sakila.film f
JOIN sakila.inventory i
	ON f.film_id = i.film_id
WHERE f.title = "Hunchback Impossible";

-- 2. List all films whose length is longer than the average length of all the films in the Sakila database.
SELECT
	f.title as film,
    f.length
FROM sakila.film f
WHERE f.length > (SELECT avg(length) FROM sakila.film);

-- 3. Use a subquery to display all actors who appear in the film "Alone Trip".
SELECT
	f.title,
	a.first_name,
    a.last_name
FROM sakila.film f
JOIN sakila.film_actor fa
	ON f.film_id = fa.film_id
JOIN sakila.actor a
	ON fa.actor_id = a.actor_id
WHERE f.title = 'Alone Trip';

SELECT 
	a.first_name,
    a.last_name
FROM sakila.actor a
WHERE a.actor_id IN (
	SELECT fa.actor_id
    FROM sakila.film_actor fa
    WHERE fa.film_id = (SELECT f.film_id
		FROM sakila.film f
		WHERE title = 'Alone Trip'
    )
);
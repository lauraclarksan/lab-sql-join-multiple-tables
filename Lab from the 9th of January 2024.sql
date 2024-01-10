-- Lab 2 Unit 3
-- 1. Write a query to display for each store its store ID, city, and country.
select * from store;
select * from address;
select * from city;
select * from country;


select a.store_id, c.city, d.country from sakila.store as a
join sakila.address as b
on a.address_id = b.address_id
join sakila.city as c
on b.city_id = c.city_id
join sakila.country as d
on c.country_id = d.country_id;

-- 2. Write a query to display how much business, in dollars, each store brought in.
select * from store;
select * from customer;
select * from payment;

select a.store_id, sum(c.amount) as total_amount from sakila.store as a
join sakila.customer as b
on a.store_id = b.store_id
join sakila.payment as c
on b.customer_id = c.customer_id
group by a.store_id;

-- 3. What is the average running time of films by category?
select * from category;
select * from film_category;
select * from film;

select a.name, avg(c.length) as average_length from sakila.category as a
join sakila.film_category as b
on a.category_id = b.category_id
join sakila.film as c
on b.film_id = c.film_id
group by a.name
order by a.name;

-- 4 Which film categories are longest?
select a.name, avg(c.length) as average_length from sakila.category as a
join sakila.film_category as b
on a.category_id = b.category_id
join sakila.film as c
on b.film_id = c.film_id
group by a.name
order by avg(c.length) desc
limit 1;


-- 5. Display the most frequently rented movies in descending order.
select * from film;
select * from inventory;
select * from rental;

select a.title, count(c.rental_id) as number_of_rentals from sakila.film as a
join sakila.inventory as b
on a.film_id = b.film_id
join sakila.rental as c
on b.inventory_id = c.inventory_id
group by a.title
order by count(c.rental_id) desc;

-- 6. List the top five genres in gross revenue in descending order.
select * from category;
select * from film_category;
select * from film;
select * from inventory;
select * from rental;
select * from payment;

select a.name, sum(f.amount) as gross_revenue from sakila.category as a
join sakila.film_category as b
on a.category_id = b.category_id
join sakila.film as c
on b.film_id = c.film_id
join sakila.inventory as d
on c.film_id = d.film_id
join sakila.rental as e
on d.inventory_id = e.inventory_id
join sakila.payment as f
on e.rental_id = f.rental_id
group by a.name
order by sum(f.amount) desc;

-- 7. Is "Academy Dinosaur" available for rent from Store 1?
select * from film;
select * from inventory;
select * from store;

select a.title from sakila.film as a
join sakila.inventory as b
on a.film_id = b.film_id
join sakila.store as c
on b.store_id = c.store_id
where a.title = "Academy Dinosaur"
group by a.title;

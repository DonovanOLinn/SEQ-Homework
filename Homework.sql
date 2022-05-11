--1. How many actors are there with the last name 'Wahlberg'?
select count(last_name)
from actor
where last_name = 'Wahlberg';

--ANSWER: There are 2 actors with the last name Wahlberg

--2.How many payments were made between $3.99 and $5.99?
select count(amount)
from payment
where amount between 3.99 and 5.99


--ANSWER: There have been 5,561 payment between 3.99 and 5.99

--3. What film does the store have the most of? (search in inventory)
--count(film_id)

select inventory.film_id, count(inventory.film_id),title
from inventory
join film
on inventory.film_id = film.film_id 
group by inventory.film_id, title
having count(inventory.film_id) > 8; 

--ANSWER:The most of one movie in the store is Curtain Videotape

--4. How many customers have the last name 'William'?
select last_name
from customer 
where last_name = 'William'


--ANSWER: There is no customer with the last name 'William'

--5.What store employee (get the id)sold the most rentals?
select count(staff_id), staff_id  
from rental 
group by staff_id ;

--ANSWER: Staff_id 1 sold the most rentals


--6.How many different district names are there?
select count(district), district
from address
group by district;

--ANSWER:There are 378 different district names

--7.What film has the most actors in it? (use film_actor table and get film_id)

select count(film_actor.film_id),  title
from film_actor 
join film
on film_actor.film_id = film.film_id 
group by film_actor.film_id, title
order by count(film_actor.film_id) desc;


--ANSWER:The film Lambs Cincinatti has the most actors in it

--8.From store_id 1, how many customers have a last name ending with ‘es’? (use customer table)

select count(last_name), last_name,  store_id   
from customer
where last_name ='%es'
group by last_name, store_id;


--ANSWER:There are no customers from store_id 1 that has a last name ending with es

--9.How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers with ids between 380 and 430? (use group by and having > 250)
select count(amount), amount, customer_id 
from payment 
where customer_id between 380 and 430
group by amount, customer_id  
having count(amount) > 250
order by count(amount) desc;

--ANSWER:There is no customer with the id between 380 and 430 that had over 250 rentals

--10.Within the film table, how many rating categories are there? And what rating has the most movies total?
select count(rating), rating
from film
group by rating
order by count(rating) desc;

--ANSWER:There are 5 rating categories with the most movies being in the PG-13 category
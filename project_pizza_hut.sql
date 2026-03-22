
use piza_hut;

-- Retrieve the total number of orders placed.
select count(order_id) from orders;


-- Calculate the total revenue generated from pizza sales.
select round(sum(order_details.quantity*pizzas.price),2) as total_revenue
from order_details
join pizzas on pizzas.pizza_id = order_details.pizza_id;


-- Identify the highest-priced pizza.
select pizza_types.name,pizzas.price from pizza_types
join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc limit 1;

-- Identify the most common pizza size ordered.
SELECT 
    pizzas.size, COUNT(order_details.quantity) AS total
FROM
    pizzas
        JOIN
    order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size
ORDER BY total DESC
LIMIT 1;

-- List the top 5 most ordered pizza types along with their quantities.
select sum(order_details.quantity) as total_quantity,pizzas.pizza_type_id
from order_details
join pizzas on order_details.pizza_id = pizzas.pizza_id
group by pizza_type_id order by total_quantity desc limit 5;


-- Intermediate:
-- Join the necessary tables to find the total quantity of each pizza category ordered.
select pizza_types.category,sum(order_details.quantity) as total_quantity 
from pizza_types
join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id 
join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizza_types.category;

-- Determine the distribution of orders by hour of the day.
select hour(order_time) , count(order_id) from orders
group by hour(order_time);

-- Join relevant tables to find the category-wise distribution of pizzas.
select category , count(name) from pizza_types
group by category; 

-- Group the orders by date and calculate the average number of pizzas ordered per day.
select avg(quantity) from
(select sum(order_details.quantity) as quantity ,orders.order_date
from orders
join order_details
on orders.order_id = order_details.order_id
group by orders.order_date) as order_quantity;


-- Determine the top 3 most ordered pizza types based on revenue.
select pizzas.pizza_type_id , sum(order_details.quantity * pizzas.price) as total_revenue
from pizzas
join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizzas.pizza_type_id order by total_revenue desc limit 3;
 
 
--  Calculate the percentage contribution of each pizza type to total revenue. 
select pizza_types.category, (sum(order_details.quantity*pizzas.price) / (select sum(order_details.quantity*pizzas.price) as revenue
from order_details join pizzas
on order_details.pizza_id = pizzas.pizza_id)*100)as percentage_contribution
from pizza_types join pizzas
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details
on pizzas.pizza_id = order_details.pizza_id
group by pizza_types.category;


-- Analyze the cumulative revenue generated over time.
-- per day kitna revenue hua and har din ka jod ke agla din me dikhana hai
select order_date , round(sum(revenue) over(order by order_date),2) as cum_rev
from
(select orders.order_date , sum(order_details.quantity*pizzas.price) as revenue
from order_details join pizzas
on order_details.pizza_id = pizzas.pizza_id
join orders
on order_details.order_id = orders.order_id
group by orders.order_date) as sales ;



-- Determine the top 3 most ordered pizza types based on revenue for each pizza category.
select category,name,revenue,Ranks
 from
(select category ,name ,revenue ,
rank() over(partition by category order by revenue desc) as Ranks from
(select pizza_types.category ,pizza_types.name, round(sum(order_details.quantity*pizzas.price),2) as revenue
from pizza_types join pizzas 
on pizza_types.pizza_type_id = pizzas.pizza_type_id
join order_details on pizzas.pizza_id = order_details.pizza_id
group by pizza_types.category ,pizza_types.name) as a) as b
where Ranks <=3 ;







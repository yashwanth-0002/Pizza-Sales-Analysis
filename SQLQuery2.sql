select * from order_details

--Basis:
--Q1.Retrieve the total number of orders placed.
select count(Order_id) as Total_orders from orders

--Q2. Calculate the total revenue generated from pizza sales.
select round(sum(order_details.quantity * pizzas.price),2)
as total_sales from order_details join pizzas on  
cast(order_details.pizza_id as varchar(50)) = pizzas.pizza_id -- (actually cast and varchar functions are not there in the querry but i did one mistake in iport the data thats why i appiled this function to remove error)

--Q3. Identify the highest-priced pizza.
select max(pizzas.price) as Highest_priced_pizza from pizzas
--anothe professional code
select top 1 pizza_types.name, pizzas.price from pizza_types join pizzas on pizza_types.pizza_type_id = pizzas.pizza_type_id
order by pizzas.price desc


--Q4. Identify the most common pizza size ordered.
select  top 1 pizzas.size, count(order_details.order_details_id) from
pizzas join order_details on pizzas.pizza_id = CAST(order_details.pizza_id AS varchar(50))  -- (actually cast and varchar functions are not there in the querry but i did one mistake in iport the data thats why i appiled this function to remove error)
group by pizzas.size 
ORDER BY pizzas.size

--Q5. List the top 5 most ordered pizza types along with their quantities.
SELECT TOP 5 
    pizzas.pizza_type_id,
    SUM(order_details.quantity) AS total_quantity
FROM pizzas
JOIN order_details 
    ON pizzas.pizza_id = CAST(order_details.pizza_id AS VARCHAR(50))
GROUP BY pizzas.pizza_type_id
ORDER BY total_quantity DESC;
-- if you want pizza names instead of ids
SELECT TOP 5 
    pizza_types.name,
    SUM(order_details.quantity) AS total_quantity
FROM pizzas
JOIN order_details 
    ON pizzas.pizza_id = CAST(order_details.pizza_id AS VARCHAR(50))
JOIN pizza_types 
    ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY total_quantity DESC;
 

 --intermediate:

 --Q1. Join the necessary tables to find the total quantity of each pizza category ordered.
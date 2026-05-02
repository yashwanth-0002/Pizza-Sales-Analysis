select sum(total_price) / count(distinct order_id) as Average_order_value from [pizza_sales excel file]
select * from [pizza_sales excel file]
select sum(quantity) as total_pizza_sold from [pizza_sales excel file]
select count(distinct order_id) as total_orders from [pizza_sales excel file]
select sum(quantity) / count(distinct order_id) as avg_order from [pizza_sales excel file]
select cast(sum(quantity) as decimal(10,2)) / cast(count(distinct order_id) as decimal(10,2)) as avg_pizzas_per_order from [pizza_sales excel file]
--## Daily Trend
select DATENAME(DW, order_date) as order_day, count(distinct order_id) as Total_orders from [pizza_sales excel file]
order by DATENAME(DW,order_date)
--## correct queary
SELECT 
    DATENAME(DW, order_date) AS order_day,
    COUNT(DISTINCT order_id) AS Total_orders
FROM [pizza_sales excel file]
GROUP BY DATENAME(DW, order_date), DATEPART(DW, order_date)
ORDER BY DATEPART(DW, order_date);

-- ## hourly trend 
select DATEPART(hour,order_time) as order_hours, COUNT(DISTINCT order_id) AS Total_orders from [pizza_sales excel file]
group by  DATEPART(hour,order_time)
order by  DATEPART(hour,order_time)

--## percentage of sales by pizza category:
select pizza_category, sum(total_price) as Total_sales, sum(total_price) * 100 / (select sum(total_price) from [pizza_sales excel file] where month(order_date) = 11) as PCT
from [pizza_sales excel file] 
where month(order_date) = 11--(month no)
group by  pizza_category

---## Percentage of sales by pizza size:

select pizza_size, sum(total_price) as Total_sales, sum(total_price) * 100 / (select sum(total_price) from [pizza_sales excel file] where month(order_date) = 11) as PSP
from [pizza_sales excel file] 

group by  pizza_size

--## Total pizza sold by pizza category:
select pizza_category, sum(quantity) as Total_sales from [pizza_sales excel file]
group by pizza_category

--## Top 5 Best sellers by Total pizzas Slod:
 
 select top 5  pizza_name, sum(quantity) as Total_Sales from [pizza_sales excel file]
 group by pizza_name
 order by Total_sales desc

 --## Bottom 5 Best sellers by Total pizzas Slod:

 select top 5 pizza_name, sum(quantity) as Total_Sales from [pizza_sales excel file]
 group by pizza_name
 order by Total_sales asc

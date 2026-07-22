create database pizza_sales_db
use pizza_sales_db
select * from pizza_sales limit 5

--Q1. TOTAL REVENUE
select round(sum(total_price),2) as total_revenue from pizza_sales

--Q2. Total Pizzas sold
select sum(quantity) as total_pizzas_sols from pizza_sales

--Q3. Total Orders
select count(distinct(order_id)) as total_orders from pizza_sales

--Q4. Avg Order value
SELECT
    ROUND(SUM(total_price) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM pizza_sales

--Q5. Avg pizza per order
select round(sum(quantity)/ COUNT(DISTINCT order_id), 2) as avg_pizza_per_order from pizza_sales


--Q6. Daily Trend for Total Orders
SELECT
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day,
    COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'))

--Q7. Monthly Trend for Total Orders
select monthname(str_to_date(order_date, '%d-%m-%Y')) AS month_name, count(distinct(order_id)) as total_orders from pizza_sales group by monthname(str_to_date(order_date, '%d-%m-%Y'))

--Q8. % of Sales by Pizza Category
	select pizza_category, sum(total_price), round(100*sum(total_price)/(select sum(total_price) from pizza_sales),2) as pct
	from pizza_sales group by pizza_category
    
--Q9. % of Sales by Pizza Size
select pizza_size, round(100*sum(total_price)/(select sum(total_price)from pizza_sales),2)as pst from pizza_sales group by pizza_size

--Q10. Total Pizzas Sold by Pizza Category
select pizza_category, sum(quantity) from pizza_sales group by pizza_category

--Q11. Top 5 Pizzas by quantity
select pizza_name,count(quantity) from pizza_sales group by pizza_name order by count(quantity) desc limit 5 

--Q12. Bottom 5 Pizzas by quantity
select pizza_name,count(quantity) from pizza_sales group by pizza_name order by count(quantity) asc limit 5 

--Q13. Top 5 Pizzas by Revenue
select pizza_name, sum(total_price) from pizza_sales group by pizza_name order by sum(total_price) desc limit 5

--Q14. Bottom 5 Pizzas by Revenue
select pizza_name, sum(total_price) from pizza_sales group by pizza_name order by sum(total_price) asc limit 5

--Q15. Top 5 Pizzas by Total Orders
select pizza_name, count(distinct(order_id)) from pizza_sales group by pizza_name order by count(distinct(order_id)) desc limit 5

--Q16. Bottom 5 Pizzas by Total Orders
select pizza_name, count(distinct(order_id)) from pizza_sales group by pizza_name order by count(distinct(order_id)) asc limit 5





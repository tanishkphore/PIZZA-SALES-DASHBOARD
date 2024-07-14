CREATE DATABASE PIZZAdb;
USE PIZZAdb;
SELECT * FROM pizza_sales;

-- TOTAL REVENUE
SELECT sum(total_price) AS Total_Revenue FROM pizza_sales;

-- AVERAGE ORDER VALUE
SELECT sum(total_price)/ count(distinct order_id) AS Avg_Order_Value FROM pizza_sales;

-- TOTAL PIZZA SOLD
SELECT sum(quantity) AS Total_Pizza_Sold FROM pizza_sales;

-- TOTAL ORDER
SELECT count(distinct order_id) AS Total_Orders FROM pizza_sales;

-- AVERAGE PIZZAS PER ORDER 
SELECT sum(quantity) / count(distinct order_id) AS Average_Pizzas_Per_Order FROM pizza_sales;

-- HOURLY TREND FOR TOTAL PIZZAS SOLD
SELECT HOUR(order_time) AS Order_Hour, sum(quantity) AS Total_Pizzas_Sold FROM pizza_sales
GROUP BY HOUR(order_time)
ORDER BY HOUR(order_time);

-- WEEKLY TRENDS FOR TOTAL ORDER;
SELECT WEEK(order_date) AS Order_Week, COUNT(DISTINCT order_id) AS Total_Order FROM pizza_sales
GROUP BY WEEK(order_date)
ORDER BY WEEK(order_date);

-- PERCENTAGE OF SALES BY PIZZA CATEGORY
SELECT pizza_category, sum(total_price) * 100 / (SELECT sum(total_price) FROM pizza_sales) AS Percentage_Total_Sales FROM pizza_sales
GROUP BY pizza_category;

-- PERCENTAGE OF SALES BY PIZZA SIZE
SELECT pizza_size, sum(total_price) * 100 / (SELECT sum(total_price) FROM pizza_sales) AS Percentage_Total_Sales FROM pizza_sales
GROUP BY pizza_size;

-- TOTAL PIZZA SOLD BY CATEGORY
SELECT pizza_category, sum(quantity) AS Total_Quantity_Sold FROM pizza_sales
GROUP BY pizza_category;

-- TOP 5 PIZZAS BY REVENUE
SELECT pizza_name, sum(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- BOTTOM 5 PIZZA BY REVENUE 
SELECT pizza_name, sum(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

-- TOP 5 PIZZAS BY QUANTITY
SELECT pizza_name, sum(quantity) AS Total_Pizza_Sold FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

-- BOTTOM 5 PIZZAS BY QUANTITY
SELECT pizza_name, sum(quantity) AS Total_Pizza_Sold FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;

-- TOP 5 PIZZAS BY TOTAL ORDER
SELECT pizza_name, count(distinct order_id) AS Total_Order FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order DESC
LIMIT 5;

-- BOTTOM 5 PIZZAS BY TOTAL ORDERS
SELECT pizza_name, count(distinct order_id) AS Total_Order FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Order ASC
LIMIT 5;
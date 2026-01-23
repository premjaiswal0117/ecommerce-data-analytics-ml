-- Calculate Total revenue to understand overall business performance
SELECT SUM(sales) AS total_revenue FROM orders;

-- Calculate monthly revenue by year-month
SELECT DATE_FORMAT(order_date,'%y-%m') AS Months, SUM(sales) AS revenue FROM orders GROUP BY months ORDER BY months;

-- Retrieve the top 10 products by total revenue
SELECT p.product_name, SUM(o.sales) AS revenue FROM products p JOIN orders o ON p.product_id = o.product_id GROUP BY p.product_name ORDER BY revenue DESC LIMIT 10;

-- Calculate total revenue by product category
SELECT p.category, SUM(o.sales) AS revenue FROM products p JOIN orders o ON p.product_id = o.product_id GROUP BY p.category ORDER BY revenue DESC ;

-- Count total orders per customer 
SELECT c.customer_name, COUNT(o.order_id) AS total_order FROM orders o JOIN customers c ON o.customer_id = c.customer_id GROUP BY c.customer_name;

-- Identify repeat customers who place multiple orders, indicating customer retention and loyalty
SELECT c.customer_name, COUNT(o.order_id) AS total_order FROM orders o JOIN customers c ON o.customer_id = c.customer_id GROUP BY c.customer_name HAVING COUNT(o.order_id) > 1;

-- Total number of orders
SELECT COUNT(order_id) AS total_orders FROM orders;

-- Total distinct customers
SELECT  COUNT(DISTINCT customer_name) AS total_customers FROM customers;


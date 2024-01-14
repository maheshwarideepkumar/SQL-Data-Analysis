UPDATE orders
SET order_date = '2023-04-16',
    ship_date = '2023-04-21'
WHERE order_id = 5;

--  Finding the top-selling product based on sales quantity
SELECT p.product_id, p.product_name, SUM(o.quantity) AS total_quantity
FROM products p
JOIN orders o ON p.product_id = o.product_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN categories cat ON p.category_id = cat.category_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC
LIMIT 1;

-- To find the top 10 highest sales and with thier names and product ID and the year in which it occurred,
SELECT c.Customer_name, o.product_id, EXTRACT(YEAR FROM o.order_date) AS sales_year,p.product_name
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
join products  p on o.product_id=p.product_id
order by sales desc
LIMIT 10;

--To find the top 10 cities with the highest sales and profit, along with product details
SELECT c.city, p.product_id, p.product_name, SUM(o.sales) AS total_sales, SUM(o.profit) AS total_profit
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN products p ON p.product_id = o.product_id
GROUP BY c.city, p.product_id, p.product_name
ORDER BY total_sales DESC, total_profit DESC
LIMIT  10;
--to calculate the total sales for each product in each year
WITH sales_data AS (
    SELECT product_id, EXTRACT(YEAR FROM order_date) AS sales_year, SUM(sales) AS total_sales
    FROM orders
    GROUP BY product_id, EXTRACT(YEAR FROM order_date)
)
SELECT s.sales_year, s.product_id, p.product_name, s.total_sales
FROM sales_data s
JOIN products p ON s.product_id = p.product_id
group by s.sales_year ,s.product_id, p.product_name, s.total_sales;


--To find the maximum shipment days and include customer details and product details
SELECT o.order_id,o.ship_date,o.order_date,EXTRACT(DAY FROM o.ship_date) - EXTRACT(DAY FROM o.order_date) AS max_shipment_days,
  c.customer_id,c.customer_name,c.city,c.country,p.product_id,p.product_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE EXTRACT(DAY FROM o.ship_date) - EXTRACT(DAY FROM o.order_date) = (
  SELECT MAX(EXTRACT(DAY FROM ship_date) - EXTRACT(DAY FROM order_date))
  FROM orders
);











-- Create the Categories table
CREATE TABLE IF NOT EXISTS public.categories (
    category_id SERIAL PRIMARY KEY,
    category_name TEXT);

-- Create the Customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT,
    country TEXT,
    city TEXT,
    state TEXT,
    postal_code TEXT
);

-- Create the Orders table
CREATE TABLE IF NOT EXISTS public.orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE,
    ship_date DATE,
    customer_id INTEGER,
    sales NUMERIC(10, 2),
    quantity INTEGER,
    discount NUMERIC(5, 2),
    profit NUMERIC(10, 2),
    product_id intetger,
    CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id)
        REFERENCES public.customers (customer_id)
);

-- Create the Products table

    CREATE TABLE IF NOT EXISTS public.products (
    product_id SERIAL PRIMARY KEY,
    product_name TEXT,
    category_id INTEGER,
    CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id)
     REFERENCES public.categories (category_id)
);

2)  --For inserting data into this table:
-- Insert the data into order table
INSERT INTO orders (order_id, order_date, ship_date, customer_id, sales, quantity, discount, profit, product_id)
VALUES
  (1, '2022-11-09', '2022-11-12', 24, 500.00, 2, 0.10, 100.00, 1001),
  (2, '2023-06-13', '2023-06-17', 62, 750.00, 3, 0.15, 200.00, 1002),
  (3, '2022-10-11', '2022-10-18', 9, 1000.00, 4, 0.20, 300.00, 1003),
  (4, '2021-06-09', '2021-06-14', 42, 250.00, 1, 0.05, 50.00, 1004),
  (5, '2023-04-16', '2023-04-21', 38, 1200.00, 5, 0.25, 400.00, 1005),
  (6, '2023-12-06', '2023-12-11', 57, 800.00, 3, 0.10, -150.00, 1006),
  (7, '2022-11-22', '2022-11-26', 10, 350.00, 2, 0.05, 75.00, 1007),
  (8, '2021-11-11', '2021-11-18', 68, 600.00, 4, 0.15, 200.00, 1008),
  (9, '2021-05-13', '2021-05-15', 53, 400.00, 2, 0.10, 80.00, 1009),
  (10, '2021-08-27', '2021-09-01', 17, 900.00, 3, 0.15, 180.00, 1010),
  (11, '2022-12-10', '2022-12-14', 49, 600.00, 2, 0.05, 120.00, 1011),
  (12, '2023-07-17', '2023-07-19', 29, 1500.00, 5, 0.20, 300.00, 1012),
  (13, '2022-09-25', '2022-09-30', 64, 800.00, 3, 0.10, -160.00, 1013),
  (14, '2023-01-16', '2023-01-20', 33, 450.00, 2, 0.05, 90.00, 1014),
  (15, '2022-09-17', '2022-09-21', 22, 700.00, 4, 0.15, 140.00, 1015),
  (16, '2022-10-09', '2022-10-14', 45, 350.00, 1, 0.05, 70.00, 1016),
  (17, '2023-12-27', '2023-12-31', 40, 600.00, 3, 0.10, 120.00, 1017),
  (18, '2022-12-11', '2022-12-16', 28, 300.00, 2, 0.05, 60.00, 1018),
  (19, '2021-09-18', '2021-09-23', 56, 450.00, 3, 0.10, 90.00, 1019),
  (20, '2021-10-20', '2021-10-24', 59, 800.00, 4, 0.20, 200.00, 1020),
  (21, '2022-12-12', '2022-12-18', 30, 350.00, 2, 0.05, 70.00, 1021),
  (22, '2022-06-18', '2022-06-19', 65, 600.00, 3, 0.10, 120.00, 1022),
  (23, '2021-04-24', '2021-04-30', 61, 400.00, 2, 0.05, 80.00, 1023),
  (24, '2023-12-18', '2023-12-21', 18, 900.00, 5, 0.25, -180.00, 1024),
  (25, '2021-06-09', '2021-06-14', 6, 600.00, 3, 0.10, 120.00, 1030),
  (26, '2021-11-24', '2021-11-30', 50, 450.00, 2, 0.05, 90.00, 1031),
  (27, '2022-04-30', '2022-05-05', 14, 700.00, 4, 0.15, 140.00, 1032),
  (28, '2021-12-05', '2021-12-10', 41, 350.00, 1, 0.05, 70.00, 1033),
  (29, '2023-09-19', '2023-09-24', 25, 600.00, 3, 0.10, 120.00, 1034),
  (30, '2022-09-15', '2022-09-18', 23, 400.00, 2, 0.05, 80.00, 1035),
  (31, '2021-04-26', '2021-05-02', 16, 800.00, 5, 0.25, 160.00, 1036),
  (32, '2023-12-10', '2023-12-12', 48, 600.00, 3, 0.10, 120.00, 1037),
  (33, '2023-11-26', '2023-12-01', 69, 350.00, 2, 0.05, -70.00, 1038),
  (34, '2023-06-13', '2023-06-16', 67, 700.00, 4, 0.15, 140.00, 1039),
  (35, '2022-10-12', '2022-10-16', 32, 500.00, 3, 0.10, 100.00, 1040);
-- insert the data into Products table

INSERT INTO products (product_id, product_name, category_id)
VALUES
  (1001, 'Sofa', 1),
  (1002, 'Office Chair', 2),
  (1003, 'Outdoor Table', 3),
  (1004, 'Bed', 4),
  (1005, 'Coffee Table', 5),
  (1006, 'Dining Set', 6),
  (1007, 'Kitchen Island', 7),
  (1008, 'Bathroom Vanity', 8),
  (1009, 'Kids'' Bed', 9),
  (1010, 'Patio Lounge Chair', 10),
  (1011, 'Bookshelf', 11),
  (1012, 'Ceiling Light', 12),
  (1013, 'Wall Art', 13),
  (1014, 'Notebook', 15),
  (1015, 'Ballpoint Pen', 16),
  (1016, 'Copy Paper', 17),
  (1017, 'Desk Organizer', 18),
  (1018, 'File Cabinet', 19),
  (1019, 'Whiteboard', 20),
  (1020, 'Coffee Maker', 31),
  (1021, 'Toaster Oven', 32),
  (1022, 'Washing Machine', 33),
  (1023, 'Hair Dryer', 34),
  (1024, 'Lawn Mower', 35),
  (1030, 'Office Desk', 2),
  (1031, 'Outdoor Chair', 3),
  (1032, 'Mattress', 4),
  (1033, 'TV Stand', 5),
  (1034, 'Desk Lamp', 18),
  (1035, 'Printer', 26),
  (1036, 'Bluetooth Speaker', 28),
  (1037, 'Wireless Router', 29),
  (1038, 'Smartphone', 30),
  (1039, 'Refrigerator', 31),
  (1040, 'Blender', 32),
  (1041, 'Vacuum Cleaner', 33),
  (1042, 'Electric Shaver', 34),
  (1043, 'Grill Set', 35);

-- insert the data into categories table

INSERT INTO categories (category_id, category_name)
VALUES
  (1, 'Home Furniture'),
  (2, 'Office Furniture'),
  (3, 'Outdoor Furniture'),
  (4, 'Bedroom Furniture'),
  (5, 'Living Room Furniture'),
  (6, 'Dining Room Furniture'),
  (7, 'Kitchen Furniture'),
  (8, 'Bathroom Furniture'),
  (9, 'Kids'' Furniture'),
  (10, 'Patio Furniture'),
  (11, 'Storage Furniture'),
  (12, 'Lighting Fixtures'),
  (13, 'Decorative Accessories'),
  (14, 'Office Supplies'),
  (15, 'Stationery'),
  (16, 'Writing Instruments'),
  (17, 'Paper Products'),
  (18, 'Desk Accessories'),
  (19, 'Filing and Organization'),
  (20, 'Presentation Supplies'),
  (21, 'Breakroom Supplies'),
  (22, 'Cleaning and Janitorial Supplies'),
  (23, 'Safety and Security Equipment'),
  (24, 'Technology Gadgets'),
  (25, 'Computers and Laptops'),
  (26, 'Printers and Scanners'),
  (27, 'Computer Accessories'),
  (28, 'Audio and Video Equipment'),
  (29, 'Networking Devices'),
  (30, 'Mobile Devices and Accessories'),
  (31, 'Home Appliances'),
  (32, 'Kitchen Appliances'),
  (33, 'Laundry Appliances'),
  (34, 'Personal Care Appliances'),
  (35, 'Outdoor Equipment');


-- Finding the top-selling product based on sales quantity

SELECT p.product_id, p.product_name, SUM(o.quantity) AS total_quantity
FROM products p
JOIN orders o ON p.product_id = o.product_id
JOIN customers c ON o.customer_id = c.customer_id
JOIN categories cat ON p.category_id = cat.category_id
GROUP BY p.product_id, p.product_name
ORDER BY total_quantity DESC
LIMIT 1;

-- To find the top 10 highest sales and with  customer and product details and the year in which it occurred.
CREATE VIEW top_sales_view AS
SELECT c.Customer_name, o.product_id, EXTRACT(YEAR FROM o.order_date) AS sales_year, p.product_name
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN products p ON o.product_id = p.product_id
ORDER BY sales_year DESC
LIMIT 10;
select *
from top_sales_view

--To find the top 10 cities with the highest sales and profit, along with product details
SELECT c.city, p.product_id, p.product_name, SUM(o.sales) AS total_sales, SUM(o.profit) AS total_profit
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
JOIN products p ON p.product_id = o.product_id
GROUP BY c.city, p.product_id, p.product_name
ORDER BY total_sales DESC, total_profit DESC
LIMIT  10;
--To calculate the total sales for each product in each year using CTE(computed table Expression)
WITH sales_data AS (
    SELECT product_id, EXTRACT(YEAR FROM order_date) AS sales_year, SUM(sales) AS total_sales
    FROM orders
    GROUP BY product_id, EXTRACT(YEAR FROM order_date) 
)
SELECT s.sales_year, s.product_id, p.product_name, s.total_sales
FROM sales_data s
JOIN products p ON s.product_id = p.product_id
group by s.sales_year ,s.product_id, p.product_name, s.total_sales;

-- For calculating the maximum shipment days from ordering days for that customer and even with the product details
SELECT o.order_id ,o.ship_date, o.order_date, 
EXTRACT(DAY FROM o.ship_date) - EXTRACT(DAY FROM o.order_date) AS max_shipment_days,
 c.customer_id,c.customer_name,c.city,c.country,p.product_id,p.product_name
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
WHERE EXTRACT(DAY FROM o.ship_date) - EXTRACT(DAY FROM o.order_date) = (
 SELECT MAX(EXTRACT(DAY FROM ship_date) - EXTRACT(DAY FROM order_date))
 FROM orders );


-- For finding the customer who spend more money on products and label them as high-spending customer

SELECT  c.customer_id,  c.customer_name, SUM (o.sales) AS total_sales,
 CASE WHEN SUM(o.sales) > avg_sales.avg_total_sales THEN 'High-Spending' ELSE 'Regular' END AS spending_category
FROM customers c
JOIN  orders o ON c.customer_id = o.customer_id
CROSS JOIN  (SELECT AVG(sales) AS avg_total_sales FROM orders) avg_sales
GROUP BY  c.customer_id, c.customer_name, avg_sales.avg_total_sales
ORDER BY total_sales DESC;



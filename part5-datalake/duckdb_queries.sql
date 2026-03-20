-- 5.1 — Cross-Format Queries:

-- Q1: List all customers along with the total number of orders they have placed
SELECT c.name AS Customer_name, COUNT(o.order_id) AS total_orders
FROM read_csv_auto('customers.csv') AS c
LEFT JOIN read_json_auto('orders.json') AS o ON c.customer_id = o.customer_id
GROUP BY c.name;

-- Q2: Find the top 3 customers by total order value
SELECT c.name AS Customer_name, SUM(o.total_amount) AS total_spent
FROM read_csv_auto('customers.csv') AS c
JOIN read_json_auto('orders.json') AS o ON c.customer_id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC
LIMIT 3;

-- Q3: List all products purchased by customers from Bangalore
-- Note: Assumes 'city' column in CSV and 'product_id' linking JSON to Parquet
SELECT DISTINCT p.product_name FROM read_csv_auto('customers.csv') AS c
JOIN read_json_auto('orders.json') AS o ON c.customer_id = o.customer_id
JOIN read_parquet('products.parquet') AS p ON o.order_id = p.product_id
WHERE c.city = 'Bangalore';

-- Q4: Join all three files to show: customer name, order date, product name, and quantity
SELECT c.name AS Customer_name,o.order_date,p.product_name, o.num_items AS Quantity
FROM read_csv_auto('customers.csv') AS c
JOIN read_json_auto('orders.json') AS o ON c.customer_id = o.customer_id
JOIN read_parquet('products.parquet') AS p ON o.order_id = p.product_id;
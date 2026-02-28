DESCRIBE customers;
DESCRIBE orders;
DESCRIBE products;
DESCRIBE order_items;

SELECT * FROM customers;

SELECT COUNT(customer_id) FROM customers;

SELECT state, COUNT(state) AS `Count` FROM customers
GROUP BY state;

SELECT state, COUNT(*) AS total_customers
FROM customers
GROUP BY STATE
ORDER BY 2 DESC
LIMIT 10;

SELECT DATE_FORMAT(signup_date, '%Y-%m') AS `month`,
COUNT(*) AS new_customers
FROM customers
GROUP BY `month`
ORDER BY `month`;

SELECT * FROM orders;

SELECT order_status, COUNT(payment_method) AS `Count of UPI` FROM orders
WHERE order_status = 'Delivered' AND payment_method = 'UPI';

SELECT order_status, COUNT(order_status) AS `Count` FROM orders
GROUP BY order_status;

SELECT payment_method, COUNT(payment_method) AS `COUNT` FROM orders
GROUP BY payment_method
ORDER BY 2 DESC;

SELECT * FROM products;

SELECT category, COUNT(category) AS `Count`
FROM products
GROUP BY category;

SELECT category, ROUND(SUM(price),2) AS price
FROM products
GROUP BY 1;

SELECT * FROM order_items;

SELECT * FROM order_items
WHERE quantity = 3;

SELECT MIN(price) AS min_price, MAX(price) AS max_price, ROUND(AVG(price),2) AS average_price
FROM products;

SELECT order_id, price_per_unit FROM order_items
WHERE price_per_unit BETWEEN 1000 AND 2000;





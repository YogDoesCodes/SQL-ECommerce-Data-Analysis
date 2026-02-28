CREATE DATABASE ecommerce_db;

USE ecommerce_db;

SHOW VARIABLES LIKE "secure_file_priv";

CREATE TABLE customers(
customer_id VARCHAR(20),
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
city VARCHAR(50),
`state` VARCHAR(50),
country VARCHAR(50),
signup_date DATE
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

ALTER TABLE customers 
ADD PRIMARY KEY (customer_id);

CREATE TABLE products(
product_id VARCHAR(20),
product_name VARCHAR(50),
category VARCHAR(50),
price FLOAT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/products.csv'
INTO TABLE products
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

ALTER TABLE products
ADD CONSTRAINT pk_products
PRIMARY KEY (product_id);

CREATE TABLE orders(
order_id VARCHAR(20),
customer_id VARCHAR (20),
order_date DATE,
order_status VARCHAR(20),
payment_method VARCHAR(50),
shipping_cost FLOAT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/orders.csv'
INTO TABLE orders
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

ALTER TABLE orders
ADD CONSTRAINT pk_orders
PRIMARY KEY (order_id);

ALTER TABLE orders
ADD CONSTRAINT fk_orders
FOREIGN KEY(customer_id) REFERENCES customers(customer_id);

CREATE TABLE order_items(
order_id VARCHAR(20),
product_id VARCHAR(20),
quantity VARCHAR(20),
price_per_unit FLOAT
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/order_items.csv'
INTO TABLE order_items
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

ALTER TABLE order_items
ADD COLUMN order_item_id INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE order_items
ADD CONSTRAINT fk_orderitems_order
FOREIGN KEY (order_id)
REFERENCES orders(order_id);

ALTER TABLE order_items
ADD CONSTRAINT fk_order_items_product
FOREIGN KEY (product_id)
REFERENCES products(product_id);






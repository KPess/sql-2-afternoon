-- eCommerce Simulation - No Hints
-- Summary
-- Let's simulate an e-commerce site. We're going to need users, products, and orders.

-- users need a name and an email.


CREATE TABLE users ( userid SERIAL PRIMARY KEY, name TEXT, email TEXT);
INSERT INTO users ( name, email ) VALUES ('Kevin', 'kevin@gmail.com');
INSERT INTO users ( name, email ) VALUES ('Chris', 'chris@gmail.com');
INSERT INTO users ( name, email ) VALUES ('David', 'david@gmail.com');

SELECT * FROM users;


-- products need a name and a price


CREATE TABLE products ( product_id SERIAL PRIMARY KEY, name TEXT, price DECIMAL);
INSERT INTO products ( name, price ) VALUES ('Car', 30000);
INSERT INTO products ( name, price ) VALUES ('Boat', 90000);
INSERT INTO products ( name, price ) VALUES ('House', 5000000);

SELECT * FROM products;


-- orders need a ref to product.

CREATE TABLE orders ( 
    order_id SERIAL PRIMARY KEY, 
    product_id INT REFERENCES products(product_id),
    qty INT);
INSERT INTO orders ( product_id, qty ) VALUES (1, 1);
INSERT INTO orders ( product_id, qty ) VALUES (2, 4);
INSERT INTO orders ( product_id, qty ) VALUES (3, 1);

SELECT * FROM orders


-- Run queries against your data.
-- Get all products for the first order.

SELECT * FROM orders
JOIN products ON (orders.product_id = products.product_id)
WHERE order_ID = 1;


-- Get all orders.

SELECT * FROM orders

-- Get the total cost of an order ( sum the price of all products on an order ).

SELECT SUM(o.qty * p.price) 
FROM orders o
JOIN products p ON (o.product_id = p.product_id)
WHERE order_ID = 1;

-- Add a foreign key reference from orders to users.

ALTER TABLE orders
ADD userid INT REFERENCES users(userid);

-- Update the orders table to link a user to each order.

UPDATE orders
SET user_id = 1
WHERE orders.order_id = 1;

UPDATE orders
SET user_id = 2
WHERE orders.order_id = 2;

UPDATE orders
SET user_id = 3
WHERE orders.order_id = 3;



-- Run queries against your data.
-- Get all orders for a user.

SELECT * 
FROM orders
WHERE user_id = 1;

-- Get how many orders each user has.

SELECT u.name, COUNT(o.user_id)
FROM orders o
JOIN users u
ON u.userid = o.user_id
GROUP BY u.name;

-- Black Diamond
-- Get the total amount on all orders for each user.
-- Resources
Create Database Pizza_Hub;
USE Pizza_Hub;

# Two table were imported - 1. Pizza & Pizza Types

# Created Table - Orders & Import data
CREATE TABLE orders (
order_id INT NOT NULL PRIMARY KEY,
order_data DATE NOT NULL,
order_time TIME NOT NULL
);

# Created Table - Order details & impot data
CREATE TABLE order_details (
order_details_id INT NOT NULL PRIMARY KEY,
order_id INT NOT NULL,
pizza_id VARCHAR (50) NOT NULL,
quantity INT NOT NULL
);

# Retrieve the total number of orders placed.

SELECT COUNT(order_id) as total_orders
FROM orders;
# Answer - 21,350 total no. of orders

# Calculate the total revenue generated from pizza sales.
SELECT ROUND(SUM(order_details.quantity * pizzas.price),2) as total_sales
FROM order_details JOIN pizzas
ON pizzas.pizza_id = order_details.pizza_id;
# Answer - Total revenue generated from pizza sales 817860.05

# Identify the highest-priced pizza.
SELECT pizza_types.name, pizzas.price
FROM pizza_types JOIN pizzas
On pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzas.price DESC LIMIT 1;
# Answer - The Greek Pizza = 35.95

# Identify the most common pizza quantity ordered.
SELECT quantity, COUNT(order_details_id)
FROM order_details GROUP BY quantity;
# Answer - Most common quantity pizza order is 1 with order count of 47,693

# Identify the most common pizza size ordered
SELECT pizzas.size, COUNT(order_details.order_details_id) as order_count
FROM pizzas JOIN order_details
ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzas.size ORDER BY order_count DESC;
# Answer - The most common pizza size ordered is L which is 18,526 orders

# List the top 5 most ordered pizza types along with their quantities.
SELECT pizza_types.name,
SUM(order_details.quantity) as quantity
FROM pizza_types JOIN pizzas
ON pizza_types.pizza_type_id = pizzas.pizza_type_id
JOIN order_details
ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.name ORDER BY quantity DESC LIMIT 5;
# Answer - Classic Deluxe Pizza - 2,453
#          Barbecue Chicken Pizza - 2,432
#          Hawaiian Pizza - 2,422
#          Pepperoni Pizza - 2,418
#          Thai Chicken Pizza - 2,371
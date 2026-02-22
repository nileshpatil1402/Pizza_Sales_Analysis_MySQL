use pz;

--    PIZZA SALES ANALYSIS PROJECT
--    Author: Nilesh Patil
--    Database: MySQL

----------------BASIC ANALYSIS---------------------------

-- 1. Total number of orders placed
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM orders;

-- 2. Total revenue generated
SELECT 
  SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN pizzas p 
  ON od.pizza_id = p.pizza_id;

-- 3. Highest priced pizza
SELECT 
  pt.name,
  p.size,
  p.price
FROM pizzas p
JOIN pizza_types pt 
  ON p.pizza_type_id = pt.pizza_type_id
ORDER BY p.price DESC
LIMIT 1;

-- 4. Most common pizza size ordered
SELECT 
  p.size,
  COUNT(*) AS total_orders
FROM pizzas p
GROUP BY p.size
ORDER BY total_orders DESC
LIMIT 1;

-- 5. Top 5 most ordered pizzas by quantity
SELECT 
  od.pizza_id,
  SUM(od.quantity) AS total_quantity
FROM order_details od
GROUP BY od.pizza_id
ORDER BY total_quantity DESC
LIMIT 5;

  -----------INTERMEDIATE ANALYSIS-----------------

-- 6. Total quantity ordered by pizza category
SELECT 
  pt.category,
  SUM(od.quantity) AS total_quantity
FROM order_details od
JOIN pizzas p 
  ON od.pizza_id = p.pizza_id
JOIN pizza_types pt 
  ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;

-- 7. Distribution of orders by hour
SELECT 
  HOUR(order_time) AS order_hour,
  COUNT(*) AS total_orders
FROM orders
GROUP BY order_hour
ORDER BY order_hour;

-- 8. Category-wise pizza count
SELECT 
  pt.category,
  COUNT(p.pizza_id) AS pizza_count
FROM pizzas p
JOIN pizza_types pt 
  ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category;

-- 9. Average number of pizzas ordered per day
SELECT 
  o.order_date,
  SUM(od.quantity) AS total_pizzas,
  ROUND(
    SUM(od.quantity) / COUNT(DISTINCT o.order_id), 2
  ) AS avg_pizzas_per_order
FROM orders o
JOIN order_details od 
  ON o.order_id = od.order_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- 10. Top 3 pizzas based on revenue
SELECT 
  pt.name,
  SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN pizzas p 
  ON od.pizza_id = p.pizza_id
JOIN pizza_types pt 
  ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_revenue DESC
LIMIT 3;

----------------ADVANCED ANALYSIS-----------------

-- 11. Percentage contribution of each pizza to total revenue
SELECT
  pt.name AS pizza_name,
  SUM(p.price * od.quantity) AS revenue,
  ROUND(
    (SUM(p.price * od.quantity) * 100) /
    (
      SELECT SUM(p2.price * od2.quantity)
      FROM order_details od2
      JOIN pizzas p2 
        ON od2.pizza_id = p2.pizza_id
    ), 2
  ) AS revenue_percentage
FROM order_details od
JOIN pizzas p 
  ON od.pizza_id = p.pizza_id
JOIN pizza_types pt 
  ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY revenue_percentage DESC;

-- 12. Cumulative revenue over time
SELECT 
  o.order_date,
  SUM(p.price * od.quantity) AS daily_revenue,
  SUM(
    SUM(p.price * od.quantity)
  ) OVER (ORDER BY o.order_date) AS cumulative_revenue
FROM orders o
JOIN order_details od 
  ON o.order_id = od.order_id
JOIN pizzas p 
  ON od.pizza_id = p.pizza_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- 13. Top 3 pizzas by revenue in each category
SELECT 
  category,
  pizza_name,
  revenue
FROM (
  SELECT 
    pt.category,
    pt.name AS pizza_name,
    SUM(p.price * od.quantity) AS revenue,
    RANK() OVER (
      PARTITION BY pt.category 
      ORDER BY SUM(p.price * od.quantity) DESC
    ) AS rnk
  FROM order_details od
  JOIN pizzas p 
    ON od.pizza_id = p.pizza_id
  JOIN pizza_types pt 
    ON p.pizza_type_id = pt.pizza_type_id
  GROUP BY pt.category, pt.name
) ranked_pizzas
WHERE rnk <= 3;

--END OF PROJECT

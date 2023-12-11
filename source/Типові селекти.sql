SELECT *FROM restaurant
WHERE city="Берегово";
SELECT *FROM orders
WHERE customer_id=210;
SELECT customer_id, SUM(total_amount) AS total_spent FROM orders
GROUP BY customer_id;
SELECT *FROM orders
WHERE status = "виконується";
SELECT *FROM orders
ORDER BY total_amount DESC
LIMIT 5;
SELECT *FROM employee;
SELECT *FROM employee
WHERE salary > 1500;
SELECT *FROM employee
WHERE salary IN (SELECT MAX(salary) FROM employee UNION SELECT MIN(salary) FROM employee);
SELECT *FROM client
WHERE table_number IN ( 6, 1, 4);
SELECT AVG(price) AS avarage_price FROM product;
SELECT *FROM client
WHERE table_number > 5;

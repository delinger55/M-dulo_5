-- Active: 1725459846237@@127.0.0.1@5432@ejemplo_relaciones


CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100)
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    order_date DATE
);

INSERT INTO customers (customer_name)
VALUES ('Alice'), ('Bob'), ('Charlie'), ('David');

INSERT INTO orders (customer_id, order_date)
VALUES 
(1, '2024-09-01'), 
(2, '2024-09-02'), 
(2, '2024-09-03'),
(3, '2024-09-04');


INSERT INTO customers (customer_name)
VALUES ('Eva'), ('Frank'), ('Grace');

INSERT INTO orders (customer_id, order_date)
VALUES 
(5, '2024-09-05'), 
(6, '2024-09-06'), 
(7, '2024-09-07'), 
(3, '2024-09-08');

--Inner join: devuelve las filas que tienen coincidencia en ambas tablas
SELECT c.customer_name, o.order_date
from customers c 
INNER JOIN orders o on c.customer_id = o.customer_id

-- FULL outer join: este operador devuelve todas las filas cuando
-- hay una coincidencia en una de las tablas
SELECT c.customer_name, o.order_date
from customers c 
FULL OUTER JOIN orders o on c.customer_id = o.customer_id

-- left join: devuelve todas las filas de la tabla izquierda y
--las coincidencias de la tabla derecha
SELECT c.customer_name, o.order_date
from customers c 
LEFT JOIN orders o on c.customer_id = o.customer_id

--right join: devuelve todas las filas de la tabla derecha y
--las coincidencias de la tabla izquierda
SELECT c.customer_name, o.order_date
from customers c 
RIGHT JOIN orders o on c.customer_id = o.customer_id

--FULL JOIN devuelve todas las filas cuando hay una coincidencia
-- en unas tablas, incluyendo las filas que no coinciden
SELECT c.customer_name, o.order_date
from customers c 
FULL JOIN orders o on c.customer_id = o.customer_id

-- INTERSECT: devulve las filas comunes entre dos consultas
select customer_id, from customers
INTERSECT
select customer_id from orders

--producto cartesiano: regresa todas las combinaciones posibles
-- de una fila
select c.customer_name, o.order_date 
from customers c, orders o

-- UNION: combina los resultados de dos o más columnas,
-- eliminando los duplicados (ocupa mucha memoria)
SELECT customer_name as name, 'Customer' as source, null as order_date
from customers
UNION
SELECT 'Order' as name, 'Order' as source, order_date
from orders

--Devuelve las filas que están en la primera consulata y no
-- en la segunda
SELECT customer_name from customers 
EXCEPT
SELECT customer_name from orders o join customers c on o.customer_id = c.customer_id
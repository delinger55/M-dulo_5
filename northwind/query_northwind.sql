-- Active: 1725459846237@@127.0.0.1@5432@northwind

-- Insertar un nuevo cliente


-- Insertar un nuevo empleado
-- Insertar un nuevo producto

-- Consultar todos los clientes
SELECT * from customers

-- Consultar clientes por país
SELECT customers.country
from customers

-- Consultar empleados y sus títulos
SELECT employees.title_of_courtesy, employees.first_name, employees.last_name
from employees

-- Consultar productos con stock bajo
SELECT product_name, units_in_stock as stock_bajo 
from products
where units_in_stock < 10

-- Actualizar la dirección de un cliente
update customers 
set address = 'Cautin'   
where customer_id = 'ALFKI'

-- Actualizar el precio de un producto
update products
set unit_price = 10
where product_id = 65

-- Eliminar un cliente
delete from customers 
where customer_id = 'ANATR'

-- Consultar pedidos con detalles del cliente (JOIN ORDERS CUSTOMRES)


-- Consultar detalles de los pedidos junto con información del producto ORDER_DETAILS


-- Consultar clientes de una región específica
SELECT * from customers 
where region = 'SP'

-- Total de ventas (suma de precios unitarios) por pedido
SELECT order_id, SUM(unit_price * quantity) AS total_sales
FROM order_details
GROUP BY order_id;
-- Hacer un join con customer para obtener un nombre cliente
SELECT o.order_id, c.company_name AS customer_name, c.contact_name, o.order_date
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

SELECT o.customer_id, o.order_id, SUM(od.unit_price * od.quantity) AS total_sales
FROM order_details od
join orders o
on o.order_id = od.order_id
GROUP BY o.order_id;

-- Promedio de precios unitarios de los productos
SELECT AVG(unit_price) AS average_price
FROM products;

-- Precio máximo y mínimo de productos
SELECT MAX(unit_price) AS max_price, MIN(unit_price) AS min_price
FROM products;

-- Contar el número de productos en cada categoría
SELECT category_id, COUNT(*) AS product_count
FROM products
GROUP BY category_id

--hacer un join para obtener el nombre de cada categoria
SELECT c.category_name, COUNT(*) AS total_products
FROM categories c
JOIN products p ON p.category_id = c.category_id
GROUP BY c.category_name

SELECT p.product_id, p.product_name, c.category_name
FROM products p
JOIN categories c ON p.category_id = c.category_id;


-- Total de ventas por cliente
SELECT c.company_name, SUM(od.unit_price * od.quantity) AS total_sales
FROM orders o
JOIN order_details od ON o.order_id = od.order_id
JOIN customers c ON o.customer_id = c.customer_id
GROUP BY c.company_name;

-- Consultar productos cuyo nombre contiene 'Widget'

-- Consultar pedidos realizados por ciertos clientes
SELECT * from orders
where customer_id in ('C001','C002','C003')

-- Consultar productos ordenados por precio descendente
-- Consultar clientes ordenados por nombre de la empresa
 
-- Active: 1725459846237@@127.0.0.1@5432@ejemplo_having
-- Crear tabla de categorías

BEGIN

CREATE TABLE categorias (
    id_categoria SERIAL PRIMARY KEY,
    nombre_categoria VARCHAR(50)
);

-- Crear tabla de proveedores
CREATE TABLE proveedores (
    id_proveedor SERIAL PRIMARY KEY,
    nombre_proveedor VARCHAR(50),
    pais VARCHAR(50)
);

-- Crear tabla de productos
CREATE TABLE productos (
    id_producto SERIAL PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2),
    cantidad INTEGER,
    id_categoria INT REFERENCES categorias(id_categoria),
    id_proveedor INT REFERENCES proveedores(id_proveedor)
);

-- Crear tabla de ventas
CREATE TABLE ventas (
    id_venta SERIAL PRIMARY KEY,
    id_producto INT REFERENCES productos(id_producto),
    cantidad INT,
    fecha_venta DATE
);
End

-- Insertar categorías
INSERT INTO categorias (nombre_categoria) VALUES 
('Pinturas'),
('Herramientas'),
('Accesorios');

-- Insertar proveedores
INSERT INTO proveedores (nombre_proveedor, pais) VALUES 
('Proveedor A', 'México'),
('Proveedor B', 'EE.UU.'),
('Proveedor C', 'Canadá');

-- Insertar productos
INSERT INTO productos (nombre, precio, cantidad, id_categoria, id_proveedor) VALUES
('Pintura Blanca', 100.50, 30, 1, 1),
('Pintura Roja', 120.00, 45,  1, 2),
('Brocha', 15.00, 23, 2, 3),
('Rodillo', 25.00, 34,  2, 1),
('Cinta de enmascarar', 10.00, 56, 3, 2);

-- Insertar ventas
INSERT INTO ventas (id_producto, cantidad, fecha_venta) VALUES
(1, 50, '2024-08-01'),
(1, 60, '2024-07-15'),
(2, 20, '2024-01-03'),
(3, 100, '2024-08-05'),
(4, 120, '2024-08-08'),
(2, 100, '2023-07-14'),
(2, 110, '2021-04-23'),
(2, 110, '2021-12-03'),
(2, 110, '2021-05-23'),
(2, 110, '2024-09-13'),
(5, 200, '2022-05-10');

-- Ejemplo 1: Productos con ventas totales superiores a 100 unidades
select  p.nombre, sum(v.cantidad) as total_vendido
from productos p
JOIN ventas v ON p.id_producto = v.id_producto
group by p.nombre
having sum(v.cantidad) > 50

-- Ejemplo 2: Categorías con ingresos superiores a $10,000
SELECT  c.nombre_categoria, sum(v.cantidad * p.precio) as ingresos_totales
FROM productos p
JOIN ventas v ON p.id_producto = v.id_producto
JOIN categorias c ON p.id_categoria = c.id_categoria
GROUP BY  c.nombre_categoria

-- Ejemplo 3: Proveedores con más de 5 productos registrados
select pr.nombre_proveedor, count(p.id_producto) as total
from public.proveedores pr 
join productos p on pr.id_proveedor = p.id_proveedor
GROUP BY pr.nombre_proveedor
having count(p.id_producto) > 1


-- Ejemplo 4: Productos con un precio promedio de ventas superior a $50

select p.nombre,  round(avg(p.precio),3) as  total
from productos p
JOIN ventas v on p.id_producto = v.id_producto
GROUP BY p.nombre
HAVING avg(p.precio) > 50

-- ###EXtract
-- Extraer el año de las ventas
select id_venta, fecha_venta, EXTRACT(YEAR FROM fecha_venta) 
from ventas

select id_venta, fecha_venta, DATE_PART('year', fecha_venta) as year
from ventas


-- Extraer el mes de las ventas
select id_venta, fecha_venta, EXTRACT(MONTH FROM fecha_venta) 
from ventas

select id_venta, fecha_venta, DATE_PART('month', fecha_venta) as mes
from ventas


-- Ventas realizadas en un mes específico
 SELECT id_venta, fecha_venta, cantidad
 from ventas
 where EXTRACT(MONTH FROM  fecha_venta) =8

--agrupar ventas por año
SELECT date_part('year', fecha_venta) as anio, count(*) as total_ventas
from ventas
GROUP BY date_part('year', fecha_venta) 
ORDER BY anio

--agrupar ventas por mes
SELECT date_part('month', fecha_venta) as mes, count(v.cantidad * p.precio) as ingresos
from ventas v
join producto p on v.id_product = p.id_producto
GROUP BY date_part('month', fecha_venta) 
ORDER BY mes

-- Ventas realizadas en un año específico


-- Número de ventas por mes


-- Ingresos mensuales


-- #ejemplo de case when

-- Clasificar ventas en categorías de cantidad (alta, media, baja)
SELECT id_venta, cantidad,
    case 
        when cantidad > 100 then 'Alta'
        when cantidad BETWEEN 50 and 100 then 'Media'
        else 'Baja'
    end as Clasificacion_cantidad
from ventas

-- Ejemplo 2: Asignar descuentos según el precio del producto 
-- 10% productos caros, 5% productos medios, 1% productos baratos
SELECT nombre, precio, 
    CASE 
        WHEN precio > 100 THEN  '10%'
        WHEN precio BETWEEN 50 AND 100 THEN '5%'
        ELSE '1%'
    END AS tipo_descuento
FROM productos

-- Ejemplo 3: Clasificar ventas por estación del año 
--invierno(6,7,8), primavera(9,10,11), verano(12,1,2), otoño(3,4,5)
SELECT id_venta, fecha_venta,
    CASE 
        WHEN extract(month from fecha_venta) in(6, 7, 8) THEN 'Invierno'
        WHEN extract(month from fecha_venta) in(9, 10, 11) THEN 'Primavera'
        WHEN extract(month from fecha_venta) in(12, 1, 2) THEN 'Verano'  
        ELSE 'Otoño' 
    END AS Estacion
FROM ventas

-- Ejemplo 4: Calcular el estado del stock de productos
--poco stock <10, stock moderado 10 a 50, stock alto >50
SELECT nombre, cantidad, 
    CASE 
        WHEN cantidad < 10 THEN  'Poco stock'
        WHEN cantidad BETWEEN 10 and 50 THEN  'Stock moderado'
        ELSE  'Stock alto'
    END AS estado_stock
FROM productos


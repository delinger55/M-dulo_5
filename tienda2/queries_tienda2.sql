-- Active: 1725459846237@@127.0.0.1@5432@tienda2

/*Obtener la informacion de todos los movimiento de de stock, con el nombre del pruducto asociado:*/
SELECT  productos.nombre, ms.tipo_movimiento as Movimiento, ms.cantidad
from "movimientoStock" ms join productos  on productos.id = ms.product_id

--obtener los movimientos de stock contengan la palabra entrada
SELECT *
from "movimientoStock"
where tipo_movimiento like '%entrada%'

select * 
from productos
where nombre like '%Arroz%' 

--actualizar el stock de un producto aumentar/disminuir 50
UPDATE productos
set stock = stock - 10
where id = 1

--Obtener la cantidad total de movimiento de stock por tipo de movimiento
SELECT tipo_movimiento, sum(cantidad) as Total
FROM "movimientoStock"
GROUP BY tipo_movimiento

--Calcular el promedio de los precios de todos los productos
-- no se puede hacer con numeric con float(funciona)
SELECT AVG(precios) as precio_promedio
from productos

--calcular el precio más bajo y más alto de los productos
SELECT MIN(precios) as precio_minimo, MAX(precios) as precio_maximo
FROM productos
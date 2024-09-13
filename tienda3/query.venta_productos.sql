-- Active: 1725459846237@@127.0.0.1@5432@tienda3

--1. Reporte de venta por cliente
--group by nombre cliente, count(transaciones.id), 
--sum(precio) where tipo_transacion=4
SELECT 
    clientes.nombre AS nombre_cliente,
    COUNT(transaciones.id) AS numero_de_transacciones,
    SUM(transaciones.precio * transaciones.cantidad) AS total_venta
FROM 
    public.transaciones
JOIN 
    public.clientes ON transaciones.id_cliente = clientes.id
WHERE 
    transaciones.id_tipo_transacion = 4
GROUP BY 
    clientes.nombre
ORDER BY 
    total_venta DESC;  

--2. Reporte de Compras por Cliente 
--Este reporte detallaría las compras realizadas por cada cliente, 
--el total de productos comprados y el monto total invertido en 
--las compras.       

--3. Reporte de Clientes con Ventas y Compras 
--Este reporte muestra una combinación de las ventas y compras por 
--cliente, indicando el monto total gastado en ambas categorías.       

--4. Reporte de Ventas por Producto 
--Este reporte muestra cuántas unidades de cada producto se 
--vendieron y el ingreso total generado por producto. 
SELECT 
    productos.nombre AS producto,
    SUM(transaciones.cantidad) AS unidades_vendidas,
    SUM(transaciones.precio * transaciones.cantidad) AS ingreso_total
FROM 
    transaciones
JOIN 
    productos ON productos.id = transaciones.id_producto
GROUP BY 
    productos.nombre
ORDER BY 
    ingreso_total DESC;  

--5. Reporte de Compras por Producto 
--Similar al reporte anterior, pero para compras, detallando 
--cuántas unidades de cada producto fueron compradas y el monto 
--total invertido en cada uno. 

--6. Reporte de Clientes que No Han Realizado Compras 
--Este reporte lista a los clientes que han realizado ventas pero 
--no compras, útil para identificar posibles oportunidades de 
--venta cruzada. 
--Resultado Esperado: Si hay clientes que no han realizado 
--compras, aparecerían en este reporte. 

--7. Reporte de Gasto Total por Cliente (Ventas y Compras 
--Combinadas) 
--Este reporte muestra el gasto total de cada cliente considerando 
--tanto ventas como compras. 




-- Active: 1725459846237@@127.0.0.1@5432@escuelaPago

--Listar todos los estudiantes
select nombre
from estudiante

--Mostrar todos los pagos con información del estudiante. 
select 


--Contar el número total de estudiantes.
select count(id_estudiante)
from estudiante

-- Encontrar el pago más alto. 
select MAX(monto) as pago_maximo
from pago

--Mostrar los pagos ordenados por fecha.  
select monto, fecha_pago as pago_por_fecha
from pago

SELECT p.id_pago, p.monto, p.fecha_pago, e.nombre, e.apellido
FROM public."Pago" p
JOIN public."Estudiantes" e on p.id_estudiante = e.id_estudiante;
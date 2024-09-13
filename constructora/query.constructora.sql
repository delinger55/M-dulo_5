-- proyectos con presupuest de más de 500.000
-- nombre_proyecto  total_presupuesto
-- Proyecto B          800,000
-- Proyecto C          600,000
-- Proyecto D          1,200,000
-- hacer join, having 

select proyecto.nombre_proyecto
from proyectos


--EXTRACT: Clasifica proyectos cuanto se iniciaron por mes
--Salida esperada:
-- mes   Numero de proyectos
-- 1         34
-- 2          5

select count(proyecto_detalle.id_proyecto) as proyectos, extract(month from fecha_inicio) as mes
from proyecto_detalle 
GROUP BY extract(month from fecha_inicio)
ORDER BY mes

--CASE y WHEN: Clasificación de proyectos según su presupuesto
--presupuesto > 100000 THEN 'Alto
--presupuesto BETWEEN 50000 AND 100000 THEN 'Medio'
--ELSE 'Bajo'
/*
Salida esperada:
 
nombre_proyecto
presupuesto
clasificacion_presupuesto

Proyecto A
300,000
Bajo  

Proyecto B
800,000
Medio

Proyecto C
600,000
Medio

Proyecto D
1,200,000
Alto
*/
select id_proyecto.proyecto_detalle, presupuesto.proyecto_detalle,
    CASE 
        WHEN presupuesto > 100000 THEN 'Alto THEN'  
        WHEN presupuesto BETWEEN 50000 AND 100000 THEN 'Medio'
        ELSE  'Bajo'
    END
from proyecto_detalle
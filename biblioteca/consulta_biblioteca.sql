-- Active: 1725459846237@@127.0.0.1@5432@biblioteca

--Cambiar isbn
UPDATE
    libros
    SET
        ISBN = 6654
WHERE
id = 2

UPDATE categoria
set 
descripcion = 'novela decimonica'
WHERE
id = 1

select * from libros
order by titulo asc

DELETE from libros
WHERE id = 2

select min(publicacion)
from libros

select max(publicacion)
from libros

--contar registros
select count(publicacion)
from libros

--promedio años de publicacion(publicacion esta text, cambiar a integer)
select AVG(publicacion)
from libros

--suma años publicacion(publicacion esta text, cambiar a integer)
select sum(publicacion)
from libros

--join une dos tablas
SELECT titulo, autores.nombre, autores.nacionalidad
FROM libros
inner JOIN autores on libros.id = autores.id


select titulo, categoria.nombre, categoria.descripcion
from libros INNER join categoria on libros.id_categoria = categoria.id 



--Mostrar todos los pacientes con la información de su médico y el 
--tratamiento recibido (INNER JOIN)
SELECT 
    Pacientes.Nombre AS Paciente,
    Medicos.Nombre AS Medico,
    Tratamientos.Descripcion AS Tratamiento
FROM 
    Pacientes
INNER JOIN 
    Citas ON Pacientes.PacienteID = Citas.PacienteID
INNER JOIN 
    Medicos ON Citas.MedicoID = Medicos.MedicoID
INNER JOIN 
    Tratamientos ON Citas.CitaID = Tratamientos.CitaID;

--Mostrar todos los pacientes y, si tienen, el tratamiento recibido y el 
--nombre del médico: (LEFT JOIN)
SELECT  
    p.Nombre AS Nombre_Paciente, 
    t.Descripcion AS Tratamiento,  
    m.Nombre AS Nombre_Medico
FROM 
    Pacientes p
LEFT JOIN 
    Citas c ON p.PacienteID = c.PacienteID
LEFT JOIN 
    Tratamientos t ON c.CitaID = t.CitaID
LEFT JOIN 
    Medicos m ON c.MedicoID = m.MedicoID;

--Mostrar todos los tratamientos y, si existen, la información del paciente 
--y del médico: (RIGHT JOIN)
SELECT  
    t.Descripcion AS Tratamiento, 
    t.Costo,  
    p.Nombre AS Nombre_Paciente, 
    p.Genero as Genero, 
    m.Nombre AS Nombre_Medico
FROM 
    Tratamientos t
RIGHT JOIN 
    Citas c ON t.CitaID = c.CitaID
RIGHT JOIN 
    Pacientes p ON c.PacienteID = p.PacienteID
RIGHT JOIN 
    Medicos m ON c.MedicoID = m.MedicoID;

--CROSS JOIN 
--Mostrar todas las combinaciones posibles de pacientes y médicos:
--El CROSS JOIN combina todas las filas de la tabla Pacientes (p) con todas las 
--filas de la tabla Medicos (m), sin ningún criterio de relación. 
SELECT 
    p.PacienteID, 
    p.Nombre AS Nombre_Paciente, 
    m.MedicoID, 
    m.Nombre AS Nombre_Medico
FROM 
    Pacientes p
CROSS JOIN 
    Medicos m;

--1. UNION 
--Mostrar todos los nombres de pacientes y médicos (sin duplicados): 


--Mostrar los nombres que están tanto en la tabla de pacientes como en la 
--tabla de médicos (aunque en este caso, no deberíamos tener nombres comunes 
--entre pacientes y médicos): (INTERSECT)
SELECT Nombre
FROM Pacientes
INTERSECT
SELECT Nombre
FROM Medicos;

--utilizando una estructura como CASE para devolver un mensaje
-- personalizado cuando no hay coincidencias.
SELECT 
    CASE 
        WHEN EXISTS (
            SELECT Nombre
            FROM Pacientes
            INTERSECT
            SELECT Nombre
            FROM Medicos
        ) THEN 'Hay coincidencias'
        ELSE 'No hay coincidencias entre los nombres de Pacientes y Médicos'
    END AS Resultado;

--COUNT(*): Cuenta cuántas filas (coincidencias) hay en la subconsulta.
--Si el resultado es 0, significa que no hay coincidencias entre los 
--nombres de pacientes y médicos.
SELECT 
    COUNT(*) AS Coincidencias
FROM (
    SELECT Nombre
    FROM Pacientes
    INTERSECT
    SELECT Nombre
    FROM Medicos
) AS Subconsulta;

--3. EXCEPT (equivalente a MINUS en PostgreSQL) 
--Mostrar los nombres de pacientes que no están en la tabla de médicos (en 
--este caso, debería mostrar todos los pacientes porque no compartimos 
--nombres entre las tablas): 
SELECT Nombre
FROM pacientes
EXCEPT
SELECT Nombre
FROM medicos;
 
--Mostrar los pacientes cuyo cumpleaños es en el mismo mes que la fecha 
--actual: (EXTRACT)

--1. UNION con Datos de Pacientes y Citas 
--Mostrar todos los nombres de pacientes y los ID de citas: 

--2. INTERSECT con Datos de Pacientes y Médicos 
--Mostrar los nombres que se encuentran tanto en pacientes como en médicos 
--(esperamos que esté vacío si no hay nombres comunes): 

--3. EXCEPT con Datos de Pacientes y Tratamientos 
--Mostrar nombres de pacientes que no tienen tratamiento registrado (esto 
--asume que todos los pacientes con citas tienen tratamientos registrados, 
--por lo que debería estar vacío):
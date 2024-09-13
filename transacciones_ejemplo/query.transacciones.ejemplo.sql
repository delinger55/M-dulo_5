CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    salario DECIMAL(10, 2)
);

-- Tabla de productos
CREATE TABLE productos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2)
);

-- Insertar empleados
INSERT INTO empleados (nombre, salario) VALUES
('Juan', 3000),
('Ana', 3500),
('Carlos', 4000);

-- Insertar productos
INSERT INTO productos (nombre, precio) VALUES
('Producto A', 100),
('Producto B', 150),
('Producto C', 200);


-- Ejemplo 1: Transacción con ROLLBACK
BEGIN;


INSERT INTO empleados (nombre, salario) VALUES ('Maria', 3800); --- Inserción de un nuevo empleado


UPDATE empleados SET salario = 4500 WHERE nombre = 'Carlos';-- Actualización del salario de Carlos


ROLLBACK;   -- Decides deshacer la transacción

 
select * from empleados
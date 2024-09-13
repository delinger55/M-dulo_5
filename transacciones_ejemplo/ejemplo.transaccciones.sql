-- Active: 1725459846237@@127.0.0.1@5432@transacciones_ejemplo
CREATE TABLE cuentas (
    cuenta_id SERIAL PRIMARY KEY,
    nombre TEXT,
    saldo DECIMAL
);
 
CREATE TABLE transacciones (
    transaccion_id SERIAL PRIMARY KEY,
    desde_cuenta_id INT,
    hacia_cuenta_id INT,
    monto DECIMAL,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
/*
Ejercicio 
Vamos a realizar una transferencia de 300 unidades de la cuenta de Ana 
(cuenta_id = 1) a la cuenta de Carlos (cuenta_id = 2). 
Además, vamos a registrar esta transferencia en la tabla transacciones. 

6. Si ocurre un error en la actualización del saldo o en el registro de 
la transacción, revertir a la savepoint. 
*/ 

--Iniciar una transacción.
BEGIN

-- Savepoint antes de intentar realizar la transferencia.  
SAVEPOINT inicio_transferencia

--Debitar 300 unidades de la cuenta de Ana. 
update cuentas
SET saldo = saldo - 300
WHERE cuenta_id = 1

--Acreditar 300 unidades a la cuenta de Carlos. 
update cuentas
SET saldo = saldo + 300
WHERE cuenta_id = 2

-- Registrar la transacción en la tabla de transacciones
INSERT INTO transacciones (desde_cuenta_id, hacia_cuenta_id, monto)
VALUES (1, 2, 300)

-- Confirmar la transacción si todo sale bien
COMMIT

INSERT INTO empleados (nombre, salario) VALUES ('Mario', 4800)

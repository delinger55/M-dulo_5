-- Active: 1725459846237@@127.0.0.1@5432@hospital_bd
-- Tablas de pacientes 
CREATE TABLE Pacientes ( 
PacienteID serial PRIMARY KEY, 
Nombre VARCHAR(50), 
FechaNacimiento DATE, 
Genero CHAR(1) 
); 

-- Tabla de Médicos 
CREATE TABLE Medicos ( 
MedicoID serial PRIMARY KEY, 
Nombre VARCHAR(50), 
Especialidad VARCHAR(50) 
); 

-- Tabla de Citas 
CREATE TABLE Citas ( 
CitaID serial PRIMARY KEY, 
PacienteID INT, 
MedicoID INT, 
FechaCita DATE, 
FOREIGN KEY (PacienteID) REFERENCES Pacientes(PacienteID), 
FOREIGN KEY (MedicoID) REFERENCES Medicos(MedicoID) 
); 

-- Tabla de Tratamientos 
CREATE TABLE Tratamientos ( 
TratamientoID serial PRIMARY KEY, 
CitaID INT, 
Descripcion TEXT, 
Costo DECIMAL(10, 2), 
FOREIGN KEY (CitaID) REFERENCES Citas(CitaID) 
);
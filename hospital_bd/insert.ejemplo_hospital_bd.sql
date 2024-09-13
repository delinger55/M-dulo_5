-- Insertar Pacientes
INSERT INTO Pacientes (Nombre, FechaNacimiento, Genero) VALUES 
('Juan Pérez', '1985-06-15', 'M'), 
('Ana Gómez', '1990-04-22', 'F'), 
('Carlos Ruiz', '1978-11-30', 'M'); 

INSERT INTO Pacientes (Nombre, FechaNacimiento, Genero) VALUES 
('Fabiana Castro', '1982-10-25', 'F')

-- Insertar Médicos 
INSERT INTO Medicos (Nombre, Especialidad) VALUES 
('Dr. Martínez', 'Cardiología'), 
('Dr. Sánchez', 'Pediatría'), 
('Dra. López', 'Ginecología'); 

INSERT INTO Medicos (Nombre, Especialidad) VALUES 
('Dra. Castellani', 'Psiquiatría') 

-- Insertar Citas 
INSERT INTO Citas (PacienteID, MedicoID, FechaCita) VALUES 
(1, 1, '2024-09-15'), 
(2, 2, '2024-09-16'), 
(3, 3, '2024-09-17'); 

INSERT INTO Citas (PacienteID, MedicoID, FechaCita) VALUES 
(4, 4, '2024-11-25')

-- Insertar Tratamientos 
INSERT INTO Tratamientos (CitaID, Descripcion, Costo) VALUES 
(1, 'Consulta general y examen físico', 150.00), 
(2, 'Revisión pediátrica y vacunas', 200.00), 
(3, 'Chequeo ginecológico y ecografía', 250.00); 

INSERT INTO Tratamientos (CitaID, Descripcion, Costo) VALUES 
(4, 'Consulta y examen laboral', 250.00)
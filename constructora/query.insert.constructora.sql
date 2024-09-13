-- Insertar datos en la tabla cliente
INSERT INTO public.cliente (nombre, ap_paterno) VALUES
('Ana', 'Martínez'),
('Luis', 'Gómez'),
('Marta', 'Pérez'),
('Juan', 'Rodríguez'),
('Laura', 'Fernández'),
('Pedro', 'García'),
('Sofía', 'López'),
('Carlos', 'Moreno'),
('Elena', 'Jiménez'),
('David', 'Vásquez');

-- Insertar datos en la tabla estatus
INSERT INTO public.estatus (nombre, descripcion) VALUES
('En progreso', 'El proyecto está en desarrollo activo.'),
('Completo', 'El proyecto ha sido finalizado y entregado.'),
('Pendiente', 'El proyecto está a la espera de iniciarse.'),
('En espera', 'El proyecto está en pausa.'),
('Cancelado', 'El proyecto ha sido cancelado.');

-- Insertar datos en la tabla proyectos
INSERT INTO public.proyectos (descripcion, nombre_proyecto, id_cliente, id_status) VALUES
('Desarrollo de una nueva aplicación móvil para comercio electrónico.', 'AppEcom', 1, 1),
('Rediseño del sitio web corporativo.', 'WebRedesign', 2, 2),
('Implementación de un sistema de gestión de inventarios.', 'InventariosPlus', 3, 1),
('Migración de datos a la nube.', 'CloudData', 4, 3),
('Desarrollo de una plataforma de e-learning.', 'EduPlatform', 5, 1),
('Automatización del proceso de manufactura.', 'ManufacturaAuto', 6, 2),
('Actualización de la infraestructura de TI.', 'InfraUpdate', 7, 4),
('Creación de una solución CRM personalizada.', 'CustomCRM', 8, 2),
('Desarrollo de un sistema de gestión de proyectos.', 'ProjectMaster', 9, 5),
('Consultoría en ciberseguridad.', 'CyberConsult', 10, 1),
('Creación de una aplicación para gestión de finanzas personales.', 'FinApp', 1, 2),
('Desarrollo de un sistema de control de calidad.', 'QualityControl', 2, 3),
('Implementación de un sistema de reservas en línea.', 'OnlineReservations', 3, 1),
('Rediseño del sistema de atención al cliente.', 'SupportSystem', 4, 4),
('Desarrollo de una solución de análisis de datos.', 'DataAnalyzer', 5, 1),
('Automatización del flujo de trabajo.', 'WorkflowAuto', 6, 3),
('Implementación de una solución de marketing digital.', 'DigitalMarketing', 7, 2),
('Desarrollo de un portal de empleo.', 'JobPortal', 8, 1),
('Integración de sistemas de pagos en línea.', 'PaymentIntegration', 9, 4),
('Desarrollo de una plataforma de streaming.', 'StreamPlatform', 10, 5),
('Optimización del sistema de logística.', 'LogisticsOpt', 1, 3),
('Creación de una aplicación de bienestar.', 'WellnessApp', 2, 1),
('Desarrollo de un sistema de gestión de eventos.', 'EventManager', 3, 2),
('Implementación de un sistema de control de accesos.', 'AccessControl', 4, 5),
('Automatización del sistema de contabilidad.', 'AccountingAuto', 5, 1);

-- Insertar datos en la tabla proyecto_detalle
INSERT INTO public.proyecto_detalle (id_proyecto, fecha_inicio, fecha_termino, presupuesto, ubicacion) VALUES
(1, '2024-01-10', '2024-06-30', 50000.00, 'Ciudad de México'),
(2, '2024-02-01', '2024-04-15', 20000.00, 'Barcelona'),
(3, '2024-03-05', '2024-09-30', 35000.00, 'Bogotá'),
(4, '2024-04-01', '2024-10-01', 30000.00, 'Lima'),
(5, '2024-05-01', '2024-11-30', 60000.00, 'Buenos Aires'),
(6, '2024-06-01', '2024-12-15', 45000.00, 'Santiago'),
(7, '2024-07-01', '2025-01-15', 70000.00, 'Montevideo'),
(8, '2024-08-01', '2025-02-28', 25000.00, 'Quito'),
(9, '2024-09-01', '2025-03-31', 55000.00, 'Asunción'),
(10, '2024-10-01', '2025-04-30', 40000.00, 'La Paz'),
(11, '2024-01-15', '2024-07-30', 28000.00, 'Ciudad de México'),
(12, '2024-02-15', '2024-08-31', 32000.00, 'Barcelona'),
(13, '2024-03-10', '2024-09-15', 27000.00, 'Bogotá'),
(14, '2024-04-15', '2024-10-30', 35000.00, 'Lima'),
(15, '2024-05-10', '2024-11-15', 40000.00, 'Buenos Aires'),
(16, '2024-06-15', '2024-12-20', 29000.00, 'Santiago'),
(17, '2024-07-15', '2025-01-10', 37000.00, 'Montevideo'),
(18, '2024-08-15', '2025-02-15', 33000.00, 'Quito'),
(19, '2024-09-15', '2025-03-10', 39000.00, 'Asunción'),
(20, '2024-10-15', '2025-04-05', 42000.00, 'La Paz'),
(21, '2024-01-20', '2024-07-10', 26000.00, 'Ciudad de México'),
(22, '2024-02-20', '2024-08-10', 31000.00, 'Barcelona'),
(23, '2024-03-20', '2024-09-05', 28000.00, 'Bogotá'),
(24, '2024-04-20', '2024-10-10', 34000.00, 'Lima'),
(25, '2024-05-20', '2024-11-05', 38000.00, 'Buenos Aires');

-- Insertar datos en la tabla cargos
INSERT INTO public.cargos (nombre, descripcion) VALUES 
('Gerente General', 'Responsable de la gestión general de la empresa'),
('Jefe de Recursos Humanos', 'Encargado de la selección, contratación y gestión de empleados'),
('Desarrollador de Software', 'Desarrolla y mantiene aplicaciones de software'),
('Analista de Datos', 'Analiza y gestiona grandes volúmenes de datos para la toma de decisiones'),
('Contador', 'Gestiona la contabilidad y las finanzas de la empresa'),
('Administrador de Sistemas', 'Encargado de la gestión y mantenimiento de los sistemas informáticos'),
('Vendedor', 'Responsable de la venta de productos y servicios'),
('Jefe de Marketing', 'Dirige las estrategias de marketing de la empresa'),
('Soporte Técnico', 'Brinda asistencia técnica a los usuarios y clientes'),
('Diseñador Gráfico', 'Crea contenido visual para la comunicación y publicidad de la empresa');

-- Insertar datos en la tabla empleados
INSERT INTO public.empleados (nombre, ap_paterno, id_cargo) VALUES 
('Carlos', 'González', 1),
('María', 'López', 2),
('Luis', 'Pérez', 3),
('Ana', 'Ramírez', 4),
('Jorge', 'Fernández', 5),
('Lucía', 'Hernández', 6),
('Pedro', 'Martínez', 7),
('Mónica', 'Gutiérrez', 8),
('Andrés', 'Sánchez', 9),
('Laura', 'Díaz', 10),
('Sebastián', 'Ortiz', 3),
('Isabel', 'Vargas', 6),
('Rodrigo', 'Castillo', 1),
('Gabriela', 'Morales', 5),
('Felipe', 'Reyes', 2),
('Patricia', 'Gómez', 8),
('Raúl', 'Mendoza', 9),
('Diana', 'Flores', 4),
('Javier', 'Ríos', 7),
('Claudia', 'Herrera', 10),
('Sofía', 'Medina', 3),
('Diego', 'Núñez', 5),
('Daniela', 'Ruiz', 1),
('Fernando', 'Silva', 6),
('Valeria', 'Cruz', 8);

-- Insertar datos en la tabla empleado_contratacion
INSERT INTO public.empleado_contratacion (fecha_contratacion, fecha_termino, salario, id_empleado) VALUES 
('2018-05-10', NULL, 2500.00, 1),
('2020-07-15', '2023-06-30', 3200.00, 2),
('2019-11-20', NULL, 2800.00, 3),
('2021-01-05', NULL, 2700.00, 4),
('2017-09-10', '2022-12-31', 3500.00, 5),
('2022-03-01', NULL, 2600.00, 6),
('2018-10-25', NULL, 2900.00, 7),
('2019-06-12', NULL, 3000.00, 8),
('2020-04-23', NULL, 2400.00, 9),
('2021-09-01', NULL, 3100.00, 10),
('2019-08-15', '2023-07-31', 2600.00, 11),
('2016-11-30', NULL, 3700.00, 12),
('2017-03-22', NULL, 2800.00, 13),
('2020-10-05', NULL, 2550.00, 14),
('2018-07-19', NULL, 3350.00, 15),
('2021-06-10', NULL, 2600.00, 16),
('2017-12-01', '2022-11-15', 2750.00, 17),
('2019-04-17', NULL, 2850.00, 18),
('2020-08-20', NULL, 2950.00, 19),
('2022-01-15', NULL, 3100.00, 20),
('2021-11-02', NULL, 2600.00, 21),
('2018-03-30', '2022-09-30', 3550.00, 22),
('2019-07-07', NULL, 3250.00, 23),
('2020-02-18', NULL, 2800.00, 24),
('2021-04-09', NULL, 3400.00, 25);

-- Insertar datos en la tabla proyecto_recursos_humanos
INSERT INTO public.proyecto_recursos_humanos (id_empleado, id_proyecto) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 1),
(5, 4),
(6, 2),
(7, 3),
(8, 1),
(9, 5),
(10, 6),
(11, 2),
(12, 3),
(13, 1),
(14, 4),
(15, 5),
(16, 2),
(17, 6),
(18, 3),
(19, 1),
(20, 2),
(21, 5),
(22, 6),
(23, 1),
(24, 4),
(25, 5);

--Insertar datos en la tabla maquinarias
INSERT INTO public.maquinarias (nombre, descripcion, id_proyecto) VALUES 
('Excavadora hidráulica', 'Maquinaria utilizada para excavaciones de terrenos y demolición de estructuras.', 1),
('Bulldozer', 'Máquina de movimiento de tierra utilizada para empujar grandes cantidades de material.', 2),
('Grua torre', 'Grúa de gran altura utilizada en la construcción de edificios altos.', 3),
('Compactadora', 'Máquina que se utiliza para compactar la tierra y pavimento.', 4),
('Retroexcavadora', 'Maquinaria de construcción que combina una excavadora con una pala cargadora.', 1),
('Montacargas', 'Vehículo industrial usado para levantar y transportar materiales pesados.', 5),
('Hormigonera', 'Máquina utilizada para mezclar cemento, arena y agua para producir concreto.', 6),
('Perforadora', 'Equipo utilizado para perforar agujeros profundos en terrenos y estructuras.', 3),
('Rodillo compactador', 'Equipo usado para compactar tierra, grava y asfalto en proyectos de construcción de carreteras.', 4),
('Cargador frontal', 'Maquinaria usada para cargar material en camiones o tolvas en obras de construcción.', 1);

-- Insertar datos en la tabla materiales
INSERT INTO public.materiales (nombre, descripcion, id_proveedor, id_status) VALUES 
('{Acero, Hierro}', 'Materiales estructurales utilizados para la construcción de edificios y puentes.', 1, 1),
('{Cemento, Arena, Grava}', 'Materiales básicos para la producción de concreto y construcción de cimientos.', 2, 2),
('{Madera tratada, Tableros}', 'Materiales utilizados para la construcción de estructuras y encofrados.', 3, 1),
('{Ladrillos, Bloques de hormigón}', 'Materiales de construcción utilizados en muros y edificios.', 4, 3),
('{Tuberías de PVC, Conectores}', 'Materiales para la instalación de sistemas de plomería y drenaje.', 5, 1),
('{Cables eléctricos, Conectores}', 'Materiales utilizados en la instalación de sistemas eléctricos.', 6, 2),
('{Vidrio templado, Ventanas}', 'Material utilizado para ventanas y fachadas de edificios.', 7, 1),
('{Pintura, Revestimientos}', 'Materiales de acabado utilizados en interiores y exteriores.', 8, 2),
('{Tejas, Paneles solares}', 'Materiales de techado y sistemas de energía renovable.', 9, 1),
('{Tornillos, Clavos, Bisagras}', 'Materiales metálicos utilizados para la fijación de elementos de construcción.', 10, 1);

-- Insertar datos en la tabla material_detalle
INSERT INTO public.material_detalle (cantidad, unidad_medida, precio_compra, id_material) VALUES 
(500, 'kg', 1200.50, 1),  -- Acero y Hierro
(1000, 'kg', 800.30, 2),  -- Cemento, Arena, Grava
(250, 'm3', 3500.75, 3),  -- Madera tratada, Tableros
(800, 'unidades', 1500.60, 4),  -- Ladrillos, Bloques de hormigón
(1500, 'm', 950.40, 5),  -- Tuberías de PVC, Conectores
(3000, 'm', 2500.00, 6),  -- Cables eléctricos, Conectores
(200, 'm2', 5000.90, 7),  -- Vidrio templado, Ventanas
(600, 'litros', 1200.20, 8),  -- Pintura, Revestimientos
(100, 'unidades', 4500.75, 9),  -- Tejas, Paneles solares
(5000, 'unidades', 300.50, 10);  -- Tornillos, Clavos, Bisagras

-- Insertar datos en la tabla proyectos_materiales
INSERT INTO public.proyectos_materiales (id, id_proyecto, id_material, cantidad_material) VALUES 
(1, 1, 1, 300),  -- Proyecto 101, Acero y Hierro
(2, 2, 2, 500),  -- Proyecto 102, Cemento, Arena, Grava
(3, 3, 3, 100),  -- Proyecto 103, Madera tratada, Tableros
(4, 4, 4, 600),  -- Proyecto 104, Ladrillos, Bloques de hormigón
(5, 5, 5, 1200),  -- Proyecto 105, Tuberías de PVC, Conectores
(6, 6, 6, 2500),  -- Proyecto 106, Cables eléctricos, Conectores
(7, 7, 7, 150),  -- Proyecto 101, Vidrio templado, Ventanas
(8, 8, 8, 300),  -- Proyecto 102, Pintura, Revestimientos
(9, 9, 9, 50),  -- Proyecto 103, Tejas, Paneles solares
(10, 10, 10, 4000);  -- Proyecto 104, Tornillos, Clavos, Bisagras



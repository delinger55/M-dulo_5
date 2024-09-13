-- Active: 1725459846237@@127.0.0.1@5432@constructora
BEGIN;

CREATE TABLE IF NOT EXISTS public.proyectos
(
    id serial NOT NULL,
    descripcion text,
    nombre_proyecto text,
    id_cliente integer,
    id_status integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.cliente
(
    id serial NOT NULL,
    nombre text NOT NULL,
    ap_paterno text NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.estatus
(
    id serial NOT NULL,
    nombre text NOT NULL,
    descripcion text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.proyecto_detalle
(
    id serial NOT NULL,
    id_proyecto integer NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_termino date,
    presupuesto float,
    ubicacion text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.empleados
(
    id serial NOT NULL,
    nombre text NOT NULL,
    ap_paterno text NOT NULL,
    id_cargo integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.cargos
(
    id serial NOT NULL,
    nombre text NOT NULL,
    descripcion text,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.empleado_contratacion
(
    id serial NOT NULL,
    fecha_contratacion date NOT NULL,
    fecha_termino date,
    salario float NOT NULL,
    id_empleado integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.proyecto_recursos_humanos
(
    id serial NOT NULL,
    id_empleado integer NOT NULL,
    id_proyecto integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.maquinarias
(
    id serial NOT NULL,
    nombre text NOT NULL,
    descripcion text NOT NULL,
    id_proyecto integer,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.materiales
(
    id serial NOT NULL,
    nombre text[] NOT NULL,
    descripcion text,
    id_proveedor integer NOT NULL,
    id_status integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.material_detalle
(
    id serial NOT NULL,
    cantidad float NOT NULL,
    unidad_medida text,
    precio_compra float,
    id_material integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.proyectos_materiales
(
    id integer NOT NULL,
    id_proyecto integer NOT NULL,
    id_material integer NOT NULL,
    cantidad_material float NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.proyectos
    ADD FOREIGN KEY (id_cliente)
    REFERENCES public.cliente (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.proyectos
    ADD FOREIGN KEY (id_status)
    REFERENCES public.estatus (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.proyecto_detalle
    ADD FOREIGN KEY (id_proyecto)
    REFERENCES public.proyectos (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.empleados
    ADD FOREIGN KEY (id_cargo)
    REFERENCES public.cargos (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.empleado_contratacion
    ADD FOREIGN KEY (id_empleado)
    REFERENCES public.empleados (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.proyecto_recursos_humanos
    ADD FOREIGN KEY (id_empleado)
    REFERENCES public.empleados (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.proyecto_recursos_humanos
    ADD FOREIGN KEY (id_proyecto)
    REFERENCES public.proyectos (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.maquinarias
    ADD FOREIGN KEY (id_proyecto)
    REFERENCES public.proyectos (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.material_detalle
    ADD FOREIGN KEY (id_material)
    REFERENCES public.materiales (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.proyectos_materiales
    ADD FOREIGN KEY (id_proyecto)
    REFERENCES public.proyectos (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.proyectos_materiales
    ADD FOREIGN KEY (id_material)
    REFERENCES public.materiales (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
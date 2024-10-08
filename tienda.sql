-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.

-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.productos
(
    "Id" serial NOT NULL,
    "Nombre" text NOT NULL,
    "Descripcion" text,
    "Precio" money NOT NULL,
    "Cantidad" integer NOT NULL,
    PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public.categorias
(
    "Id" serial NOT NULL,
    "Nombre" text NOT NULL,
    "Descripcion" text,
    PRIMARY KEY ("Id")
);

CREATE TABLE IF NOT EXISTS public.proveedores
(
    "ID" serial NOT NULL,
    "Nombre" text NOT NULL,
    "Dirrecion" text,
    telefono character(11),
    PRIMARY KEY ("ID")
);

CREATE TABLE IF NOT EXISTS public.ventas
(
    "Id" serial NOT NULL,
    fecha date NOT NULL,
    cantidad integer NOT NULL,
    PRIMARY KEY ("Id")
);

ALTER TABLE IF EXISTS public.productos
    ADD FOREIGN KEY ("Id")
    REFERENCES public.ventas ("Id") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.categorias
    ADD FOREIGN KEY ("Id")
    REFERENCES public.productos ("Id") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.proveedores
    ADD FOREIGN KEY ("ID")
    REFERENCES public.productos ("Id") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
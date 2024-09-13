BEGIN;
 
 
CREATE TABLE IF NOT EXISTS public.libros
(
    id serial NOT NULL,
    titulo text NOT NULL,
    id_autor integer,
    isbn text,
    publicacion integer,
    id_categoria integer,
    CONSTRAINT pk_libro PRIMARY KEY (id)
);
 
CREATE TABLE IF NOT EXISTS public.autores
(
    id serial NOT NULL,
    nombre text NOT NULL,
    nacionalidad text,
    PRIMARY KEY (id)
);
 
CREATE TABLE IF NOT EXISTS public.categoria
(
    id serial NOT NULL,
    nombre integer NOT NULL,
    descripcion integer,
    PRIMARY KEY (id)
);
 
ALTER TABLE IF EXISTS public.libros
    ADD CONSTRAINT fk_autor FOREIGN KEY (id_autor)
    REFERENCES public.autores (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
 
 
ALTER TABLE IF EXISTS public.libros
    ADD CONSTRAINT fk_categoria FOREIGN KEY (id_categoria)
    REFERENCES public.categoria (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;
 
END;
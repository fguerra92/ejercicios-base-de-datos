-- CREATE DATABASE desafio3; --NO DICE EN EL DESAFIO PERO LA CREE SOLO POR EL ORDEN
-- CREATE DATABASE

CREATE TABLE "departamentos" ( "id" SERIAL PRIMARY KEY, "nombres_departamentos" VARCHAR);
--CREATE TABLE
-- SELECT *FROM departamentos;
--  id | nombres_departamentos 
-- ----+-----------------------
-- (0 filas)

CREATE TABLE "trabajadores" ( "id" SERIAL PRIMARY KEY, "nombres_trabajadores" VARCHAR, "rut" INT, "direccion" VARCHAR, "departamentos_id" INT);
--CREATE TABLE
-- SELECT *FROM trabajadores;
--  id | nombres_trabajadors | rut | direccion | departamentos_id 
-- ----+---------------------+-----+-----------+------------------
-- (0 filas)


CREATE TABLE "liquidaciones" ( "id" SERIAL PRIMARY KEY, "url_drive" VARCHAR, "fecha_pago" DATE, "trabajadores_id" INT);
--CREATE TABLE
-- SELECT *FROM liquidaciones;
--  id | url_drive | fecha_pago | trabajadors_id 
-- ----+-----------+------------+----------------
-- (0 filas)


ALTER TABLE "trabajadores" ADD FOREIGN KEY ("departamentos_id") REFERENCES "departamentos" ("id");
--ALTER TABLE

-- Tabla «public.trabajadores»
--        Columna        |       Tipo        | Ordenamiento | Nulable  |               Por omisión                
-- ----------------------+-------------------+--------------+----------+------------------------------------------
--  id                   | integer           |              | not null | nextval('trabajadores_id_seq'::regclass)
--  nombres_trabajadores | character varying |              |          | 
--  rut                  | integer           |              |          | 
--  direccion            | character varying |              |          | 
--  departamentos_id     | integer           |              |          | 
-- Índices:
--     "trabajadores_pkey" PRIMARY KEY, btree (id)
-- Restricciones de llave foránea:
--     "trabajadores_departamentos_id_fkey" FOREIGN KEY (departamentos_id) REFERENCES departamentos(id)
-- Referenciada por:
--     TABLE "liquidaciones" CONSTRAINT "liquidaciones_trabajadores_id_fkey" FOREIGN KEY (trabajadores_id) REFERENCES trabajadores(id)


ALTER TABLE "liquidaciones" ADD FOREIGN KEY ("trabajadores_id") REFERENCES "trabajadores" ("id");
--ALTER TABLE

--  Tabla «public.liquidaciones»
--      Columna     |       Tipo        | Ordenamiento | Nulable  |                Por omisión                
-- -----------------+-------------------+--------------+----------+-------------------------------------------
--  id              | integer           |              | not null | nextval('liquidaciones_id_seq'::regclass)
--  url_drive       | character varying |              |          | 
--  fecha_pago      | date              |              |          | 
--  trabajadores_id | integer           |              |          | 
-- Índices:
--     "liquidaciones_pkey" PRIMARY KEY, btree (id)
-- Restricciones de llave foránea:
--     "liquidaciones_trabajadores_id_fkey" FOREIGN KEY (trabajadores_id) REFERENCES trabajadores(id)


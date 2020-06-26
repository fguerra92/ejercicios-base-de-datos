--CREATE DATABASE desafio3s;
CREATE TABLE "cursos" ( "id" SERIAL PRIMARY KEY, "nombre" VARCHAR);
-- SELECT * FROM cursos;
--  id | nombre 
-- ----+--------
-- (0 filas)

CREATE TABLE "alumnos" ( "id" SERIAL, "nombre_alumnos" VARCHAR, "cursos_id" INT, "rut" INT);
-- SELECT * FROM alumnos;
--  id | nombre_alumno | cursos_id | rut 
-- ----+---------------+-----------+-----
-- (0 filas)

CREATE TABLE "departamentos" ( "id" SERIAL PRIMARY KEY, "nombre_departamento" VARCHAR);
-- SELECT * FROM departamentos;
--  id | nombre_departamento 
-- ----+---------------------
-- (0 filas)

CREATE TABLE "profesores" ( "id" SERIAL PRIMARY KEY, "nombre_profesor" VARCHAR, "departamentos_id" INT);
-- SELECT * FROM profesores;
--  id | nombre_profesor | departamento_id 
-- ----+-----------------+-----------------
-- (0 filas)

CREATE TABLE "pruebas_alumnos" ( "id" SERIAL PRIMARY KEY, "nota" FLOAT, "score" FLOAT, "alumnos_id" INT, "profesores_id" INT);
-- SELECT * FROM pruebas_alumnos;
--  id | nota | score | alumnos_id | profesores_id 
-- ----+------+-------+------------+---------------
-- (0 filas)

ALTER TABLE "alumnos" ADD FOREIGN KEY ("cursos_id") REFERENCES "cursos" ("id");

ALTER TABLE "profesores" ADD FOREIGN KEY ("departamentos_id") REFERENCES "departamentos" ("id");

ALTER TABLE "pruebas_alumnos" ADD FOREIGN KEY ("alumnos_id") REFERENCES "alumnos" ("id");

ALTER TABLE "pruebas_alumnos" ADD FOREIGN KEY ("profesores_id") REFERENCES "profesores" ("id");
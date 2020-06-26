CREATE TABLE cursos(id SERIAL,nombres VARCHAR,PRIMARY KEY (id));
-- SELECT * FROM CURSO;
--  id | nombres
-- ----+--------
-- (0 filas)

CREATE TABLE alumnos(id SERIAL UNIQUE,nombres_alumnos VARCHAR,cursos_id INT,rut INT,FOREIGN KEY(cursos_id) REFERENCES cursos(id));
-- SELECT * FROM ALUMNO;
--  id | nombres_alumnos | cursos_id | rut 
-- ----+---------------+----------+-----
-- (0 filas)

CREATE TABLE departamentos(id SERIAL PRIMARY KEY,nombres_departamentos VARCHAR);
-- SELECT * FROM departamentos;
--  id | nombres_departamentos
-- ----+---------------------
-- (0 filas)

CREATE TABLE profesores(id SERIAL PRIMARY KEY,nombres_profesores VARCHAR,departamentos_id INT,FOREIGN KEY(departamentos_id) REFERENCES departamentos);
-- SELECT * FROM profesores;
--  id | nombres_profesores | departamentos_id 
-- ----+-----------------+-----------------
-- (0 filas)


CREATE TABLE pruebas_alumnos (id SERIAL PRIMARY KEY,nota FLOAT,score FLOAT,alumnos_id INT,profesores_id INT,FOREIGN KEY (alumnos_id) REFERENCES alumnos(id),FOREIGN KEY (profesores_id) REFERENCES profesores(id));
-- SELECT * FROM pruebas_alumnos;
--  id | nota | score | alumnos_id | profesores_id 
-- ----+------+-------+-----------+-------------
-- (0 filas)

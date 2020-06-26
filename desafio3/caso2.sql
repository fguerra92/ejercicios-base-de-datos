CREATE TABLE curso(id SERIAL,nombre VARCHAR,PRIMARY KEY (id));
-- SELECT * FROM CURSO;
--  id | nombre 
-- ----+--------
-- (0 filas)


CREATE TABLE alumno(id SERIAL UNIQUE,nombre_alumno VARCHAR,curso_id INT,rut INT,FOREIGN KEY(curso_id) REFERENCES curso(id));
-- SELECT * FROM ALUMNO;
--  id | nombre_alumno | curso_id | rut 
-- ----+---------------+----------+-----
-- (0 filas)

CREATE TABLE departamento(id SERIAL PRIMARY KEY,nombre_departamento VARCHAR);
-- SELECT * FROM departamento;
--  id | nombre_departamento 
-- ----+---------------------
-- (0 filas)

CREATE TABLE profesor(id SERIAL PRIMARY KEY,nombre_profesor VARCHAR,departamento_id INT,OREIGN KEY(departamento_id) REFERENCES departamento);
-- SELECT * FROM profesor;
--  id | nombre_profesor | departamento_id 
-- ----+-----------------+-----------------
-- (0 filas)


CREATE TABLE prueba_alumno (id SERIAL PRIMARY KEY,nota FLOAT,score FLOAT,alumno_id INT,profesor_id INT,FOREIGN KEY (alumno_id) REFERENCES alumno(id),
FOREIGN KEY (profesor_id) REFERENCES profesor(id)
);
-- SELECT * FROM prueba_alumno;
--  id | nota | score | alumno_id | profesor_id 
-- ----+------+-------+-----------+-------------
-- (0 filas)

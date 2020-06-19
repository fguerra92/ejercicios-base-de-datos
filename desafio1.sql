--1. Crear Base de datos posts 
CREATE DATABASE posts;
--CREATE DATABASE--

--2. Crear tabla post, con los atributos id, nombre de usuario, fecha de creación, contenido,  descripcion
\c posts;
--Ahora está conectado a la base de datos «posts» con el usuario «felipe».--
CREATE TABLE posts(id SERIAL, nombre_de_usuario VARCHAR(50), fecha_de_creacion DATE, contenido VARCHAR(30), descripcion VARCHAR(70), PRIMARY KEY(id));
--CREATE TABLE--
--select * from posts;
-- id | nombre_de_usuario | fecha_de_creacion | contenido | descripcion 
----+-------------------+-------------------+-----------+-------------
--(0 filas)


--3. Insertar 3 post, 2 para el usuario "Pamela" y uno para "Carlos" 
INSERT INTO posts (nombre_de_usuario, fecha_de_creacion, contenido, descripcion) VALUES ('Pamela', '2020-06-17', '5 contratos', 'nuevos colaboradores');
--INSERT 0 1--
INSERT INTO posts (nombre_de_usuario, fecha_de_creacion, contenido, descripcion) VALUES ('Pamela', '2020-06-17', '10 finiquitos', 'desvinculaciones');
--INSERT 0 1--
INSERT INTO posts (nombre_de_usuario, fecha_de_creacion, contenido, descripcion) VALUES ('Carlos', '2020-06-16', '4 permisos', 'permiso comisaria virtual');
--INSERT 0 1--
--select * from posts;
--id | nombre_de_usuario | fecha_de_creacion |   contenido   |        descripcion        
----+-------------------+-------------------+---------------+---------------------------
--  1 | Pamela            | 2020-06-17        | 5 contratos   | nuevos colaboradores
--  2 | Pamela            | 2020-06-17        | 10 finiquitos | desvinculaciones
--  3 | Carlos            | 2020-06-16        | 4 permisos    | permiso comisaria virtual
--(3 filas)

--4. Modificar la tabla post, agregando la columna título
ALTER TABLE posts ADD COLUMN titulo VARCHAR(25);
--ALTER TABLE--

--select * from posts;
--id | nombre_de_usuario | fecha_de_creacion |   contenido   |        descripcion        | titulo 
----+-------------------+-------------------+---------------+---------------------------+--------
--  1 | Pamela            | 2020-06-17        | 5 contratos   | nuevos colaboradores      | 
--  2 | Pamela            | 2020-06-17        | 10 finiquitos | desvinculaciones          | 
--  3 | Carlos            | 2020-06-16        | 4 permisos    | permiso comisaria virtual | 
--(3 filas)


--5. Agregar título a las publicaciones ya ingresadas
UPDATE posts SET titulo='contratos' WHERE id=1;
--UPDATE 1
UPDATE posts SET titulo='finiquitos' WHERE id=2;
--UPDATE 1
UPDATE posts SET titulo='permisos' WHERE id=3;
--UPDATE 1
--select * from posts;
--id | nombre_de_usuario | fecha_de_creacion |   contenido   |        descripcion        |   titulo   
----+-------------------+-------------------+---------------+---------------------------+------------
--  1 | Pamela            | 2020-06-17        | 5 contratos   | nuevos colaboradores      | contratos
--  2 | Pamela            | 2020-06-17        | 10 finiquitos | desvinculaciones          | finiquitos
--  3 | Carlos            | 2020-06-16        | 4 permisos    | permiso comisaria virtual | permisos
--(3 filas)


--6. Insertar 2 post para el usuario "Pedro" 
INSERT INTO posts (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) VALUES ('Pedro', '2020-06-17', 'Charla Covid-19', 'Informacion Achs', 'Charla');
INSERT INTO posts (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) VALUES ('Pedro', '2020-06-17', 'Curso oratoria', 'como hablar en publico', 'Capacitacion');
--select * from posts;
--id | nombre_de_usuario | fecha_de_creacion |    contenido    |        descripcion        |    titulo    
----+-------------------+-------------------+-----------------+---------------------------+--------------
--  1 | Pamela            | 2020-06-17        | 5 contratos     | nuevos colaboradores      | contratos
--  2 | Pamela            | 2020-06-17        | 10 finiquitos   | desvinculaciones          | finiquitos
--  3 | Carlos            | 2020-06-16        | 4 permisos      | permiso comisaria virtual | permisos
--  4 | Pedro             | 2020-06-17        | Charla Covid-19 | Informacion Achs          | Charla
--  5 | Pedro             | 2020-06-17        | Curso oratoria  | como hablar en publico    | Capacitacion
--(5 filas)

--7. Eliminar el post de Carlos
DELETE FROM posts WHERE nombre_de_usuario='Carlos';
--DELETE 1  
--select * from post;
-- id | nombre_de_usuario | fecha_de_creacion |    contenido    |      descripcion       |    titulo    
----+-------------------+-------------------+-----------------+------------------------+--------------
--  1 | Pamela            | 2020-06-17        | 5 contratos     | nuevos colaboradores   | contratos
--  2 | Pamela            | 2020-06-17        | 10 finiquitos   | desvinculaciones       | finiquitos
--  1 | Pedro             | 2020-06-17        | Charla Covid-19 | Informacion Achs       | Charla
--  1 | Pedro             | 2020-06-17        | Curso oratoria  | como hablar en publico | Capacitacion
--(4 filas)

--8. Ingresar un nuevo post para el usuario "Carlos"
INSERT INTO posts (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) values ('Carlos', '2020-06-18', 'pagos proveedores', 'detalle pagos semana', 'transferencias');
--select * from posts;
--id | nombre_de_usuario | fecha_de_creacion |     contenido     |        descripcion        |     titulo     
----+-------------------+-------------------+-------------------+---------------------------+----------------
--  1 | Pamela            | 2020-06-17        | 5 contratos       | nuevos colaboradores      | contratos
--  2 | Pamela            | 2020-06-17        | 10 finiquitos     | desvinculaciones          | finiquitos
--  3 | Carlos            | 2020-06-16        | 4 permisos        | permiso comisaria virtual | permisos
--  4 | Pedro             | 2020-06-17        | Charla Covid-19   | Informacion Achs          | Charla
--  5 | Pedro             | 2020-06-17        | Curso oratoria    | como hablar en publico    | Capacitacion
--  6 | Carlos            | 2020-06-18        | pagos proveedores | detalle pagos semana      | transferencias
--(6 filas)







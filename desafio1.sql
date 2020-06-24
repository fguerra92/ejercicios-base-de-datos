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

---------------------PARTE 2-------------------------------------
--9. Crear una nueva tabla, llamada comentarios, con los atributos id, fecha y hora de creación,contenido, que se relacione con la tabla posts.--
CREATE TABLE comentarios (id SERIAL, posts_id INT, fecha_y_hora TIMESTAMP, contenido VARCHAR(300), FOREIGN KEY (posts_id) REFERENCES posts(id), PRIMARY KEY(id));
--CREATE TABLE
--SELECT * FROM comentarios;
-- id | posts_id | fecha_y_hora | contenido 
----+----------+--------------+-----------
--(0 filas)

--10. Crear 2 comentarios para el post de "Pamela" y 4 para "Carlos" 
INSERT INTO comentarios (posts_id, fecha_y_hora, contenido) VALUES (1, '24-06-2020 13:51:30','Lorem Ipsum');
INSERT INTO comentarios (posts_id, fecha_y_hora, contenido) VALUES (1, '24-07-2020 12:51:30','Lorem Ipsum2');
INSERT INTO comentarios (posts_id, fecha_y_hora, contenido) VALUES (6, '24-05-2020 11:51:30','Lorem Ipsum3');
INSERT INTO comentarios (posts_id, fecha_y_hora, contenido) VALUES (6, '24-05-2020 11:51:30','Lorem Ipsum4');
INSERT INTO comentarios (posts_id, fecha_y_hora, contenido) VALUES (6, '24-05-2020 11:51:30','Lorem Ipsum5');
INSERT INTO comentarios (posts_id, fecha_y_hora, contenido) VALUES (6, '24-05-2020 11:51:30','Lorem Ipsum6');
--SELECT * FROM comentarios;
-- id | posts_id |    fecha_y_hora     |  contenido   
----+----------+---------------------+--------------
--  1 |        1 | 2020-06-24 13:51:30 | Lorem Ipsum
--  2 |        1 | 2020-07-24 12:51:30 | Lorem Ipsum2
--  3 |        6 | 2020-05-24 11:51:30 | Lorem Ipsum3
--  4 |        6 | 2020-05-24 11:51:30 | Lorem Ipsum4
--  5 |        6 | 2020-05-24 11:51:30 | Lorem Ipsum5
--  6 |        6 | 2020-05-24 11:51:30 | Lorem Ipsum6
--(6 filas)

--11. Crear un nuevo post para "Margarita" 
INSERT INTO posts (nombre_de_usuario, fecha_de_creacion, contenido, descripcion, titulo) VALUES ('Margarita', '2020-07-17', 'Fechas Despedida', 'junta despedida', 'Despedida');
--SELECT * FROM posts;
-- id | nombre_de_usuario | fecha_de_creacion |     contenido     |        descripcion        |     titulo     
----+-------------------+-------------------+-------------------+---------------------------+----------------
--  1 | Pamela            | 2020-06-17        | 5 contratos       | nuevos colaboradores      | contratos
--  2 | Pamela            | 2020-06-17        | 10 finiquitos     | desvinculaciones          | finiquitos
--  3 | Carlos            | 2020-06-16        | 4 permisos        | permiso comisaria virtual | permisos
--  4 | Pedro             | 2020-06-17        | Charla Covid-19   | Informacion Achs          | Charla
--  5 | Pedro             | 2020-06-17        | Curso oratoria    | como hablar en publico    | Capacitacion
--  6 | Carlos            | 2020-06-18        | pagos proveedores | detalle pagos semana      | transferencias
--  7 | Margarita         | 2020-07-17        | Fechas Despedida  | junta despedida           | Despedida
--(7 filas)

--12. Ingresar 5 comentarios para el post de Margarita. 
INSERT INTO comentarios (posts_id, fecha_y_hora, contenido) VALUES (7, '24-05-2020 11:51:30','Lorem Ipsum7');
INSERT INTO comentarios (posts_id, fecha_y_hora, contenido) VALUES (7, '24-05-2020 11:51:30','Lorem Ipsum8');
INSERT INTO comentarios (posts_id, fecha_y_hora, contenido) VALUES (7, '24-05-2020 11:51:30','Lorem Ipsum9');
INSERT INTO comentarios (posts_id, fecha_y_hora, contenido) VALUES (7, '24-05-2020 11:51:30','Lorem Ipsum10');
INSERT INTO comentarios (posts_id, fecha_y_hora, contenido) VALUES (7, '24-05-2020 11:51:30','Lorem Ipsum11');
--SELECT * FROM comentarios;
-- id | posts_id |    fecha_y_hora     |   contenido   
------+----------+---------------------+---------------
--  1 |        1 | 2020-06-24 13:51:30 | Lorem Ipsum
--  2 |        1 | 2020-07-24 12:51:30 | Lorem Ipsum2
--  3 |        6 | 2020-05-24 11:51:30 | Lorem Ipsum3
--  4 |        6 | 2020-05-24 11:51:30 | Lorem Ipsum4
--  5 |        6 | 2020-05-24 11:51:30 | Lorem Ipsum5
--  6 |        6 | 2020-05-24 11:51:30 | Lorem Ipsum6
--  8 |        7 | 2020-05-24 11:51:30 | Lorem Ipsum7
--  9 |        7 | 2020-05-24 11:51:30 | Lorem Ipsum8
-- 10 |        7 | 2020-05-24 11:51:30 | Lorem Ipsum9
-- 11 |        7 | 2020-05-24 11:51:30 | Lorem Ipsum10
-- 12 |        7 | 2020-05-24 11:51:30 | Lorem Ipsum11
--(11 filas)



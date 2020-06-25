--1. Crear base de datos llamada películas
CREATE DATABASE peliculas;
--\c peliculas
--Ahora está conectado a la base de datos «peliculas» con el usuario «felipe».

--2. Revisar los archivos peliculas.csv y reparto.csv para crear las tablas correspondientes,
--determinando la relación entre ambas tablas. 
CREATE TABLE peliculas(id SERIAL, nombre VARCHAR, año INT, director VARCHAR,PRIMARY KEY(id));
--CREATE TABLE
CREATE TABLE reparto(id SERIAL, nombre_reparto VARCHAR, peliculas_id INT, PRIMARY KEY(id), FOREIGN KEY (peliculas_id) REFERENCES peliculas(id));
--CREATE TABLE
--SELECT * FROM peliculas;
-- id | nombre | año | director 
----+--------+-----+----------
--(0 filas)

--SELECT * FROM reparto;
-- id | nombre_reparto | peliculas_id 
----+----------------+--------------
--(0 filas)

--3. Cargar ambos archivos a su tabla correspondiente
\copy peliculas FROM '/home/felipe/Documentos/DesafioLatam/Introduccion_Base_de_datos/Ejercicios-base-de-datos/Apoyo Desafío 2 -  Top 100/peliculas.csv' csv header;
--COPY 100
\copy reparto(peliculas_id, nombre_reparto) FROM '/home/felipe/Documentos/DesafioLatam/Introduccion_Base_de_datos/Ejercicios-base-de-datos/Apoyo Desafío 2 -  Top 100/reparto.csv' csv;
--COPY 1051

--4. Listar todos los actores que aparecen en la película "Titanic", indicando el título de la película,año de estreno, director y todo el reparto.
SELECT * FROM peliculas INNER JOIN reparto ON peliculas.id = reparto.peliculas_id WHERE peliculas.nombre = 'Titanic';
id | nombre  | año  |   director    |  id  |  nombre_reparto   | peliculas_id 
-- ----+---------+------+---------------+------+-------------------+--------------
--   2 | Titanic | 1997 | James Cameron | 2119 | Leonardo DiCaprio |            2
--   2 | Titanic | 1997 | James Cameron | 2120 | Kate Winslet      |            2
--   2 | Titanic | 1997 | James Cameron | 2121 | Billy Zane        |            2
--   2 | Titanic | 1997 | James Cameron | 2122 | Kathy Bates       |            2
--   2 | Titanic | 1997 | James Cameron | 2123 | Frances Fisher    |            2
--   2 | Titanic | 1997 | James Cameron | 2124 | Bernard Hill      |            2
--   2 | Titanic | 1997 | James Cameron | 2125 | Jonathan Hyde     |            2
--   2 | Titanic | 1997 | James Cameron | 2126 | Danny Nucci       |            2
--   2 | Titanic | 1997 | James Cameron | 2127 | David Warner      |            2
--   2 | Titanic | 1997 | James Cameron | 2128 | Bill Paxton       |            2
--   2 | Titanic | 1997 | James Cameron | 2129 | Gloria Stuart     |            2
--   2 | Titanic | 1997 | James Cameron | 2130 | Victor Garber     |            2
--   2 | Titanic | 1997 | James Cameron | 2131 | Suzy Amis         |            2
-- (13 filas)

--5. Listar los titulos de las películas donde actúe Harrison Ford.
SELECT M.nombre FROM peliculas AS M INNER JOIN reparto AS A ON M.id = A.peliculas_id WHERE A.nombre_reparto = 'Harrison Ford';
--                   nombre                     
-- -----------------------------------------------
--  Star Wars. Episodio IV: Una nueva esperanza
--  Indiana Jones y la última cruzada
--  En busca del arca perdida
--  Star Wars. Episodio V: El imperio contraataca
--  Star Wars. Episodio VI: El retorno del Jedi
--  Blade Runner
--  Apocalypse Now
--  Indiana Jones y el templo maldito
-- (8 filas)







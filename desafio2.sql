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



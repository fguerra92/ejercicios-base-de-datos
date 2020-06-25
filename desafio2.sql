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

--6. Listar los 10 directores mas populares, indicando su nombre y cuántas películas aparecen en el top 100.
SELECT director, count(*) AS N_peliculas FROM peliculas GROUP BY director ORDER BY N_peliculas DESC LIMIT 10;
-- director       | n_peliculas 
-- ----------------------+-------------
--  Steven Spielberg     |           9
--  Francis Ford Coppola |           4
--  Peter Jackson        |           4
--  Quentin Tarantino    |           3
--  Martin Scorsese      |           3
--  Robert Zemeckis      |           3
--  James Cameron        |           3
--  Ridley Scott         |           3
--  George Lucas         |           3
--  Frank Darabont       |           2
-- (10 filas)

--7. Indicar cuantos actores distintos hay 
SELECT DISTINCT(nombre_reparto) FROM reparto;
--ME SALIERON MUCHOS.... SOLO DEJE EL FINAL
-- Lupe Ontiveros
--  John Turturro
--  Claude Rains
--  Stephen Rea
--  Winona Ryder
--  Scatman Crothers
--  Uma Thurman
--  John Gavin
--  Robert Shaw
--  John Travolta
--  John Cazale
--  Shane West
--  Tyrese Gibson
--  Jean Reno
--  Max von Sydow
--  Sally Field
--  Ewen Bremner
--  André Morell
--  Eric Stoltz
--  Ngc Le
--  Silas Carson
--  Stellan Skarsgård
--  Peter Greene
--  Dave Prowse
--  Cotter Smith
-- (831 filas)

--8. Indicar las películas estrenadas entre los años 1990 y 1999 (ambos incluidos) ordenadas por título de manera ascendente.
SELECT año, nombre FROM peliculas WHERE año BETWEEN 1990 AND 1999 ORDER BY año ASC;
-- año  |                   nombre                   
-- ------+--------------------------------------------
--  1990 | Uno de los nuestros
--  1990 | Eduardo Manostijeras
--  1990 | El Padrino. Parte III
--  1991 | Terminator 2: el juicio final
--  1991 | El silencio de los corderos
--  1993 | La lista de Schindler
--  1993 | Parque Jurásico
--  1993 | Pesadilla antes de navidad
--  1994 | Forest Gump
--  1994 | Cadena perpetua
--  1994 | Pulp Fiction
--  1994 | Entrevista con el vampiro
--  1994 | El profesional
--  1995 | Seven
--  1995 | Toy Story
--  1995 | Braveheart
--  1996 | Trainspotting
--  1997 | Titanic
--  1997 | Hombres de negro
--  1997 | Mejor... imposible
--  1998 | American History X
--  1998 | Salvar al soldado Ryan
--  1998 | El show de Truman
--  1999 | Toy Story 2
--  1999 | La milla verde

--10. Listar los actores de la película más nueva
SELECT nombre_reparto FROM reparto WHERE peliculas_id IN (SELECT id FROM peliculas ORDER BYaño DESC LIMIT 1);
-- nombre_reparto    
-- ----------------------
--  Christian Bale
--  Heath Ledger
--  Aaron Eckhart
--  Michael Caine
--  Gary Oldman
--  Maggie Gyllenhaal
--  Morgan Freeman
--  Eric Roberts
--  Cillian Murphy
--  Anthony Michael Hall
--  Michael Jai White
--  William Fichtner
--  Edison Chen
--  Monique Curnen
--  Chin Han
--  Nestor Carbonell
--  Ritchie Coster
--  Keith Szarabajka
--  Colin McFarlane
--  Melinda McGraw
--  Nathan Gamble
--  Michael Vieau
-- (22 filas)




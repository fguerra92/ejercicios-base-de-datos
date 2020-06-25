CREATE DATABASE prueba;
--CREATE DATABASE
-- \c prueba
-- Ahora está conectado a la base de datos «prueba» con el usuario «felipe».

CREATE TABLE categorias(id SERIAL PRIMARY KEY, nombre VARCHAR, descripcion TEXT);
--CREATE TABLE
-- SELECT * FROM categorias;
--  id | nombre | descripcion 
-- ----+--------+-------------
-- (0 filas)
CREATE TABLE clientes (id SERIAL PRIMARY KEY, nombre VARCHAR, direccion VARCHAR, rut TEXT);
--CREATE TABLE
-- SELECT * FROM cliente;
--  id | nombre | direccion | rut 
-- ----+--------+-----------+-----
-- (0 filas)
CREATE TABLE productos(id SERIAL PRIMARY KEY, nombre VARCHAR, descripcion TEXT, precio INT, categorias_id INT, FOREIGN KEY (categorias_id) REFERENCES categorias(id));
--CREATE TABLE
-- SELECT * FROM productos;
--  id | nombre | descripcion | precio | categorias_id 
-- ----+--------+-------------+--------+--------------
-- (0 filas)
CREATE TABLE facturas (id SERIAL PRIMARY KEY, numero INT, fecha DATE, iva INT, subtotal INT, clientes_id INT, FOREIGN KEY (clientes_id) REFERENCES clientes(id));
--CREATE TABLE
-- SELECT * FROM facturas;
--  id | numero | fecha | iva | subtotal | clientes_id 
-- ----+--------+-------+-----+----------+-------------
-- (0 filas)
CREATE TABLE facturas_productos(id SERIAL PRIMARY KEY, cantidad INT, facturas_id INT, productos_id INT, FOREIGN KEY (facturas_id) REFERENCES facturas(id), FOREIGN KEY (productos_id) REFERENCES productos(id));
--CREATE TABLE
-- SELECT * FROM facturas_productos;
--  id | cantidad | facturas_id | productos_id 
-- ----+----------+-------------+--------------
-- (0 filas)

--------------------5 CLIENTES--------------------
INSERT INTO clientes (nombre, direccion, rut) VALUES ('Elizabeth', 'Avenida interprovincial', '123456'),('José', 'Direccion Colina', '123456'), ('Felipe', 'Direccion Esmeralda', '1234567'),('Michel', 'Huechuraba', '12345678'),('Mayli', 'La Florida', '123456789');
-- SELECT * FROM clientes;
--  id |  nombre   |        direccion        |    rut    
-- ----+-----------+-------------------------+-----------
--   1 | Elizabeth | Avenida interprovincial | 123456
--   2 | José      | Direccion Colina        | 123456
--   3 | Felipe    | Direccion Esmeralda     | 1234567
--   4 | Michel    | Huechuraba              | 12345678
--   5 | Mayli     | La Florida              | 123456789
-- (5 filas)
    
-------------------3 Categorias------------------------
INSERT INTO categorias ( nombre, descripcion) VALUES ('categoria 1', 'Descripcion 1'), ('categoria 2', 'Descripcion 2'), ('categoria 3', 'Descripcion 3');
-- SELECT * FROM categorias;
--  id |   nombre    |  descripcion  
-- ----+-------------+---------------
--   1 | categoria 1 | Descripcion 1
--   2 | categoria 2 | Descripcion 2
--   3 | categoria 3 | Descripcion 3
-- (3 filas)



------------------8 productos------------------------------------
INSERT INTO productos (nombre, descripcion, precio, categorias_id) VALUES ('producto 1_1', 'Descripcion producto 1_1', 100, 1), ('producto 1_2', 'Descripcion producto 1_2', 100, 1), ('producto 1_3', 'Descripcion producto 1_3', 100, 1), ('producto 2_1', 'Descripcion producto 2_1', 200, 2), ('producto 2_2', 'Descripcion producto 2_2', 200, 2), ('producto 2_3', 'Descripcion producto 2_3', 200, 2), ('producto 3_1', 'Descripcion producto 3_1', 300, 3), ('producto 3_2', 'Descripcion producto 3_2', 300, 3);
-- SELECT * FROM productos;
--  id |    nombre    |       descripcion        | precio | categorias_id 
-- ----+--------------+--------------------------+--------+---------------
--   1 | producto 1_1 | Descripcion producto 1_1 |    100 |             1
--   2 | producto 1_2 | Descripcion producto 1_2 |    100 |             1
--   3 | producto 1_3 | Descripcion producto 1_3 |    100 |             1
--   4 | producto 2_1 | Descripcion producto 2_1 |    200 |             2
--   5 | producto 2_2 | Descripcion producto 2_2 |    200 |             2
--   6 | producto 2_3 | Descripcion producto 2_3 |    200 |             2
--   7 | producto 3_1 | Descripcion producto 3_1 |    300 |             3
--   8 | producto 3_2 | Descripcion producto 3_2 |    300 |             3
-- (8 filas)

--------------------10 facturas------------------------------
--cliente elizabeth 1
INSERT INTO facturas (fecha, iva, subtotal, clientes_id) VALUES (CURRENT_DATE, 19, 200, 1);
INSERT INTO facturas_productos (facturas_id, productos_id) VALUES  (3,1), (3,2);
INSERT INTO facturas (fecha, iva, subtotal, clientes_id) VALUES (CURRENT_DATE, 19, 500,1);
INSERT INTO facturas_productos (facturas_id, productos_id) VALUES  (4, 3), (4, 4), (4,5);

--cliente José 2
INSERT INTO facturas (fecha, iva, subtotal, clientes_id) VALUES (CURRENT_DATE, 19, 800, 2);
INSERT INTO facturas_productos (facturas_id, productos_id) VALUES  (5, 6), (5, 7), (5,8);
INSERT INTO facturas (fecha, iva, subtotal, clientes_id) VALUES (CURRENT_DATE, 19, 400, 2);
INSERT INTO facturas_productos (facturas_id, productos_id) VALUES  (6, 4), (6, 6);
INSERT INTO facturas (fecha, iva, subtotal, clientes_id) VALUES (CURRENT_DATE, 19, 400, 2);
INSERT INTO facturas_productos (facturas_id, productos_id) VALUES  (7, 4), (7, 2), (7,3);

--clinete Felipe 3
INSERT INTO facturas (fecha, iva, subtotal, clientes_id) VALUES (CURRENT_DATE, 19, 100, 3);
INSERT INTO facturas_productos (facturas_id, productos_id) VALUES  (8, 3);

--cliente Michel 4
INSERT INTO facturas (fecha, iva, subtotal, clientes_id) VALUES (CURRENT_DATE, 19, 400, 4);
INSERT INTO facturas_productos (facturas_id, productos_id) VALUES  (9, 4), (9,5);
INSERT INTO facturas (fecha, iva, subtotal, clientes_id) VALUES (CURRENT_DATE, 19, 500, 4);
INSERT INTO facturas_productos (facturas_id, productos_id) VALUES  (10, 3), (10, 6), (10,5);
INSERT INTO facturas (fecha, iva, subtotal, clientes_id) VALUES (CURRENT_DATE, 19, 700, 4);
--INSERT INTO facturas_productos (facturas_id, productos_id) VALUES  (11, 3), (11, 4), (11, 8), (11,1);
INSERT INTO facturas (fecha, iva, subtotal, clientes_id) VALUES (CURRENT_DATE, 19, 100, 4);
--INSERT INTO facturas_productos (facturas_id, productos_id) VALUES  (12, 1);

-- SELECT * FROM facturas;
--  id | numero |   fecha    | iva | subtotal | clientes_id 
-- ----+--------+------------+-----+----------+-------------
--   1 |        | 2020-06-25 |  19 |      200 |           1
--   2 |        | 2020-06-25 |  19 |      500 |           1
--   3 |        | 2020-06-25 |  19 |      800 |           2
--   4 |        | 2020-06-25 |  19 |      400 |           2
--   5 |        | 2020-06-25 |  19 |      400 |           2
--   6 |        | 2020-06-25 |  19 |      100 |           3
--   7 |        | 2020-06-25 |  19 |      400 |           4
--   8 |        | 2020-06-25 |  19 |      500 |           4
--   9 |        | 2020-06-25 |  19 |      700 |           4
--  10 |        | 2020-06-25 |  19 |      100 |           4
-- (10 filas)




-------¿Que cliente realizó la compra más cara?----
SELECT c.nombre, f.subtotal FROM clientes AS c INNER JOIN facturas AS f ON f.clientes_id =c.id ORDER BY f.subtotal DESC LIMIT 1;
--  nombre | subtotal 
-- --------+----------
--  José   |      800
-- (1 fila)

--------------¿Que cliente pagó sobre 100 de monto?-------------
SELECT DISTINCT (c.rut), c.nombre FROM clientes AS c INNER JOIN facturas AS f ON f.clientes_id = c.id WHERE f.subtotal > 250;
--    rut    |  nombre   
-- ----------+-----------
--  123456   | Elizabeth
--  123456   | José
--  12345678 | Michel
-- (3 filas)

--------------¿Cuantos clientes han comprado el producto 6?-----
SELECT  productos_id, cliente.nombre cliente_nombre FROM facturas_producto INNER JOIN facturas ON facturas.id = facturas_producto.facturas_id INNER JOIN cliente ON clientes.id = facturas.cliente_id WHERE productos_id =6;
SELECT  productos_id, clientes.nombre clientes_nombre FROM facturas_productos INNER JOIN facturas ON facturas.id = facturas_producto.facturas_id INNER JOIN clientes ON clientes.id = facturas.clientes_id WHERE productos_id =6;

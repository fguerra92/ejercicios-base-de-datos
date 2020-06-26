CREATE TABLE "editorial" (
  "id" SERIAL PRIMARY KEY,
  "nombre_editorial" CARCHAR
);

CREATE TABLE "lector" (
  "id" SERIAL PRIMARY KEY,
  "nombre_lector" VARCHAR
);

CREATE TABLE "autor" (
  "id" SERIAL PRIMARY KEY,
  "nombre_autor" VARCHAR
);

CREATE TABLE "libro" (
  "id" SERIAL PRIMARY KEY,
  "codigo" INT,
  "titulo" VARCHAR,
  "editorial_id" INT
);

CREATE TABLE "prestamo" (
  "id" SERIAL PRIMARY KEY,
  "fecha" DATE,
  "lector_id" INT,
  "libro_id" INT
);

CREATE TABLE "libro_autor" (
  "id" SERIAL PRIMARY KEY,
  "autor_id" INT,
  "libro_id" INT
);

ALTER TABLE "libro" ADD FOREIGN KEY ("editorial_id") REFERENCES "editorial" ("id");

ALTER TABLE "prestamo" ADD FOREIGN KEY ("lector_id") REFERENCES "lector" ("id");

ALTER TABLE "prestamo" ADD FOREIGN KEY ("libro_id") REFERENCES "libro" ("id");

ALTER TABLE "libro_autor" ADD FOREIGN KEY ("autor_id") REFERENCES "autor" ("id");

ALTER TABLE "libro_autor" ADD FOREIGN KEY ("libro_id") REFERENCES "libro" ("id");
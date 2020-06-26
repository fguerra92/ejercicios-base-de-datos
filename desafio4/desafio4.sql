CREATE TABLE "editoriales" (
  "id" SERIAL PRIMARY KEY,
  "nombres_editoriales" VARCHAR
);

CREATE TABLE "lectores" (
  "id" SERIAL PRIMARY KEY,
  "nombres_lectores" VARCHAR
);

CREATE TABLE "autores" (
  "id" SERIAL PRIMARY KEY,
  "nombres_autores" VARCHAR
);

CREATE TABLE "libros" (
  "id" SERIAL PRIMARY KEY,
  "codigos" INT,
  "titulos" VARCHAR,
  "editoriales_id" INT
);

CREATE TABLE "prestamos" (
  "id" SERIAL PRIMARY KEY,
  "fechas" DATE,
  "lectores_id" INT,
  "libros_id" INT
);

CREATE TABLE "libros_autores" (
  "id" SERIAL PRIMARY KEY,
  "autores_id" INT,
  "libros_id" INT
);

ALTER TABLE "libros" ADD FOREIGN KEY ("editoriales_id") REFERENCES "editoriales" ("id");

ALTER TABLE "prestamos" ADD FOREIGN KEY ("lectores_id") REFERENCES "lectores" ("id");

ALTER TABLE "prestamos" ADD FOREIGN KEY ("libros_id") REFERENCES "libros" ("id");

ALTER TABLE "libros_autores" ADD FOREIGN KEY ("autores_id") REFERENCES "autores" ("id");

ALTER TABLE "libros_autores" ADD FOREIGN KEY ("libros_id") REFERENCES "libros" ("id");
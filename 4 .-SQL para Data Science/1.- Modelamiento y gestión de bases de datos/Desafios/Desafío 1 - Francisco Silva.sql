--Cree la base de datos llamada Biblioteca.
CREATE DATABASE Biblioteca;
--En esta, cree la tabla Libro, cuyas campos seran id_libro (clave primaria), nombre_libro, ‹autor, genero.
CREATE TABLE Libro(
id_libro SERIAL CONSTRAINT pk_libro PRIMARY KEY,
nombre_libro VARCHAR(50) not null,
autor VARCHAR(50) not null,
genero VARCHAR(50) not null
);
--Ingrese el libro llamado Sapo y Sepo, el resto de los datos debe inventarlos.
insert into libro (nombre_libro, autor, genero) values ('Sapo y Sepo', 'sapolio', 'sapogenero')
--Ingrese el libro llamado La Metamorfosis, el resto de los datos debe inventarlos
insert into libro (nombre_libro, autor, genero) values ('La Mefamorfosis', 'El Metamorfo', 'Metamorfolandia');
--Cree la tabla ​Prestamo​, que contenga los campos ​id_prestamo (clave primaria),
--id_libro (clave foranea referenciando a ​id_libro en ​Libro​), ​nombre_persona​,
--fecha_inicio​ y ​fecha_termino​.
CREATE TABLE Prestamo(
id_prestamo SERIAL CONSTRAINT prestamo_key PRIMARY KEY,
id_libro SERIAL NOT NULL REFERENCES libro(id_libro),
nombre_persona VARCHAR(50) not null,
fecha_inicio DATE not null,
fecha_termino DATE not null
)
--Añada la columna ​prestado​ (booleano) a la tabla ​Libro​.
alter table libro
add column prestado bool DEFAULT FALSE;
--Ingresar el estado de ​prestamo​ de Sapo y Sepo.
UPDATE libro SET prestado = TRUE WHERE nombre_libro = 'Sapo y Sepo';
--Ingresar el estado de ​prestamo​ de La Metamorfosis
UPDATE libro SET prestado = TRUE WHERE nombre_libro = 'La Mefamorfosis';
--Ingrese 5 préstamos asociados a Sapo y Sepo
INSERT INTO prestamo (id_libro, nombre_persona, fecha_inicio, fecha_fin) VALUES (1, 'nombre1', '2020-11-01', '2020-11-05');
INSERT INTO prestamo (id_libro, nombre_persona, fecha_inicio, fecha_fin) VALUES (1, 'nombre2', '2020-11-06', '2020-11-10');
INSERT INTO prestamo (id_libro, nombre_persona, fecha_inicio, fecha_fin) VALUES (1, 'nombre3', '2020-11-11', '2020-11-15');
INSERT INTO prestamo (id_libro, nombre_persona, fecha_inicio, fecha_fin) VALUES (1, 'nombre4', '2020-11-16', '2020-10-20');
INSERT INTO prestamo (id_libro, nombre_persona, fecha_inicio, fecha_fin) VALUES (1, 'nombre5', '2021-11-21', '2021-11-25');
--Ingrese 6 préstamos asociados a La Metamorfosis.
INSERT INTO prestamo (id_libro, nombre_persona, fecha_inicio, fecha_fin) VALUES (2, 'nombre1', '2020-11-01', '2020-11-05');
INSERT INTO prestamo (id_libro, nombre_persona, fecha_inicio, fecha_fin) VALUES (2, 'nombre2', '2020-11-06', '2020-11-10');
INSERT INTO prestamo (id_libro, nombre_persona, fecha_inicio, fecha_fin) VALUES (2, 'nombre3', '2020-11-11', '2020-11-15');
INSERT INTO prestamo (id_libro, nombre_persona, fecha_inicio, fecha_fin) VALUES (2, 'nombre4', '2020-11-16', '2020-10-20');
INSERT INTO prestamo (id_libro, nombre_persona, fecha_inicio, fecha_fin) VALUES (2, 'nombre5', '2021-11-21', '2021-11-25');
--Cree un nuevo libro.
INSERT INTO libro (nombre_libro, autor, genero) VALUES ('papelucho', 'autor1', 'genero1');
--Seleccione los libros y las personas quienes lo pidieron prestado (​nombre_libro y nombre_persona​).
SELECT nombre_libro, autor, genero, nombre_persona FROM libro INNER JOIN prestamo ON libro.id_libro = prestamo.id_libro;
--Seleccione todas las columnas de la tabla ​Prestamo para los préstamos de Sapo y Sepo, ordenados decrecientemente por ​fecha_de_inicio​.
SELECT * FROM prestamo WHERE id_libro=1 ORDER BY fecha_inicio DESC;

--CREACIÓN DE TABLA REVISTA
CREATE TABLE revista
(
    codigo NUMBER(4) PRIMARY KEY,
    sala VARCHAR(10),
    estanteria NUMBER(1)
);

--COMPROBACIÓN TABLA REVISTA
DESCRIBE revista;

--CREACIÓN TABLA ACTOR
CREATE TABLE actor
(
    DNI VARCHAR2(10) PRIMARY KEY,
    nombre_artistico VARCHAR2(20),
    fecha_nac DATE
);

--COMPROBACIÓN TABLA ACTOR
DESCRIBE actor;

--BORRAR TABLA REVISTA
DROP TABLE revista;

--BORRAR TABLA ACTOR
DROP TABLE actor;
--CREAR TABLAS
CREATE TABLE PROVINCIAS
(
    cod_provincia NUMBER(2) CONSTRAINT PK_PROV PRIMARY KEY,
    nom_provincia VARCHAR2(15)
);

CREATE TABLE PERSONAS
(
    dni NUMBER(8) CONSTRAINT PK_PER PRIMARY KEY,
    nombre VARCHAR2(15),
    edad NUMBER(3) CONSTRAINT MAYOR_EDAD CHECK (edad >= 18),
    provincia NUMBER(2),
        CONSTRAINT FK_PROV FOREIGN KEY (provincia) REFERENCES
            provincias(cod_provincia)
);

INSERT INTO PROVINCIAS VALUES (28, 'MADRID');
INSERT INTO PROVINCIAS VALUES (28, 'SEVILLA');

INSERT INTO PERSONAS VALUES (1133, 'Luis', 35, 22);

INSERT INTO PERSONAS VALUES (1155, 'Ana', 15, 28);
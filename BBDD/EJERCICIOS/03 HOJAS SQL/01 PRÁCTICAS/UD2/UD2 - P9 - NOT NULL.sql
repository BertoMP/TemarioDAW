--CREACI�N DE LA TABLA
CREATE TABLE ejemplo_notnull
(
    dni VARCHAR2(9) PRIMARY KEY,
    nombre VARCHAR2(30) NOT NULL,
    edad NUMBER(3)
);

--INSERTAR REGISTRO
INSERT INTO ejemplo_notnull (dni, edad) VALUES ('11111A', 53);

/* No se est� registrando el campo nombre que tiene una restricci�n
   NOT NULL, es decir, no puede estar vac�o. */
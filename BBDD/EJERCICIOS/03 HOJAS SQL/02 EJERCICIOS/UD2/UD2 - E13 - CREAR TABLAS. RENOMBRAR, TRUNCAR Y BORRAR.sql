--CREAR TABLAS
/* Primero se deben crear las tablas CONCESIONARIO y PRECIO (da igual
   el orden) ya que ambas son referenciadas por la tabla VEH�CULO en 
   los siguientes campos:
    - Concesario --> Ser� una FK que una a la tabla VEHICULO con 
      CONCESARIO.
    - Marca, modelo, anno --> Sera una FK compuesta que una a las
      tablas VEH�CULO y PRECIO. 

CREAR TABLA CONCESIONARIO*/
CREATE TABLE CONCESIONARIO
(
    concesionario NUMBER(3) 
        CONSTRAINT PK_CONCESIONARIO PRIMARY KEY,
    direccion VARCHAR2(50),
    poblacion VARCHAR2(50),
    telefono NUMBER(9)
);
/*CREAR TABLA PRECIO

  La PK al ser una compuesta debe crearse en formato de tabla. */
CREATE TABLE PRECIO
(
    marca VARCHAR2(20),
    modelo VARCHAR2(20),
    anno NUMBER(4) DEFAULT 2021,
    precio NUMBER(8,2) CONSTRAINT C_PRECIO_MIN5000 CHECK(precio > 5000),
    
        CONSTRAINT PK_PRECIO PRIMARY KEY(marca,modelo,anno)
);
/*CREAR TABLA VEH�CULO

  La FK que referencia a PRECIO al ser compuesta por tres campos
  debe crearse como restricci�n de tabla. */
CREATE TABLE VEHICULO
(
    matricula CHAR(8)
        CONSTRAINT PK_VEHICULO PRIMARY KEY,
        CONSTRAINT C_MATRICULA_FORMATO CHECK(matricula LIKE '____ ___'),
        /* Este tipo CHECK LIKE es para obligar a la estructura 4 n�meros
           (primeras 4 barras bajas), espacio y 3 letras (siguientes 3 barras
           bajas). 
           Se podr�a haber puesto LIKE "% %" pero ser�a menos restrictivo
           ya que el espacio podr�a encontrarse en cualquier lugar y no guardar
           la estructura de una matricula.*/
    concesionario NUMBER(3)
        CONSTRAINT FK_VEHICULO_CONCESIONARIO 
            REFERENCES CONCESIONARIO(concesionario),
    marca VARCHAR2(20),
    modelo VARCHAR2(20),
    anno NUMBER(4),
    color VARCHAR2(20) 
        CONSTRAINT C_COLOR_LISTA 
            CHECK(color IN('Rojo','Azul','Gris','Blanco','Negro')),
        
        CONSTRAINT FK_VEHICULO_PRECIO FOREIGN KEY(marca,modelo,anno) 
            REFERENCES PRECIO(marca,modelo,anno)
);

--INSERTAR REGISTROS
/* Al igual que pasaba con la creaci�n de tablas, los registros tambi�n
   deben crearse primero los registros de las tablas CONCESIONARIO Y 
   PRECIO. */
/*REGISTROS TABLA CONCESIONARIO*/
INSERT INTO CONCESIONARIO VALUES(043,'Calle Almansa, 25','Getafe',916852033);
INSERT INTO CONCESIONARIO 
    VALUES(026,'Avenida Montealto, 4','Alcobendas',916398039);

/*REGISTROS TABLA PRECIO*/
INSERT INTO PRECIO VALUES('Citro�n','C3',2021,12690);
INSERT INTO PRECIO VALUES('Citro�n','C3',2015,8520.99);
INSERT INTO PRECIO VALUES('Ford','Fiesta',2019,16210);

/*REGISTROS TABLA VEH�CULO*/
INSERT INTO VEHICULO VALUES('7826 LFR',043,'Citro�n','C3',2021,'Rojo');
INSERT INTO VEHICULO VALUES('5289 GBN',043,'Citro�n','C3',2015,'Gris');
INSERT INTO VEHICULO VALUES('5580 KPL',026,'Ford','Fiesta',2019,'Rojo');

--VISUALIZAR REGISTROS
SELECT * FROM CONCESIONARIO;
SELECT * FROM PRECIO;
SELECT * FROM VEHICULO;

--TRUNCAR TABLA CONCESIONARIO RESERVANDO ESPACIO
TRUNCATE TABLE VEHICULO REUSE STORAGE;
/* Se borran los campos que se encontraban en veh�culo pero se guarda el
   espacio en memoria que ocupaban. */

--CAMBIAR DE NOMBRE A LA TABLA PRECIO A PRECIO_VEHICULO
RENAME PRECIO TO PRECIO_VEHICULO;

--COMPROBAR RESTRICCIONES DE REFERENCIA POST-CAMBIO DE NOMBRE
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='VEHICULO';
SELECT * FROM USER_CONS_COLUMNS WHERE TABLE_NAME='VEHICULO';

--ELIMINAR LA TABLA CONCESIONARIO CON DROP TABLE CONCESIONARIO
DROP TABLE CONCESIONARIO;
/* No se puede eliminar la tabla porque esta referenciada por 
   VEHICULO, habr�a que utilizar el comando:
   DROP TABLE CONCESIONARIO CASCADE CONSTRAINTS; 
   Para con ello eliminar las conexiones entre tablas y, de esa forma,
   poder eliminar la tabla sin problemas. */









--ESTRUCTURA DE LAS TABLAS
DESCRIBE PERSONAS2;
DESCRIBE BLOQUESPISOS;

SELECT * FROM PERSONAS2;
SELECT * FROM BLOQUESPISOS;

SELECT * FROM USER_CONSTRAINTS
WHERE TABLE_NAME='PERSONAS2' OR TABLE_NAME='BLOQUESPISOS'
ORDER BY TABLE_NAME ASC;

SELECT * FROM USER_CONS_COLUMNS
WHERE TABLE_NAME='PERSONAS2' OR TABLE_NAME='BLOQUESPISOS'
ORDER BY TABLE_NAME ASC;

DROP TABLE BLOQUESPISOS;

DROP TABLE BLOQUESPISOS CASCADE CONSTRAINTS;
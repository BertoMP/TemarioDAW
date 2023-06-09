--a)
INSERT INTO EMPLE VALUES (8000,'MART�NEZ','EMPLEADOR',7902,'27/01/2017',1300,NULL,NULL);
INSERT INTO EMPLE VALUES (8001,'PALOMERA','VENDEDOR',7902,'08/05/2019',1505,NULL,NULL);
COMMIT;

SELECT EMP_NO, APELLIDO, LOC 
FROM EMPLE E, DEPART D
WHERE E.DEPT_NO = D.DEPT_NO(+);

SELECT EMP_NO, APELLIDO, LOC
FROM EMPLE E
LEFT JOIN DEPART D ON E.DEPT_NO = D.DEPT_NO;

--b)
DROP TABLE DP_TEL;
DROP TABLE DATOSPERSONALES;

CREATE TABLE DATOSPERSONALES(
LOGIN VARCHAR2(15) PRIMARY KEY,
IDIOMA VARCHAR2(3) CHECK (IDIOMA IN ('ESP','EN','FR','DE')),
FECHA_NAC DATE);

CREATE TABLE DP_TEL(
TELEFONO NUMBER(9) PRIMARY KEY,
LOGIN VARCHAR2(15) REFERENCES DATOSPERSONALES ON DELETE CASCADE);

INSERT INTO DATOSPERSONALES VALUES('mcalero23','ESP','21/03/2005');
INSERT INTO DATOSPERSONALES VALUES('eriv625','ESP','08/10/2004');
INSERT INTO DATOSPERSONALES VALUES('jdestroy','FR','11/06/2003');

INSERT INTO DP_TEL VALUES(600022222,'eriv625');
INSERT INTO DP_TEL VALUES(600033333,'eriv625');
INSERT INTO DP_TEL VALUES(600044444,'jdestroy');
INSERT INTO DP_TEL(TELEFONO) VALUES(600055555);

COMMIT;

SELECT DP.LOGIN, IDIOMA, TELEFONO
FROM DATOSPERSONALES DP, DP_TEL DPT
WHERE DP.LOGIN = DPT.LOGIN(+);

SELECT DP.LOGIN, IDIOMA, TELEFONO
FROM DATOSPERSONALES DP
LEFT JOIN DP_TEL DPT ON DP.LOGIN = DPT.LOGIN;

--c)
SELECT TELEFONO, NVL(IDIOMA, 'INDEFINIDO')
FROM DATOSPERSONALES DP, DP_TEL DPT
WHERE DP.LOGIN(+) = DPT.LOGIN;

SELECT TELEFONO, NVL(IDIOMA, 'INDEFINIDO')
FROM DATOSPERSONALES DP
RIGHT JOIN DP_TEL DPT ON DP.LOGIN = DPT.LOGIN;
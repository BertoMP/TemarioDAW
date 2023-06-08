SELECT * FROM CLIENT;
SELECT * FROM MERCHAN;
SELECT * FROM FACTURA;
SELECT * FROM DETALLE_FACTURA;

/* a. Muestra, para cada material, cu�ntos productos comercializa la empresa. */
SELECT MATERIAL, COUNT(*)
FROM MERCHAN
GROUP BY MATERIAL;

/* b. Muestra cu�ntas facturas hay en cada fecha. */
SELECT FECHA, COUNT(*)
FROM FACTURA
GROUP BY FECHA;

/* c. Muestra la cantidad de facturas que haya el d�a con m�s facturas. */
SELECT MAX(COUNT(*))
FROM FACTURA
GROUP BY FECHA;
    
/* d. Muestra el d�a con la mayor cantidad de facturas (y cu�ntas facturas
      hubo ese d�a). */
SELECT FECHA, COUNT(*)
FROM FACTURA
GROUP BY FECHA
HAVING COUNT(*) = (
    SELECT MAX(COUNT(*))
    FROM FACTURA
    GROUP BY FECHA);

/* e. Muestra cu�ntas facturas tiene cada cliente (mostrar el CIF del 
      cliente). */ 
SELECT CIF_CLIENTE, COUNT(*)
FROM FACTURA
GROUP BY CIF_CLIENTE;

/* f. Muestra los clientes que tienen m�s de una factura (mostrar el CIF del
      cliente). */
SELECT CIF_CLIENTE, COUNT(*)
FROM FACTURA
GROUP BY CIF_CLIENTE
HAVING COUNT(*) > 1;

/* g. Muestra el CIF de cliente con m�s facturas. */
SELECT CIF_CLIENTE
FROM FACTURA
GROUP BY CIF_CLIENTE
HAVING COUNT(*) = (
    SELECT MAX(COUNT(*)) 
    FROM FACTURA
    GROUP BY CIF_CLIENTE);
    
/* h. Muestra cu�ntas facturas tiene cada cliente (mostrar el CIF y la 
      empresa del cliente). */
SELECT CIF, EMPRESA, COUNT(NUM_FACT)
FROM CLIENT C
INNER JOIN FACTURA F ON C.CIF = F.CIF_CLIENTE
GROUP BY CIF, EMPRESA;

SELECT CIF, EMPRESA, COUNT(NUM_FACT)
FROM CLIENT C, FACTURA F
WHERE C.CIF = F.CIF_CLIENTE
GROUP BY CIF, EMPRESA;

/* i. Muestra cu�ntas facturas tiene cada cliente (mostrar el CIF del cliente). 
      Los clientes sin facturas aparecer�n en el listado con 0 facturas. */
SELECT CIF, COUNT(NUM_FACT)
FROM CLIENT C
LEFT JOIN FACTURA F ON C.CIF = F.CIF_CLIENTE
GROUP BY CIF;

SELECT CIF, COUNT(NUM_FACT)
FROM CLIENT C, FACTURA F 
WHERE C.CIF = F.CIF_CLIENTE(+)
GROUP BY CIF;

/* j. Muestra cu�ntos productos distintos tiene cada factura (por ejemplo 
      la factura de la imagen del enunciado tendr� 3). Pon el t�tulo 
      "productos" en el listado. */
SELECT NUM_FACT, COUNT(*) "PRODUCTOS"
FROM DETALLE_FACTURA
GROUP BY NUM_FACT;

/* k. Muestra cu�ntos productos en total tiene cada factura (por ejemplo 
      la factura de la imagen del enunciado tendr� 16). Pon el t�tulo 
      "cantidad total de productos" en el listado. */
SELECT NUM_FACT, SUM(CANTIDAD) "CANTIDAD TOTAL DE PRODUCTOS"
FROM DETALLE_FACTURA
GROUP BY NUM_FACT;

/* l. Para cada producto, muestra la cantidad total vendida teniendo en cuenta 
      todas las facturas. */
SELECT PRODUCTO, SUM(CANTIDAD)
FROM DETALLE_FACTURA
GROUP BY PRODUCTO;

/* m. Para cada producto, muestra la cantidad total vendida teniendo en cuenta 
      todas las facturas. Debe verse el c�digo y la descripci�n de producto. */
SELECT M.PRODUCTO, DESCRIPCION, SUM(CANTIDAD)
FROM MERCHAN M
INNER JOIN DETALLE_FACTURA DF ON M.PRODUCTO = DF.PRODUCTO
GROUP BY M.PRODUCTO, DESCRIPCION;

SELECT M.PRODUCTO, DESCRIPCION, SUM(CANTIDAD)
FROM MERCHAN M, DETALLE_FACTURA DF
WHERE M.PRODUCTO = DF.PRODUCTO
GROUP BY M.PRODUCTO, DESCRIPCION;

/* n. Para cada c�digo de producto, muestra en cu�ntas facturas aparece. En el 
      listado deben aparecer todos los productos que comercializa la empresa, 
      aunque nunca se hayan facturado. */
SELECT M.PRODUCTO, COUNT(NUM_FACT)
FROM MERCHAN M
LEFT JOIN DETALLE_FACTURA DF ON M.PRODUCTO = DF.PRODUCTO
GROUP BY M.PRODUCTO;

SELECT M.PRODUCTO, COUNT(NUM_FACT)
FROM MERCHAN M, DETALLE_FACTURA DF
WHERE M.PRODUCTO = DF.PRODUCTO(+)
GROUP BY M.PRODUCTO;

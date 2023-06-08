/* a) Visualiza cu�ntas facturas tiene cada CIF de cliente. Si un cliente no
      tiene facturas, aparecer� en el listado con 0 facturas. */
SELECT CIF, COUNT(NUM_FACT)
FROM CLIENT C
LEFT JOIN FACTURA F ON C.CIF = F.CIF_CLIENTE
GROUP BY CIF;

-- ~ Ejercicio 16: Obtener la cantidad total de la parte P1 suministrada por el proveedor S1.

SELECT	SUM(cant)
FROM	spj
WHERE	sCod = 'S1'
AND		pCod = 'P1';

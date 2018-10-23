-- ~ Ejercicio 14: Obtener todas las parejas de números de parte tales que algún proveedor suministre las dos partes
-- ~ indicadas.

SELECT	DISTINCT spj1.pCod, spj2.pCod
FROM	spj AS spj1,
		spj AS spj2
WHERE	spj1.sCod = spj2.sCod
AND		spj1.pCod <= spj2.pCod
ORDER BY spj1.pCod, spj2.pCod;

-- ~ Ejercicio 25: Obtener los números de los proveedores que suministren por lo menos una de las partes
-- ~ suministradas por al menos uno de los proveedores que suministran por lo menos una parte roja.

SELECT	DISTINCT sCOD
FROM	spj
WHERE	pCod IN
		(SELECT	DISTINCT pCod
		FROM	spj
		WHERE	sCOD IN
				(SELECT	DISTINCT sCOD
				FROM	spj
				WHERE	pCOD IN
						(SELECT	DISTINCT pCod
						FROM	p
						WHERE	color = 'Rojo')))
ORDER BY sCod;

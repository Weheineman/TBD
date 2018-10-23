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

-- ~ Ejercicio 28: Repetir el ejercicio 23 utilizando EXISTS en la solución.
-- ~ Obtener los números de las partes suministradas a cualquier proyecto en Londres.

SELECT  pCod
FROM    spj
WHERE   EXISTS (SELECT * FROM j WHERE ciudad = 'Londres' AND spj.jCod = j.jCod);

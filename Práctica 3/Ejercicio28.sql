-- ~ Ejercicio 28: Repetir el ejercicio 23 utilizando EXISTS en la solución.
-- ~ Obtener los números de las partes suministradas a cualquier proyecto en Londres.

SELECT	DISTINCT pCod
FROM	spj
WHERE	EXISTS
		(SELECT		jCod
		 FROM		j
		 WHERE		ciudad = 'Londres'
		 AND		spj.jCod = j.jCod);

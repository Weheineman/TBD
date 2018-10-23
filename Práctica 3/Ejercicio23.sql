-- ~ Ejercicio 23: Obtener los números de las partes suministradas a cualquier proyecto en Londres.

SELECT 		DISTINCT pCod
FROM		spj
WHERE		jCod IN
			(SELECT	DISTINCT jCod
			 FROM	j
			 WHERE	ciudad = 'Londres');

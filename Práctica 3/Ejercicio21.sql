-- ~ Ejercicio 21: Obtener los nombres de los proyectos a los cuales suministra partes el proveedor S1.
SELECT 		DISTINCT jNombre
FROM		j
WHERE		jCod IN
			(SELECT		DISTINCT jCod
			 FROM		spj
			 WHERE		sCod = 'S1');

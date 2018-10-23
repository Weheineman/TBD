-- ~ Ejercicio 24: Obtener los números de los proyectos donde se utilice al menos una de las partes suministradas por el
-- ~ proveedor S1.

SELECT		DISTINCT jCod
FROM		spj
WHERE		pCod IN
			(SELECT		DISTINCT pCod
			 FROM		spj
			 WHERE		sCod = 'S1');

-- ~ Ejercicio 31: Obtener los números de los proyectos para los cuales S1 es el único proveedor.

SELECT	jCod
FROM	j
WHERE	NOT EXISTS
		(SELECT		*
		 FROM		spj
		 WHERE		spj.jCod = j.jCod
		 AND		spj.sCod <> 'S1');

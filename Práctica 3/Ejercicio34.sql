-- ~ Ejercicio 34: Eliminar todos los proyectos para los cuales no haya envíos.

DELETE
FROM	j
WHERE	NOT EXISTS
		(SELECT		*
		 FROM		spj
		 WHERE		spj.jCod = j.jCod);

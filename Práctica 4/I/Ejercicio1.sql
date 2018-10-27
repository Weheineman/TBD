-- ~ Ejercicio 1: Obtener los nombres de los clubes con presupuesto mayor que 5 millones y que hayan
-- ~ participado en competiciones de categoría igual a 2.

SELECT		DISTINCT NOM_C
FROM		CLUB
WHERE		PRESUPUESTO > 5000000
AND			EXISTS
			(SELECT 	*
			 FROM		PARTICIPACION AS p
			 WHERE		p.C# = CLUB.C#
			 AND		P# IN (SELECT P# FROM COMPETICION WHERE CATEGORIA = 2));

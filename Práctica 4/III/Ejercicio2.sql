-- ~ Ejercicio 2: Obtener los nombres de los clubes que sólo han conseguido el primer puesto.

SELECT		DISTINCT NOM_C
FROM		CLUB
WHERE		NOT EXISTS
			(SELECT		*
			 FROM		PARTICIPACION AS p
			 WHERE		p.C# = CLUB.C#
			 AND		PUESTO <> 1);

-- ~ Ejercicio 3: Obtener los nombres de los clubes que han participado en todas las competiciones.

SELECT		DISTINCT NOM_C
FROM		CLUB
WHERE		(SELECT 	COUNT(*)
			 FROM		PARTICIPACION AS P
			 WHERE		P.C# = CLUB.C#)
			=
			(SELECT 	COUNT (*)
			 FROM		COMPETICION);

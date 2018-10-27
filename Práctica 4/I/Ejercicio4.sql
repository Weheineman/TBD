-- ~ Ejercicio 4: Obtener los nombres de los clubes que participaron en las competiciones P1 y P2 (en ambas).

SELECT		DISTINCT NOM_C
FROM		CLUB
WHERE		(SELECT		COUNT(*)
			 FROM		(SELECT * FROM PARTICIPACION WHERE P# = 'P1' OR P# = 'P2')
			 WHERE		C# = CLUB.C#)
			 =
			 2;

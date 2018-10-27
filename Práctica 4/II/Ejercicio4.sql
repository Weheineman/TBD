-- ~ Ejercicio 4: Obtener los nombres de los campeonatos en que se enfrentaron jugadores de un mismo país.

SELECT		DISTINCT CNOMBRE
FROM		CAMPEONATOS
WHERE		EXISTS
			(SELECT 	*
			 FROM		PARTIDAS
			 WHERE 		C# = CAMPEONATOS.C#
			 AND		J1# IN 
						(SELECT 	J#
						 FROM		JUGADORES
						 WHERE 		NACIONALIDAD = (SELECT NACIONALIDAD FROM JUGADORES WHERE J# = J2#)));

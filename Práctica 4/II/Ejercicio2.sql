-- ~ Ejercicio 2: Obtener los nombres de los jugadores que han participado en los campeonatos 'C1' o 'C7'.

CREATE VIEW P17 AS SELECT * FROM PARTIDAS WHERE C# = 'C1' OR C# = 'C7';

SELECT		DISTINCT NOMBRE
FROM		JUGADORES
WHERE		EXISTS
			(SELECT		*
			 FROM		P17
			 WHERE		J1# = J#
			 OR			J2# = J#);

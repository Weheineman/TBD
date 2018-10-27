-- ~ Ejercicio 5: Obtener el nombre de los jugadores que no han participado en ningún campeonato.

-- ~ Se asume que cada partida ocurre en un campeonato (dado que C# es parte de la PK de PARTIDAS)

SELECT 		DISTINCT NOMBRE
FROM		JUGADORES
WHERE		NOT EXISTS
			(SELECT * FROM PARTIDAS WHERE J1# = J# OR J2# = J#);

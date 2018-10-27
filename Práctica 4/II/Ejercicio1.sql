-- ~ Ejercicio 1: Obtener los códigos, las fechas y los resultados de las partidas en las que participaron
-- ~ jugadores de Argentina en la categoría Junior.

CREATE VIEW ARPLAYERS AS SELECT J# FROM JUGADORES WHERE NACIONALIDAD = 'Argentina';

CREATE VIEW JUNIORC AS SELECT C# FROM CAMPEONATOS WHERE CATEGORIA = 'Junior';

SELECT		P#, FECHA, RESULTADO
FROM		PARTIDAS
WHERE		(J1# IN ARPLAYERS OR J2# IN ARPLAYERS)
AND			C# IN JUNIORC

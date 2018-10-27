-- ~ Ejercicio 5: Obtener el nombre y presupuesto de los clubes que no han conseguido un primer puesto.

SELECT 		DISTINCT NOM_C, PRESUPUESTO
FROM		CLUB
WHERE		NOT EXISTS
			(SELECT		*
			 FROM		PARTICIPACION
			 WHERE		C# = CLUB.C#
			 AND		PUESTO = 1);

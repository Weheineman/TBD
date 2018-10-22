-- ~ Ejercicio 18: Obtener los números de las partes suministradas a algún proyecto tales que la cantidad promedio
-- ~ suministrada sea mayor que 320.

SELECT		DISTINCT pCod
FROM 		spj
GROUP BY	pCod, jCod
HAVING		AVG(cant) >= 320;

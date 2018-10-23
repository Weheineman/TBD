-- ~ Ejercicio 17: Para cada parte suministrada a un proyecto, obtener el número de parte, el número de proyecto y la
-- ~ cantidad total correspondiente.

SELECT		pCod, jCod, SUM(cant)
FROM		spj
GROUP BY	pCod, jCod
ORDER BY	pCod, jCod;

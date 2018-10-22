-- ~ Ejercicio 6: Obtener todas las 3-uplas número de proveedor/número de parte/ número de proyecto tales que el
-- ~ proveedor, la parte y el proyecto indicados estén todos en la misma ciudad (cosituados).

SELECT DISTINCT sCod, pCod, jCod
FROM	s, p, j
WHERE	s.ciudad = p.ciudad
AND		p.ciudad = j.ciudad
ORDER BY sCod, pCod, jCod;

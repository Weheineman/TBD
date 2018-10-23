-- ~ Ejercicio 7: Obtener todas las 3-uplas número de proveedor/número de parte/ número de proyecto tales que el
-- ~ proveedor, la parte y el proyecto indicados no estén todos cosituados.

SELECT DISTINCT sCod, pCod, jCod
FROM	s, p, j
WHERE	s.ciudad <> p.ciudad
OR		s.ciudad <> j.ciudad
OR		p.ciudad <> j.ciudad
ORDER BY sCod, pCod, jCod;

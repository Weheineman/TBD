-- ~ Obtener todas las 3-uplas número de proveedor/número de parte/ número de proyecto tales que el
-- ~ proveedor, la parte y el proyecto indicados estén todos en diferente ciudad.

SELECT DISTINCT sCod, pCod, jCod
FROM	s, p, j
WHERE	s.ciudad <> p.ciudad
AND		s.ciudad <> j.ciudad
AND		p.ciudad <> j.ciudad
ORDER BY sCod, pCod, jCod;

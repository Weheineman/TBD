-- ~ Ejercicio 13: Obtener los números de los proyectos a los cuales suministra partes por lo menos un proveedor
-- ~ situado en una ciudad distinta.

SELECT 	DISTINCT j.jCod
FROM	spj, s, j 
WHERE	spj.sCod = s.sCod
AND		spj.jCod = j.jCod
AND		s.ciudad <> j.ciudad
ORDER BY j.jCod;

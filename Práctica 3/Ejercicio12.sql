-- ~ Ejercicio 12: Obtener los números de las partes suministradas a un proyecto por un proveedor situado en la misma
-- ~ ciudad que el proyecto.

SELECT DISTINCT pCod
FROM	spj, s, j
WHERE	spj.sCod = s.sCod
AND		spj.jCod = j.jCod
AND		s.ciudad = j.ciudad
ORDER BY pCod;

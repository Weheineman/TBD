-- ~ Ejercicio 11: Obtener todas las parejas de nombres de ciudad tales que un proveedor de la primera ciudad
-- ~ suministre partes a un proyecto en la segunda ciudad.

SELECT DISTINCT s.ciudad, j.ciudad
FROM	spj, s, j
WHERE	spj.sCod = s.sCod
AND		spj.jCod = j.jCod
ORDER BY s.ciudad, j.ciudad;

-- ~ Ejercicio 10: Obtener los números de las partes suministradas por un proveedor de Londres a un proyecto en
-- ~ Londres.

SELECT DISTINCT pCod
FROM	spj, s, j
WHERE	spj.sCod = s.sCod
AND		spj.jCod = j.jCod
AND		s.ciudad = 'Londres'
AND		j.ciudad = 'Londres';

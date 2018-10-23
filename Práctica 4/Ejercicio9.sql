-- ~ Ejercicio 9: Obtener los números de las partes suministradas por algún proveedor de Londres.

SELECT DISTINCT pCod
FROM	spj, s
WHERE	s.sCod = spj.sCod
AND		s.ciudad = 'Londres';

-- ~ Ejercicio 20:Obtener números de proyecto y ciudades en los cuales la segunda letra del nombre de la ciudad sea
-- ~ una "o".

SELECT		jCod, ciudad
FROM		j
WHERE		ciudad LIKE '_o%';

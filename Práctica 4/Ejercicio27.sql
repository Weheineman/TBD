-- ~ Ejercicio 27: Obtener los números de los proyectos cuya ciudad sea la primera en la lista alfabética de las ciudades
-- ~ donde hay proyectos.

SELECT	jCod
FROM	j
WHERE	ciudad = (SELECT MIN(ciudad) FROM j);

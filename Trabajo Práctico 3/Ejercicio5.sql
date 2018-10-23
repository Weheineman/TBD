-- ~ Apartado a
-- ~ Obtener los nombres de los dueños de los inmuebles.
SELECT 	nombre, apellido
FROM	Persona, PoseeInmueble
WHERE	codigo = codigo_propietario;

-- ~ Apartado b
-- ~ Obtener todos los códigos de los inmuebles cuyo precio está en el intervalo 600.000 a 700.000
-- ~ inclusive.
SELECT	codigo
FROM	Inmueble
WHERE	precio >= 600000
AND		precio <= 700000;

-- ~ Apartado c
-- ~ Obtener los nombres de los clientes que prefieran inmuebles sólo en la zona Norte de Santa Fe.
SELECT	DISTINCT nombre, apellido
FROM	Persona, PrefiereZona
WHERE	codigo = codigo_cliente
AND		codigo_cliente NOT IN
			(SELECT DISTINCT codigo_cliente
			 FROM	PrefiereZona
			 WHERE	nombre_poblacion <> "Santa Fe"
			 OR		nombre_zona <> "Norte");

-- ~ Apartado d
-- ~ Obtener los nombres de los empleados que atiendan a algún cliente que prefiera la zona Centro
-- ~ de Rosario.
SELECT	DISTINCT nombre, apellido
FROM	Persona, Cliente
WHERE	Persona.codigo = Cliente.vendedor
AND		Cliente.codigo IN
			(SELECT DISTINCT codigo_cliente
			 FROM	PrefiereZona
			 WHERE	nombre_poblacion = "Rosario"
			 AND	nombre_zona = "Centro");

-- ~ Apartado e
-- ~ Obtener los nombres de los vendedores que atienden a otros vendedores.
SELECT	DISTINCT nombre, apellido
FROM	Persona, Cliente
WHERE	Persona.codigo = Cliente.vendedor
AND		Cliente.codigo IN (SELECT DISTINCT vendedor FROM Cliente);

-- ~ Apartado f
-- ~ Obtener los nombres de los clientes que prefieran inmuebles en todas las zonas de Rosario.
SELECT	DISTINCT nombre, apellido
FROM	Persona
WHERE	codigo	IN
				(SELECT 	DISTINCT codigo_cliente
				 FROM		PrefiereZona AS pz
				 WHERE		(SELECT 		COUNT(nombre_zona)
							 FROM		 	PrefiereZona
							 WHERE			nombre_poblacion = 'Rosario'
							 AND			codigo_cliente = pz.codigo_cliente)
							 =
							(SELECT COUNT(nombre_zona)
							 FROM	Zona
							 WHERE	nombre_poblacion = "Rosario"));

-- ~ Apartado g
-- ~ Hay clientes que ya visitaron o tienen programado visitar todos los inmuebles de sus zonas favoritas
-- ~ (un cliente que no tenga zonas de preferencia no entrará en esta categorı́a).
-- ~ Para cada uno de ellos, obtener su nombre junto con información de los inmuebles (código, zona
-- ~ y precio) ubicados en zonas no preferidas por ellos pero sı́ limı́trofes a alguna de ellas.
CREATE VIEW CLIENTES_VISITADORES
AS			(SELECT		*
			 FROM		PrefiereZona, Persona AS p
			 WHERE		codigo_cliente = codigo
			 AND		NOT EXISTS
						(SELECT		*
						 FROM		Inmueble AS i
						 WHERE		(nombre_poblacion, nombre_zona) IN
									(SELECT		nombre_poblacion, nombre_zona
									 FROM		PrefiereZona
									 WHERE		codigo_cliente = p.codigo)
						 AND		NOT EXISTS
									(SELECT		*
									 FROM		Visitas
									 WHERE		codigo_cliente = p.codigo
									 AND		codigo_inmueble = i.codigo)));
-- ~ Intento fallido de seleccionar limitrofes dada una zona
SELECT * FROM(

(SELECT		nombre_poblacion, nombre_zona
 FROM		Limita
 WHERE		nombre_poblacion_2 = z.nombre_poblacion
 AND		nombre_zona_2 = z.nombre_zona)

UNION

(SELECT		nombre_poblacion_2, nombre_zona_2
 FROM		Limita
 WHERE		nombre_poblacion = z.nombre_poblacion
 AND		nombre_zona = z.nombre_zona));

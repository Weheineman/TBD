-- ~ Apartado a
SELECT 	nombre, apellido
FROM	Persona, PoseeInmueble
WHERE	codigo = codigo_propietario;

-- ~ Apartado b
SELECT	codigo
FROM	Inmueble
WHERE	precio >= 600000
AND		precio <= 700000;

-- ~ Apartado c
SELECT	DISTINCT nombre, apellido
FROM	Persona, PrefiereZona
WHERE	codigo = codigo_cliente
AND		codigo_cliente NOT IN
			(SELECT DISTINCT codigo_cliente
			 FROM	PrefiereZona
			 WHERE	nombre_poblacion <> "Santa Fe"
			 OR		nombre_zona <> "Norte");

-- ~ Apartado d
SELECT	DISTINCT nombre, apellido
FROM	Persona, Cliente
WHERE	Persona.codigo = Cliente.vendedor
AND		Cliente.codigo IN
			(SELECT DISTINCT codigo_cliente
			 FROM	PrefiereZona
			 WHERE	nombre_poblacion = "Rosario"
			 AND	nombre_zona = "Centro");

-- ~ Apartado e
SELECT	DISTINCT nombre, apellido
FROM	Persona, Cliente
WHERE	Persona.codigo = Cliente.vendedor
AND		Cliente.codigo IN (SELECT DISTINCT vendedor FROM Cliente);

-- ~ Apartado f
SELECT	DISTINCT nombre, apellido
FROM	Persona
WHERE	codigo IN
			(SELECT 	codigo_cliente
			 FROM		PrefiereZona
			 WHERE		(SELECT COUNT	(nombre_zona)
						 FROM		 	PrefiereZona
						 WHERE			codigo)
						 
(SELECT COUNT (nombre_zona)
 FROM	Zona
 WHERE	nombre_poblacion = "Rosario");


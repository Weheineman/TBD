USE Biblioteca;

INSERT INTO Autor(Nombre, Apellido, Nacionalidad, Residencia) 
	VALUES('Abelardo', 'Castillo', 'Argentina', 'Santa Fe');
INSERT INTO Autor(Nombre, Apellido, Nacionalidad, Residencia)
	VALUES('Alfredo', 'Mercurio', 'Tanzania', 'Zanzibar');

INSERT INTO Libro VALUES(69420, 'Como mudarse a Buenos Aires', 'UNR', 1000);
INSERT INTO Libro VALUES(1337, 'Mi casa de veraneo en Tanzania', 'UKNR', 100);
INSERT INTO Libro VALUES(12234, 'No me detengas ahora', 'UKR', 1000);

INSERT INTO Escribe VALUES(1, 69420, 2018);
INSERT INTO Escribe VALUES(1, 1337, 1998);
-- ~ Alfredo muere en 1991, el libro se publica un rato mas tarde. Abelardo
-- ~ completa este clasico de la literatura en 1998.
INSERT INTO Escribe VALUES(2, 1337, 1998);
INSERT INTO Escribe VALUES(2, 12234, 1978);

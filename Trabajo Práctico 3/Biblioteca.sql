CREATE DATABASE IF NOT EXISTS Biblioteca;

USE Biblioteca;

DROP TABLE IF EXISTS Escribe;
DROP TABLE IF EXISTS Autor;
DROP TABLE IF EXISTS Libro;

CREATE TABLE Autor (
	ID int NOT NULL UNIQUE AUTO_INCREMENT,
	Nombre varchar(50) NOT NULL,
	Apellido varchar(50) NOT NULL,
	Nacionalidad varchar(50),
	Residencia varchar(50),
	PRIMARY KEY (ID)
);
CREATE INDEX OrdApellido ON Autor(Apellido);

CREATE TABLE Libro (
	ISBN int NOT NULL UNIQUE,
	Titulo varchar(50) NOT NULL,
	Editorial varchar(50),
	Precio float(10, 2) NOT NULL,
	PRIMARY KEY (ISBN)
);
CREATE INDEX OrdTitulo ON Libro(Titulo);


CREATE TABLE Escribe (
	ID int NOT NULL,
	ISBN int NOT NULL,
	Año int,
	PRIMARY KEY(ID, ISBN),
	FOREIGN KEY(ID) REFERENCES Autor(ID) ON DELETE CASCADE,
	FOREIGN KEY(ISBN) REFERENCES Libro(ISBN) ON DELETE CASCADE
);

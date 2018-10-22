CREATE DATABASE PPP;

USE PPP;

-- Tabla J
CREATE TABLE IF NOT EXISTS `j` (
  `jCod` char(10) NOT NULL,
  `jNombre` char(30) NOT NULL,
  `ciudad` char(30) NOT NULL,
  PRIMARY KEY  (`jCod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `j` (`jCod`, `jNombre`, `ciudad`) VALUES ('J1', 'Clasificador', 'Paris'), ('J2', 'Perforadora', 'Roma'), ('J3', 'Lectora', 'Atenas'), ('J4', 'Consola', 'Atenas'), ('J5', 'Compaginador', 'Londres'), ('J6', 'Terminal', 'Oslo'), ('J7', 'Cinta', 'Londres');

-- Tabla P
CREATE TABLE IF NOT EXISTS `p` (
  `pCod` char(10) NOT NULL,
  `pNombre` char(30) NOT NULL,
  `color` char(30) NOT NULL,
  `peso` int(10) unsigned NOT NULL,
  `ciudad` char(30) NOT NULL,
  PRIMARY KEY  (`pCod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `p` (`pCod`, `pNombre`, `color`, `peso`, `ciudad`) VALUES ('P1', 'Tuerca', 'Rojo', 12, 'Londres'), ('P2', 'Perno', 'Verde', 17, 'Paris'), ('P3', 'Burlete', 'Azul', 17, 'Roma'), ('P4', 'Burlete', 'Rojo', 14, 'Londres'), ('P5', 'Leva', 'Azul', 12, 'Paris'), ('P6', 'Engranaje', 'Rojo', 19, 'Londres');

-- Tabla S
CREATE TABLE IF NOT EXISTS `s` (
  `sCod` char(10) NOT NULL,
  `sNombre` char(30) NOT NULL,
  `situacion` int(10) unsigned NOT NULL,
  `ciudad` char(30) NOT NULL,
  PRIMARY KEY  (`sCod`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `s` (`sCod`, `sNombre`, `situacion`, `ciudad`) VALUES ('S1', 'Salazar', 20, 'Londres'), ('S2', 'James', 10, 'Paris'), ('S3', 'Bernal', 30, 'Paris'), ('S4', 'Corona', 20, 'Londres'), ('S5', 'Aldana', 30, 'Atenas');

-- Tabla SPJ
CREATE TABLE IF NOT EXISTS `spj` (
  `sCod` char(10) NOT NULL,
  `pCod` char(10) NOT NULL,
  `jCod` char(10) NOT NULL,
  `cant` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`sCod`,`pCod`,`jCod`),
  FOREIGN KEY (`jCod`) REFERENCES `j` (`jCod`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`pCod`) REFERENCES `p` (`pCod`) ON DELETE CASCADE ON UPDATE CASCADE,
  FOREIGN KEY (`sCod`) REFERENCES `s` (`sCod`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `spj` (`sCod`, `pCod`, `jCod`, `cant`) VALUES ('S1', 'P1', 'J1', 200), ('S1', 'P1', 'J4', 700), ('S2', 'P3', 'J1', 400), ('S2', 'P3', 'J2', 200), ('S2', 'P3', 'J3', 200), ('S2', 'P3', 'J4', 500), ('S2', 'P3', 'J5', 600), ('S2', 'P3', 'J6', 400), ('S2', 'P3', 'J7', 800), ('S2', 'P5', 'J2', 100), ('S3', 'P3', 'J1', 200), ('S3', 'P4', 'J2', 500), ('S4', 'P6', 'J3', 300), ('S4', 'P6', 'J7', 300), ('S5', 'P1', 'J4', 100), ('S5', 'P2', 'J2', 200), ('S5', 'P2', 'J4', 100), ('S5', 'P3', 'J4', 200), ('S5', 'P4', 'J4', 800), ('S5', 'P5', 'J4', 400), ('S5', 'P5', 'J5', 500), ('S5', 'P5', 'J7', 100), ('S5', 'P6', 'J4', 500);
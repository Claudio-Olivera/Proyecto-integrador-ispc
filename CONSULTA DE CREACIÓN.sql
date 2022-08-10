create database Veterinaria;
use Veterinaria;

CREATE TABLE Dueno
(
  DNI INT(8) NOT NULL AUTO_INCREMENT,
  Nombre    VARCHAR (50),
  Apellido  VARCHAR (50),
  Telefono  VARCHAR (20),
  Direccion VARCHAR (50),
  PRIMARY KEY (DNI)
);

CREATE TABLE Historial
(
  ID_Historial INT(11) NOT NULL AUTO_INCREMENT,
  Fecha        DATE,
  Perro        INT(11) NOT NULL,
  Descripcion  VARCHAR(200),
  Monto        INT(11),
  PRIMARY KEY (ID_Historial)
);

CREATE TABLE Perro
(
  ID_Perro INT(11) NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Fecha_nac DATE,
  Sexo      VARCHAR (10),
  DNI_dueno INT(8) UNIQUE,
  PRIMARY KEY (ID_Perro)
);

ALTER TABLE Perro
  ADD CONSTRAINT FK_Dueno_TO_Perro
    FOREIGN KEY (DNI_dueno)
    REFERENCES Dueno (DNI);

ALTER TABLE Historial
  ADD CONSTRAINT FK_Perro_TO_Historial
    FOREIGN KEY (Perro)
    REFERENCES Perro (ID_Perro);
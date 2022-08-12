create database Veterinaria;
use Veterinaria;

CREATE TABLE Dueno
(
  DNI INT NOT NULL UNIQUE,
  Nombre    VARCHAR (100) NOT NULL,
  Apellido  VARCHAR (100) NOT NULL,
  Telefono  VARCHAR (20) NOT NULL,
  Direccion VARCHAR (100) NOT NULL,
  PRIMARY KEY (DNI)
);

CREATE TABLE Historial
(
  ID_Historial INT NOT NULL AUTO_INCREMENT,
  Fecha        DATE NOT NULL,
  Perro        INT NOT NULL,
  Descripcion  VARCHAR(250),
  Monto        FLOAT,
  PRIMARY KEY (ID_Historial)
);

CREATE TABLE Perro
(
  ID_Perro INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(50),
  Fecha_nac DATE,
  Sexo      VARCHAR (6) NOT NULL,
  DNI_dueno INT NOT NULL,
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









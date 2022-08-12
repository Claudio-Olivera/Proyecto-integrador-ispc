start transaction;

-- 1. Creacion de base y tablas

drop database IF EXISTS PELUQUERIA;
create database PELUQUERIA;
use PELUQUERIA;

CREATE TABLE Dueno
(
  DNI INT NOT NULL,
  Nombre    VARCHAR (100) NOT NULL,
  Apellido  VARCHAR (100) NOT NULL,
  Telefono  VARCHAR (14) NOT NULL,
  Direccion VARCHAR (200) NOT NULL,
  PRIMARY KEY (DNI)
);


CREATE TABLE Perro
(
  ID_Perro INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(100) NOT NULL,
  Fecha_nac DATE,
  Sexo      VARCHAR (6) NOT NULL,
  DNI_dueno INT NOT NULL,
  PRIMARY KEY (ID_Perro)
);

ALTER TABLE Perro
  ADD CONSTRAINT FK_Dueno_Perro
    FOREIGN KEY (DNI_dueno)
    REFERENCES Dueno (DNI);

CREATE TABLE Historial
(
  ID_Historial INT NOT NULL AUTO_INCREMENT,
  Fecha        DATE NOT NULL,
  Perro        INT NOT NULL,
  Descripcion  VARCHAR(2000),
  Monto        FLOAT,
  PRIMARY KEY (ID_Historial)
);

ALTER TABLE Historial
  ADD CONSTRAINT FK_Perro_Historial
    FOREIGN KEY (Perro)
    REFERENCES Perro (ID_Perro);

-- 2. Inserte en la tabla correspondiente un nuevo animal (perro) como paciente y el dueño asociado a ese animal.
-- (Primero voy a insertar el dueño, y despues el perro que lo referencia)

INSERT INTO DUENO (DNI, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (33222111,"JUAN","PEREZ",3513222111,"AV COLON 48");
INSERT INTO PERRO (NOMBRE, FECHA_NAC,SEXO,DNI_DUENO) VALUES ("FIRULAYS","2010-01-01","MACHO",33222111);

-- 4. Actualice la fecha de nacimiento de algún animal (perro) que usted considere.
SELECT * FROM PERRO;
UPDATE PERRO SET FECHA_NAC="2020-01-01" WHERE ID_PERRO=1;
SELECT * FROM PERRO;

-- 8. Insertar un nuevo registro en la tabla historial de un perro cuyo ID Perro es igual a 10.
-- (primero voy a necesitar que exista un perro con Id = 10.....)
INSERT INTO PERRO (ID_PERRO,NOMBRE, FECHA_NAC,SEXO,DNI_DUENO) VALUES (10,"PAQUITA","2015-01-01","HEMBRA",33222111);
SELECT * FROM PERRO;
-- (Ahora si puedo registrar un historial para paquita)
insert into historial (fecha, perro, descripcion, monto) values 
("2022-08-10",10,"A paquita le hicimos un baño y secado", 1500.00);
select * from historial;

rollback;





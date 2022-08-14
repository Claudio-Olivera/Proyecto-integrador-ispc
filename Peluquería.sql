create database Peluqueria;
use Peluqueria;

CREATE TABLE Dueno
(
  DNI INT NOT NULL UNIQUE,
  Nombre    VARCHAR (60) NOT NULL,
  Apellido  VARCHAR (60) NOT NULL,
  Telefono  VARCHAR (30) NOT NULL,
  Direccion VARCHAR (120) NOT NULL,
  PRIMARY KEY (DNI)
);

CREATE TABLE Historial
(
  ID_Historial INT NOT NULL AUTO_INCREMENT,
  Fecha        DATE NOT NULL,
  Perro        INT NOT NULL,
  Descripcion  VARCHAR(300),
  Monto        FLOAT,
  PRIMARY KEY (ID_Historial)
);

CREATE TABLE Perro
(
  ID_Perro INT NOT NULL AUTO_INCREMENT,
  Nombre VARCHAR(60),
  Fecha_nac DATE,
  Sexo      VARCHAR (12) NOT NULL,
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
    
    -- 2 Inserte información del nuevo animal (perro) y datos del dueño.
INSERT INTO DUENO (DNI, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (30667523,"Maximiliano","Orqueta",3515298753,"Av. de los Incas 152");
INSERT INTO Perro (NOMBRE, FECHA_NAC, SEXO, DNI_DUENO) VALUES ("Percy","2012-06-20","MACHO",30667523);
INSERT INTO Historial (FECHA, PERRO, DESCRIPCION, MONTO) VALUES ("2012-06-20","1","Baño,desparacitación",25000);

INSERT INTO DUENO (DNI, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (34005698,"Josefa","Sujatovich",34856852,"Catamarca 256");
INSERT INTO Perro (NOMBRE, FECHA_NAC, SEXO, DNI_DUENO) VALUES ("Maradona","2018-11-28","MACHO",34005698);
INSERT INTO Historial (FECHA, PERRO, DESCRIPCION, MONTO) VALUES ("2020-06-17","2","Castracion",20000);

INSERT INTO DUENO (DNI, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (45025789,"Roberto","Mancuso",29441238526,"Segurola y Habana 4310, séptimo piso");
INSERT INTO Perro (NOMBRE, FECHA_NAC, SEXO, DNI_DUENO) VALUES ("Tontita","2021-05-07","HEMBRA",45025789);
INSERT INTO Historial (FECHA, PERRO, DESCRIPCION, MONTO) VALUES ("2022-07-12","3","Desparacitación, Corte y Baño",8000);

	-- Consulta para saber datos ingresados 
select * from dueno;
select * from perro;
select * from historial;

   -- 12 Obtener todos los perros de sexo “Macho” nacidos entre 2020 y 2022.
   SELECT MACHO FROM HISTORIAL WHERE FECHA >= '2020-01-01' AND FECHA < '2022-12-31';
   
   -- 4 Actualice la fecha de nacimiento de algún animal (perro) que usted considere.
   UPDATE PERRO SET Fecha_nac='2021-05-08' WHERE NOMBRE="tontita"
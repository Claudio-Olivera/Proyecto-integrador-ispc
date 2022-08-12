create database Peluqueria;
use Peluqueria;

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
    
-- 2) Inserte en la tabla correspondiente un nuevo animal (perro) como paciente y el dueño asociado a ese animal.
INSERT INTO DUENO (DNI, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (35059357,"Claudio","Olivera",2984788433,"Pje.Pto Moreno 285");
INSERT INTO Perro (NOMBRE, FECHA_NAC, SEXO, DNI_DUENO) VALUES ("Betito","2020-02-13","MACHO",35059357);
INSERT INTO Historial (FECHA, PERRO, DESCRIPCION, MONTO) VALUES ("2022-08-14","1","Sesion belleza extra plus",2549);

INSERT INTO DUENO (DNI, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (31057842,"Maria","Fernandez",2984788432,"Alsina 1285");
INSERT INTO Perro (NOMBRE, FECHA_NAC, SEXO, DNI_DUENO) VALUES ("Lili","2006-05-12","HEMBRA",31057842);
INSERT INTO Historial (FECHA, PERRO, DESCRIPCION, MONTO) VALUES ("2009-05-12","2","Corte bajo, flequillo estrella",1500);

INSERT INTO DUENO (DNI, NOMBRE, APELLIDO, TELEFONO, DIRECCION) VALUES (34057841,"Lucia","Fernandez",5484788430,"Montevideo 4555");
INSERT INTO Perro (NOMBRE, FECHA_NAC, SEXO, DNI_DUENO) VALUES ("Pochita","2018-02-15","HEMBRA",34057841);
INSERT INTO Historial (FECHA, PERRO, DESCRIPCION, MONTO) VALUES ("2022-07-12","3","Corte recto en el lomo, patas con flecos",1500);

	-- Consulto si están los datos ingresados 
select * from dueno;
select * from perro;
select * from historial;


-- 3) Borre un animal que ya no va a ser atendido. Para ello consulte antes en el historial, algún animal que ya no sea atendido desde hace mucho tiempo.
            -- Primero consulto el historial por un animal registrado en historial antes del 2010
            SELECT * FROM HISTORIAL  WHERE fecha < '2010-00-00';
            -- Luego elimino el animal que no es atendido hace mucho tiempo (registro de Lili con id 2 eliminado)
            DELETE FROM HISTORIAL WHERE PERRO = 2 ;
            -- Consulto para ver si se elimino correctamente
            SELECT * FROM HISTORIAL  WHERE fecha < '2010-00-00' ;
            
-- 6) Obtener todos los perros que asistieron a la peluquería en 2022  (Obtengo los id perro, podria buscar tambien select * from historial, para ver los datos completos)
			SELECT PERRO FROM HISTORIAL WHERE FECHA >= '2022-00-00' AND FECHA < '2023-00-00';
            
-- 7) Obtener los ingresos percibidos en Julio del 2022 
			SELECT MONTO FROM HISTORIAL WHERE FECHA >= '2022-07-00' AND FECHA < '2022-08-00';
            
-- 9) Escriba una consulta que permita actualizar la dirección de un dueño. Su nueva dirección es Libertad 123
			SELECT DIRECCION FROM DUENO WHERE DNI='31057842';  -- (Antes del cambio de direccion)
			UPDATE DUENO SET Direccion = 'Libertad 123' WHERE DNI = '31057842';
            SELECT DIRECCION FROM DUENO WHERE DNI='31057842'; -- (Después del cambio de direccion)



/*1-Realice la consulta correspondiente para crear la tabla Perro, teniendo en cuenta sus claves foráneas y primarias.*/


CREATE DATABASE peluqueriacanina;
USE peluqueriacanina;

CREATE TABLE dueño (
DNI int PRIMARY KEY NOT NULL,
Nombre varchar(30) NOT NULL, 
Apellido varchar(25) NOT NULL, 
Telefono int NOT NULL, 
Direccion varchar(50)
);

CREATE TABLE perro (
ID_Perro int PRIMARY KEY NOT NULL auto_increment, 
Nombre varchar(30) NOT NULL, 
Fecha_nacimiento date NULL, 
Sexo varchar(15) NOT NULL,
DNI_Dueño int,
constraint fk_DNI_Dueño FOREIGN KEY(DNI_Dueño) REFERENCES Dueño(DNI)
);

CREATE TABLE historial (
ID_Historial int PRIMARY KEY  NOT NULL auto_increment,
Fecha DATETIME NOT NULL,
Descripcion varchar(200) NULL, 
Monto DOUBLE NOT NULL,
Perro int,
constraint fk_Perro FOREIGN KEY(Perro) REFERENCES Perro(ID_Perro) 
);

/*2-Inserte en la tabla correspondiente un nuevo animal (perro) como paciente y el dueño asociado a ese animal.*/

INSERT INTO peluqueriacanina.Dueño (
DNI, Nombre, Apellido, Telefono, Dirección)
VALUES(39241916, "Giselle", "Chaumont", 738920849, "Aristides Villanueva 7462");

INSERT INTO peluqueriacanina.Perro (
Nombre, Fecha_nacimiento, Sexo, DNI_dueño)
VALUES("Chicha", "2016-11-18", "Hembra", 39241916);

/*3-Borre un animal que ya no va a ser atendido. Para ello consulte antes en el historial, algún animal que ya no sea atendido desde hace mucho tiempo.*/

            DELETE FROM historial WHERE perro = 1 ;

/*9- Escriba una consulta que permita actualizar la dirección de un dueño. Su nueva dirección es Libertad 123*/
SELECT*FROM peluqueriacanina.Dueño; #Consulto los datos de los dueños

UPDATE peluqueriacanina.Dueño
SET Direccion = "Libertad 123"
WHERE DNI =39241916;

SELECT*FROM peluqueriacanina.Dueño; #Consulto los datos del dueño para verificar que cambió la dirección
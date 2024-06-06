-- Crear Base de Datos

CREATE	DATABASE DIPLOMADO

-- llamar base de datos
USE DIPLOMADO

-- crear esquema

CREATE SCHEMA practica
GO

-- crear una tabla

CREATE TABLE clases
(
	ID TINYINT,
	NOMBRE VARCHAR(50),
	FECHA_INGRESO DATE
)
GO

CREATE TABLE practica.estudiantes
(
	FECHA_PRACTICA DATE,
	ID TINYINT,
	COSTO_MATRICULA MONEY
)
GO

-- Consultar una tabla

SELECT
	*
FROM clases

-- Insertar datos

INSERT INTO clases(ID, NOMBRE, FECHA_INGRESO)
VALUES
(11,'JAIME', '2024-05-20'),
(12,'ELIANA', '2024-05-20')






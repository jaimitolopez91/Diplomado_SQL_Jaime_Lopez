CREATE DATABASE UNIVERSIDAD

USE UNIVERSIDAD

CREATE SCHEMA Administracion

CREATE TABLE Administracion.Estudiantes (
	[Documento Identidad] INT,
	Nombre_Estudiante VARCHAR(200),
	Email NVARCHAR(300),
	Fecha_Nacimiento DATE DEFAULT GETDATE(),
	Mayor_Edad BIT,
	Codigo_Zip INT,
	Latitud INT NOT NULL,
	Longitud INT NOT NULL,
	CONSTRAINT PK_Doc_Identidad PRIMARY KEY ([Documento Identidad]),
	CONSTRAINT UN_Email UNIQUE(Email)
)

CREATE TABLE Administracion.Examenes (
	Documento_ID INT,
	Fecha_Examen DATETIME,
	CONSTRAINT PK_Doc_ID PRIMARY KEY(Documento_ID),
	CONSTRAINT FK_Doc_Id_Estu_con_Doc_Id_Examenes FOREIGN KEY(Documento_ID)
	REFERENCES Administracion.Estudiantes([Documento Identidad])
)

CREATE SCHEMA Inscripciones

CREATE TABLE Inscripciones.Inscripcion_Materias(
	Codigo_Asignatura INT,
	Documento_Identidad INT,
	Horario TIME NOT NULL,
	ID_Salon INT,
	CONSTRAINT FK_Doc_Id_con_Doc_Id_Estudiantes FOREIGN KEY(Documento_Identidad)
	REFERENCES Administracion.Estudiantes([Documento Identidad])
)

CREATE SCHEMA Infraestructura

CREATE TABLE Infraestructura.Salones (
	ID_Salon INT PRIMARY KEY,
	Nombre_Edificion VARCHAR(300),
	Capacidad INT
)

--AÑADIR RESTRICCION

ALTER TABLE Inscripciones.Inscripcion_Materias
ADD CONSTRAINT FK_ID_SALON_CON_ID_SALON_SALONES FOREIGN KEY (ID_Salon)
REFERENCES Infraestructura.Salones(ID_Salon)

CREATE TABLE Infraestructura.Mantenimiento (
	ID_Salon INT,
	Horario TIME NOT NULL,
	CONSTRAINT FK_ID_SALON_SALONES_CON_ID_SALON_MANTENIMIENTO FOREIGN KEY (ID_Salon)
	REFERENCES Infraestructura.Salones(ID_Salon) 
)


-------- AÑADIR COLUMNA A UNA TABLA EXISTENTE

ALTER TABLE Infraestructura.Salones 
ADD Nombre_Salon VARCHAR(200)

select * from Infraestructura.Salones

ALTER TABLE Infraestructura.Salones 
DROP COLUMN Nombre_Salon

CREATE SCHEMA Curriculum
GO

CREATE SCHEMA Nomina
GO

CREATE TABLE Curriculum.Programas (
	Cod_Programa INT,
	Nombre_Programa VARCHAR(200),
	Fecha_Creacion DATE,
	Programa_Activo BIT,
	CONSTRAINT PK_Cod_Pro PRIMARY KEY (Cod_Programa)
)

CREATE TABLE Nomina.Asignacion_Docentes (
	Cod_Docente INT NOT NULL PRIMARY KEY,
	Nombre_Docente VARCHAR(200),
	Planta_Provisional BIT,
	Nivel_Escolaridad VARCHAR(200)
)

CREATE TABLE Nomina.Docentes (
	Cod_Docente INT,
	Cod_Asignatura int
)

CREATE TABLE Curriculum.Asignaturas (
	Codigo_Asignatura INT PRIMARY KEY,
	Nombre_Asignatura VARCHAR(200),
	Cod_Asignatura_Previa INT,
	Cod_Programa INT
)

ALTER TABLE Nomina.Docentes
ADD CONSTRAINT FK_Cod_Asig_Asignatura_con_Cod_Asig_Asignacion FOREIGN KEY (Cod_Asignatura)
REFERENCES Curriculum.Asignaturas(Codigo_Asignatura)


ALTER TABLE Curriculum.Asignaturas
ADD CONSTRAINT FK_Cod_Asig_conCod_Prograa FOREIGN KEY (Cod_Programa) REFERENCES Curriculum.Asignaturas(Codigo_Asignatura)

ALTER TABLE Curriculum.Asignaturas
ADD CONSTRAINT FK_Cod_Prog_Asignaturas_con_Cod_Prog_Prograas FOREIGN KEY (Cod_programa)
REFERENCES Curriculum.Programas(Cod_Programa)


ALTER TABLE Nomina.Docentes
ADD CONSTRAINT FK_Cod_Docente_Docentes_con_Cod_Docente_Asignacion_Docentes FOREIGN KEY (Cod_Docente)
REFERENCES Nomina.Asignacion_Docentes(Cod_Docente)

	ALTER TABLE Inscripciones.Inscripcion_Materias
	ADD CONSTRAINT FK_Cod_Asig_Inscripcion_Con_Cod_Asig_Asignaturas FOREIGN KEY (Codigo_Asignatura)
	REFERENCES Curriculum.Asignaturas (Codigo_Asignatura)

SELECT * FROM Administracion.Estudiantes

-- CREAR VISTA EN SQL SERVER

CREATE VIEW Estudiantes2
AS
SELECT
	[Documento Identidad],
	Nombre_Estudiante,
	Email,
	Fecha_Nacimiento,
	CASE	
		WHEN DATEDIFF(YEAR, Fecha_Nacimiento, GETDATE()) >= 18 THEN 'Mayor de Edad'
		ELSE 'Menor de Edad'
	END AS 'Condicional',
	Codigo_Zip,
	Latitud,
	Longitud
	FROM Administracion.Estudiantes

INSERT INTO Administracion.Estudiantes([Documento Identidad], Nombre_Estudiante, Email, Fecha_Nacimiento, Codigo_Zip, Latitud, Longitud)
VALUES
	(266, 'Jaime', 'jaime@estudiante.com.co', '1991-08-23', 1225, 233, 568),
	(255, 'Matias', 'Matias@estudiante.com.co', '2013-02-03', 1225, 233, 568)

SELECT * FROM Estudiantes2
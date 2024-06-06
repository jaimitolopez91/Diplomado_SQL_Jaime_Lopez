USE DIPLOMADO

CREATE SCHEMA Admisiones

CREATE TABLE Admisiones.Estudiantes (
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

CREATE TABLE Admisiones.Examenes (
	Documento_ID INT,
	Fecha_Examen DATETIME,
	CONSTRAINT PK_Doc_ID PRIMARY KEY(Documento_ID),
	CONSTRAINT FK_Doc_Id_Estu_con_Doc_Id_Examenes FOREIGN KEY(Documento_ID)
	REFERENCES Admisiones.Estudiantes([Documento Identidad])
)

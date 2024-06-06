CREATE DATABASE LIBRERIA
GO

CREATE SCHEMA Catalogo
GO

CREATE SCHEMA Ventas
GO

CREATE TABLE Catalogo.Autores (
	AutorID INT IDENTITY (1, 2) PRIMARY KEY,
	Nombre_Autor VARCHAR(200),
	Apellido_Autor VARCHAR(200)
)
GO

INSERT INTO Catalogo.Autores (Nombre_Autor, Apellido_Autor, Pais_Autor, Fecha_Nacimiento)
VALUES ('Edgar','Poe', 'Estados Unidos', '1809-05-23'),
('Jane', 'Austen', 'Inglaterra', '1775-01-12'),
('Miguel de Cervantes', 'Saavedra', 'España', '1547-08-17'),
('Agatha', 'Chistie', 'Inglaterra', '1890-04-05'),
('Paulo', 'Cohelo', 'Brasil', '1948-06-16'),
('Charles', 'Dickens', 'Inglaterra', '1812-11-30'),
('Ken', 'Follet', 'Inglaterra', '1949-03-27'),
('Federico', 'Garcia', 'España', '1898-07-16'),
('Gabriel', 'Garcia Marquez', 'Colombia', '1927-09-10'),
('Ernets', 'hemingway', 'Estados Unidos', '1899-12-09')

SELECT * FROM Catalogo.Autores

CREATE TABLE Catalogo.Categorias (
	 CategoriaID INT IDENTITY (1,3) PRIMARY KEY,
	 Nombre_Categoria VARCHAR(200)
)
GO

INSERT INTO Catalogo.Categorias (Nombre_Categoria)
VALUES ('Poesia'),
('Novelista'),
('Satiricos'),
('Libretista'),
('Letrista'),
('Dramaturgo'),
('Guionista'),
('Biografo'),
('Criticos'),
('Editor')

SELECT * FROM Catalogo.Categorias

CREATE TABLE Catalogo.Libros (
	LibroID INT IDENTITY (1,4) PRIMARY KEY,
	Titulo_Libro VARCHAR(200),
	AutorID INT,
	CategoriaID INT,
	Precio_Libro MONEY,
	CONSTRAINT FK_AutorID_Autores_Con_Autor_Autores FOREIGN KEY (AutorID)
	REFERENCES Catalogo.Autores(AutorID)
)
GO

INSERT INTO Catalogo.Libros (Titulo_Libro, AutorID, CategoriaID, Precio_Libro)
VALUES	('El Cuervo', 1, 4, 26000),
('Orgullo y Prejuicio', 3, 13, 45000),
('El Quijote', 5, 4, 55000),
('Muerte en el Nilo', 7, 10, 36000),
('El Alquimista', 9, 1, 27000),
('Grandes Esperanzas', 11, 16, 56000),
('Los Pilares de la Tierra', 13, 4, 88000),
('Poeta en New York', 15, 19, 63000),
('100 años de Soledad', 17, 4, 90000),
('El viejo y el Mar', 19, 4, 76000)

SELECT * FROM Catalogo.Libros

ALTER TABLE Catalogo.Libros
ADD CONSTRAINT FK_Cat_Categorias_Con_Cat_Libros FOREIGN KEY (CategoriaID)
	REFERENCES Catalogo.Categorias (CategoriaID)

CREATE TABLE Ventas.Clientes (
	ClienteID INT IDENTITY (1, 5) PRIMARY KEY,
	Nombre_Cliente VARCHAR(200),
	Apellido_Cliente VARCHAR(200),
	Correo_Cliente NVARCHAR(300) UNIQUE
)
GO

INSERT INTO Ventas.Clientes (Nombre_Cliente, Apellido_Cliente, Correo_Cliente)
VALUES ('Pedro', 'Sachez', 'pedrosan@correo.com.co'),
('Constanza', 'Sandoval', 'constasan@correo.com,co'),
('Yuliana', 'Padilla', 'padilla@correo.com.co'),
('Carolina', 'Jaramillo', 'Carojara@correo.com.co'),
('Yineth', 'Algarra', 'Yinga@correo.com.co'),
('Valentina', 'Orejuela', 'Valeore@correo.com.co'),
('Juan', 'roman', 'Romanjuan@correo.com.co'),
('Eliana', 'Lopez', 'Elopez@correo.com.co'),
('Matias', 'Torres', 'torresma@correo.com.co'),
('Martina', 'montano', 'martimo@correo.com.co')

SELECT * FROM Ventas.Clientes


CREATE TABLE Ventas.Ventas (
	VentaID INT IDENTITY (1, 1) PRIMARY KEY,
	ClienteID INT,
	Fecha_Venta DATE,
CONSTRAINT FK_Cli_ID_Ventas_Con_Cli_ID_Clientes FOREIGN KEY(ClienteID)
REFERENCES Ventas.Clientes(ClienteID)
)
GO

INSERT INTO Ventas.Ventas(ClienteID, Fecha_Venta)
VALUES (1, '2024-04-30'),
(6, '2024-03-31'),
(11, '2024-05-01'),
(16, '2024-05-15'),
(21, '2024-06-01'),
(26, '2024-02-28'),
(31, '2024-01-18'),
(36, '2024-06-02'),
(41, '2024-05-22'),
(46, '2024-04-29')

SELECT * FROM Ventas.Ventas

CREATE TABLE Ventas.DetalleVenta (
	DetalleID INT PRIMARY KEY,
	VentaID INT,
	LibroID INT,
	Cantidad INT,
	Precio_Venta MONEY
)
GO

INSERT INTO Ventas.DetalleVenta (ID_Detalle, VentaID, LibroID, Cantidad, Precio_Venta)
VALUES (256, 1, 1, 1, 26000),
(365, 2, 5, 2, 90000),
(652, 3, 9, 1, 55000),
(214, 4, 13, 1, 36000),
(874, 5, 17, 1, 27000),
(325, 6, 21, 1, 56000),
(951, 7, 25, 1, 88000),
(423, 8, 29, 1, 63000),
(023, 9, 33, 1, 90000),
(528, 10, 37, 1, 76000)

SELECT * FROM Ventas.DetalleVenta


ALTER TABLE Ventas.DetalleVenta
ADD CONSTRAINT FK_Venta_ID_DetalleVentas_Con__VentaID_Ventas FOREIGN KEY(VentaID)
REFERENCES Ventas.Ventas(VentaID)

ALTER TABLE Ventas.DetalleVenta
ADD CONSTRAINT FK_Libro_ID_Libros_Con_Libro_ID_Detalle FOREIGN KEY(LibroID)
REFERENCES Catalogo.Libros(LibroID)

EXEC sp_rename 'Ventas.DetalleVenta.DetalleID', 'ID_Detalle', 'COLUMN';


EXEC sp_rename 'Ventas.Ventas.VentaID', 'ID_Venta', 'COLUMN';


EXEC sp_rename 'Catalogo.Categorias.CategoriaID', 'ID_Categoria', 'COLUMN';

ALTER TABLE Catalogo.Autores
ADD Pais_Autor VARCHAR(200),
	Fecha_Nacimiento DATE;

ALTER TABLE Ventas.Ventas
ADD ID_Vendedor INT,
	ID_Tienda INT;
	















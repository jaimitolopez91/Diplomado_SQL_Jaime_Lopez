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

CREATE TABLE Catalogo.Categorias (
	 CategoriaID INT IDENTITY (1,3) PRIMARY KEY,
	 Nombre_Categoria VARCHAR(200)
)
GO

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

CREATE TABLE Ventas.Ventas (
	VentaID INT IDENTITY (1, 1) PRIMARY KEY,
	ClienteID INT,
	Fecha_Venta DATE,
CONSTRAINT FK_Cli_ID_Ventas_Con_Cli_ID_Clientes FOREIGN KEY(ClienteID)
REFERENCES Ventas.Clientes(ClienteID)
)
GO

CREATE TABLE Ventas.DetalleVenta (
	DetalleID INT PRIMARY KEY,
	VentaID INT,
	LibroID INT,
	Cantidad INT,
	Precio_Venta MONEY
)
GO

SELECT * FROM Ventas.DetalleVenta


ALTER TABLE Ventas.Ventas
ADD CONSTRAINT FK_Libro_ID_Ventas_Con_Libro_ID_Detalle FOREIGN KEY(LibroID)
REFERENCES Ventas.DetalleVenta(LibroID)

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
	















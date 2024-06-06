CREATE DATABASE JIMP_INGENIERIA
GO

USE JIMP_INGENIERIA
GO

CREATE SCHEMA JIMP_1
GO

CREATE SCHEMA JIMP_2
GO


CREATE TABLE clientes 
(
	id_cliente int PRIMARY KEY NOT NULL,
    nombre_cliente varchar(50) NOT NULL,
    apellido_cliente varchar(50) NOT NULL,
    tipo_documento int,
    numero_documeto varchar(20) NOT NULL,
    telefono_cliente varchar(20) NOT NULL,
    pais_cliente varchar(50) DEFAULT NULL,
    ciudad_cliente int DEFAULT NULL,
    direccion_cliente nvarchar(100) UNIQUE NOT NULL,
    email_cliente nvarchar(100) UNIQUE NOT NULL    
)
GO

INSERT INTO clientes ( id_cliente, nombre_cliente, apellido_cliente, tipo_documento, numero_documeto, telefono_cliente, pais_cliente, ciudad_cliente, direccion_cliente, email_cliente)
VALUES (1, 'Ruben Dario', 'Pineda Olmedo', 10, '16485235', '6023375932', 'Colombia', 2, 'cra 49 14 75', 'rudapiol@gmail.com'),
(2, 'Jorge Ivan', 'Mosquera Palacios', 10, '1144256387', '3115986204', 'Colombia', 2, 'cra 62 48 58', 'ingmosquera@hotmail.com'),
(3, 'Maria', 'Rojas Perez', 10, '27568324', '3158642635', 'Colombia', 2, 'Calle 15 86 32', 'marope14@gmail.com'),
(4, 'Ladrillera', 'Manantiales', 15, '800953147', '6028859412', 'Colombia', 5, 'transversal 5 10 100', 'Ladrimatantiales@gmaiL.com'),
(5, 'John Jairo', 'Cardenas Ome', 10, '1143985021', '3207546923', 'Colombia', 2, 'Diagonal 27 26 06', 'Johncar90@hotmail.com')

SELECT * FROM clientes

CREATE TABLE pedidos 
(
	id_pedidos int IDENTITY (1, 2) PRIMARY KEY,
	description nvarchar(200),
	fecha_pedido date default getdate(),
	id_cliente int DEFAULT NULL, 
	CONSTRAINT FK_pedidos FOREIGN KEY (id_cliente)
	REFERENCES clientes (id_cliente)
)
GO

INSERT INTO pedidos (description, id_cliente)
VALUES ('CAMARAS DE SEGURIDAD', 3),
('Instalacion de Sala', 1),
('5 Camaras e instalacion', 2),
('4 censores de movimiento e instalacion', 5),
('Instalacion de servidor', 5)

SELECT * FROM pedidos

CREATE TABLE servicios
(
	id_servicio int NOT NULL,
	tipo_servicio varchar(200) NOT NULL,
	PRIMARY KEY (id_servicio)
)
GO

INSERT INTO servicios (id_servicio, tipo_servicio)
VALUES (0453, 'instalacion de sala'),
(0489, 'Instalacion de Camaras de Seguridad HD'),
(0736, 'Instalacion de Censores de movimiento'),
(0423, 'Instalacion de servidor')

SELECT * FROM servicios

CREATE TABLE instalacion
(
	id_instalacion int PRIMARY KEY  NOT NULL,
	fecha_instalacion date NOT NULL,
	id_servicio int DEFAULT NULL,
	CONSTRAINT FK_instalacion FOREIGN KEY (id_servicio) 
	REFERENCES servicios (id_servicio)
)
GO

INSERT INTO instalacion (id_instalacion, fecha_instalacion, id_servicio)
VALUES (1956, '2023-10-20', 0453),
(3856, '2023-10-05', 0489),
(3855, '2023-10-10', 0736),
(5686, '2023-10-19', 0423)

SELECT * FROM instalacion

CREATE TABLE envio
(
  id_envio int PRIMARY KEY NOT NULL,
  fecha_envio date NOT NULL,
  id_instalacion int DEFAULT NULL,
  CONSTRAINT FK_envio FOREIGN KEY (id_instalacion) 
  REFERENCES instalacion (id_instalacion)
)
GO

INSERT INTO envio (id_envio, fecha_envio, id_instalacion)
VALUES (2310, '2023-10-21', 1956),
(2315, '2023-10-06', 3856),
(2317, '2023-10-11', 3855),
(2318, '2023-10-20', 5686)

SELECT * FROM envio

CREATE TABLE producto
(
  id_producto int NOT NULL,
  cantidad FLOAT NOT NULL,
  tipo_producto varchar(100) DEFAULT NULL,
  PRIMARY KEY (id_producto)
)
GO

INSERT INTO producto (id_producto, cantidad, tipo_producto)
VALUES (0153, 3.5, 'Camaras de Seguridad'),
(0154, 5, 'Camaras de Seguridad HD'),
(0356, 4, 'Censores de movimiento')

SELECT * FROM producto

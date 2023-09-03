/*
Código realizado por: Juan Bladimir Romero Collazos
*/

CREATE DATABASE LuminousHorizons
GO

USE LuminousHorizons
GO

CREATE TABLE Clientes (
    Id_cliente				INT					 NOT NULL		PRIMARY KEY,
    Nombre					VARCHAR(50)			 NOT NULL,
    Apellido				VARCHAR(50)			 NOT NULL,
    Genero					VARCHAR(10)			 NOT NULL,
    Fecha_nacimiento		SMALLDATETIME		 NOT NULL,
    Direccion				VARCHAR(200)		 NOT NULL,
    Estado_o_Provincia		VARCHAR(50)		     NOT NULL,
    Codigo_postal			VARCHAR(10)			 NOT NULL,
    Pais					VARCHAR(25)			 NOT NULL,
    Numero_de_telefono		VARCHAR(20)			 NULL,
    Correo_electronico		VARCHAR(50)			 NULL
)
GO

CREATE TABLE Empleados (
    Id_empleado					INT					NOT NULL		PRIMARY KEY,
    Nombre						VARCHAR(50)			NOT NULL,
    Apellido					VARCHAR(50)			NOT NULL,
    Puesto						VARCHAR(50)			NOT NULL,
    Fecha_de_contratacion		SMALLDATETIME		NOT NULL,
    Numero_de_telefono			VARCHAR(20)			NULL,
    Correo_electronico			VARCHAR(50)			NULL
)
GO

CREATE TABLE Viajes (
    Id_viaje						INT					NOT NULL		PRIMARY KEY,
    Destino							VARCHAR(25)			NOT NULL,
    Fecha_de_salida					SMALLDATETIME		NOT NULL,
    Fecha_de_regreso				SMALLDATETIME		NOT NULL,
    Precio_por_pasajero				DECIMAL(10,2)		NOT NULL,
    Disponibilidad_de_plazas		CHAR(2)				NOT NULL,
    Descripcion_del_viaje			VARCHAR(225)		NULL,
    Tipo_de_viaje					VARCHAR(100)		NOT NULL,
    Hotel							VARCHAR(100)		NULL,
    Itinerario						VARCHAR(225)		NULL,
	Id_empleado						INT					NULL,

    CONSTRAINT	FK_EMPLEADOS_VIAJES
    FOREIGN KEY	(Id_empleado)
    REFERENCES	Empleados (Id_empleado)
)
GO

CREATE TABLE Reservas (
    Id_reserva				INT					NOT NULL	 PRIMARY KEY,
    Id_cliente				INT					NOT NULL,
    Id_viaje				INT					NOT NULL,
    Fecha_de_reserva		SMALLDATETIME		NOT NULL,
    Fecha_de_viaje			SMALLDATETIME		NOT NULL,
    Destino					VARCHAR(25)			NOT NULL,
    Numero_de_pasajero		INT					NOT NULL,
    Estado_de_la_reserva	VARCHAR(25)			NOT NULL,
    Precio_total			DECIMAL(10,2)		NOT NULL,
    
    CONSTRAINT	FK_CLIENTES_RESERVAS
    FOREIGN KEY	(Id_cliente)
    REFERENCES	Clientes (Id_cliente),

    CONSTRAINT	FK_VIAJES_RESERVAS
    FOREIGN KEY	(Id_viaje)
    REFERENCES	Viajes (Id_viaje)
)
GO
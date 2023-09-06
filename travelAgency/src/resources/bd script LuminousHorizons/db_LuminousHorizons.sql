USE [master]
GO
/****** Object:  Database [LuminousHorizons]    Script Date: 04/09/2023 23:30:26 ******/
CREATE DATABASE [LuminousHorizons]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LuminousHorizons', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER_DEV2022\MSSQL\DATA\LuminousHorizons.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LuminousHorizons_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER_DEV2022\MSSQL\DATA\LuminousHorizons_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [LuminousHorizons] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LuminousHorizons].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LuminousHorizons] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LuminousHorizons] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LuminousHorizons] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LuminousHorizons] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LuminousHorizons] SET ARITHABORT OFF 
GO
ALTER DATABASE [LuminousHorizons] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LuminousHorizons] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LuminousHorizons] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LuminousHorizons] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LuminousHorizons] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LuminousHorizons] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LuminousHorizons] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LuminousHorizons] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LuminousHorizons] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LuminousHorizons] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LuminousHorizons] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LuminousHorizons] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LuminousHorizons] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LuminousHorizons] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LuminousHorizons] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LuminousHorizons] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LuminousHorizons] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LuminousHorizons] SET RECOVERY FULL 
GO
ALTER DATABASE [LuminousHorizons] SET  MULTI_USER 
GO
ALTER DATABASE [LuminousHorizons] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LuminousHorizons] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LuminousHorizons] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LuminousHorizons] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LuminousHorizons] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LuminousHorizons] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LuminousHorizons', N'ON'
GO
ALTER DATABASE [LuminousHorizons] SET QUERY_STORE = ON
GO
ALTER DATABASE [LuminousHorizons] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [LuminousHorizons]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 04/09/2023 23:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[Id_cliente] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Genero] [varchar](10) NOT NULL,
	[Fecha_nacimiento] [smalldatetime] NOT NULL,
	[Direccion] [varchar](200) NOT NULL,
	[Estado_o_Provincia] [varchar](50) NOT NULL,
	[Codigo_postal] [varchar](10) NOT NULL,
	[Pais] [varchar](25) NOT NULL,
	[Numero_de_telefono] [varchar](20) NULL,
	[Correo_electronico] [varchar](50) NULL,
	[Id_usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 04/09/2023 23:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[Id_empleado] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Puesto] [varchar](50) NOT NULL,
	[Fecha_de_contratacion] [smalldatetime] NOT NULL,
	[Numero_de_telefono] [varchar](20) NULL,
	[Correo_electronico] [varchar](50) NULL,
	[Id_usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 04/09/2023 23:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[Id_reserva] [int] NOT NULL,
	[Id_cliente] [int] NOT NULL,
	[Id_viaje] [int] NOT NULL,
	[Fecha_de_reserva] [smalldatetime] NOT NULL,
	[Fecha_de_viaje] [smalldatetime] NOT NULL,
	[Destino] [varchar](25) NOT NULL,
	[Numero_de_pasajero] [int] NOT NULL,
	[Estado_de_la_reserva] [varchar](25) NOT NULL,
	[Precio_total] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 04/09/2023 23:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[Id_usuario] [int] NOT NULL,
	[Nombre_de_usuario] [nvarchar](50) NOT NULL,
	[Contrasena_hash] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Viajes]    Script Date: 04/09/2023 23:30:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Viajes](
	[Id_viaje] [int] NOT NULL,
	[Destino] [varchar](25) NOT NULL,
	[Fecha_de_salida] [smalldatetime] NOT NULL,
	[Fecha_de_regreso] [smalldatetime] NOT NULL,
	[Precio_por_pasajero] [decimal](10, 2) NOT NULL,
	[Disponibilidad_de_plazas] [char](2) NOT NULL,
	[Descripcion_del_viaje] [varchar](225) NULL,
	[Tipo_de_viaje] [varchar](100) NOT NULL,
	[Hotel] [varchar](100) NULL,
	[Itinerario] [varchar](225) NULL,
	[Id_empleado] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_viaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Usuarios] ([Id_usuario], [Nombre_de_usuario], [Contrasena_hash]) VALUES (1, N'Admin', N'11d13ab2f1f3aeec89d72497628c1154362643ffde14a49c729cc83891e55f63:4231a96339998951571a9d9977e72fa5')
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Usuarios__654243EE846924A4]    Script Date: 04/09/2023 23:30:27 ******/
ALTER TABLE [dbo].[Usuarios] ADD UNIQUE NONCLUSTERED 
(
	[Nombre_de_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuarios] ([Id_usuario])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([Id_usuario])
REFERENCES [dbo].[Usuarios] ([Id_usuario])
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_CLIENTES_RESERVAS] FOREIGN KEY([Id_cliente])
REFERENCES [dbo].[Clientes] ([Id_cliente])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_CLIENTES_RESERVAS]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_VIAJES_RESERVAS] FOREIGN KEY([Id_viaje])
REFERENCES [dbo].[Viajes] ([Id_viaje])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_VIAJES_RESERVAS]
GO
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD  CONSTRAINT [FK_EMPLEADOS_VIAJES] FOREIGN KEY([Id_empleado])
REFERENCES [dbo].[Empleados] ([Id_empleado])
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [FK_EMPLEADOS_VIAJES]
GO
USE [master]
GO
ALTER DATABASE [LuminousHorizons] SET  READ_WRITE 
GO

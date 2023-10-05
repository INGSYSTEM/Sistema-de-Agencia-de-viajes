CREATE DATABASE [LuminousHorizons]
GO
USE [LuminousHorizons]
GO
/****** Object:  User [TestLuminousHorizons]    Script Date: 05/10/2023 15:49:54 ******/
CREATE USER [TestLuminousHorizons] FOR LOGIN [TestLuminousHorizons] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TestLuminousHorizons]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [TestLuminousHorizons]
GO
/****** Object:  Table [dbo].[ASIENTO]    Script Date: 05/10/2023 15:49:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ASIENTO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vuelo_id] [int] NOT NULL,
	[numero_asiento] [int] NOT NULL,
	[clase] [varchar](50) NOT NULL,
	[ocupado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 05/10/2023 15:49:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENTE](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](255) NOT NULL,
	[apellido] [varchar](255) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[contrasena] [varbinary](255) NOT NULL,
	[genero] [varchar](25) NOT NULL,
	[trabajaEmpresa] [tinyint] NOT NULL,
	[codeVerificacion] [varchar](6) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DESTINO]    Script Date: 05/10/2023 15:49:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DESTINO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_destino] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESERVA]    Script Date: 05/10/2023 15:49:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESERVA](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NOT NULL,
	[vuelo_id] [int] NOT NULL,
	[fecha_reserva] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESERVA Y DESTINO]    Script Date: 05/10/2023 15:49:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESERVA Y DESTINO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NOT NULL,
	[destino_id] [int] NOT NULL,
	[fecha_reserva] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[VUELO]    Script Date: 05/10/2023 15:49:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VUELO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[origen] [varchar](255) NOT NULL,
	[destino_id] [int] NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[capacidad] [int] NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] ON 
GO
INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [usuario], [contrasena], [genero], [trabajaEmpresa], [codeVerificacion]) VALUES (1, N'Juan Bladimir', N'Romero Collazos', N'juanromerocollazos@gmail.com', N'Admin', 0x3ACA4A331944E44471E93EABED5F6933266B79F036A9FF3294AD79CC0692A807, N'hombre', 3, NULL)
GO
INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [usuario], [contrasena], [genero], [trabajaEmpresa], [codeVerificacion]) VALUES (2, N'Briggitte del Milagro', N'Martinez Vidaurre', N'U22232825@utp.edu.pe', N'Clown', 0x5DDE754BF124B8D46F66F56C133644EE12763744B63AD54EABB06D37CC515779, N'mujer', 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] OFF
GO
SET IDENTITY_INSERT [dbo].[DESTINO] ON 
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (1, N'Lima, Perú')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (2, N'París, Francia')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (3, N'Nueva York, Estados Unidos')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (4, N'Roma, Italia')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (5, N'Tokio, Japón')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (6, N'Sídney, Australia')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (7, N'Londres, Reino Unido')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (8, N'Madrid, España')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (9, N'Río de Janeiro, Brasil')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (10, N'Ciudad de México, México')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (11, N'Toronto, Canadá')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (12, N'Atenas, Grecia')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (13, N'Bangkok, Tailandia')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (14, N'Dubái, Emiratos Árabes Unidos')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (15, N'Cairo, Egipto')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (16, N'Copenhague, Dinamarca')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (17, N'Ámsterdam, Países Bajos')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (18, N'Viena, Austria')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (19, N'Berlín, Alemania')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (20, N'Buenos Aires, Argentina')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (21, N'San Francisco, Estados Unidos')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (22, N'Seúl, Corea del Sur')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (23, N'Moscú, Rusia')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (24, N'Oslo, Noruega')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (25, N'Estocolmo, Suecia')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (26, N'Praga, República Checa')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (27, N'Varsovia, Polonia')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (28, N'Budapest, Hungría')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (29, N'Dublín, Irlanda')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (30, N'Helsinki, Finlandia')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (31, N'Singapur')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (32, N'Kuala Lumpur, Malasia')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (33, N'Sevilla, España')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (34, N'Venecia, Italia')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (35, N'Estambul, Turquía')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (36, N'Ámsterdam, Países Bajos')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (37, N'Río de Janeiro, Brasil')
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino]) VALUES (38, N'Bogotá, Colombia')
GO
SET IDENTITY_INSERT [dbo].[DESTINO] OFF
GO
SET IDENTITY_INSERT [dbo].[VUELO] ON 
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1, N'París, Francia', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (2, N'Nueva York, Estados Unidos', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (3, N'Roma, Italia', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (4, N'Tokio, Japón', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (5, N'Sídney, Australia', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (6, N'Londres, Reino Unido', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (7, N'Madrid, España', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (8, N'Río de Janeiro, Brasil', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (9, N'Ciudad de México, México', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (10, N'Toronto, Canadá', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (11, N'Atenas, Grecia', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (12, N'Bangkok, Tailandia', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (13, N'Dubái, Emiratos Árabes Unidos', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (14, N'Cairo, Egipto', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (15, N'Copenhague, Dinamarca', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (16, N'Ámsterdam, Países Bajos', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (17, N'Viena, Austria', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (18, N'Berlín, Alemania', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (19, N'Buenos Aires, Argentina', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (20, N'San Francisco, Estados Unidos', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (21, N'Seúl, Corea del Sur', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (22, N'Moscú, Rusia', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (23, N'Oslo, Noruega', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (24, N'Estocolmo, Suecia', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (25, N'Praga, República Checa', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (26, N'Varsovia, Polonia', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (27, N'Budapest, Hungría', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (28, N'Dublín, Irlanda', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (29, N'Helsinki, Finlandia', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (30, N'Singapur', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (31, N'Kuala Lumpur, Malasia', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (32, N'Sevilla, España', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (33, N'Venecia, Italia', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (34, N'Estambul, Turquía', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (35, N'Ámsterdam, Países Bajos', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (36, N'Río de Janeiro, Brasil', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (37, N'Bogotá, Colombia', 1, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (38, N'Lima, Perú', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (39, N'Nueva York, Estados Unidos', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (40, N'Roma, Italia', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (41, N'Tokio, Japón', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (42, N'Sídney, Australia', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (43, N'Londres, Reino Unido', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (44, N'Madrid, España', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (45, N'Río de Janeiro, Brasil', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (46, N'Ciudad de México, México', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (47, N'Toronto, Canadá', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (48, N'Atenas, Grecia', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (49, N'Bangkok, Tailandia', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (50, N'Dubái, Emiratos Árabes Unidos', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (51, N'Cairo, Egipto', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (52, N'Copenhague, Dinamarca', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (53, N'Ámsterdam, Países Bajos', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (54, N'Viena, Austria', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (55, N'Berlín, Alemania', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (56, N'Buenos Aires, Argentina', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (57, N'San Francisco, Estados Unidos', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (58, N'Seúl, Corea del Sur', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (59, N'Moscú, Rusia', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (60, N'Oslo, Noruega', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (61, N'Estocolmo, Suecia', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (62, N'Praga, República Checa', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (63, N'Varsovia, Polonia', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (64, N'Budapest, Hungría', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (65, N'Dublín, Irlanda', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (66, N'Helsinki, Finlandia', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (67, N'Singapur', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (68, N'Kuala Lumpur, Malasia', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (69, N'Sevilla, España', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (70, N'Venecia, Italia', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (71, N'Estambul, Turquía', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (72, N'Ámsterdam, Países Bajos', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (73, N'Río de Janeiro, Brasil', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (74, N'Bogotá, Colombia', 2, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (75, N'Lima, Perú', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (76, N'París, Francia', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (77, N'Roma, Italia', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (78, N'Tokio, Japón', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (79, N'Sídney, Australia', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (80, N'Londres, Reino Unido', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (81, N'Madrid, España', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (82, N'Río de Janeiro, Brasil', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (83, N'Ciudad de México, México', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (84, N'Toronto, Canadá', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (85, N'Atenas, Grecia', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (86, N'Bangkok, Tailandia', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (87, N'Dubái, Emiratos Árabes Unidos', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (88, N'Cairo, Egipto', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (89, N'Copenhague, Dinamarca', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (90, N'Ámsterdam, Países Bajos', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (91, N'Viena, Austria', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (92, N'Berlín, Alemania', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (93, N'Buenos Aires, Argentina', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (94, N'San Francisco, Estados Unidos', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (95, N'Seúl, Corea del Sur', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (96, N'Moscú, Rusia', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (97, N'Oslo, Noruega', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (98, N'Estocolmo, Suecia', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (99, N'Praga, República Checa', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (100, N'Varsovia, Polonia', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (101, N'Budapest, Hungría', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (102, N'Dublín, Irlanda', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (103, N'Helsinki, Finlandia', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (104, N'Singapur', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (105, N'Kuala Lumpur, Malasia', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (106, N'Sevilla, España', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (107, N'Venecia, Italia', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (108, N'Estambul, Turquía', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (109, N'Ámsterdam, Países Bajos', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (110, N'Río de Janeiro, Brasil', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (111, N'Bogotá, Colombia', 3, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (112, N'Lima, Perú', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (113, N'París, Francia', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (114, N'Nueva York, Estados Unidos', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (115, N'Tokio, Japón', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (116, N'Sídney, Australia', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (117, N'Londres, Reino Unido', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (118, N'Madrid, España', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (119, N'Río de Janeiro, Brasil', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (120, N'Ciudad de México, México', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (121, N'Toronto, Canadá', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (122, N'Atenas, Grecia', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (123, N'Bangkok, Tailandia', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (124, N'Dubái, Emiratos Árabes Unidos', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (125, N'Cairo, Egipto', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (126, N'Copenhague, Dinamarca', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (127, N'Ámsterdam, Países Bajos', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (128, N'Viena, Austria', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (129, N'Berlín, Alemania', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (130, N'Buenos Aires, Argentina', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (131, N'San Francisco, Estados Unidos', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (132, N'Seúl, Corea del Sur', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (133, N'Moscú, Rusia', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (134, N'Oslo, Noruega', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (135, N'Estocolmo, Suecia', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (136, N'Praga, República Checa', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (137, N'Varsovia, Polonia', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (138, N'Budapest, Hungría', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (139, N'Dublín, Irlanda', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (140, N'Helsinki, Finlandia', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (141, N'Singapur', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (142, N'Kuala Lumpur, Malasia', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (143, N'Sevilla, España', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (144, N'Venecia, Italia', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (145, N'Estambul, Turquía', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (146, N'Ámsterdam, Países Bajos', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (147, N'Río de Janeiro, Brasil', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (148, N'Bogotá, Colombia', 4, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (149, N'Lima, Perú', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (150, N'París, Francia', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (151, N'Nueva York, Estados Unidos', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (152, N'Roma, Italia', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (153, N'Sídney, Australia', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (154, N'Londres, Reino Unido', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (155, N'Madrid, España', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (156, N'Río de Janeiro, Brasil', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (157, N'Ciudad de México, México', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (158, N'Toronto, Canadá', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (159, N'Atenas, Grecia', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (160, N'Bangkok, Tailandia', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (161, N'Dubái, Emiratos Árabes Unidos', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (162, N'Cairo, Egipto', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (163, N'Copenhague, Dinamarca', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (164, N'Ámsterdam, Países Bajos', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (165, N'Viena, Austria', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (166, N'Berlín, Alemania', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (167, N'Buenos Aires, Argentina', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (168, N'San Francisco, Estados Unidos', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (169, N'Seúl, Corea del Sur', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (170, N'Moscú, Rusia', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (171, N'Oslo, Noruega', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (172, N'Estocolmo, Suecia', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (173, N'Praga, República Checa', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (174, N'Varsovia, Polonia', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (175, N'Budapest, Hungría', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (176, N'Dublín, Irlanda', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (177, N'Helsinki, Finlandia', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (178, N'Singapur', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (179, N'Kuala Lumpur, Malasia', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (180, N'Sevilla, España', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (181, N'Venecia, Italia', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (182, N'Estambul, Turquía', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (183, N'Ámsterdam, Países Bajos', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (184, N'Río de Janeiro, Brasil', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (185, N'Bogotá, Colombia', 5, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (186, N'Lima, Perú', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (187, N'París, Francia', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (188, N'Nueva York, Estados Unidos', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (189, N'Roma, Italia', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (190, N'Tokio, Japón', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (191, N'Londres, Reino Unido', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (192, N'Madrid, España', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (193, N'Río de Janeiro, Brasil', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (194, N'Ciudad de México, México', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (195, N'Toronto, Canadá', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (196, N'Atenas, Grecia', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (197, N'Bangkok, Tailandia', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (198, N'Dubái, Emiratos Árabes Unidos', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (199, N'Cairo, Egipto', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (200, N'Copenhague, Dinamarca', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (201, N'Ámsterdam, Países Bajos', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (202, N'Viena, Austria', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (203, N'Berlín, Alemania', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (204, N'Buenos Aires, Argentina', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (205, N'San Francisco, Estados Unidos', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (206, N'Seúl, Corea del Sur', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (207, N'Moscú, Rusia', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (208, N'Oslo, Noruega', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (209, N'Estocolmo, Suecia', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (210, N'Praga, República Checa', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (211, N'Varsovia, Polonia', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (212, N'Budapest, Hungría', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (213, N'Dublín, Irlanda', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (214, N'Helsinki, Finlandia', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (215, N'Singapur', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (216, N'Kuala Lumpur, Malasia', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (217, N'Sevilla, España', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (218, N'Venecia, Italia', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (219, N'Estambul, Turquía', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (220, N'Ámsterdam, Países Bajos', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (221, N'Río de Janeiro, Brasil', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (222, N'Bogotá, Colombia', 6, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (223, N'Lima, Perú', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (224, N'París, Francia', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (225, N'Nueva York, Estados Unidos', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (226, N'Roma, Italia', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (227, N'Tokio, Japón', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (228, N'Sídney, Australia', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (229, N'Madrid, España', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (230, N'Río de Janeiro, Brasil', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (231, N'Ciudad de México, México', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (232, N'Toronto, Canadá', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (233, N'Atenas, Grecia', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (234, N'Bangkok, Tailandia', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (235, N'Dubái, Emiratos Árabes Unidos', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (236, N'Cairo, Egipto', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (237, N'Copenhague, Dinamarca', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (238, N'Ámsterdam, Países Bajos', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (239, N'Viena, Austria', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (240, N'Berlín, Alemania', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (241, N'Buenos Aires, Argentina', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (242, N'San Francisco, Estados Unidos', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (243, N'Seúl, Corea del Sur', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (244, N'Moscú, Rusia', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (245, N'Oslo, Noruega', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (246, N'Estocolmo, Suecia', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (247, N'Praga, República Checa', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (248, N'Varsovia, Polonia', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (249, N'Budapest, Hungría', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (250, N'Dublín, Irlanda', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (251, N'Helsinki, Finlandia', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (252, N'Singapur', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (253, N'Kuala Lumpur, Malasia', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (254, N'Sevilla, España', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (255, N'Venecia, Italia', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (256, N'Estambul, Turquía', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (257, N'Ámsterdam, Países Bajos', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (258, N'Río de Janeiro, Brasil', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (259, N'Bogotá, Colombia', 7, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (260, N'Lima, Perú', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (261, N'París, Francia', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (262, N'Nueva York, Estados Unidos', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (263, N'Roma, Italia', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (264, N'Tokio, Japón', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (265, N'Sídney, Australia', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (266, N'Londres, Reino Unido', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (267, N'Río de Janeiro, Brasil', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (268, N'Ciudad de México, México', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (269, N'Toronto, Canadá', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (270, N'Atenas, Grecia', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (271, N'Bangkok, Tailandia', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (272, N'Dubái, Emiratos Árabes Unidos', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (273, N'Cairo, Egipto', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (274, N'Copenhague, Dinamarca', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (275, N'Ámsterdam, Países Bajos', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (276, N'Viena, Austria', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (277, N'Berlín, Alemania', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (278, N'Buenos Aires, Argentina', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (279, N'San Francisco, Estados Unidos', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (280, N'Seúl, Corea del Sur', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (281, N'Moscú, Rusia', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (282, N'Oslo, Noruega', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (283, N'Estocolmo, Suecia', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (284, N'Praga, República Checa', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (285, N'Varsovia, Polonia', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (286, N'Budapest, Hungría', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (287, N'Dublín, Irlanda', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (288, N'Helsinki, Finlandia', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (289, N'Singapur', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (290, N'Kuala Lumpur, Malasia', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (291, N'Sevilla, España', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (292, N'Venecia, Italia', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (293, N'Estambul, Turquía', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (294, N'Ámsterdam, Países Bajos', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (295, N'Río de Janeiro, Brasil', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (296, N'Bogotá, Colombia', 8, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (297, N'Lima, Perú', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (298, N'París, Francia', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (299, N'Nueva York, Estados Unidos', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (300, N'Roma, Italia', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (301, N'Tokio, Japón', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (302, N'Sídney, Australia', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (303, N'Londres, Reino Unido', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (304, N'Madrid, España', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (305, N'Ciudad de México, México', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (306, N'Toronto, Canadá', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (307, N'Atenas, Grecia', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (308, N'Bangkok, Tailandia', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (309, N'Dubái, Emiratos Árabes Unidos', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (310, N'Cairo, Egipto', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (311, N'Copenhague, Dinamarca', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (312, N'Ámsterdam, Países Bajos', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (313, N'Viena, Austria', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (314, N'Berlín, Alemania', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (315, N'Buenos Aires, Argentina', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (316, N'San Francisco, Estados Unidos', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (317, N'Seúl, Corea del Sur', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (318, N'Moscú, Rusia', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (319, N'Oslo, Noruega', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (320, N'Estocolmo, Suecia', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (321, N'Praga, República Checa', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (322, N'Varsovia, Polonia', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (323, N'Budapest, Hungría', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (324, N'Dublín, Irlanda', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (325, N'Helsinki, Finlandia', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (326, N'Singapur', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (327, N'Kuala Lumpur, Malasia', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (328, N'Sevilla, España', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (329, N'Venecia, Italia', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (330, N'Estambul, Turquía', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (331, N'Ámsterdam, Países Bajos', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (332, N'Río de Janeiro, Brasil', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (333, N'Bogotá, Colombia', 9, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (334, N'Lima, Perú', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (335, N'París, Francia', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (336, N'Nueva York, Estados Unidos', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (337, N'Roma, Italia', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (338, N'Tokio, Japón', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (339, N'Sídney, Australia', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (340, N'Londres, Reino Unido', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (341, N'Madrid, España', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (342, N'Río de Janeiro, Brasil', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (343, N'Toronto, Canadá', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (344, N'Atenas, Grecia', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (345, N'Bangkok, Tailandia', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (346, N'Dubái, Emiratos Árabes Unidos', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (347, N'Cairo, Egipto', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (348, N'Copenhague, Dinamarca', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (349, N'Ámsterdam, Países Bajos', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (350, N'Viena, Austria', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (351, N'Berlín, Alemania', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (352, N'Buenos Aires, Argentina', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (353, N'San Francisco, Estados Unidos', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (354, N'Seúl, Corea del Sur', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (355, N'Moscú, Rusia', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (356, N'Oslo, Noruega', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (357, N'Estocolmo, Suecia', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (358, N'Praga, República Checa', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (359, N'Varsovia, Polonia', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (360, N'Budapest, Hungría', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (361, N'Dublín, Irlanda', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (362, N'Helsinki, Finlandia', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (363, N'Singapur', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (364, N'Kuala Lumpur, Malasia', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (365, N'Sevilla, España', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (366, N'Venecia, Italia', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (367, N'Estambul, Turquía', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (368, N'Ámsterdam, Países Bajos', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (369, N'Río de Janeiro, Brasil', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (370, N'Bogotá, Colombia', 10, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (371, N'Lima, Perú', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (372, N'París, Francia', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (373, N'Nueva York, Estados Unidos', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (374, N'Roma, Italia', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (375, N'Tokio, Japón', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (376, N'Sídney, Australia', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (377, N'Londres, Reino Unido', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (378, N'Madrid, España', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (379, N'Río de Janeiro, Brasil', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (380, N'Ciudad de México, México', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (381, N'Atenas, Grecia', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (382, N'Bangkok, Tailandia', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (383, N'Dubái, Emiratos Árabes Unidos', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (384, N'Cairo, Egipto', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (385, N'Copenhague, Dinamarca', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (386, N'Ámsterdam, Países Bajos', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (387, N'Viena, Austria', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (388, N'Berlín, Alemania', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (389, N'Buenos Aires, Argentina', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (390, N'San Francisco, Estados Unidos', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (391, N'Seúl, Corea del Sur', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (392, N'Moscú, Rusia', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (393, N'Oslo, Noruega', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (394, N'Estocolmo, Suecia', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (395, N'Praga, República Checa', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (396, N'Varsovia, Polonia', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (397, N'Budapest, Hungría', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (398, N'Dublín, Irlanda', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (399, N'Helsinki, Finlandia', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (400, N'Singapur', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (401, N'Kuala Lumpur, Malasia', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (402, N'Sevilla, España', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (403, N'Venecia, Italia', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (404, N'Estambul, Turquía', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (405, N'Ámsterdam, Países Bajos', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (406, N'Río de Janeiro, Brasil', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (407, N'Bogotá, Colombia', 11, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (408, N'Lima, Perú', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (409, N'París, Francia', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (410, N'Nueva York, Estados Unidos', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (411, N'Roma, Italia', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (412, N'Tokio, Japón', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (413, N'Sídney, Australia', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (414, N'Londres, Reino Unido', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (415, N'Madrid, España', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (416, N'Río de Janeiro, Brasil', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (417, N'Ciudad de México, México', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (418, N'Toronto, Canadá', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (419, N'Bangkok, Tailandia', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (420, N'Dubái, Emiratos Árabes Unidos', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (421, N'Cairo, Egipto', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (422, N'Copenhague, Dinamarca', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (423, N'Ámsterdam, Países Bajos', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (424, N'Viena, Austria', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (425, N'Berlín, Alemania', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (426, N'Buenos Aires, Argentina', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (427, N'San Francisco, Estados Unidos', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (428, N'Seúl, Corea del Sur', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (429, N'Moscú, Rusia', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (430, N'Oslo, Noruega', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (431, N'Estocolmo, Suecia', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (432, N'Praga, República Checa', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (433, N'Varsovia, Polonia', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (434, N'Budapest, Hungría', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (435, N'Dublín, Irlanda', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (436, N'Helsinki, Finlandia', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (437, N'Singapur', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (438, N'Kuala Lumpur, Malasia', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (439, N'Sevilla, España', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (440, N'Venecia, Italia', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (441, N'Estambul, Turquía', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (442, N'Ámsterdam, Países Bajos', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (443, N'Río de Janeiro, Brasil', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (444, N'Bogotá, Colombia', 12, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (445, N'Lima, Perú', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (446, N'París, Francia', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (447, N'Nueva York, Estados Unidos', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (448, N'Roma, Italia', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (449, N'Tokio, Japón', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (450, N'Sídney, Australia', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (451, N'Londres, Reino Unido', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (452, N'Madrid, España', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (453, N'Río de Janeiro, Brasil', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (454, N'Ciudad de México, México', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (455, N'Toronto, Canadá', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (456, N'Atenas, Grecia', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (457, N'Dubái, Emiratos Árabes Unidos', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (458, N'Cairo, Egipto', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (459, N'Copenhague, Dinamarca', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (460, N'Ámsterdam, Países Bajos', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (461, N'Viena, Austria', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (462, N'Berlín, Alemania', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (463, N'Buenos Aires, Argentina', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (464, N'San Francisco, Estados Unidos', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (465, N'Seúl, Corea del Sur', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (466, N'Moscú, Rusia', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (467, N'Oslo, Noruega', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (468, N'Estocolmo, Suecia', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (469, N'Praga, República Checa', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (470, N'Varsovia, Polonia', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (471, N'Budapest, Hungría', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (472, N'Dublín, Irlanda', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (473, N'Helsinki, Finlandia', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (474, N'Singapur', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (475, N'Kuala Lumpur, Malasia', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (476, N'Sevilla, España', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (477, N'Venecia, Italia', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (478, N'Estambul, Turquía', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (479, N'Ámsterdam, Países Bajos', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (480, N'Río de Janeiro, Brasil', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (481, N'Bogotá, Colombia', 13, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (482, N'Lima, Perú', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (483, N'París, Francia', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (484, N'Nueva York, Estados Unidos', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (485, N'Roma, Italia', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (486, N'Tokio, Japón', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (487, N'Sídney, Australia', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (488, N'Londres, Reino Unido', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (489, N'Madrid, España', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (490, N'Río de Janeiro, Brasil', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (491, N'Ciudad de México, México', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (492, N'Toronto, Canadá', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (493, N'Atenas, Grecia', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (494, N'Bangkok, Tailandia', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (495, N'Cairo, Egipto', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (496, N'Copenhague, Dinamarca', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (497, N'Ámsterdam, Países Bajos', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (498, N'Viena, Austria', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (499, N'Berlín, Alemania', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (500, N'Buenos Aires, Argentina', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (501, N'San Francisco, Estados Unidos', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (502, N'Seúl, Corea del Sur', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (503, N'Moscú, Rusia', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (504, N'Oslo, Noruega', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (505, N'Estocolmo, Suecia', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (506, N'Praga, República Checa', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (507, N'Varsovia, Polonia', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (508, N'Budapest, Hungría', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (509, N'Dublín, Irlanda', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (510, N'Helsinki, Finlandia', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (511, N'Singapur', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (512, N'Kuala Lumpur, Malasia', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (513, N'Sevilla, España', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (514, N'Venecia, Italia', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (515, N'Estambul, Turquía', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (516, N'Ámsterdam, Países Bajos', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (517, N'Río de Janeiro, Brasil', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (518, N'Bogotá, Colombia', 14, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (519, N'Lima, Perú', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (520, N'París, Francia', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (521, N'Nueva York, Estados Unidos', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (522, N'Roma, Italia', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (523, N'Tokio, Japón', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (524, N'Sídney, Australia', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (525, N'Londres, Reino Unido', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (526, N'Madrid, España', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (527, N'Río de Janeiro, Brasil', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (528, N'Ciudad de México, México', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (529, N'Toronto, Canadá', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (530, N'Atenas, Grecia', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (531, N'Bangkok, Tailandia', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (532, N'Dubái, Emiratos Árabes Unidos', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (533, N'Copenhague, Dinamarca', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (534, N'Ámsterdam, Países Bajos', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (535, N'Viena, Austria', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (536, N'Berlín, Alemania', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (537, N'Buenos Aires, Argentina', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (538, N'San Francisco, Estados Unidos', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (539, N'Seúl, Corea del Sur', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (540, N'Moscú, Rusia', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (541, N'Oslo, Noruega', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (542, N'Estocolmo, Suecia', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (543, N'Praga, República Checa', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (544, N'Varsovia, Polonia', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (545, N'Budapest, Hungría', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (546, N'Dublín, Irlanda', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (547, N'Helsinki, Finlandia', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (548, N'Singapur', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (549, N'Kuala Lumpur, Malasia', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (550, N'Sevilla, España', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (551, N'Venecia, Italia', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (552, N'Estambul, Turquía', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (553, N'Ámsterdam, Países Bajos', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (554, N'Río de Janeiro, Brasil', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (555, N'Bogotá, Colombia', 15, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (556, N'Lima, Perú', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (557, N'París, Francia', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (558, N'Nueva York, Estados Unidos', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (559, N'Roma, Italia', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (560, N'Tokio, Japón', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (561, N'Sídney, Australia', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (562, N'Londres, Reino Unido', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (563, N'Madrid, España', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (564, N'Río de Janeiro, Brasil', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (565, N'Ciudad de México, México', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (566, N'Toronto, Canadá', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (567, N'Atenas, Grecia', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (568, N'Bangkok, Tailandia', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (569, N'Dubái, Emiratos Árabes Unidos', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (570, N'Cairo, Egipto', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (571, N'Ámsterdam, Países Bajos', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (572, N'Viena, Austria', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (573, N'Berlín, Alemania', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (574, N'Buenos Aires, Argentina', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (575, N'San Francisco, Estados Unidos', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (576, N'Seúl, Corea del Sur', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (577, N'Moscú, Rusia', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (578, N'Oslo, Noruega', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (579, N'Estocolmo, Suecia', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (580, N'Praga, República Checa', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (581, N'Varsovia, Polonia', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (582, N'Budapest, Hungría', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (583, N'Dublín, Irlanda', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (584, N'Helsinki, Finlandia', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (585, N'Singapur', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (586, N'Kuala Lumpur, Malasia', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (587, N'Sevilla, España', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (588, N'Venecia, Italia', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (589, N'Estambul, Turquía', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (590, N'Ámsterdam, Países Bajos', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (591, N'Río de Janeiro, Brasil', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (592, N'Bogotá, Colombia', 16, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (593, N'Lima, Perú', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (594, N'París, Francia', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (595, N'Nueva York, Estados Unidos', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (596, N'Roma, Italia', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (597, N'Tokio, Japón', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (598, N'Sídney, Australia', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (599, N'Londres, Reino Unido', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (600, N'Madrid, España', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (601, N'Río de Janeiro, Brasil', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (602, N'Ciudad de México, México', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (603, N'Toronto, Canadá', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (604, N'Atenas, Grecia', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (605, N'Bangkok, Tailandia', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (606, N'Dubái, Emiratos Árabes Unidos', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (607, N'Cairo, Egipto', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (608, N'Copenhague, Dinamarca', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (609, N'Viena, Austria', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (610, N'Berlín, Alemania', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (611, N'Buenos Aires, Argentina', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (612, N'San Francisco, Estados Unidos', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (613, N'Seúl, Corea del Sur', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (614, N'Moscú, Rusia', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (615, N'Oslo, Noruega', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (616, N'Estocolmo, Suecia', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (617, N'Praga, República Checa', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (618, N'Varsovia, Polonia', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (619, N'Budapest, Hungría', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (620, N'Dublín, Irlanda', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (621, N'Helsinki, Finlandia', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (622, N'Singapur', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (623, N'Kuala Lumpur, Malasia', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (624, N'Sevilla, España', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (625, N'Venecia, Italia', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (626, N'Estambul, Turquía', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (627, N'Ámsterdam, Países Bajos', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (628, N'Río de Janeiro, Brasil', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (629, N'Bogotá, Colombia', 17, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (630, N'Lima, Perú', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (631, N'París, Francia', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (632, N'Nueva York, Estados Unidos', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (633, N'Roma, Italia', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (634, N'Tokio, Japón', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (635, N'Sídney, Australia', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (636, N'Londres, Reino Unido', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (637, N'Madrid, España', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (638, N'Río de Janeiro, Brasil', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (639, N'Ciudad de México, México', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (640, N'Toronto, Canadá', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (641, N'Atenas, Grecia', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (642, N'Bangkok, Tailandia', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (643, N'Dubái, Emiratos Árabes Unidos', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (644, N'Cairo, Egipto', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (645, N'Copenhague, Dinamarca', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (646, N'Ámsterdam, Países Bajos', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (647, N'Berlín, Alemania', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (648, N'Buenos Aires, Argentina', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (649, N'San Francisco, Estados Unidos', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (650, N'Seúl, Corea del Sur', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (651, N'Moscú, Rusia', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (652, N'Oslo, Noruega', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (653, N'Estocolmo, Suecia', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (654, N'Praga, República Checa', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (655, N'Varsovia, Polonia', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (656, N'Budapest, Hungría', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (657, N'Dublín, Irlanda', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (658, N'Helsinki, Finlandia', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (659, N'Singapur', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (660, N'Kuala Lumpur, Malasia', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (661, N'Sevilla, España', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (662, N'Venecia, Italia', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (663, N'Estambul, Turquía', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (664, N'Ámsterdam, Países Bajos', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (665, N'Río de Janeiro, Brasil', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (666, N'Bogotá, Colombia', 18, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (667, N'Lima, Perú', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (668, N'París, Francia', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (669, N'Nueva York, Estados Unidos', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (670, N'Roma, Italia', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (671, N'Tokio, Japón', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (672, N'Sídney, Australia', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (673, N'Londres, Reino Unido', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (674, N'Madrid, España', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (675, N'Río de Janeiro, Brasil', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (676, N'Ciudad de México, México', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (677, N'Toronto, Canadá', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (678, N'Atenas, Grecia', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (679, N'Bangkok, Tailandia', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (680, N'Dubái, Emiratos Árabes Unidos', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (681, N'Cairo, Egipto', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (682, N'Copenhague, Dinamarca', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (683, N'Ámsterdam, Países Bajos', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (684, N'Viena, Austria', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (685, N'Buenos Aires, Argentina', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (686, N'San Francisco, Estados Unidos', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (687, N'Seúl, Corea del Sur', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (688, N'Moscú, Rusia', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (689, N'Oslo, Noruega', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (690, N'Estocolmo, Suecia', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (691, N'Praga, República Checa', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (692, N'Varsovia, Polonia', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (693, N'Budapest, Hungría', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (694, N'Dublín, Irlanda', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (695, N'Helsinki, Finlandia', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (696, N'Singapur', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (697, N'Kuala Lumpur, Malasia', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (698, N'Sevilla, España', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (699, N'Venecia, Italia', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (700, N'Estambul, Turquía', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (701, N'Ámsterdam, Países Bajos', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (702, N'Río de Janeiro, Brasil', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (703, N'Bogotá, Colombia', 19, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (704, N'Lima, Perú', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (705, N'París, Francia', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (706, N'Nueva York, Estados Unidos', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (707, N'Roma, Italia', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (708, N'Tokio, Japón', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (709, N'Sídney, Australia', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (710, N'Londres, Reino Unido', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (711, N'Madrid, España', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (712, N'Río de Janeiro, Brasil', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (713, N'Ciudad de México, México', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (714, N'Toronto, Canadá', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (715, N'Atenas, Grecia', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (716, N'Bangkok, Tailandia', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (717, N'Dubái, Emiratos Árabes Unidos', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (718, N'Cairo, Egipto', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (719, N'Copenhague, Dinamarca', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (720, N'Ámsterdam, Países Bajos', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (721, N'Viena, Austria', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (722, N'Berlín, Alemania', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (723, N'San Francisco, Estados Unidos', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (724, N'Seúl, Corea del Sur', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (725, N'Moscú, Rusia', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (726, N'Oslo, Noruega', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (727, N'Estocolmo, Suecia', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (728, N'Praga, República Checa', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (729, N'Varsovia, Polonia', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (730, N'Budapest, Hungría', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (731, N'Dublín, Irlanda', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (732, N'Helsinki, Finlandia', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (733, N'Singapur', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (734, N'Kuala Lumpur, Malasia', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (735, N'Sevilla, España', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (736, N'Venecia, Italia', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (737, N'Estambul, Turquía', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (738, N'Ámsterdam, Países Bajos', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (739, N'Río de Janeiro, Brasil', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (740, N'Bogotá, Colombia', 20, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (741, N'Lima, Perú', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (742, N'París, Francia', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (743, N'Nueva York, Estados Unidos', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (744, N'Roma, Italia', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (745, N'Tokio, Japón', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (746, N'Sídney, Australia', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (747, N'Londres, Reino Unido', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (748, N'Madrid, España', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (749, N'Río de Janeiro, Brasil', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (750, N'Ciudad de México, México', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (751, N'Toronto, Canadá', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (752, N'Atenas, Grecia', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (753, N'Bangkok, Tailandia', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (754, N'Dubái, Emiratos Árabes Unidos', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (755, N'Cairo, Egipto', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (756, N'Copenhague, Dinamarca', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (757, N'Ámsterdam, Países Bajos', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (758, N'Viena, Austria', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (759, N'Berlín, Alemania', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (760, N'Buenos Aires, Argentina', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (761, N'Seúl, Corea del Sur', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (762, N'Moscú, Rusia', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (763, N'Oslo, Noruega', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (764, N'Estocolmo, Suecia', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (765, N'Praga, República Checa', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (766, N'Varsovia, Polonia', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (767, N'Budapest, Hungría', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (768, N'Dublín, Irlanda', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (769, N'Helsinki, Finlandia', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (770, N'Singapur', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (771, N'Kuala Lumpur, Malasia', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (772, N'Sevilla, España', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (773, N'Venecia, Italia', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (774, N'Estambul, Turquía', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (775, N'Ámsterdam, Países Bajos', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (776, N'Río de Janeiro, Brasil', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (777, N'Bogotá, Colombia', 21, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (778, N'Lima, Perú', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (779, N'París, Francia', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (780, N'Nueva York, Estados Unidos', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (781, N'Roma, Italia', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (782, N'Tokio, Japón', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (783, N'Sídney, Australia', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (784, N'Londres, Reino Unido', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (785, N'Madrid, España', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (786, N'Río de Janeiro, Brasil', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (787, N'Ciudad de México, México', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (788, N'Toronto, Canadá', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (789, N'Atenas, Grecia', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (790, N'Bangkok, Tailandia', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (791, N'Dubái, Emiratos Árabes Unidos', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (792, N'Cairo, Egipto', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (793, N'Copenhague, Dinamarca', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (794, N'Ámsterdam, Países Bajos', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (795, N'Viena, Austria', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (796, N'Berlín, Alemania', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (797, N'Buenos Aires, Argentina', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (798, N'San Francisco, Estados Unidos', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (799, N'Moscú, Rusia', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (800, N'Oslo, Noruega', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (801, N'Estocolmo, Suecia', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (802, N'Praga, República Checa', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (803, N'Varsovia, Polonia', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (804, N'Budapest, Hungría', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (805, N'Dublín, Irlanda', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (806, N'Helsinki, Finlandia', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (807, N'Singapur', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (808, N'Kuala Lumpur, Malasia', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (809, N'Sevilla, España', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (810, N'Venecia, Italia', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (811, N'Estambul, Turquía', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (812, N'Ámsterdam, Países Bajos', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (813, N'Río de Janeiro, Brasil', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (814, N'Bogotá, Colombia', 22, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (815, N'Lima, Perú', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (816, N'París, Francia', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (817, N'Nueva York, Estados Unidos', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (818, N'Roma, Italia', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (819, N'Tokio, Japón', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (820, N'Sídney, Australia', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (821, N'Londres, Reino Unido', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (822, N'Madrid, España', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (823, N'Río de Janeiro, Brasil', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (824, N'Ciudad de México, México', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (825, N'Toronto, Canadá', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (826, N'Atenas, Grecia', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (827, N'Bangkok, Tailandia', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (828, N'Dubái, Emiratos Árabes Unidos', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (829, N'Cairo, Egipto', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (830, N'Copenhague, Dinamarca', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (831, N'Ámsterdam, Países Bajos', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (832, N'Viena, Austria', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (833, N'Berlín, Alemania', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (834, N'Buenos Aires, Argentina', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (835, N'San Francisco, Estados Unidos', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (836, N'Seúl, Corea del Sur', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (837, N'Oslo, Noruega', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (838, N'Estocolmo, Suecia', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (839, N'Praga, República Checa', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (840, N'Varsovia, Polonia', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (841, N'Budapest, Hungría', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (842, N'Dublín, Irlanda', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (843, N'Helsinki, Finlandia', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (844, N'Singapur', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (845, N'Kuala Lumpur, Malasia', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (846, N'Sevilla, España', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (847, N'Venecia, Italia', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (848, N'Estambul, Turquía', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (849, N'Ámsterdam, Países Bajos', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (850, N'Río de Janeiro, Brasil', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (851, N'Bogotá, Colombia', 23, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (852, N'Lima, Perú', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (853, N'París, Francia', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (854, N'Nueva York, Estados Unidos', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (855, N'Roma, Italia', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (856, N'Tokio, Japón', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (857, N'Sídney, Australia', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (858, N'Londres, Reino Unido', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (859, N'Madrid, España', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (860, N'Río de Janeiro, Brasil', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (861, N'Ciudad de México, México', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (862, N'Toronto, Canadá', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (863, N'Atenas, Grecia', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (864, N'Bangkok, Tailandia', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (865, N'Dubái, Emiratos Árabes Unidos', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (866, N'Cairo, Egipto', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (867, N'Copenhague, Dinamarca', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (868, N'Ámsterdam, Países Bajos', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (869, N'Viena, Austria', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (870, N'Berlín, Alemania', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (871, N'Buenos Aires, Argentina', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (872, N'San Francisco, Estados Unidos', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (873, N'Seúl, Corea del Sur', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (874, N'Moscú, Rusia', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (875, N'Estocolmo, Suecia', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (876, N'Praga, República Checa', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (877, N'Varsovia, Polonia', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (878, N'Budapest, Hungría', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (879, N'Dublín, Irlanda', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (880, N'Helsinki, Finlandia', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (881, N'Singapur', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (882, N'Kuala Lumpur, Malasia', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (883, N'Sevilla, España', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (884, N'Venecia, Italia', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (885, N'Estambul, Turquía', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (886, N'Ámsterdam, Países Bajos', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (887, N'Río de Janeiro, Brasil', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (888, N'Bogotá, Colombia', 24, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (889, N'Lima, Perú', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (890, N'París, Francia', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (891, N'Nueva York, Estados Unidos', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (892, N'Roma, Italia', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (893, N'Tokio, Japón', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (894, N'Sídney, Australia', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (895, N'Londres, Reino Unido', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (896, N'Madrid, España', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (897, N'Río de Janeiro, Brasil', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (898, N'Ciudad de México, México', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (899, N'Toronto, Canadá', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (900, N'Atenas, Grecia', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (901, N'Bangkok, Tailandia', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (902, N'Dubái, Emiratos Árabes Unidos', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (903, N'Cairo, Egipto', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (904, N'Copenhague, Dinamarca', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (905, N'Ámsterdam, Países Bajos', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (906, N'Viena, Austria', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (907, N'Berlín, Alemania', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (908, N'Buenos Aires, Argentina', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (909, N'San Francisco, Estados Unidos', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (910, N'Seúl, Corea del Sur', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (911, N'Moscú, Rusia', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (912, N'Oslo, Noruega', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (913, N'Praga, República Checa', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (914, N'Varsovia, Polonia', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (915, N'Budapest, Hungría', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (916, N'Dublín, Irlanda', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (917, N'Helsinki, Finlandia', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (918, N'Singapur', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (919, N'Kuala Lumpur, Malasia', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (920, N'Sevilla, España', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (921, N'Venecia, Italia', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (922, N'Estambul, Turquía', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (923, N'Ámsterdam, Países Bajos', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (924, N'Río de Janeiro, Brasil', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (925, N'Bogotá, Colombia', 25, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (926, N'Lima, Perú', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (927, N'París, Francia', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (928, N'Nueva York, Estados Unidos', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (929, N'Roma, Italia', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (930, N'Tokio, Japón', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (931, N'Sídney, Australia', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (932, N'Londres, Reino Unido', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (933, N'Madrid, España', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (934, N'Río de Janeiro, Brasil', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (935, N'Ciudad de México, México', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (936, N'Toronto, Canadá', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (937, N'Atenas, Grecia', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (938, N'Bangkok, Tailandia', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (939, N'Dubái, Emiratos Árabes Unidos', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (940, N'Cairo, Egipto', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (941, N'Copenhague, Dinamarca', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (942, N'Ámsterdam, Países Bajos', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (943, N'Viena, Austria', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (944, N'Berlín, Alemania', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (945, N'Buenos Aires, Argentina', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (946, N'San Francisco, Estados Unidos', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (947, N'Seúl, Corea del Sur', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (948, N'Moscú, Rusia', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (949, N'Oslo, Noruega', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (950, N'Estocolmo, Suecia', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (951, N'Varsovia, Polonia', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (952, N'Budapest, Hungría', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (953, N'Dublín, Irlanda', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (954, N'Helsinki, Finlandia', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (955, N'Singapur', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (956, N'Kuala Lumpur, Malasia', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (957, N'Sevilla, España', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (958, N'Venecia, Italia', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (959, N'Estambul, Turquía', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (960, N'Ámsterdam, Países Bajos', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (961, N'Río de Janeiro, Brasil', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (962, N'Bogotá, Colombia', 26, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (963, N'Lima, Perú', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (964, N'París, Francia', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (965, N'Nueva York, Estados Unidos', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (966, N'Roma, Italia', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (967, N'Tokio, Japón', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (968, N'Sídney, Australia', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (969, N'Londres, Reino Unido', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (970, N'Madrid, España', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (971, N'Río de Janeiro, Brasil', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (972, N'Ciudad de México, México', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (973, N'Toronto, Canadá', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (974, N'Atenas, Grecia', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (975, N'Bangkok, Tailandia', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (976, N'Dubái, Emiratos Árabes Unidos', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (977, N'Cairo, Egipto', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (978, N'Copenhague, Dinamarca', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (979, N'Ámsterdam, Países Bajos', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (980, N'Viena, Austria', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (981, N'Berlín, Alemania', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (982, N'Buenos Aires, Argentina', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (983, N'San Francisco, Estados Unidos', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (984, N'Seúl, Corea del Sur', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (985, N'Moscú, Rusia', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (986, N'Oslo, Noruega', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (987, N'Estocolmo, Suecia', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (988, N'Praga, República Checa', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (989, N'Budapest, Hungría', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (990, N'Dublín, Irlanda', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (991, N'Helsinki, Finlandia', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (992, N'Singapur', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (993, N'Kuala Lumpur, Malasia', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (994, N'Sevilla, España', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (995, N'Venecia, Italia', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (996, N'Estambul, Turquía', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (997, N'Ámsterdam, Países Bajos', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (998, N'Río de Janeiro, Brasil', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (999, N'Bogotá, Colombia', 27, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1000, N'Lima, Perú', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1001, N'París, Francia', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1002, N'Nueva York, Estados Unidos', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1003, N'Roma, Italia', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1004, N'Tokio, Japón', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1005, N'Sídney, Australia', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1006, N'Londres, Reino Unido', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1007, N'Madrid, España', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1008, N'Río de Janeiro, Brasil', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1009, N'Ciudad de México, México', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1010, N'Toronto, Canadá', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1011, N'Atenas, Grecia', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1012, N'Bangkok, Tailandia', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1013, N'Dubái, Emiratos Árabes Unidos', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1014, N'Cairo, Egipto', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1015, N'Copenhague, Dinamarca', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1016, N'Ámsterdam, Países Bajos', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1017, N'Viena, Austria', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1018, N'Berlín, Alemania', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1019, N'Buenos Aires, Argentina', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1020, N'San Francisco, Estados Unidos', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1021, N'Seúl, Corea del Sur', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1022, N'Moscú, Rusia', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1023, N'Oslo, Noruega', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1024, N'Estocolmo, Suecia', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1025, N'Praga, República Checa', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1026, N'Varsovia, Polonia', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1027, N'Dublín, Irlanda', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1028, N'Helsinki, Finlandia', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1029, N'Singapur', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1030, N'Kuala Lumpur, Malasia', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1031, N'Sevilla, España', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1032, N'Venecia, Italia', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1033, N'Estambul, Turquía', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1034, N'Ámsterdam, Países Bajos', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1035, N'Río de Janeiro, Brasil', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1036, N'Bogotá, Colombia', 28, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1037, N'Lima, Perú', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1038, N'París, Francia', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1039, N'Nueva York, Estados Unidos', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1040, N'Roma, Italia', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1041, N'Tokio, Japón', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1042, N'Sídney, Australia', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1043, N'Londres, Reino Unido', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1044, N'Madrid, España', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1045, N'Río de Janeiro, Brasil', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1046, N'Ciudad de México, México', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1047, N'Toronto, Canadá', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1048, N'Atenas, Grecia', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1049, N'Bangkok, Tailandia', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1050, N'Dubái, Emiratos Árabes Unidos', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1051, N'Cairo, Egipto', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1052, N'Copenhague, Dinamarca', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1053, N'Ámsterdam, Países Bajos', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1054, N'Viena, Austria', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1055, N'Berlín, Alemania', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1056, N'Buenos Aires, Argentina', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1057, N'San Francisco, Estados Unidos', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1058, N'Seúl, Corea del Sur', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1059, N'Moscú, Rusia', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1060, N'Oslo, Noruega', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1061, N'Estocolmo, Suecia', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1062, N'Praga, República Checa', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1063, N'Varsovia, Polonia', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1064, N'Budapest, Hungría', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1065, N'Helsinki, Finlandia', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1066, N'Singapur', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1067, N'Kuala Lumpur, Malasia', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1068, N'Sevilla, España', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1069, N'Venecia, Italia', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1070, N'Estambul, Turquía', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1071, N'Ámsterdam, Países Bajos', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1072, N'Río de Janeiro, Brasil', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1073, N'Bogotá, Colombia', 29, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1074, N'Lima, Perú', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1075, N'París, Francia', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1076, N'Nueva York, Estados Unidos', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1077, N'Roma, Italia', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1078, N'Tokio, Japón', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1079, N'Sídney, Australia', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1080, N'Londres, Reino Unido', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1081, N'Madrid, España', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1082, N'Río de Janeiro, Brasil', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1083, N'Ciudad de México, México', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1084, N'Toronto, Canadá', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1085, N'Atenas, Grecia', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1086, N'Bangkok, Tailandia', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1087, N'Dubái, Emiratos Árabes Unidos', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1088, N'Cairo, Egipto', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1089, N'Copenhague, Dinamarca', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1090, N'Ámsterdam, Países Bajos', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1091, N'Viena, Austria', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1092, N'Berlín, Alemania', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1093, N'Buenos Aires, Argentina', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1094, N'San Francisco, Estados Unidos', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1095, N'Seúl, Corea del Sur', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1096, N'Moscú, Rusia', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1097, N'Oslo, Noruega', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1098, N'Estocolmo, Suecia', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1099, N'Praga, República Checa', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1100, N'Varsovia, Polonia', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1101, N'Budapest, Hungría', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1102, N'Dublín, Irlanda', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1103, N'Singapur', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1104, N'Kuala Lumpur, Malasia', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1105, N'Sevilla, España', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1106, N'Venecia, Italia', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1107, N'Estambul, Turquía', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1108, N'Ámsterdam, Países Bajos', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1109, N'Río de Janeiro, Brasil', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1110, N'Bogotá, Colombia', 30, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1111, N'Lima, Perú', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1112, N'París, Francia', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1113, N'Nueva York, Estados Unidos', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1114, N'Roma, Italia', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1115, N'Tokio, Japón', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1116, N'Sídney, Australia', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1117, N'Londres, Reino Unido', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1118, N'Madrid, España', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1119, N'Río de Janeiro, Brasil', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1120, N'Ciudad de México, México', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1121, N'Toronto, Canadá', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1122, N'Atenas, Grecia', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1123, N'Bangkok, Tailandia', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1124, N'Dubái, Emiratos Árabes Unidos', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1125, N'Cairo, Egipto', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1126, N'Copenhague, Dinamarca', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1127, N'Ámsterdam, Países Bajos', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1128, N'Viena, Austria', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1129, N'Berlín, Alemania', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1130, N'Buenos Aires, Argentina', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1131, N'San Francisco, Estados Unidos', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1132, N'Seúl, Corea del Sur', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1133, N'Moscú, Rusia', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1134, N'Oslo, Noruega', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1135, N'Estocolmo, Suecia', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1136, N'Praga, República Checa', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1137, N'Varsovia, Polonia', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1138, N'Budapest, Hungría', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1139, N'Dublín, Irlanda', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1140, N'Helsinki, Finlandia', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1141, N'Kuala Lumpur, Malasia', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1142, N'Sevilla, España', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1143, N'Venecia, Italia', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1144, N'Estambul, Turquía', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1145, N'Ámsterdam, Países Bajos', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1146, N'Río de Janeiro, Brasil', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1147, N'Bogotá, Colombia', 31, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1148, N'Lima, Perú', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1149, N'París, Francia', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1150, N'Nueva York, Estados Unidos', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1151, N'Roma, Italia', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1152, N'Tokio, Japón', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1153, N'Sídney, Australia', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1154, N'Londres, Reino Unido', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1155, N'Madrid, España', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1156, N'Río de Janeiro, Brasil', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1157, N'Ciudad de México, México', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1158, N'Toronto, Canadá', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1159, N'Atenas, Grecia', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1160, N'Bangkok, Tailandia', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1161, N'Dubái, Emiratos Árabes Unidos', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1162, N'Cairo, Egipto', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1163, N'Copenhague, Dinamarca', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1164, N'Ámsterdam, Países Bajos', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1165, N'Viena, Austria', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1166, N'Berlín, Alemania', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1167, N'Buenos Aires, Argentina', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1168, N'San Francisco, Estados Unidos', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1169, N'Seúl, Corea del Sur', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1170, N'Moscú, Rusia', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1171, N'Oslo, Noruega', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1172, N'Estocolmo, Suecia', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1173, N'Praga, República Checa', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1174, N'Varsovia, Polonia', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1175, N'Budapest, Hungría', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1176, N'Dublín, Irlanda', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1177, N'Helsinki, Finlandia', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1178, N'Singapur', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1179, N'Sevilla, España', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1180, N'Venecia, Italia', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1181, N'Estambul, Turquía', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1182, N'Ámsterdam, Países Bajos', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1183, N'Río de Janeiro, Brasil', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1184, N'Bogotá, Colombia', 32, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1185, N'Lima, Perú', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1186, N'París, Francia', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1187, N'Nueva York, Estados Unidos', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1188, N'Roma, Italia', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1189, N'Tokio, Japón', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1190, N'Sídney, Australia', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1191, N'Londres, Reino Unido', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1192, N'Madrid, España', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1193, N'Río de Janeiro, Brasil', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1194, N'Ciudad de México, México', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1195, N'Toronto, Canadá', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1196, N'Atenas, Grecia', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1197, N'Bangkok, Tailandia', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1198, N'Dubái, Emiratos Árabes Unidos', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1199, N'Cairo, Egipto', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1200, N'Copenhague, Dinamarca', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1201, N'Ámsterdam, Países Bajos', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1202, N'Viena, Austria', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1203, N'Berlín, Alemania', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1204, N'Buenos Aires, Argentina', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1205, N'San Francisco, Estados Unidos', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1206, N'Seúl, Corea del Sur', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1207, N'Moscú, Rusia', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1208, N'Oslo, Noruega', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1209, N'Estocolmo, Suecia', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1210, N'Praga, República Checa', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1211, N'Varsovia, Polonia', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1212, N'Budapest, Hungría', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1213, N'Dublín, Irlanda', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1214, N'Helsinki, Finlandia', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1215, N'Singapur', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1216, N'Kuala Lumpur, Malasia', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1217, N'Venecia, Italia', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1218, N'Estambul, Turquía', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1219, N'Ámsterdam, Países Bajos', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1220, N'Río de Janeiro, Brasil', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1221, N'Bogotá, Colombia', 33, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1222, N'Lima, Perú', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1223, N'París, Francia', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1224, N'Nueva York, Estados Unidos', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1225, N'Roma, Italia', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1226, N'Tokio, Japón', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1227, N'Sídney, Australia', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1228, N'Londres, Reino Unido', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1229, N'Madrid, España', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1230, N'Río de Janeiro, Brasil', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1231, N'Ciudad de México, México', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1232, N'Toronto, Canadá', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1233, N'Atenas, Grecia', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1234, N'Bangkok, Tailandia', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1235, N'Dubái, Emiratos Árabes Unidos', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1236, N'Cairo, Egipto', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1237, N'Copenhague, Dinamarca', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1238, N'Ámsterdam, Países Bajos', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1239, N'Viena, Austria', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1240, N'Berlín, Alemania', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1241, N'Buenos Aires, Argentina', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1242, N'San Francisco, Estados Unidos', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1243, N'Seúl, Corea del Sur', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1244, N'Moscú, Rusia', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1245, N'Oslo, Noruega', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1246, N'Estocolmo, Suecia', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1247, N'Praga, República Checa', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1248, N'Varsovia, Polonia', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1249, N'Budapest, Hungría', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1250, N'Dublín, Irlanda', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1251, N'Helsinki, Finlandia', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1252, N'Singapur', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1253, N'Kuala Lumpur, Malasia', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1254, N'Sevilla, España', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1255, N'Estambul, Turquía', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1256, N'Ámsterdam, Países Bajos', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1257, N'Río de Janeiro, Brasil', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1258, N'Bogotá, Colombia', 34, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1259, N'Lima, Perú', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1260, N'París, Francia', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1261, N'Nueva York, Estados Unidos', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1262, N'Roma, Italia', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1263, N'Tokio, Japón', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1264, N'Sídney, Australia', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1265, N'Londres, Reino Unido', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1266, N'Madrid, España', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1267, N'Río de Janeiro, Brasil', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1268, N'Ciudad de México, México', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1269, N'Toronto, Canadá', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1270, N'Atenas, Grecia', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1271, N'Bangkok, Tailandia', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1272, N'Dubái, Emiratos Árabes Unidos', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1273, N'Cairo, Egipto', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1274, N'Copenhague, Dinamarca', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1275, N'Ámsterdam, Países Bajos', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1276, N'Viena, Austria', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1277, N'Berlín, Alemania', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1278, N'Buenos Aires, Argentina', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1279, N'San Francisco, Estados Unidos', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1280, N'Seúl, Corea del Sur', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1281, N'Moscú, Rusia', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1282, N'Oslo, Noruega', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1283, N'Estocolmo, Suecia', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1284, N'Praga, República Checa', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1285, N'Varsovia, Polonia', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1286, N'Budapest, Hungría', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1287, N'Dublín, Irlanda', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1288, N'Helsinki, Finlandia', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1289, N'Singapur', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1290, N'Kuala Lumpur, Malasia', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1291, N'Sevilla, España', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1292, N'Venecia, Italia', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1293, N'Ámsterdam, Países Bajos', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1294, N'Río de Janeiro, Brasil', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1295, N'Bogotá, Colombia', 35, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1296, N'Lima, Perú', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1297, N'París, Francia', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1298, N'Nueva York, Estados Unidos', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1299, N'Roma, Italia', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1300, N'Tokio, Japón', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1301, N'Sídney, Australia', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1302, N'Londres, Reino Unido', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1303, N'Madrid, España', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1304, N'Río de Janeiro, Brasil', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1305, N'Ciudad de México, México', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1306, N'Toronto, Canadá', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1307, N'Atenas, Grecia', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1308, N'Bangkok, Tailandia', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1309, N'Dubái, Emiratos Árabes Unidos', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1310, N'Cairo, Egipto', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1311, N'Copenhague, Dinamarca', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1312, N'Ámsterdam, Países Bajos', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1313, N'Viena, Austria', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1314, N'Berlín, Alemania', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1315, N'Buenos Aires, Argentina', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1316, N'San Francisco, Estados Unidos', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1317, N'Seúl, Corea del Sur', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1318, N'Moscú, Rusia', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1319, N'Oslo, Noruega', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1320, N'Estocolmo, Suecia', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1321, N'Praga, República Checa', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1322, N'Varsovia, Polonia', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1323, N'Budapest, Hungría', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1324, N'Dublín, Irlanda', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1325, N'Helsinki, Finlandia', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1326, N'Singapur', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1327, N'Kuala Lumpur, Malasia', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1328, N'Sevilla, España', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1329, N'Venecia, Italia', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1330, N'Estambul, Turquía', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1331, N'Río de Janeiro, Brasil', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1332, N'Bogotá, Colombia', 36, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1333, N'Lima, Perú', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1334, N'París, Francia', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1335, N'Nueva York, Estados Unidos', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1336, N'Roma, Italia', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1337, N'Tokio, Japón', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1338, N'Sídney, Australia', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1339, N'Londres, Reino Unido', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1340, N'Madrid, España', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1341, N'Río de Janeiro, Brasil', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1342, N'Ciudad de México, México', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1343, N'Toronto, Canadá', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1344, N'Atenas, Grecia', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1345, N'Bangkok, Tailandia', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1346, N'Dubái, Emiratos Árabes Unidos', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1347, N'Cairo, Egipto', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1348, N'Copenhague, Dinamarca', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1349, N'Ámsterdam, Países Bajos', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1350, N'Viena, Austria', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1351, N'Berlín, Alemania', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1352, N'Buenos Aires, Argentina', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1353, N'San Francisco, Estados Unidos', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1354, N'Seúl, Corea del Sur', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1355, N'Moscú, Rusia', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1356, N'Oslo, Noruega', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1357, N'Estocolmo, Suecia', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1358, N'Praga, República Checa', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1359, N'Varsovia, Polonia', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1360, N'Budapest, Hungría', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1361, N'Dublín, Irlanda', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1362, N'Helsinki, Finlandia', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1363, N'Singapur', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1364, N'Kuala Lumpur, Malasia', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1365, N'Sevilla, España', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1366, N'Venecia, Italia', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1367, N'Estambul, Turquía', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1368, N'Ámsterdam, Países Bajos', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1369, N'Bogotá, Colombia', 37, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1370, N'Lima, Perú', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1371, N'París, Francia', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1372, N'Nueva York, Estados Unidos', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1373, N'Roma, Italia', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1374, N'Tokio, Japón', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1375, N'Sídney, Australia', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1376, N'Londres, Reino Unido', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1377, N'Madrid, España', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1378, N'Río de Janeiro, Brasil', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1379, N'Ciudad de México, México', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1380, N'Toronto, Canadá', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1381, N'Atenas, Grecia', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1382, N'Bangkok, Tailandia', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1383, N'Dubái, Emiratos Árabes Unidos', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1384, N'Cairo, Egipto', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1385, N'Copenhague, Dinamarca', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1386, N'Ámsterdam, Países Bajos', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1387, N'Viena, Austria', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1388, N'Berlín, Alemania', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1389, N'Buenos Aires, Argentina', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1390, N'San Francisco, Estados Unidos', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1391, N'Seúl, Corea del Sur', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1392, N'Moscú, Rusia', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1393, N'Oslo, Noruega', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1394, N'Estocolmo, Suecia', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1395, N'Praga, República Checa', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1396, N'Varsovia, Polonia', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1397, N'Budapest, Hungría', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1398, N'Dublín, Irlanda', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1399, N'Helsinki, Finlandia', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1400, N'Singapur', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1401, N'Kuala Lumpur, Malasia', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1402, N'Sevilla, España', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1403, N'Venecia, Italia', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1404, N'Estambul, Turquía', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1405, N'Ámsterdam, Países Bajos', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
INSERT [dbo].[VUELO] ([id], [origen], [destino_id], [fecha], [hora], [capacidad], [precio]) VALUES (1406, N'Río de Janeiro, Brasil', 38, CAST(N'2023-09-26' AS Date), CAST(N'12:00:00' AS Time), 200, CAST(1871.77 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[VUELO] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CLIENTE__9AFF8FC6712AA46A]    Script Date: 05/10/2023 15:49:55 ******/
ALTER TABLE [dbo].[CLIENTE] ADD UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CLIENTE__AB6E61644CAE7A81]    Script Date: 05/10/2023 15:49:55 ******/
ALTER TABLE [dbo].[CLIENTE] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ASIENTO] ADD  DEFAULT ((0)) FOR [ocupado]
GO
ALTER TABLE [dbo].[ASIENTO]  WITH CHECK ADD FOREIGN KEY([vuelo_id])
REFERENCES [dbo].[VUELO] ([id])
GO
ALTER TABLE [dbo].[RESERVA]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[CLIENTE] ([id])
GO
ALTER TABLE [dbo].[RESERVA]  WITH CHECK ADD FOREIGN KEY([vuelo_id])
REFERENCES [dbo].[VUELO] ([id])
GO
ALTER TABLE [dbo].[RESERVA Y DESTINO]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [dbo].[CLIENTE] ([id])
GO
ALTER TABLE [dbo].[RESERVA Y DESTINO]  WITH CHECK ADD FOREIGN KEY([destino_id])
REFERENCES [dbo].[DESTINO] ([id])
GO
ALTER TABLE [dbo].[VUELO]  WITH CHECK ADD FOREIGN KEY([destino_id])
REFERENCES [dbo].[DESTINO] ([id])
GO
ALTER TABLE [dbo].[CLIENTE]  WITH CHECK ADD CHECK  (([trabajaEmpresa]>=(1) AND [trabajaEmpresa]<=(3)))
GO

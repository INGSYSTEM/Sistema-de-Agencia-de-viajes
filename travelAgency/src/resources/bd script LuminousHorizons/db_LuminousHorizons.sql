CREATE DATABASE [LuminousHorizons]
GO
USE [LuminousHorizons]
GO
/****** Object:  User [TestLuminousHorizons]    Script Date: 28/09/2023 0:41:53 ******/
CREATE USER [TestLuminousHorizons] FOR LOGIN [TestLuminousHorizons] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TestLuminousHorizons]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [TestLuminousHorizons]
GO
/****** Object:  Table [dbo].[ASIENTO]    Script Date: 28/09/2023 0:41:54 ******/
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
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 28/09/2023 0:41:56 ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DESTINO]    Script Date: 28/09/2023 0:41:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DESTINO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_destino] [varchar](255) NOT NULL,
	[precio] [decimal](12, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESERVA]    Script Date: 28/09/2023 0:41:56 ******/
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
/****** Object:  Table [dbo].[RESERVA Y DESTINO]    Script Date: 28/09/2023 0:41:56 ******/
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
/****** Object:  Table [dbo].[VUELO]    Script Date: 28/09/2023 0:41:56 ******/
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
INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [usuario], [contrasena], [genero], [trabajaEmpresa]) VALUES (1, N'Juan Bladimir', N'Romero Collazos', N'juanromerocollazos@gmail.com', N'Admin', 0x3ACA4A331944E44471E93EABED5F6933266B79F036A9FF3294AD79CC0692A807, N'hombre', 3)
GO
INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [usuario], [contrasena], [genero], [trabajaEmpresa]) VALUES (2, N'Briggitte del Milagro', N'Martinez Vidaurre', N'U22232825@utp.edu.pe', N'Clown', 0x5DDE754BF124B8D46F66F56C133644EE12763744B63AD54EABB06D37CC515779, N'mujer', 1)
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] OFF
GO
SET IDENTITY_INSERT [dbo].[DESTINO] ON 
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (1, N'Lima, Perú', CAST(150.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (2, N'París, Francia', CAST(1200.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (3, N'Nueva York, Estados Unidos', CAST(1100.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (4, N'Roma, Italia', CAST(1000.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (5, N'Tokio, Japón', CAST(1600.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (6, N'Sídney, Australia', CAST(1500.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (7, N'Londres, Reino Unido', CAST(1300.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (8, N'Madrid, España', CAST(1200.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (9, N'Río de Janeiro, Brasil', CAST(800.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (10, N'Ciudad de México, México', CAST(700.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (11, N'Toronto, Canadá', CAST(1400.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (12, N'Atenas, Grecia', CAST(1100.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (13, N'Bangkok, Tailandia', CAST(1600.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (14, N'Dubái, Emiratos Árabes Unidos', CAST(1500.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (15, N'Cairo, Egipto', CAST(900.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (16, N'Copenhague, Dinamarca', CAST(1300.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (17, N'Ámsterdam, Países Bajos', CAST(1200.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (18, N'Viena, Austria', CAST(1300.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (19, N'Berlín, Alemania', CAST(1200.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (20, N'Buenos Aires, Argentina', CAST(600.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (21, N'San Francisco, Estados Unidos', CAST(1200.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (22, N'Seúl, Corea del Sur', CAST(1500.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (23, N'Moscú, Rusia', CAST(1300.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (24, N'Oslo, Noruega', CAST(1400.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (25, N'Estocolmo, Suecia', CAST(1300.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (26, N'Praga, República Checa', CAST(1100.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (27, N'Varsovia, Polonia', CAST(1200.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (28, N'Budapest, Hungría', CAST(1200.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (29, N'Dublín, Irlanda', CAST(1300.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (30, N'Helsinki, Finlandia', CAST(1400.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (31, N'Singapur', CAST(1600.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (32, N'Kuala Lumpur, Malasia', CAST(1600.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (33, N'Sevilla, España', CAST(1200.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (34, N'Venecia, Italia', CAST(1100.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (35, N'Estambul, Turquía', CAST(1400.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (36, N'Ámsterdam, Países Bajos', CAST(1200.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (37, N'Río de Janeiro, Brasil', CAST(800.00 AS Decimal(12, 2)))
GO
INSERT [dbo].[DESTINO] ([id], [nombre_destino], [precio]) VALUES (38, N'Bogotá, Colombia', CAST(800.00 AS Decimal(12, 2)))
GO
SET IDENTITY_INSERT [dbo].[DESTINO] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CLIENTE__9AFF8FC694B56025]    Script Date: 28/09/2023 0:41:57 ******/
ALTER TABLE [dbo].[CLIENTE] ADD UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CLIENTE__AB6E616454CD6F30]    Script Date: 28/09/2023 0:41:57 ******/
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
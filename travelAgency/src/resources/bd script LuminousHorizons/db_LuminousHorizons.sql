CREATE DATABASE [LuminousHorizons]
GO
USE [LuminousHorizons]
GO
/****** Object:  User [TestLuminousHorizons]    Script Date: 24/09/2023 22:23:15 ******/
CREATE USER [TestLuminousHorizons] FOR LOGIN [TestLuminousHorizons] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [TestLuminousHorizons]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [TestLuminousHorizons]
GO
/****** Object:  Table [dbo].[ASIENTO]    Script Date: 24/09/2023 22:23:16 ******/
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
/****** Object:  Table [dbo].[CLIENTE]    Script Date: 24/09/2023 22:23:16 ******/
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
	[trabajaEmpresa] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DESTINO]    Script Date: 24/09/2023 22:23:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DESTINO](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre_destino] [varchar](255) NOT NULL,
	[precio] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESERVA]    Script Date: 24/09/2023 22:23:16 ******/
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
/****** Object:  Table [dbo].[RESERVA Y DESTINO]    Script Date: 24/09/2023 22:23:16 ******/
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
/****** Object:  Table [dbo].[VUELO]    Script Date: 24/09/2023 22:23:16 ******/
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
INSERT [dbo].[CLIENTE] ([id], [nombre], [apellido], [email], [usuario], [contrasena], [trabajaEmpresa]) VALUES (1, N'Juan Bladimir', N'Romero Collazos', N'juanromerocollazos@gmail.com', N'Admin', HASHBYTES('SHA2_256', '$Admin2023'), 3)
GO
SET IDENTITY_INSERT [dbo].[CLIENTE] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CLIENTE__9AFF8FC62978FEF0]    Script Date: 24/09/2023 22:23:17 ******/
ALTER TABLE [dbo].[CLIENTE] ADD UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CLIENTE__AB6E6164312E7EC3]    Script Date: 24/09/2023 22:23:17 ******/
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

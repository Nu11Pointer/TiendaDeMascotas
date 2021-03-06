USE [master]
GO
/****** Object:  Database [MiEmpresa]    Script Date: 30/3/2021 12:22:26 ******/
CREATE DATABASE [MiEmpresa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MiEmpresa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MiEmpresa.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MiEmpresa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MiEmpresa_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MiEmpresa] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MiEmpresa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MiEmpresa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MiEmpresa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MiEmpresa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MiEmpresa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MiEmpresa] SET ARITHABORT OFF 
GO
ALTER DATABASE [MiEmpresa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MiEmpresa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MiEmpresa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MiEmpresa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MiEmpresa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MiEmpresa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MiEmpresa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MiEmpresa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MiEmpresa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MiEmpresa] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MiEmpresa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MiEmpresa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MiEmpresa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MiEmpresa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MiEmpresa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MiEmpresa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MiEmpresa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MiEmpresa] SET RECOVERY FULL 
GO
ALTER DATABASE [MiEmpresa] SET  MULTI_USER 
GO
ALTER DATABASE [MiEmpresa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MiEmpresa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MiEmpresa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MiEmpresa] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MiEmpresa] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MiEmpresa] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MiEmpresa', N'ON'
GO
ALTER DATABASE [MiEmpresa] SET QUERY_STORE = OFF
GO
USE [MiEmpresa]
GO
/****** Object:  User [administrador]    Script Date: 30/3/2021 12:22:27 ******/
--CREATE USER [administrador] FOR LOGIN [ProductoMascotas] WITH DEFAULT_SCHEMA=[administrador]
--GO
--ALTER ROLE [db_owner] ADD MEMBER [administrador]
--GO
/****** Object:  Schema [administrador]    Script Date: 30/3/2021 12:22:27 ******/
--CREATE SCHEMA [administrador]
--GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[PrimerNombre] [varchar](50) NULL,
	[SegundoNombre] [varchar](50) NULL,
	[PrimerApellido] [varchar](50) NULL,
	[SegundoApellido] [nchar](10) NULL,
	[Correo] [nvarchar](100) NULL,
	[Celular] [int] NULL,
	[estado] [varchar](15) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleFactura]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleFactura](
	[IdDetalleFactura] [int] IDENTITY(1,1) NOT NULL,
	[IdFactura] [int] NULL,
	[IdProducto] [int] NULL,
	[Precio] [float] NULL,
	[Cantidad] [float] NULL,
	[Descuento] [float] NULL,
 CONSTRAINT [PK_DetalleFactura] PRIMARY KEY CLUSTERED 
(
	[IdDetalleFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Factura]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Factura](
	[IdFactura] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[Fecha] [date] NULL,
	[NombreVendedor] [varchar](100) NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[IdFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [varchar](50) NULL,
	[DescripcionCorta] [varchar](50) NULL,
	[Inventario] [int] NULL,
	[Precio] [float] NULL,
	[Costo] [float] NULL,
	[UnidadesVendidas] [int] NULL,
	[FechaIngreso] [date] NULL,
	[estado] [varchar](15) NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario_Sistema]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario_Sistema](
	[idUsuario] [int] IDENTITY(0,1) NOT NULL,
	[usuario] [varchar](50) NULL,
	[contraseña] [varchar](150) NULL,
	[rol] [varchar](50) NULL,
	[estado] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [Correo], [Celular], [estado]) VALUES (1, N'Mercedes', N'Francisca', N'Mendiola', N'Oviedo    ', N'mercedes@yahoo.com', 54321796, N'Habilitado')
INSERT [dbo].[Cliente] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [Correo], [Celular], [estado]) VALUES (2, N'Liam', N'Mateo', N'Gonzales', N'Rodriguez ', N'liam@gmail.com', 71946324, N'Habilitado')
INSERT [dbo].[Cliente] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [Correo], [Celular], [estado]) VALUES (3, N'Olivia', N'Victoria', N'Gomez', N'Fernandez ', N'olivia@outlook.com', 48291039, N'Habilitado')
INSERT [dbo].[Cliente] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [Correo], [Celular], [estado]) VALUES (4, N'Noah', N'Gabriel', N'Lopez', N'Diaz      ', N'noah@hotmail.com', 10295212, N'Habilitado')
INSERT [dbo].[Cliente] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [Correo], [Celular], [estado]) VALUES (5, N'Emma', N'Stella', N'Martinez', N'Perez     ', N'emma@hotmail.com', 98212345, N'Habilitado')
INSERT [dbo].[Cliente] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [Correo], [Celular], [estado]) VALUES (6, N'Ava', N'Ariana', N'Garcia', N'Sanchez   ', N'ava@outlook.com', 23122312, N'Habilitado')
INSERT [dbo].[Cliente] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [Correo], [Celular], [estado]) VALUES (7, N'Sophia', N'Elena', N'Romero', N'Sosa      ', N'sophia@gmail.com', 13929394, N'Habilitado')
INSERT [dbo].[Cliente] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [Correo], [Celular], [estado]) VALUES (8, N'Lucas', N'Aaron', N'Torres', N'Alvarez   ', N'luca@gmail.com', 32939403, N'Habilitado')
INSERT [dbo].[Cliente] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [Correo], [Celular], [estado]) VALUES (9, N'Henry', N'Xavier', N'Ruiz', N'Ramirez   ', N'henry@gmail.com', 84395678, N'Habilitado')
INSERT [dbo].[Cliente] ([IdCliente], [PrimerNombre], [SegundoNombre], [PrimerApellido], [SegundoApellido], [Correo], [Celular], [estado]) VALUES (10, N'Layla', N'Eliza', N'Flores', N'Ortiz     ', N'layla@hotmail.com', 43126749, N'Habilitado')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[DetalleFactura] ON 

INSERT [dbo].[DetalleFactura] ([IdDetalleFactura], [IdFactura], [IdProducto], [Precio], [Cantidad], [Descuento]) VALUES (1, 3, 15, 37, 10, 0)
SET IDENTITY_INSERT [dbo].[DetalleFactura] OFF
GO
SET IDENTITY_INSERT [dbo].[Factura] ON 

INSERT [dbo].[Factura] ([IdFactura], [IdCliente], [Fecha], [NombreVendedor]) VALUES (3, 1, CAST(N'2021-03-30' AS Date), N'cajero')
SET IDENTITY_INSERT [dbo].[Factura] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 

INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (1, N'Combis 1lb', N'Alimento Perro', 123, 20, 12, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (2, N'Combis 20kg', N'Alimento Perro', 20, 748, 528, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (3, N'Alpo 1lb', N'Alimento Perro', 220, 28, 22, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (4, N'Alpo 20kg', N'Alimento Perro', 20, 1144, 968, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (5, N'Kan Kan 1lb', N'Alimento Perro', 88, 20, 12, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (6, N'Kan Kan 20kg', N'Alimento Perro', 5, 748, 528, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (7, N'DogChow Adulto 1lb', N'Alimento Perro', 132, 34, 28, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (8, N'DogChow Adulto 20kg', N'Alimento Perro', 15, 1408, 1232, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (9, N'DogChow Cachorro 1lb', N'Alimento Perro', 132, 36, 30, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (10, N'DogChow Cachorro 20kg', N'Alimento Perro', 15, 1496, 1320, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (11, N'CatChow 1lb', N'Alimento Gato', 44, 34, 28, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (12, N'CatChow 10kg', N'Alimento Gato', 704, 10, 10, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (13, N'Kitty 1lb', N'Alimento Gato', 44, 30, 22, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (14, N'Kitty 10kg', N'Alimento Gato', 5, 616, 484, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
INSERT [dbo].[Producto] ([IdProducto], [NombreProducto], [DescripcionCorta], [Inventario], [Precio], [Costo], [UnidadesVendidas], [FechaIngreso], [estado]) VALUES (15, N'Gati Mar y Tierra 1lb', N'Alimento Gato', 110, 37, 30, 0, CAST(N'2021-03-30' AS Date), N'Habilitado')
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario_Sistema] ON 

SET IDENTITY_INSERT [dbo].[Usuario_Sistema] OFF
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([IdFactura])
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Factura] FOREIGN KEY([IdFactura])
REFERENCES [dbo].[Factura] ([IdFactura])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Factura]
GO
ALTER TABLE [dbo].[DetalleFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetalleFactura_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleFactura] CHECK CONSTRAINT [FK_DetalleFactura_Producto]
GO
ALTER TABLE [dbo].[Factura]  WITH CHECK ADD  CONSTRAINT [FK_Factura_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Factura] CHECK CONSTRAINT [FK_Factura_Cliente]
GO
/****** Object:  StoredProcedure [dbo].[BuscarCliente]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarCliente]
@dato nvarchar(100)
AS
SELECT TOP 20 
C.IdCliente as [ID],
C.PrimerNombre as [Primer Nombre],
C.SegundoNombre as [Segundo Nombre],
C.PrimerApellido as [Primer Apellido],
C.SegundoApellido as [Segundo Apellido],
C.Correo, C.Celular,
C.estado as [Estado]
From [dbo].[Cliente] AS C
WHERE C.IdCliente like @dato + '%'
or C.PrimerNombre like @dato + '%'
or C.SegundoNombre like @dato + '%'
or C.PrimerApellido like @dato + '%'
or C.SegundoApellido like @dato + '%'
or C.Correo like @dato + '%'
or C.Celular like @dato + '%'
or C.estado like @dato + '%'
GO
/****** Object:  StoredProcedure [dbo].[BuscarProducto]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarProducto]
@dato nvarchar(100)
AS
SELECT TOP 20 
P.IdProducto AS [ID],
P.NombreProducto AS [Nombre],
P.DescripcionCorta AS [Descripción],
P.Precio, P.Inventario, P.Costo,
P.UnidadesVendidas AS [Unidades Vendidas],
P.FechaIngreso as [Fecha Ingreso],
P.estado as [Estado]
FROM [dbo].[Producto] AS P
WHERE P.NombreProducto like @dato + '%'
or P.DescripcionCorta like @dato + '%'
or P.Precio like @dato + '%'
or P.UnidadesVendidas like @dato + '%'
or P.FechaIngreso like @dato + '%'
or P.estado like @dato + '%'
---------------------------------------------- Nuevo
GO
/****** Object:  StoredProcedure [dbo].[BuscarUsuario]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarUsuario]
@dato nvarchar(100)
AS
SELECT TOP 20
US.idUsuario as ID,
US.usuario as Usuario,
US.rol as Rol,
US.Estado
FROM [dbo].[Usuario_Sistema] as US
WHERE US.idUsuario like @dato + '%'
or US.usuario like @dato + '%'
or US.rol like @dato + '%'
or US.Estado like @dato + '%'
GO
/****** Object:  StoredProcedure [dbo].[DeshabilitarCliente]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeshabilitarCliente]
@Id int
as
update Cliente set Estado = 'Deshabilitado'
where IdCliente = @Id;
GO
/****** Object:  StoredProcedure [dbo].[DeshabilitarProducto]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeshabilitarProducto]
@Id int
as
update Producto set Estado = 'Deshabilitado'
where IdProducto = @Id;
GO
/****** Object:  StoredProcedure [dbo].[DeshabilitarUsuario]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeshabilitarUsuario]
@Id INT
AS
update [dbo].Usuario_Sistema set Estado = 'Deshabilitado'
where idUsuario = @Id;
GO
/****** Object:  StoredProcedure [dbo].[HabilitarCliente]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[HabilitarCliente]
@Id int
as
update Cliente set Estado = 'Habilitado'
where IdCliente = @Id;
GO
/****** Object:  StoredProcedure [dbo].[HabilitarProducto]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[HabilitarProducto]
@Id int
as
update Producto set Estado = 'Habilitado'
where IdProducto = @Id;
GO
/****** Object:  StoredProcedure [dbo].[HabilitarUsuario]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HabilitarUsuario]
@Id INT
AS
update [dbo].Usuario_Sistema set Estado = 'Habilitado'
where idUsuario = @Id;
GO
/****** Object:  StoredProcedure [dbo].[Insertar_Usuario]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[Insertar_Usuario]
 @usuario varchar(50), @contraseña varchar(50), @rol varchar(50)
 as
 insert into Usuario_sistema values
 (@usuario, ENCRYPTBYPASSPHRASE(@contraseña,  @contraseña), @rol, 'Habilitado')

GO
/****** Object:  StoredProcedure [dbo].[InsertarDetalleFactura]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[InsertarDetalleFactura]
@IDFactura int,
@IDProducto int,
@Precio float,
@Cantidad int
as
insert into DetalleFactura
values(@IDFactura, @IDProducto, @Precio, @Cantidad, 0)
GO
/****** Object:  StoredProcedure [dbo].[InsertarFactura]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertarFactura]
@IDCliente int,
@Vendedor varchar(100)
as
declare @IDFactura int
insert into Factura
values(@IDCliente, GETDATE(), @Vendedor)
set @IDFactura = @@IDENTITY
select @IDFactura as IDFactura
GO
/****** Object:  StoredProcedure [dbo].[ModificarCliente]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarCliente]
@id int,
@PrimerNombre VARCHAR(50), @SegundoNombre VARCHAR(50),
@PrimerApellido VARCHAR(50), @SegundoApellido NCHAR(10),
@Correo NVARCHAR(100), @Celular INT
AS
UPDATE [MiEmpresa].[dbo].[Cliente] SET
Cliente.PrimerNombre = @PrimerNombre,
Cliente.SegundoNombre = @SegundoNombre,
Cliente.PrimerApellido = @PrimerApellido,
Cliente.SegundoApellido = @SegundoApellido,
Cliente.Correo = @Correo,
Cliente.Celular = @Celular
WHERE Cliente.IdCliente = @id
GO
/****** Object:  StoredProcedure [dbo].[ModificarProducto]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModificarProducto]
@IdProducto int,
@NombreProducto VARCHAR(50), @DescripcionCorta VARCHAR(50),
@Inventario int, @Precio float, @Costo Float,
@UnidadesVendidas int, @FechaIngreso date
AS
UPDATE [MiEmpresa].[dbo].[Producto] SET
NombreProducto = @NombreProducto,
DescripcionCorta = @DescripcionCorta, 
Inventario = @Inventario, 
Precio = @Precio, 
Costo = @Costo,
UnidadesVendidas = @UnidadesVendidas,
FechaIngreso = @FechaIngreso
WHERE IdProducto = @IdProducto

---------------------------------------------- Seguridad
GO
/****** Object:  StoredProcedure [dbo].[ModificarUsuario]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create procedure [dbo].[ModificarUsuario]
 @Id int, @contraseña varchar(50), @rol varchar(50)
 as
 update Usuario_Sistema set
 contraseña = ENCRYPTBYPASSPHRASE(@contraseña,  @contraseña),
 rol = @rol
 where idUsuario = @Id
GO
/****** Object:  StoredProcedure [dbo].[MostrarClientes]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MostrarClientes]
AS
SELECT TOP 20 
C.IdCliente as [ID],
C.PrimerNombre as [Primer Nombre],
C.SegundoNombre as [Segundo Nombre],
C.PrimerApellido as [Primer Apellido],
C.SegundoApellido as [Segundo Apellido],
C.Correo, C.Celular,
C.estado as [Estado]
FROM [dbo].[Cliente] AS C
GO
/****** Object:  StoredProcedure [dbo].[MostrarDetalleFactura]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MostrarDetalleFactura]
AS
SELECT TOP 20
DF.IdDetalleFactura as [ID Detalle Factura],
DF.IdFactura as [ID Factura],
DF.IdProducto as [ID Producto],
DF.Precio,
DF.Cantidad,
DF.Descuento
FROM [dbo].[DetalleFactura] AS DF
---------------------------------------------- Buscar
GO
/****** Object:  StoredProcedure [dbo].[MostrarFacturas]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MostrarFacturas]
AS
SELECT TOP 20 
F.IdFactura as [ID Factura],
F.IdCliente as [ID Cliente],
F.NombreVendedor as [Vendedor],
F.Fecha
FROM [dbo].[Factura] AS F
GO
/****** Object:  StoredProcedure [dbo].[MostrarProductos]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MostrarProductos]
AS
SELECT TOP 20 
P.IdProducto AS [ID],
P.NombreProducto AS [Nombre],
P.DescripcionCorta AS [Descripción],
P.Precio, P.Inventario, P.Costo,
P.UnidadesVendidas AS [Unidades Vendidas],
P.FechaIngreso as [Fecha Ingreso],
P.estado as [Estado]
FROM [dbo].[Producto] AS P
GO
/****** Object:  StoredProcedure [dbo].[MostrarUsuarios]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MostrarUsuarios]
AS
SELECT TOP 20
US.idUsuario as ID,
US.usuario as Usuario,
US.rol as Rol,
US.estado as Estado
FROM [dbo].[Usuario_Sistema] as US
GO
/****** Object:  StoredProcedure [dbo].[NuevoCliente]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NuevoCliente]
@PrimerNombre VARCHAR(50), @SegundoNombre VARCHAR(50),
@PrimerApellido VARCHAR(50), @SegundoApellido NCHAR(10),
@Correo NVARCHAR(100), @Celular INT
AS
INSERT INTO [MiEmpresa].[dbo].[Cliente]
VALUES(@PrimerNombre,  @SegundoNombre, @PrimerApellido, @SegundoApellido, @Correo, @Celular, 'Habilitado')
GO
/****** Object:  StoredProcedure [dbo].[NuevoProducto]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NuevoProducto]
@NombreProducto VARCHAR(50), @DescripcionCorta VARCHAR(50),
@Inventario int, @Precio float, @Costo Float,
@UnidadesVendidas int, @FechaIngreso date
AS
INSERT INTO [MiEmpresa].[dbo].[Producto] 
VALUES(@NombreProducto, @DescripcionCorta, @Inventario, @Precio, @Costo, @UnidadesVendidas, @FechaIngreso, 'Habilitado')
GO
/****** Object:  StoredProcedure [dbo].[Validar_Acceso]    Script Date: 30/3/2021 12:22:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Validar_Acceso]
@usuario varchar(50),
@contraseña varchar(50)
as
if exists (Select usuario from Usuario_sistema
            where  cast (DECRYPTBYPASSPHRASE(@contraseña, contraseña) as Varchar(100)) = @contraseña
			 and usuario = @Usuario )
			 select 'Acceso Exitoso' as Resultado,
			 US.estado as Estado,
			 US.idUsuario as ID,
			 US.rol as Rol,
			 US.usuario as Usuario
			 from Usuario_Sistema as US
			 where  cast (DECRYPTBYPASSPHRASE(@contraseña, contraseña) as Varchar(100)) = @contraseña
			 and usuario = @Usuario
			 else
			 Select 'Acceso Denegado' as Resultado
GO
execute Insertar_Usuario 'admin', 'admin', 'Administrador'
execute Insertar_Usuario 'cajero', 'cajero', 'Cajero'
execute Insertar_Usuario 'recepcionista', 'recepcionista', 'Recepcionista'
execute Insertar_Usuario 'reportes', 'reportes', 'Reportes'
USE [master]
GO
ALTER DATABASE [MiEmpresa] SET  READ_WRITE 
GO

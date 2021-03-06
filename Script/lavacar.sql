USE [master]
GO
/****** Object:  Database [LavaCar]    Script Date: 27/8/2020 16:12:59 ******/
CREATE DATABASE [LavaCar]
 CONTAINMENT = NONE
ALTER DATABASE [LavaCar] SET COMPATIBILITY_LEVEL = 150
GO

ALTER DATABASE [LavaCar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LavaCar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LavaCar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LavaCar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LavaCar] SET ARITHABORT OFF 
GO
ALTER DATABASE [LavaCar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LavaCar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LavaCar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LavaCar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LavaCar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LavaCar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LavaCar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LavaCar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LavaCar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LavaCar] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LavaCar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LavaCar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LavaCar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LavaCar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LavaCar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LavaCar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LavaCar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LavaCar] SET RECOVERY FULL 
GO
ALTER DATABASE [LavaCar] SET  MULTI_USER 
GO
ALTER DATABASE [LavaCar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LavaCar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LavaCar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LavaCar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LavaCar] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LavaCar', N'ON'
GO
ALTER DATABASE [LavaCar] SET QUERY_STORE = OFF
GO
USE [LavaCar]
GO
/****** Object:  Table [dbo].[caja_chica]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caja_chica](
	[id_caja] [int] IDENTITY(1,1) NOT NULL,
	[hora_apertura] [datetime] NOT NULL,
	[hora_cierre] [datetime] NULL,
	[monto_apertura] [float] NOT NULL,
	[monto_cierre_total] [float] NULL,
	[id_usuario_apertura] [int] NOT NULL,
	[id_usuario_cierre] [int] NULL,
 CONSTRAINT [PK_caja_chica] PRIMARY KEY CLUSTERED 
(
	[id_caja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Canton]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Canton](
	[id_Canton] [int] IDENTITY(1,1) NOT NULL,
	[id_Provincia] [int] NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[usuarioCrea] [varchar](50) NULL,
	[fechaCrea] [datetime] NULL,
	[usuarioModifica] [varchar](50) NULL,
	[fechaModifica] [datetime] NULL,
	[vc_Estado] [varchar](3) NULL,
	[id_CantonInec] [int] NOT NULL,
 CONSTRAINT [PK_Canton] PRIMARY KEY CLUSTERED 
(
	[id_Canton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cliente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cliente] [nchar](100) NOT NULL,
	[apellido1] [nchar](100) NOT NULL,
	[apellido2] [nchar](100) NULL,
	[cedula] [int] NOT NULL,
	[id_provincia] [int] NOT NULL,
	[id_canton] [int] NOT NULL,
	[id_distrito] [int] NOT NULL,
	[direccion] [nvarchar](100) NOT NULL,
	[telefono] [int] NULL,
	[email] [nchar](30) NULL,
 CONSTRAINT [PK_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Distrito]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Distrito](
	[id_Distrito] [int] IDENTITY(1,1) NOT NULL,
	[id_Canton] [int] NULL,
	[nombre] [varchar](100) NOT NULL,
	[usuarioCrea] [varchar](50) NULL,
	[fechaCrea] [datetime] NULL,
	[usuarioModifica] [varchar](50) NULL,
	[fechaModifica] [datetime] NULL,
	[vc_Estado] [varchar](3) NULL,
	[id_DistritoInec] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fabricante]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fabricante](
	[id_fabricante] [int] IDENTITY(1,1) NOT NULL,
	[nombre_fabricante] [nvarchar](100) NOT NULL,
	[pais] [int] NULL,
 CONSTRAINT [PK_fabricante] PRIMARY KEY CLUSTERED 
(
	[id_fabricante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura_detalle]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura_detalle](
	[id_detalle_factura] [int] IDENTITY(1,1) NOT NULL,
	[id_factura_encabezado] [int] NOT NULL,
	[id_servicio] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[precio_servicio] [float] NOT NULL,
 CONSTRAINT [PK_factura_detalle] PRIMARY KEY CLUSTERED 
(
	[id_detalle_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[factura_encabezado]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[factura_encabezado](
	[id_factura] [int] IDENTITY(1,1) NOT NULL,
	[fecha_factura] [datetime] NOT NULL,
	[id_cliente_factura] [int] NOT NULL,
	[vehiculo_id] [int] NOT NULL,
	[total_pagar] [float] NULL,
	[total_sin_iv] [float] NULL,
	[estado_factura] [bit] NOT NULL,
 CONSTRAINT [PK_factura_encabezado] PRIMARY KEY CLUSTERED 
(
	[id_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[marca_vehiculo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[marca_vehiculo](
	[id_marca] [int] IDENTITY(1,1) NOT NULL,
	[nombre_marca] [nchar](55) NOT NULL,
	[id_fabricante] [int] NULL,
 CONSTRAINT [PK_marca_vehículo] PRIMARY KEY CLUSTERED 
(
	[id_marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modelo_vehiculo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modelo_vehiculo](
	[id_modelo] [int] IDENTITY(1,1) NOT NULL,
	[nombre_modelo] [nvarchar](50) NOT NULL,
	[id_marca_modelo] [int] NOT NULL,
 CONSTRAINT [PK_modelo_vehículo] PRIMARY KEY CLUSTERED 
(
	[id_modelo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pais]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pais](
	[id_pais] [int] IDENTITY(1,1) NOT NULL,
	[nombre_pais] [nchar](100) NOT NULL,
 CONSTRAINT [PK_País] PRIMARY KEY CLUSTERED 
(
	[id_pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parametros]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parametros](
	[id_parametro] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[correo_apertura] [nvarchar](50) NOT NULL,
	[correo_cierre] [nvarchar](50) NOT NULL,
	[monto_minimo] [float] NOT NULL,
 CONSTRAINT [PK_Parametros] PRIMARY KEY CLUSTERED 
(
	[id_parametro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincia]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincia](
	[id_Provincia] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[usuarioCrea] [varchar](50) NULL,
	[fechaCrea] [datetime] NULL,
	[usuarioModifica] [varchar](50) NULL,
	[fechaModifica] [datetime] NULL,
	[vc_Estado] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_servicio]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_servicio](
	[id_servicio] [int] IDENTITY(1,1) NOT NULL,
	[nombre_servicio] [nchar](50) NOT NULL,
	[precio_servicio] [float] NULL,
 CONSTRAINT [PK_tipo_servicio] PRIMARY KEY CLUSTERED 
(
	[id_servicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_vehiculo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_vehiculo](
	[id_tipo_vehiculo] [int] IDENTITY(1,1) NOT NULL,
	[nombre_vehiculo] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tipo_vehículo] PRIMARY KEY CLUSTERED 
(
	[id_tipo_vehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuario]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[tipo_usuario] [nvarchar](10) NOT NULL,
	[nombre_usuario] [nvarchar](50) NOT NULL,
	[contraseña] [nvarchar](50) NOT NULL,
	[correo_usuario] [nvarchar](50) NOT NULL,
	[FechaIngreso] [date] NULL,
 CONSTRAINT [PK_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehiculos]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehiculos](
	[id_vehiculo] [int] IDENTITY(1,1) NOT NULL,
	[placa] [int] NOT NULL,
	[id_marca] [int] NOT NULL,
	[id_tipo_vehiculo] [int] NOT NULL,
	[id_modelo_vehiculo] [int] NOT NULL,
	[cantidad_puertas] [smallint] NOT NULL,
	[cantidad_ruedas] [smallint] NOT NULL,
	[año_fabricacion] [date] NOT NULL,
	[id_fabricante_vehiculo] [int] NOT NULL,
 CONSTRAINT [PK_vehículos] PRIMARY KEY CLUSTERED 
(
	[id_vehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehiculos_x_cliente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehiculos_x_cliente](
	[id_vehiculo_cliente] [int] IDENTITY(1,1) NOT NULL,
	[id_vehiculo] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
 CONSTRAINT [PK_vehículos_x_cliente] PRIMARY KEY CLUSTERED 
(
	[id_vehiculo_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[caja_chica] ON 

INSERT [dbo].[caja_chica] ([id_caja], [hora_apertura], [hora_cierre], [monto_apertura], [monto_cierre_total], [id_usuario_apertura], [id_usuario_cierre]) VALUES (1, CAST(N'2020-08-25T22:13:53.857' AS DateTime), NULL, 100, 0, 1, 2)
INSERT [dbo].[caja_chica] ([id_caja], [hora_apertura], [hora_cierre], [monto_apertura], [monto_cierre_total], [id_usuario_apertura], [id_usuario_cierre]) VALUES (2, CAST(N'2020-08-27T03:35:50.997' AS DateTime), NULL, 5000, NULL, 2, NULL)
SET IDENTITY_INSERT [dbo].[caja_chica] OFF
GO
SET IDENTITY_INSERT [dbo].[Canton] ON 

INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (1, 1, N'SAN JOSE', N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'A', 101)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (2, 1, N'ESCAZU', N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'A', 102)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (3, 1, N'DESAMPARADOS', N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'A', 103)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (4, 1, N'PURISCAL', N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'A', 104)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (5, 1, N'TARRAZU', N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.320' AS DateTime), N'A', 105)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (6, 1, N'ASERRI', N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'A', 106)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (7, 1, N'MORA', N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'A', 107)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (8, 1, N'GOICOECHEA', N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'A', 108)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (9, 1, N'SANTA ANA', N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'A', 109)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (10, 1, N'ALAJUELITA', N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'A', 110)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (11, 1, N'VAZQUEZ DE CORONADO', N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.323' AS DateTime), N'A', 111)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (12, 1, N'ACOSTA', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 112)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (13, 1, N'TIBAS', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 113)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (14, 1, N'MORAVIA', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 114)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (15, 1, N'MONTES DE OCA', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 115)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (16, 1, N'TURRUBARES', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 116)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (17, 1, N'DOTA', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 117)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (18, 1, N'CURRIDABAT', N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.327' AS DateTime), N'A', 118)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (19, 1, N'PEREZ ZELEDON', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 119)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (20, 1, N'LEON CORTES', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 120)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (21, 2, N'ALAJUELA', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 201)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (22, 2, N'SAN RAMON', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 202)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (23, 2, N'GRECIA', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 203)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (24, 2, N'SAN MATEO', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 204)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (25, 2, N'ATENAS', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 205)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (26, 2, N'NARANJO', N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.330' AS DateTime), N'A', 206)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (27, 2, N'PALMARES', N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'A', 207)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (28, 2, N'POAS', N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'A', 208)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (29, 2, N'OROTINA', N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'A', 209)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (30, 2, N'SAN CARLOS', N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'A', 210)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (31, 2, N'ALFARO RUIZ', N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'A', 211)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (32, 2, N'VALVERDE VEGA', N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.333' AS DateTime), N'A', 212)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (33, 2, N'UPALA', N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'A', 213)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (34, 2, N'LOS CHILES', N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'A', 214)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (35, 2, N'GUATUSO', N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'A', 215)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (36, 3, N'CARTAGO', N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'A', 301)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (37, 3, N'PARAISO', N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'A', 302)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (38, 3, N'LA UNION', N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.337' AS DateTime), N'A', 303)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (39, 3, N'JIMENEZ', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 304)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (40, 3, N'TURRIALBA', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 305)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (41, 3, N'ALVARADO', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 306)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (42, 3, N'OREAMUNO', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 307)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (43, 3, N'EL GUARCO', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 308)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (44, 4, N'HEREDIA', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 401)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (45, 4, N'BARVA', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 402)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (46, 4, N'SANTO DOMINGO', N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.340' AS DateTime), N'A', 403)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (47, 4, N'SANTA BARBARA', N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'A', 404)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (48, 4, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'A', 405)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (49, 4, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'A', 406)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (50, 4, N'BELEN', N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'A', 407)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (51, 4, N'FLORES', N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'A', 408)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (52, 4, N'SAN PABLO', N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.343' AS DateTime), N'A', 409)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (53, 4, N'SARAPIQUI', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 410)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (54, 5, N'LIBERIA', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 501)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (55, 5, N'NICOYA', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 502)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (56, 5, N'SANTA CRUZ', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 503)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (57, 5, N'BAGACES', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 504)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (58, 5, N'CARRILLO', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 505)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (59, 5, N'CAÑAS', N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.347' AS DateTime), N'A', 506)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (60, 5, N'ABANGARES', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 507)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (61, 5, N'TILARAN', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 508)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (62, 5, N'NANDAYURE', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 509)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (63, 5, N'LA CRUZ', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 510)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (64, 5, N'HOJANCHA', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 511)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (65, 6, N'PUNTARENAS', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 601)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (66, 6, N'ESPARZA', N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.350' AS DateTime), N'A', 602)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (67, 6, N'BUENOS AIRES', N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'A', 603)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (68, 6, N'MONTES DE ORO', N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'A', 604)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (69, 6, N'OSA', N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'A', 605)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (70, 6, N'AGUIRRE', N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'A', 606)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (71, 6, N'GOLFITO', N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.353' AS DateTime), N'A', 607)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (72, 6, N'COTO BRUS', N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'A', 608)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (73, 6, N'PARRITA', N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'A', 609)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (74, 6, N'CORREDORES', N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'A', 610)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (75, 6, N'GARABITO', N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'A', 611)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (76, 7, N'LIMON', N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'A', 701)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (77, 7, N'POCOCI', N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.357' AS DateTime), N'A', 702)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (78, 7, N'SIQUIRRES', N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'A', 703)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (79, 7, N'TALAMANCA', N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'A', 704)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (80, 7, N'MATINA', N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'A', 705)
INSERT [dbo].[Canton] ([id_Canton], [id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_CantonInec]) VALUES (81, 7, N'GUACIMO', N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'sa', CAST(N'2014-06-17T11:38:27.360' AS DateTime), N'A', 706)
SET IDENTITY_INSERT [dbo].[Canton] OFF
GO
SET IDENTITY_INSERT [dbo].[cliente] ON 

INSERT [dbo].[cliente] ([id_cliente], [nombre_cliente], [apellido1], [apellido2], [cedula], [id_provincia], [id_canton], [id_distrito], [direccion], [telefono], [email]) VALUES (2, N'Andre                                                                                               ', N'Chinchilla                                                                                          ', N'González                                                                                            ', 114150926, 1, 3, 15, N'San Jose', 22222222, N'andre@andre.com               ')
INSERT [dbo].[cliente] ([id_cliente], [nombre_cliente], [apellido1], [apellido2], [cedula], [id_provincia], [id_canton], [id_distrito], [direccion], [telefono], [email]) VALUES (3, N'Armando                                                                                             ', N'Ramirez                                                                                             ', N'Echenique                                                                                           ', 123456, 2, 21, 120, N'San José', 88888888, N'armando@armando.com           ')
INSERT [dbo].[cliente] ([id_cliente], [nombre_cliente], [apellido1], [apellido2], [cedula], [id_provincia], [id_canton], [id_distrito], [direccion], [telefono], [email]) VALUES (4, N'Marco                                                                                               ', N'Maquiño                                                                                             ', N'Marquez                                                                                             ', 564546, 1, 1, 1, N'El pueblo', 789456, N'marco@marco.com               ')
INSERT [dbo].[cliente] ([id_cliente], [nombre_cliente], [apellido1], [apellido2], [cedula], [id_provincia], [id_canton], [id_distrito], [direccion], [telefono], [email]) VALUES (1004, N'Max                                                                                                 ', N'Maximus                                                                                             ', N'Maxine                                                                                              ', 8080, 1, 8, 1, N'El pueblo', 88888888, N'max@max.com                   ')
SET IDENTITY_INSERT [dbo].[cliente] OFF
GO
SET IDENTITY_INSERT [dbo].[Distrito] ON 

INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (1, 1, N'EL CARMEN', N'sa', CAST(N'2014-06-17T11:39:58.377' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.377' AS DateTime), N'A', 10101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (2, 1, N'MERCED', N'sa', CAST(N'2014-06-17T11:39:58.377' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.377' AS DateTime), N'A', 10102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (3, 1, N'HOSPITAL', N'sa', CAST(N'2014-06-17T11:39:58.377' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.377' AS DateTime), N'A', 10103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (4, 1, N'CATEDRAL', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (5, 1, N'ZAPOTE', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (6, 1, N'SAN FRANCISCO DE DOS RIOS', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10106)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (7, 1, N'URUCA', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10107)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (8, 1, N'MATA REDONDA', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10108)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (9, 1, N'PAVAS', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10109)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (10, 1, N'HATILLO', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10110)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (11, 2, N'ESCAZU', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (12, 2, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (13, 2, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.380' AS DateTime), N'A', 10203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (14, 3, N'DESAMPARADOS', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (15, 3, N'SAN MIGUEL', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (16, 3, N'SAN JUAN DE DIOS', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (17, 3, N'SAN RAFAEL ARRIBA', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (18, 3, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (19, 3, N'FRAILES', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (20, 3, N'PATARRA', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10307)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (21, 3, N'SAN CRISTOBAL', N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.383' AS DateTime), N'A', 10308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (22, 3, N'ROSARIO', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10309)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (23, 3, N'DAMAS', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10310)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (24, 3, N'SAN RAFAEL ABAJO', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10311)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (25, 3, N'GRAVILIAS', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10312)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (26, 3, N'LOS GUIDO', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10313)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (27, 4, N'SANTIAGO', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (28, 4, N'MERCEDES SUR', N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.387' AS DateTime), N'A', 10402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (29, 4, N'BARBACOAS', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (30, 4, N'GRIFO ALTO', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10404)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (31, 4, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10405)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (32, 4, N'CANDELARITA', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10406)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (33, 4, N'DESAMPARADITOS', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10407)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (34, 4, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10408)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (35, 4, N'CHIRES', N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.390' AS DateTime), N'A', 10409)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (36, 5, N'SAN MARCOS', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (37, 5, N'SAN LORENZO', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (38, 5, N'SAN CARLOS', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (39, 6, N'ASERRI', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (40, 6, N'TARBACA', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (41, 6, N'VUELTA DE JORCO', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (42, 6, N'SAN GABRIEL', N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.393' AS DateTime), N'A', 10604)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (43, 6, N'LEGUA', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10605)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (44, 6, N'MONTERREY', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10606)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (45, 6, N'SALITRILLOS', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10607)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (46, 7, N'COLON', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (47, 7, N'GUAYABO', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (48, 7, N'TABARCIA', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (49, 7, N'PIEDRAS NEGRAS', N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.397' AS DateTime), N'A', 10704)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (50, 7, N'PICAGRES', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10705)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (51, 8, N'GUADALUPE', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10801)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (52, 8, N'SAN FRANCISCO', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (53, 8, N'CALLE BLANCOS', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (54, 8, N'MATA DE PLATANO', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10804)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (55, 8, N'IPIS', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10805)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (56, 8, N'RANCHO REDONDO', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10806)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (57, 8, N'PURRAL', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10807)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (58, 9, N'SANTA ANA', N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.400' AS DateTime), N'A', 10901)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (59, 9, N'SALITRAL', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 10902)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (60, 9, N'POZOS', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 10903)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (61, 9, N'URUCA', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 10904)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (62, 9, N'PIEDADES', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 10905)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (63, 9, N'BRASIL', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 10906)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (64, 10, N'ALAJUELITA', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 11001)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (65, 10, N'SAN JOSECITO', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 11002)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (66, 10, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.403' AS DateTime), N'A', 11003)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (67, 10, N'CONCEPCION', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11004)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (68, 10, N'SAN FELIPE', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11005)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (69, 11, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (70, 11, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (71, 11, N'DULCE NOMBRE DE JESUS', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (72, 11, N'PATALILLO', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (73, 11, N'CASCAJAL', N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.407' AS DateTime), N'A', 11105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (74, 12, N'SAN IGNACIO', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (75, 12, N'GUAITIL', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (76, 12, N'PALMICHAL', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (77, 12, N'CANGREJAL', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (78, 12, N'SABANILLAS', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (79, 13, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (80, 13, N'CINCO ESQUINAS', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (81, 13, N'ANSELMO LLORENTE', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (82, 13, N'LEON XIII', N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.410' AS DateTime), N'A', 11304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (83, 13, N'COLIMA', N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'A', 11305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (84, 14, N'SAN VICENTE', N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'A', 11401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (85, 14, N'SAN JERONIMO', N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'A', 11402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (86, 14, N'LA TRINIDAD', N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'A', 11403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (87, 15, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'A', 11501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (88, 15, N'SABANILLA', N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.413' AS DateTime), N'A', 11502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (89, 15, N'MERCEDES', N'sa', CAST(N'2014-06-17T11:39:58.417' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.417' AS DateTime), N'A', 11503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (90, 15, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (91, 16, N'SAN PABLO', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (92, 16, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (93, 16, N'SAN JUAN DE MATA', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (94, 16, N'SAN LUIS', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11604)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (95, 16, N'CARARA', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11605)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (96, 17, N'SANTA MARIA', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (97, 17, N'JARDIN', N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.420' AS DateTime), N'A', 11702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (98, 17, N'COPEY', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (99, 18, N'CURRIDABAT', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11801)
GO
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (100, 18, N'GRANADILLA', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (101, 18, N'SANCHEZ', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (102, 18, N'TIRRASES', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11804)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (103, 19, N'SAN ISIDRO DEL GENERAL', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11901)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (104, 19, N'EL GENERAL', N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.423' AS DateTime), N'A', 11902)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (105, 19, N'DANIEL FLORES', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11903)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (106, 19, N'RIVAS', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11904)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (107, 19, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11905)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (108, 19, N'PLATANARES', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11906)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (109, 19, N'PEJIBAYE', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11907)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (110, 19, N'CAJON', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11908)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (111, 19, N'BARU', N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.427' AS DateTime), N'A', 11909)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (112, 19, N'RIO NUEVO', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 11910)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (113, 19, N'PARAMO', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 11911)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (114, 20, N'SAN PABLO', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 12001)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (115, 20, N'SAN ANDRES', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 12002)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (116, 20, N'LLANO BONITO', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 12003)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (117, 20, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 12004)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (118, 20, N'SANTA CRUZ', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 12005)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (119, 20, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 12006)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (120, 21, N'ALAJUELA', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 20101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (121, 21, N'SAN JOSE', N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.430' AS DateTime), N'A', 20102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (122, 21, N'CARRIZAL', N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'A', 20103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (123, 21, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'A', 20104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (124, 21, N'GUACIMA', N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'A', 20105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (125, 21, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'A', 20106)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (126, 21, N'SABANILLA', N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'A', 20107)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (127, 21, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.433' AS DateTime), N'A', 20108)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (128, 21, N'RIO SEGUNDO', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20109)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (129, 21, N'DESAMPARADOS', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20110)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (130, 21, N'TURRUCARES', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20111)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (131, 21, N'TAMBOR', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20112)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (132, 21, N'GARITA', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20113)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (133, 21, N'SARAPIQUI', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20114)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (134, 22, N'SAN RAMON', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (135, 22, N'SANTIAGO', N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.437' AS DateTime), N'A', 20202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (136, 22, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (137, 22, N'PIEDADES NORTE', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (138, 22, N'PIEDADES SUR', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (139, 22, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20206)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (140, 22, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20207)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (141, 22, N'ANGELES', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20208)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (142, 22, N'ALFARO', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20209)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (143, 22, N'VOLIO', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20210)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (144, 22, N'CONCEPCION', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20211)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (145, 22, N'ZAPOTAL', N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.440' AS DateTime), N'A', 20212)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (146, 22, N'PEÑAS BLANCAS', N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'A', 20213)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (147, 23, N'GRECIA', N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'A', 20301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (148, 23, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'A', 20302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (149, 23, N'SAN JOSE', N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'A', 20303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (150, 23, N'SAN ROQUE', N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'A', 20304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (151, 23, N'TACARES', N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.443' AS DateTime), N'A', 20305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (152, 23, N'RIO CUARTO', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (153, 23, N'PUENTE DE PIEDRA', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20307)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (154, 23, N'BOLIVAR', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (155, 24, N'SAN MATEO', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (156, 24, N'DESMONTE', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (157, 24, N'JESUS MARIA', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (158, 25, N'ATENAS', N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.447' AS DateTime), N'A', 20501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (159, 25, N'JESUS', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (160, 25, N'MERCEDES', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (161, 25, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (162, 25, N'CONCEPCION', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20505)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (163, 25, N'SAN JOSE', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20506)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (164, 25, N'SANTA EULALIA', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20507)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (165, 25, N'ESCOBAL', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20508)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (166, 26, N'NARANJO', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (167, 26, N'SAN MIGUEL', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (168, 26, N'SAN JOSE', N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.450' AS DateTime), N'A', 20603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (169, 26, N'CIRRI SUR', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20604)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (170, 26, N'SAN JERONIMO', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20605)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (171, 26, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20606)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (172, 26, N'EL ROSARIO', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20607)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (173, 26, N'PALMITOS', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20608)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (174, 27, N'PALMARES', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (175, 27, N'ZARAGOZA', N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.453' AS DateTime), N'A', 20702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (176, 27, N'BUENOS AIRES', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (177, 27, N'SANTIAGO', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20704)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (178, 27, N'CANDELARIA', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20705)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (179, 27, N'ESQUIPULAS', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20706)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (180, 27, N'LA GRANJA', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20707)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (181, 28, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20801)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (182, 28, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.457' AS DateTime), N'A', 20802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (183, 28, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (184, 28, N'CARRILLOS', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20804)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (185, 28, N'SABANA REDONDA', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20805)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (186, 29, N'OROTINA', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20901)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (187, 29, N'EL MASTATE', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20902)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (188, 29, N'HACIENDA VIEJA', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20903)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (189, 29, N'COYOLAR', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20904)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (190, 29, N'LA CEIBA', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 20905)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (191, 30, N'QUESADA', N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.460' AS DateTime), N'A', 21001)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (192, 30, N'FLORENCIA', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21002)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (193, 30, N'BUENAVISTA', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21003)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (194, 30, N'AGUAS ZARCAS', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21004)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (195, 30, N'VENECIA', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21005)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (196, 30, N'PITAL', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21006)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (197, 30, N'LA FORTUNA', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21007)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (198, 30, N'LA TIGRA', N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.463' AS DateTime), N'A', 21008)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (199, 30, N'LA PALMERA', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21009)
GO
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (200, 30, N'VENADO', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21010)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (201, 30, N'CUTRIS', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21011)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (202, 30, N'MONTERREY', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21012)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (203, 30, N'POCOSOL', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21013)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (204, 31, N'ZARCERO', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (205, 31, N'LAGUNA', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (206, 31, N'TAPEZCO', N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.467' AS DateTime), N'A', 21103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (207, 31, N'GUADALUPE', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (208, 31, N'PALMIRA', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (209, 31, N'ZAPOTE', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21106)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (210, 31, N'BRISAS', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21107)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (211, 32, N'SARCHI NORTE', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (212, 32, N'SARCHI SUR', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (213, 32, N'TORO AMARILLO', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (214, 32, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (215, 32, N'RODRIGUEZ', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (216, 33, N'UPALA', N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.470' AS DateTime), N'A', 21301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (217, 33, N'AGUAS CLARAS', N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'A', 21302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (218, 33, N'SAN JOSE O PIZOTE', N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'A', 21303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (219, 33, N'BIJAGUA', N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'A', 21304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (220, 33, N'DELICIAS', N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'A', 21305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (221, 33, N'DOS RIOS', N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'A', 21306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (222, 33, N'YOLILLAL', N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.473' AS DateTime), N'A', 21307)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (223, 34, N'LOS CHILES', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (224, 34, N'CAÑO NEGRO', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (225, 34, N'EL AMPARO', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (226, 34, N'SAN JORGE', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21404)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (227, 35, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (228, 35, N'BUENAVISTA', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (229, 35, N'COTE', N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.477' AS DateTime), N'A', 21503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (230, 35, N'KATIRA', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 21504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (231, 36, N'ORIENTAL', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (232, 36, N'OCCIDENTAL', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (233, 36, N'CARMEN', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (234, 36, N'SAN NICOLAS', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (235, 36, N'AGUACALIENTE O SAN FRANCISCO', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (236, 36, N'GUADALUPE O ARENILLA', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30106)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (237, 36, N'CORRALILLO', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30107)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (238, 36, N'TIERRA BLANCA', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30108)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (239, 36, N'DULCE NOMBRE', N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.480' AS DateTime), N'A', 30109)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (240, 36, N'LLANO GRANDE', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30110)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (241, 36, N'QUEBRADILLAS', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30111)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (242, 37, N'PARAISO', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (243, 37, N'SANTIAGO', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (244, 37, N'OROSI', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (245, 37, N'CACHI', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (246, 37, N'LLANOS DE SANTA LUCIA', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (247, 38, N'TRES RIOS', N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.483' AS DateTime), N'A', 30301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (248, 38, N'SAN DIEGO', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (249, 38, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (250, 38, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (251, 38, N'CONCEPCION', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (252, 38, N'DULCE NOMBRE', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (253, 38, N'SAN RAMON', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30307)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (254, 38, N'RIO AZUL', N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.487' AS DateTime), N'A', 30308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (255, 39, N'JUAN VIÑAS', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (256, 39, N'TUCURRIQUE', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (257, 39, N'PEJIBAYE', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (258, 40, N'TURRIALBA', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (259, 40, N'LA SUIZA', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (260, 40, N'PERALTA', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (261, 40, N'SANTA CRUZ', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (262, 40, N'SANTA TERESITA', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30505)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (263, 40, N'PAVONES', N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.490' AS DateTime), N'A', 30506)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (264, 40, N'TUIS', N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'A', 30507)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (265, 40, N'TAYUTIC', N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'A', 30508)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (266, 40, N'SANTA ROSA', N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'A', 30509)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (267, 40, N'TRES EQUIS', N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'A', 30510)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (268, 40, N'LA ISABEL', N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'A', 30511)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (269, 40, N'CHIRRIPO', N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.493' AS DateTime), N'A', 30512)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (270, 41, N'PACAYAS', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (271, 41, N'CERVANTES', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (272, 41, N'CAPELLADES', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (273, 42, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (274, 42, N'COT', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (275, 42, N'POTRERO CERRADO', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (276, 42, N'CIPRESES', N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.497' AS DateTime), N'A', 30704)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (277, 42, N'SANTA ROSA', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 30705)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (278, 43, N'EL TEJAR', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 30801)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (279, 43, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 30802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (280, 43, N'TOBOSI', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 30803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (281, 43, N'PATIO DE AGUA', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 30804)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (282, 44, N'HEREDIA', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 40101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (283, 44, N'MERCEDES', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 40102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (284, 44, N'SAN FRANCISCO', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 40103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (285, 44, N'ULLOA', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 40104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (286, 44, N'VARABLANCA', N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.500' AS DateTime), N'A', 40105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (287, 45, N'BARVA', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (288, 45, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (289, 45, N'SAN PABLO', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (290, 45, N'SAN ROQUE', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (291, 45, N'SANTA LUCIA', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (292, 45, N'SAN JOSE DE LA MONTAÑA', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40206)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (293, 46, N'SANTO DOMINGO', N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.503' AS DateTime), N'A', 40301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (294, 46, N'SAN VICENTE', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (295, 46, N'SAN MIGUEL', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (296, 46, N'PARACITO', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (297, 46, N'SANTO TOMAS', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (298, 46, N'SANTA ROSA', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (299, 46, N'TURES', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40307)
GO
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (300, 46, N'PARA', N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.507' AS DateTime), N'A', 40308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (301, 47, N'SANTA BARBARA', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (302, 47, N'SAN PEDRO', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (303, 47, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (304, 47, N'JESUS', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40404)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (305, 47, N'SANTO DOMINGO', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40405)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (306, 47, N'PURABA', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40406)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (307, 48, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (308, 48, N'SAN JOSECITO', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (309, 48, N'SANTIAGO', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (310, 48, N'ANGELES', N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.510' AS DateTime), N'A', 40504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (311, 48, N'CONCEPCION', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 405005)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (312, 49, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 406010)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (313, 49, N'SAN JOSE', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 40602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (314, 49, N'CONCEPCION', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 40603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (315, 49, N'SAN FRANCISCO', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 40604)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (316, 50, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 40701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (317, 50, N'LA RIBERA', N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.513' AS DateTime), N'A', 40702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (318, 50, N'LA ASUNCION', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 40703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (319, 51, N'SAN JOAQUIN', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 40801)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (320, 51, N'BARRANTES', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 40802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (321, 51, N'LLORENTE', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 40803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (322, 52, N'SAN PABLO', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 40901)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (323, 52, N'RINCON DE SABANILLA', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 40902)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (324, 53, N'PUERTO VIEJO', N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.517' AS DateTime), N'A', 41001)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (325, 53, N'LA VIRGEN', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 41002)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (326, 53, N'LAS HORQUETAS', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 41003)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (327, 53, N'LLANURAS DEL GASPAR', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 41004)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (328, 53, N'CUREÑA', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 41005)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (329, 54, N'LIBERIA', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 50101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (330, 54, N'CAÑAS DULCES', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 50102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (331, 54, N'MAYORGA', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 50103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (332, 54, N'NACASCOLO', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 50104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (333, 54, N'CURUBANDE', N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.520' AS DateTime), N'A', 50105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (334, 55, N'NICOYA', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (335, 55, N'MANSION', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (336, 55, N'SAN ANTONIO', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (337, 55, N'QUEBRADA HONDA', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (338, 55, N'SAMARA', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (339, 55, N'NOSARA', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50206)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (340, 55, N'BELEN DE NOSARITA', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50207)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (341, 56, N'SANTA CRUZ', N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.523' AS DateTime), N'A', 50301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (342, 56, N'BOLSON', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (343, 56, N'VEINTISIETE DE ABRIL', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (344, 56, N'TEMPATE', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (345, 56, N'CARTAGENA', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (346, 56, N'CUAJINIQUIL', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (347, 56, N'DIRIA', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50307)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (348, 56, N'CABO VELAS', N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.527' AS DateTime), N'A', 50308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (349, 56, N'TAMARINDO', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50309)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (350, 57, N'BAGACES', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (351, 57, N'LA FORTUNA', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (352, 57, N'MOGOTE', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (353, 57, N'RIO NARANJO', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50404)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (354, 58, N'FILADELFIA', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (355, 58, N'PALMIRA', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (356, 58, N'SARDINAL', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (357, 58, N'BELEN', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (358, 59, N'CAÑAS', N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.530' AS DateTime), N'A', 50601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (359, 59, N'PALMIRA', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (360, 59, N'SAN MIGUEL', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (361, 59, N'BEBEDERO', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50604)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (362, 59, N'POROZAL', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50605)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (363, 60, N'LAS JUNTAS', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (364, 60, N'SIERRA', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (365, 60, N'SAN JUAN', N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.533' AS DateTime), N'A', 50703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (366, 60, N'COLORADO', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50704)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (367, 61, N'TILARAN', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50801)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (368, 61, N'QUEBRADA GRANDE', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (369, 61, N'TRONADORA', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (370, 61, N'SANTA ROSA', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50804)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (371, 61, N'LIBANO', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50805)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (372, 61, N'TIERRAS MORENAS', N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.537' AS DateTime), N'A', 50806)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (373, 61, N'ARENAL', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50807)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (374, 62, N'CARMONA', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50901)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (375, 62, N'SANTA RITA', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50902)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (376, 62, N'ZAPOTAL', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50903)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (377, 62, N'SAN PABLO', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50904)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (378, 62, N'PORVENIR', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50905)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (379, 62, N'BEJUCO', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 50906)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (380, 63, N'LA CRUZ', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 51001)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (381, 63, N'SANTA CECILIA', N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.540' AS DateTime), N'A', 51002)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (382, 63, N'LA GARITA', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 51003)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (383, 63, N'SANTA ELENA', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 51004)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (384, 64, N'HOJANCHA', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 51101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (385, 64, N'MONTE ROMO', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 51102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (386, 64, N'PUERTO CARRILLO', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 51103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (387, 64, N'HUACAS', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 51104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (388, 65, N'PUNTARENAS', N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.543' AS DateTime), N'A', 60101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (389, 65, N'PITAHAYA', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (390, 65, N'CHOMES', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (391, 65, N'LEPANTO', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (392, 65, N'PAQUERA', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60105)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (393, 65, N'MANZANILLO', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60106)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (394, 65, N'GUACIMAL', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60107)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (395, 65, N'BARRANCA', N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.547' AS DateTime), N'A', 60108)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (396, 65, N'MONTE VERDE', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60109)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (397, 65, N'ISLA DEL COCO', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60110)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (398, 65, N'COBANO', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60111)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (399, 65, N'CHACARITA', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60112)
GO
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (400, 65, N'CHIRA', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60113)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (401, 65, N'ACAPULCO', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60114)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (402, 65, N'EL ROBLE', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60115)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (403, 65, N'ARANCIBIA', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60116)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (404, 66, N'ESPIRITU SANTO', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (476, 33, N'CANALETE', N'SA', CAST(N'2015-11-02T11:10:33.637' AS DateTime), N'SA', CAST(N'2015-11-02T11:10:33.637' AS DateTime), N'A', 21308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (477, 66, N'CALDERA', N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'A', 60206)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (478, 69, N'BAHIA DRAKE', N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'A', 60606)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (479, 72, N'GUTIERREZ BROWN', N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'A', 60806)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (480, 77, N'LA COLONIA', N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'A', 70207)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (481, 7, N'QUITIRRISÍ', N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'SA', CAST(N'2015-11-02T11:10:33.640' AS DateTime), N'A', 10707)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (405, 66, N'SAN JUAN GRANDE', N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.550' AS DateTime), N'A', 60202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (406, 66, N'MACACONA', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (407, 66, N'SAN RAFAEL', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (408, 66, N'SAN JERONIMO', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (409, 67, N'BUENOS AIRES', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (410, 67, N'VOLCAN', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (411, 67, N'POTRERO GRANDE', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (412, 67, N'BORUCA', N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.553' AS DateTime), N'A', 60304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (413, 67, N'PILAS', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (414, 67, N'COLINAS', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (415, 67, N'CHANGUENA', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60307)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (416, 67, N'BIOLLEY', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60308)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (417, 67, N'BRUNKA', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60309)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (418, 68, N'MIRAMAR', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (419, 68, N'LA UNION', N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.557' AS DateTime), N'A', 60402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (420, 68, N'SAN ISIDRO', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (421, 69, N'PUERTO CORTES', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (422, 69, N'PALMAR', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (423, 69, N'SIERPE', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (424, 69, N'BAHIA BALLENA', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60504)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (425, 69, N'PIEDRAS BLANCAS', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60505)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (426, 70, N'QUEPOS', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (427, 70, N'SAVEGRE', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (428, 70, N'NARANJITO', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (429, 71, N'GOLFITO', N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.560' AS DateTime), N'A', 60701)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (430, 71, N'PUERTO JIMENEZ', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60702)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (431, 71, N'GUAYCARA', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60703)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (432, 71, N'PAVON', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60704)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (433, 72, N'SAN VITO', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60801)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (434, 72, N'SABALITO', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60802)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (435, 72, N'AGUABUENA', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60803)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (436, 72, N'LIMONCITO', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60804)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (437, 72, N'PITTIER', N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.563' AS DateTime), N'A', 60805)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (438, 73, N'PARRITA', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 60901)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (439, 74, N'CORREDOR', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 61010)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (440, 74, N'LA CUESTA', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 61002)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (441, 74, N'CANOAS', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 61003)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (442, 74, N'LAUREL', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 61004)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (443, 75, N'JACÓ', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 61101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (444, 75, N'TARCOLES', N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.567' AS DateTime), N'A', 61102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (445, 76, N'LIMON', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70101)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (446, 76, N'VALLE DE LA ESTRELLA', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70102)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (447, 76, N'RIO BLANCO', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70103)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (448, 76, N'MATAMA', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70104)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (449, 77, N'GUAPILES', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70201)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (450, 77, N'JIMENEZ', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70202)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (451, 77, N'RITA', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70203)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (452, 77, N'ROXANA', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70204)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (453, 77, N'CARIARI', N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.570' AS DateTime), N'A', 70205)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (454, 77, N'COLORADO', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70206)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (455, 78, N'SIQUIRRES', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70301)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (456, 78, N'PACUARITO', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70302)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (457, 78, N'FLORIDA', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70303)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (458, 78, N'GERMANIA', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70304)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (459, 78, N'EL CAIRO', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70305)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (460, 78, N'LA ALEGRIA', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70306)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (461, 79, N'BRATSI', N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.573' AS DateTime), N'A', 70401)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (462, 79, N'SIXAOLA', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70402)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (463, 79, N'CAHUITA', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70403)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (464, 79, N'TELIRE', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70404)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (465, 80, N'MATINA', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70501)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (466, 80, N'BATAN', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70502)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (467, 80, N'CARRANDI', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70503)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (468, 81, N'GUACIMO', N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.577' AS DateTime), N'A', 70601)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (469, 81, N'MERCEDES', N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'A', 70602)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (470, 81, N'POCORA', N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'A', 70603)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (471, 81, N'RIO JIMENEZ', N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'A', 70604)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (472, 81, N'DUACARI', N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'sa', CAST(N'2014-06-17T11:39:58.580' AS DateTime), N'A', 70605)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (473, 1, N'SAN SEBASTIAN', N'ARESEP\valverderf', CAST(N'2015-07-29T12:31:52.267' AS DateTime), N'ARESEP\valverderf', CAST(N'2015-07-29T12:31:52.267' AS DateTime), N'A', 10111)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (474, 7, N'JARIS', N'SA', CAST(N'2015-10-29T15:10:44.377' AS DateTime), N'SA', CAST(N'2015-10-29T15:10:44.377' AS DateTime), N'A', 10706)
INSERT [dbo].[Distrito] ([id_Distrito], [id_Canton], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado], [id_DistritoInec]) VALUES (475, 24, N'LABRADOR', N'SA', CAST(N'2015-10-29T15:10:44.377' AS DateTime), N'SA', CAST(N'2015-10-29T15:10:44.377' AS DateTime), N'A', 20404)
SET IDENTITY_INSERT [dbo].[Distrito] OFF
GO
SET IDENTITY_INSERT [dbo].[fabricante] ON 

INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (1, N'Toyota Motor Corporation', 114)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (2, N'Volkswagen Group', 4)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (3, N'General Motors Corporation', 75)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (4, N'Hyundai Motor Company', 58)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (5, N'Ford Motor Company', 75)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (6, N'Nissan Motors', 114)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (7, N'Fiat Chrysler Automobiles', 112)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (8, N'Honda Motor Company', 114)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (9, N'Suzuki Motor Corporation', 114)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (10, N'Grupo PSA', 82)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (11, N'Renault', 82)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (12, N'BMW AG', 4)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (13, N'Shanghai Automotive Industry Corporation', 47)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (14, N'Daimler AG', 4)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (15, N'Changan Motors', 47)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (16, N'Mazda Motor Corporation', 114)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (17, N'Dongfeng Motor Corporation', 47)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (18, N'Mitsubishi Motors Corporation', 114)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (19, N'Beijing Automotive Group', 47)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (20, N'Tata Motors Limited', 105)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (21, N'Geely Automobile', 47)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (22, N'Mahindra', 105)
INSERT [dbo].[fabricante] ([id_fabricante], [nombre_fabricante], [pais]) VALUES (1026, N'PRUEBA', 1)
SET IDENTITY_INSERT [dbo].[fabricante] OFF
GO
SET IDENTITY_INSERT [dbo].[marca_vehiculo] ON 

INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (1, N'1                                                      ', 2)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (2, N'Hino                                                   ', 1)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (3, N'Lexus                                                  ', 1)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (4, N'Toyota                                                 ', 1)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (5, N'Audi                                                   ', 2)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (6, N'Bentley                                                ', 2)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (7, N'Bugatti                                                ', 2)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (8, N'Lamborghini                                            ', 2)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (9, N'Porsche                                                ', 2)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (10, N'SEAT                                                   ', 2)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (11, N'Škoda                                                  ', 2)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (12, N'Volkswagen                                             ', 2)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (13, N'Buick                                                  ', 3)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (14, N'Cadillac                                               ', 3)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (15, N'Chevrolet                                              ', 3)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (16, N'GM Korea                                               ', 3)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (17, N'GMC                                                    ', 3)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (18, N'Holden                                                 ', 3)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (19, N'Hyundai                                                ', 4)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (20, N'Kia                                                    ', 4)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (21, N'Genesis                                                ', 4)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (22, N'Ford                                                   ', 5)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (23, N'Lincoln                                                ', 5)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (24, N'Troller                                                ', 5)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (25, N'Infiniti                                               ', 6)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (26, N'Datsun                                                 ', 6)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (27, N'Nissan                                                 ', 6)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (28, N'Abarth                                                 ', 7)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (29, N'Alfa Romeo                                             ', 7)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (30, N'Chrysler                                               ', 7)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (31, N'Dodge                                                  ', 7)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (32, N'Ferrari                                                ', 7)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (33, N'Fiat                                                   ', 7)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (34, N'Jeep                                                   ', 7)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (35, N'Iveco                                                  ', 7)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (36, N'Lancia                                                 ', 7)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (37, N'Maserati                                               ', 7)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (38, N'Ram Trucks                                             ', 7)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (39, N'SRT                                                    ', 7)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (40, N'Acura                                                  ', 8)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (41, N'Honda                                                  ', 8)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (42, N'Maruti Suzuki                                          ', 9)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (43, N'Suzuki                                                 ', 9)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (44, N'Citroën                                                ', 10)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (45, N'Peugeot                                                ', 10)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (46, N'Opel                                                   ', 10)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (47, N'DS Automobiles                                         ', 10)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (48, N'Vauxhall                                               ', 10)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (49, N'Dacia                                                  ', 11)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (50, N'Renault                                                ', 11)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (51, N'Renault Samsung Motors                                 ', 11)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (52, N'BMW                                                    ', 12)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (53, N'MINI                                                   ', 12)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (54, N'Rolls-Royce                                            ', 12)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (55, N'MG                                                     ', 13)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (56, N'Roewe                                                  ', 13)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (57, N'Freightliner                                           ', 14)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (58, N'Mercedes-Benz                                          ', 14)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (59, N'Mitsubishi Fuso                                        ', 14)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (60, N'Smart                                                  ', 14)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (61, N'Changan                                                ', 15)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (62, N'Mazda                                                  ', 16)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (63, N'Dongfeng                                               ', 17)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (64, N'Mitsubishi                                             ', 18)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (65, N'BAIC                                                   ', 19)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (66, N'Tata Hispano                                           ', 20)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (67, N'Jaguar                                                 ', 20)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (68, N'Land Rover                                             ', 20)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (69, N'Tata                                                   ', 20)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (70, N'Tata Daewoo                                            ', 20)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (71, N'Geely                                                  ', 21)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (72, N'Proton Holdings Berhad                                 ', 21)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (73, N'Lotus Cars                                             ', 21)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (74, N'Maple                                                  ', 21)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (75, N'Volvo                                                  ', 21)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (76, N'Mahindra                                               ', 22)
INSERT [dbo].[marca_vehiculo] ([id_marca], [nombre_marca], [id_fabricante]) VALUES (77, N'SsangYong                                              ', 22)
SET IDENTITY_INSERT [dbo].[marca_vehiculo] OFF
GO
SET IDENTITY_INSERT [dbo].[modelo_vehiculo] ON 

INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (1, N'CL                       ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (2, N'EL                       ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (3, N'ILX                      ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (4, N'Integra                  ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (5, N'MDX                      ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (6, N'NSX                      ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (7, N'RDX                      ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (8, N'RL                       ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (9, N'RLX                      ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (10, N'RSX                      ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (11, N'TL                       ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (12, N'TLX                      ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (13, N'TSX                      ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (14, N'ZDX                      ', 40)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (15, N'146                      ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (16, N'147                      ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (17, N'147 GTA                  ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (18, N'156                      ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (19, N'156 GTA                  ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (20, N'159                      ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (21, N'166                      ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (22, N'4C                       ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (23, N'8C Competizione          ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (24, N'Brera                    ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (25, N'Giulia                   ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (26, N'Giulietta                ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (27, N'GT                       ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (28, N'GTV                      ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (29, N'MiTo                     ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (30, N'Spider                   ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (31, N'Stelvio                  ', 29)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (32, N'A1                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (33, N'A2                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (34, N'A3                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (35, N'A4                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (36, N'A4 Allroad Quattro       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (37, N'A5                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (38, N'A6                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (39, N'A7                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (40, N'A8                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (41, N'Allroad                  ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (42, N'E-Tron                   ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (43, N'Q2                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (44, N'Q3                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (45, N'Q5                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (46, N'Q7                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (47, N'Q8                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (48, N'R8                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (49, N'RS Q3                    ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (50, N'RS3                      ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (51, N'RS4                      ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (52, N'RS5                      ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (53, N'RS6                      ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (54, N'RS7                      ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (55, N'S3                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (56, N'S4                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (57, N'S5                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (58, N'S6                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (59, N'S7                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (60, N'S8                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (61, N'SQ2                      ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (62, N'SQ5                      ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (63, N'SQ7                      ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (64, N'SQ8                      ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (65, N'TT                       ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (66, N'TT RS                    ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (67, N'TTS                      ', 5)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (68, N'Arnage                   ', 6)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (69, N'Azure                    ', 6)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (70, N'Bentayga                 ', 6)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (71, N'Brooklands               ', 6)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (72, N'Continental              ', 6)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (73, N'Continental Flying Spur  ', 6)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (74, N'Continental GT           ', 6)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (75, N'Flying Spur              ', 6)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (76, N'Mulsanne                 ', 6)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (77, N'1 series                 ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (78, N'2 series                 ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (79, N'3 series                 ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (80, N'4 series                 ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (81, N'5 series                 ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (82, N'6 series                 ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (83, N'7 series                 ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (84, N'8 series                 ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (85, N'i3                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (86, N'i8                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (87, N'M2                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (88, N'M3                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (89, N'M4                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (90, N'M5                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (91, N'M6                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (92, N'X1                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (93, N'X2                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (94, N'X3                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (95, N'X3 M                     ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (96, N'X4                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (97, N'X4 M                     ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (98, N'X5                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (99, N'X5 M                     ', 52)
GO
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (100, N'X6                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (101, N'X6 M                     ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (102, N'X7                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (103, N'Z3                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (104, N'Z4                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (105, N'Z8                       ', 52)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (106, N'Veyron                   ', 7)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (107, N'Century                  ', 13)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (108, N'Enclave                  ', 13)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (109, N'Envision                 ', 13)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (110, N'La Crosse                ', 13)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (111, N'Le Sabre                 ', 13)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (112, N'Lucerne                  ', 13)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (113, N'Park Avenue              ', 13)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (114, N'Rainier                  ', 13)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (115, N'Regal                    ', 13)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (116, N'Rendezvouz               ', 13)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (117, N'Terraza                  ', 13)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (118, N'Verano                   ', 13)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (119, N'CS35                     ', 61)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (120, N'CS35 Plus                ', 61)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (121, N'CS55                     ', 61)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (122, N'CS75                     ', 61)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (123, N'CS95                     ', 61)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (124, N'Eado                     ', 61)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (125, N'Raeton                   ', 61)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (126, N'Astro                    ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (127, N'Avalanche                ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (128, N'Aveo                     ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (129, N'Blazer                   ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (130, N'Camaro                   ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (131, N'Captiva                  ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (132, N'Cavalier                 ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (133, N'Cobalt                   ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (134, N'Colorado                 ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (135, N'Corvette                 ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (136, N'Cruze                    ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (137, N'Epica                    ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (138, N'Equinox                  ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (139, N'Express                  ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (140, N'HHR                      ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (141, N'Impala                   ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (142, N'Lacetti                  ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (143, N'Lanos                    ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (144, N'Malibu                   ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (145, N'Monte Carlo              ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (146, N'Niva                     ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (147, N'Orlando                  ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (148, N'Rezzo                    ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (149, N'Silverado                ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (150, N'Silverado 2500 HD        ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (151, N'Spark                    ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (152, N'SSR                      ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (153, N'Suburban                 ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (154, N'Tahoe                    ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (155, N'TrailBlazer              ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (156, N'Traverse                 ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (157, N'Trax                     ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (158, N'Uplander                 ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (159, N'Venture                  ', 15)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (160, N'200                      ', 30)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (161, N'300                      ', 30)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (162, N'300M                     ', 30)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (163, N'Aspen                    ', 30)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (164, N'Concorde                 ', 30)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (165, N'Crossfire                ', 30)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (166, N'Grand Voyager            ', 30)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (167, N'Pacifica                 ', 30)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (168, N'PT Cruiser               ', 30)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (169, N'Sebring                  ', 30)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (170, N'Town & Country           ', 30)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (171, N'Voyager                  ', 30)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (172, N'Berlingo                 ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (173, N'C-Crosser                ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (174, N'C-Elysee                 ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (175, N'C1                       ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (176, N'C2                       ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (177, N'C3                       ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (178, N'C3 Aircross              ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (179, N'C3 Picasso               ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (180, N'C3 Pluriel               ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (181, N'C4                       ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (182, N'C4 Aircross              ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (183, N'C4 Cactus                ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (184, N'C4 Picasso               ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (185, N'C5                       ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (186, N'C6                       ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (187, N'C8                       ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (188, N'DS 7 Crossback           ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (189, N'DS3                      ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (190, N'DS4                      ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (191, N'DS5                      ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (192, N'Grand C4 Picasso         ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (193, N'Jumpy                    ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (194, N'Nemo                     ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (195, N'Saxo                     ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (196, N'Spacetourer              ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (197, N'Xsara                    ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (198, N'Xsara Picasso            ', 44)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (199, N'Evanda                   ', 70)
GO
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (200, N'Kalos                    ', 70)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (201, N'Leganza                  ', 70)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (202, N'Magnus                   ', 70)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (203, N'Matiz                    ', 70)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (204, N'Nexia                    ', 70)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (205, N'Nubira                   ', 70)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (206, N'Applause                 ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (207, N'Cast                     ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (208, N'Copen                    ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (209, N'Cuore                    ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (210, N'Gran Move                ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (211, N'Luxio                    ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (212, N'Materia                  ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (213, N'Mebius                   ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (214, N'Move                     ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (215, N'Rocky                    ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (216, N'Sirion                   ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (217, N'Terios                   ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (218, N'Trevis                   ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (219, N'YRV                      ', 1)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (220, N'mi-DO                    ', 26)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (221, N'on-DO                    ', 26)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (222, N'Avenger                  ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (223, N'Caliber                  ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (224, N'Caliber SRT4             ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (225, N'Caravan                  ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (226, N'Challenger               ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (227, N'Charger                  ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (228, N'Dakota                   ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (229, N'Dart                     ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (230, N'Durango                  ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (231, N'Intrepid                 ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (232, N'Journey                  ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (233, N'Magnum                   ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (234, N'Neon                     ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (235, N'Nitro                    ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (236, N'Ram 1500                 ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (237, N'Ram 2500                 ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (238, N'Ram 3500                 ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (239, N'Ram SRT10                ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (240, N'Stratus                  ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (241, N'Viper                    ', 31)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (242, N'580                      ', 63)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (243, N'A30                      ', 63)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (244, N'AX7                      ', 63)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (245, N'H30 Cross                ', 63)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (246, N'348                      ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (247, N'360                      ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (248, N'456                      ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (249, N'458                      ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (250, N'488                      ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (251, N'512                      ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (252, N'550                      ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (253, N'575 M                    ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (254, N'599 GTB Fiorano          ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (255, N'599 GTO                  ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (256, N'612                      ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (257, N'812                      ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (258, N'California               ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (259, N'California T             ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (260, N'Challenge Stradale       ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (261, N'Enzo                     ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (262, N'F12                      ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (263, N'F355                     ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (264, N'F430                     ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (265, N'F50                      ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (266, N'F512 M                   ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (267, N'FF                       ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (268, N'GTC4 Lusso               ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (269, N'LaFerrari                ', 32)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (270, N'124 Spider               ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (271, N'500                      ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (272, N'500L                     ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (273, N'500X                     ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (274, N'Albea                    ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (275, N'Brava                    ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (276, N'Bravo                    ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (277, N'Coupe                    ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (278, N'Croma                    ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (279, N'Doblo                    ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (280, N'Ducato                   ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (281, N'Freemont                 ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (282, N'Grande Punto             ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (283, N'Idea                     ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (284, N'Linea                    ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (285, N'Marea                    ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (286, N'Multipla                 ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (287, N'Palio                    ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (288, N'Panda                    ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (289, N'Panda 4x4                ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (290, N'Punto                    ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (291, N'Qubo                     ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (292, N'Sedici                   ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (293, N'Siena                    ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (294, N'Stilo                    ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (295, N'Strada                   ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (296, N'Tipo                     ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (297, N'Ulysse                   ', 33)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (298, N'B-Max                    ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (299, N'C-Max                    ', 22)
GO
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (300, N'Cougar                   ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (301, N'Crown Victoria           ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (302, N'EcoSport                 ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (303, N'Edge                     ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (304, N'Escape                   ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (305, N'Excursion                ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (306, N'Expedition               ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (307, N'Explorer                 ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (308, N'Explorer Sport Trac      ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (309, N'F-150                    ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (310, N'F-250                    ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (311, N'F-350                    ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (312, N'Falcon                   ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (313, N'Fiesta                   ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (314, N'Five Hundred             ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (315, N'Flex                     ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (316, N'Focus                    ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (317, N'Focus Active             ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (318, N'Freestar                 ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (319, N'Freestyle                ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (320, N'Fusion                   ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (321, N'Galaxy                   ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (322, N'Ka                       ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (323, N'Kuga                     ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (324, N'Maverick                 ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (325, N'Mondeo                   ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (326, N'Mustang                  ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (327, N'Mustang Shelby GT350     ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (328, N'Mustang Shelby GT500     ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (329, N'Puma                     ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (330, N'Ranger                   ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (331, N'S-Max                    ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (332, N'Taurus                   ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (333, N'Taurus X                 ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (334, N'Thunderbird              ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (335, N'Tourneo Connect          ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (336, N'Transit                  ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (337, N'Transit Connect          ', 22)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (338, N'Atlas                    ', 71)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (339, N'Coolray                  ', 71)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (340, N'Emgrand 7                ', 71)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (341, N'Emgrand EC7              ', 71)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (342, N'Emgrand GS               ', 71)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (343, N'Emgrand X7               ', 71)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (344, N'GC9                      ', 71)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (345, N'GÐ¡6                     ', 71)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (346, N'MK                       ', 71)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (347, N'Otaka                    ', 71)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (348, N'Vision                   ', 71)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (349, N'G70                      ', 21)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (350, N'G80                      ', 21)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (351, N'G90                      ', 21)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (352, N'Acadia                   ', 17)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (353, N'Canyon                   ', 17)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (354, N'Envoy                    ', 17)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (355, N'Sierra 1500              ', 17)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (356, N'Sierra 2500              ', 17)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (357, N'Terrain                  ', 17)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (358, N'Yukon                    ', 17)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (359, N'Commodore                ', 18)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (360, N'Accord                   ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (361, N'Amaze                    ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (362, N'City                     ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (363, N'Civic                    ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (364, N'CR-V                     ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (365, N'CR-Z                     ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (366, N'Crosstour                ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (367, N'Element                  ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (368, N'Fit                      ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (369, N'FR-V                     ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (370, N'HR-V                     ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (371, N'HR-V II (GJ)             ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (372, N'Insight                  ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (373, N'Jade                     ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (374, N'Jazz                     ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (375, N'Legend                   ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (376, N'Odyssey                  ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (377, N'Pilot                    ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (378, N'Prelude                  ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (379, N'Ridgeline                ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (380, N'S2000                    ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (381, N'Shuttle                  ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (382, N'Stream                   ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (383, N'Vezel                    ', 41)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (384, N'Accent                   ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (385, N'Atos Prime               ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (386, N'Azera                    ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (387, N'Centennial               ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (388, N'Creta                    ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (389, N'Elantra                  ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (390, N'Entourage                ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (391, N'Eon                      ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (392, N'Equus                    ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (393, N'Galloper                 ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (394, N'Genesis                  ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (395, N'Genesis Coupe            ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (396, N'Getz                     ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (397, N'Grandeur                 ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (398, N'H-1                      ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (399, N'i10                      ', 19)
GO
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (400, N'i20                      ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (401, N'i30                      ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (402, N'i30 N                    ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (403, N'i40                      ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (404, N'Ioniq                    ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (405, N'ix20                     ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (406, N'ix35                     ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (407, N'Kona                     ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (408, N'Matrix                   ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (409, N'Palisade                 ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (410, N'Porter                   ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (411, N'Santa Fe                 ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (412, N'Solaris                  ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (413, N'Sonata                   ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (414, N'Terracan                 ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (415, N'Trajet                   ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (416, N'Tucson                   ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (417, N'Veloster                 ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (418, N'Veracruz                 ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (419, N'Verna                    ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (420, N'Xcent                    ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (421, N'XG                       ', 19)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (422, N'EX                       ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (423, N'FX                       ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (424, N'G                        ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (425, N'I35                      ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (426, N'JX                       ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (427, N'M                        ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (428, N'Q30                      ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (429, N'Q40                      ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (430, N'Q45                      ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (431, N'Q50                      ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (432, N'Q60                      ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (433, N'Q70                      ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (434, N'QX30                     ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (435, N'QX4                      ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (436, N'QX50                     ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (437, N'QX56                     ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (438, N'QX60                     ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (439, N'QX70                     ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (440, N'QX80                     ', 25)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (441, N'E-Pace                   ', 67)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (442, N'F-Pace                   ', 67)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (443, N'F-Type                   ', 67)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (444, N'I-Pace                   ', 67)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (445, N'S-Type                   ', 67)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (446, N'X-Type                   ', 67)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (447, N'XE                       ', 67)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (448, N'XF                       ', 67)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (449, N'XJ                       ', 67)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (450, N'XK/XKR                   ', 67)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (451, N'Cherokee                 ', 34)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (452, N'Commander                ', 34)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (453, N'Compass                  ', 34)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (454, N'Gladiator                ', 34)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (455, N'Grand Cherokee           ', 34)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (456, N'Liberty                  ', 34)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (457, N'Patriot                  ', 34)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (458, N'Renegade                 ', 34)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (459, N'Wrangler                 ', 34)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (460, N'Carens                   ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (461, N'Carnival                 ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (462, N'Ceed                     ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (463, N'Cerato                   ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (464, N'Clarus                   ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (465, N'Forte                    ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (466, N'K900                     ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (467, N'Magentis                 ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (468, N'Mohave                   ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (469, N'Niro                     ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (470, N'Opirus                   ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (471, N'Optima                   ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (472, N'Picanto                  ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (473, N'ProCeed                  ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (474, N'Quoris                   ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (475, N'Ray                      ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (476, N'Rio                      ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (477, N'Rio X-Line               ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (478, N'Seltos                   ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (479, N'Shuma                    ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (480, N'Sorento                  ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (481, N'Sorento Prime            ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (482, N'Soul                     ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (483, N'Spectra                  ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (484, N'Sportage                 ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (485, N'Stinger                  ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (486, N'Stonic                   ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (487, N'Telluride                ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (488, N'Venga                    ', 20)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (489, N'Aventador                ', 8)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (490, N'Centenario               ', 8)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (491, N'Diablo                   ', 8)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (492, N'Gallardo                 ', 8)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (493, N'Huracan                  ', 8)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (494, N'Murcielago               ', 8)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (495, N'Reventon                 ', 8)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (496, N'Urus                     ', 8)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (497, N'Delta                    ', 36)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (498, N'Lybra                    ', 36)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (499, N'Musa                     ', 36)
GO
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (500, N'Phedra                   ', 36)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (501, N'Thema                    ', 36)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (502, N'Thesis                   ', 36)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (503, N'Ypsilon                  ', 36)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (504, N'Defender                 ', 68)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (505, N'Discovery                ', 68)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (506, N'Discovery Sport          ', 68)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (507, N'Evoque                   ', 68)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (508, N'Freelander               ', 68)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (509, N'Range Rover              ', 68)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (510, N'Range Rover Sport        ', 68)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (511, N'Range Rover Velar        ', 68)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (512, N'CT                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (513, N'ES                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (514, N'GS                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (515, N'GX                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (516, N'HS                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (517, N'IS                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (518, N'LC                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (519, N'LFA                      ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (520, N'LS                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (521, N'LX                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (522, N'NX                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (523, N'RC                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (524, N'RX                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (525, N'SC                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (526, N'UX                       ', 3)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (527, N'Aviator                  ', 23)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (528, N'Corsair                  ', 23)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (529, N'Mark LT                  ', 23)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (530, N'MKC                      ', 23)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (531, N'MKS                      ', 23)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (532, N'MKT                      ', 23)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (533, N'MKX                      ', 23)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (534, N'MKZ                      ', 23)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (535, N'Navigator                ', 23)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (536, N'Town Car                 ', 23)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (537, N'Zephyr                   ', 23)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (538, N'Elise                    ', 73)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (539, N'Europa S                 ', 73)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (540, N'Evora                    ', 73)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (541, N'Exige                    ', 73)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (542, N'3200 GT                  ', 37)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (543, N'Ghibli                   ', 37)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (544, N'Gran Cabrio              ', 37)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (545, N'Gran Turismo             ', 37)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (546, N'Gran Turismo S           ', 37)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (547, N'Levante                  ', 37)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (548, N'Quattroporte             ', 37)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (549, N'Quattroporte S           ', 37)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (550, N'2                        ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (551, N'3                        ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (552, N'323                      ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (553, N'5                        ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (554, N'6                        ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (555, N'626                      ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (556, N'B-Series                 ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (557, N'BT-50                    ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (558, N'CX-3                     ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (559, N'CX-5                     ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (560, N'CX-7                     ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (561, N'CX-9                     ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (562, N'MPV                      ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (563, N'MX-5                     ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (564, N'Premacy                  ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (565, N'RX-7                     ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (566, N'RX-8                     ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (567, N'Tribute                  ', 62)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (568, N'A-class                  ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (569, N'AMG GT                   ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (570, N'AMG GT 4-Door            ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (571, N'B-class                  ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (572, N'C-class                  ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (573, N'C-class Sport Coupe      ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (574, N'CL-class                 ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (575, N'CLA-class                ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (576, N'CLC-class                ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (577, N'CLK-class                ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (578, N'CLS-class                ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (579, N'E-class                  ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (580, N'E-class Coupe            ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (581, N'EQC                      ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (582, N'G-class                  ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (583, N'GL-class                 ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (584, N'GLA-class                ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (585, N'GLB-class                ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (586, N'GLC-class                ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (587, N'GLC-class Coupe          ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (588, N'GLE-class                ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (589, N'GLE-class Coupe          ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (590, N'GLK-class                ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (591, N'GLS-class                ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (592, N'M-class                  ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (593, N'R-class                  ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (594, N'S-class                  ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (595, N'S-class Cabrio           ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (596, N'S-class Coupe            ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (597, N'SL-class                 ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (598, N'SLK-class                ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (599, N'SLR-class                ', 58)
GO
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (600, N'SLS AMG                  ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (601, N'Sprinter                 ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (602, N'Vaneo                    ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (603, N'Viano                    ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (604, N'Vito                     ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (605, N'X-class                  ', 58)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (606, N'TF                       ', 55)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (607, N'XPower SV                ', 55)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (608, N'ZR                       ', 55)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (609, N'ZS                       ', 55)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (610, N'ZT                       ', 55)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (611, N'ZT-T                     ', 55)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (612, N'Clubman                  ', 53)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (613, N'Clubman S                ', 53)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (614, N'Clubvan                  ', 53)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (615, N'Cooper                   ', 53)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (616, N'Cooper Cabrio            ', 53)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (617, N'Cooper S                 ', 53)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (618, N'Cooper S Cabrio          ', 53)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (619, N'Cooper S Countryman All4 ', 53)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (620, N'Countryman               ', 53)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (621, N'One                      ', 53)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (622, N'3000 GT                  ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (623, N'ASX                      ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (624, N'Carisma                  ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (625, N'Colt                     ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (626, N'Dignity                  ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (627, N'Eclipse                  ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (628, N'Eclipse Cross            ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (629, N'Endeavor                 ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (630, N'Galant                   ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (631, N'Grandis                  ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (632, N'i-MiEV                   ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (633, N'L200                     ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (634, N'Lancer                   ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (635, N'Lancer Evo               ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (636, N'Mirage                   ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (637, N'Outlander                ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (638, N'Outlander XL             ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (639, N'Pajero                   ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (640, N'Pajero Pinin             ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (641, N'Pajero Sport             ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (642, N'Raider                   ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (643, N'Space Gear               ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (644, N'Space Runner             ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (645, N'Space Star               ', 64)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (646, N'350Z                     ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (647, N'370Z                     ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (648, N'Almera                   ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (649, N'Almera Classic           ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (650, N'Almera Tino              ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (651, N'Altima                   ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (652, N'Armada                   ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (653, N'Bluebird Sylphy          ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (654, N'GT-R                     ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (655, N'Juke                     ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (656, N'Leaf                     ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (657, N'Maxima                   ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (658, N'Micra                    ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (659, N'Murano                   ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (660, N'Navara                   ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (661, N'Note                     ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (662, N'NP300                    ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (663, N'Pathfinder               ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (664, N'Patrol                   ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (665, N'Primera                  ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (666, N'Qashqai                  ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (667, N'Qashqai+2                ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (668, N'Quest                    ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (669, N'Rogue                    ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (670, N'Sentra                   ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (671, N'Skyline                  ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (672, N'Sylphy                   ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (673, N'Teana                    ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (674, N'Terrano                  ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (675, N'Tiida                    ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (676, N'Titan                    ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (677, N'Titan XD                 ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (678, N'X-Trail                  ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (679, N'XTerra                   ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (680, N'Z                        ', 27)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (681, N'Adam                     ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (682, N'Agila                    ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (683, N'Antara                   ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (684, N'Astra                    ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (685, N'Astra GTS                ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (686, N'Cascada                  ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (687, N'Combo                    ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (688, N'Corsa                    ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (689, N'Corsa OPC                ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (690, N'Crossland X              ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (691, N'Frontera                 ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (692, N'Grandland X              ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (693, N'Insignia                 ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (694, N'Insignia OPC             ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (695, N'Karl                     ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (696, N'Meriva                   ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (697, N'Mokka                    ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (698, N'Omega                    ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (699, N'Signum                   ', 46)
GO
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (700, N'Speedster                ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (701, N'Tigra                    ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (702, N'Vectra                   ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (703, N'Vivaro                   ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (704, N'Zafira                   ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (705, N'Zafira Tourer            ', 46)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (706, N'1007                     ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (707, N'107                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (708, N'108                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (709, N'2008                     ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (710, N'206                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (711, N'207                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (712, N'208                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (713, N'3008                     ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (714, N'301                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (715, N'307                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (716, N'308                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (717, N'4007                     ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (718, N'4008                     ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (719, N'406                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (720, N'407                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (721, N'408                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (722, N'5008                     ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (723, N'508                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (724, N'607                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (725, N'807                      ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (726, N'Boxer                    ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (727, N'Partner                  ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (728, N'RCZ Sport                ', 45)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (729, N'718 Boxster              ', 9)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (730, N'718 Cayman               ', 9)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (731, N'911                      ', 9)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (732, N'Boxster                  ', 9)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (733, N'Cayenne                  ', 9)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (734, N'Cayman                   ', 9)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (735, N'Macan                    ', 9)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (736, N'Panamera                 ', 9)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (737, N'Taycan                   ', 9)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (738, N'Arkana                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (739, N'Avantime                 ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (740, N'Captur                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (741, N'Clio                     ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (742, N'Duster                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (743, N'Duster Oroch             ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (744, N'Espace                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (745, N'Fluence                  ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (746, N'Grand Scenic             ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (747, N'Kadjar                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (748, N'Kangoo                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (749, N'Kaptur                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (750, N'Koleos                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (751, N'Laguna                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (752, N'Latitude                 ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (753, N'Logan                    ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (754, N'Master                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (755, N'Megane                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (756, N'Modus                    ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (757, N'Sandero                  ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (758, N'Sandero Stepway          ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (759, N'Scenic                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (760, N'Symbol                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (761, N'Talisman                 ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (762, N'Trafic                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (763, N'Twingo                   ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (764, N'Twizy                    ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (765, N'Vel Satis                ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (766, N'Wind                     ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (767, N'Zoe                      ', 50)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (768, N'Cullinan                 ', 54)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (769, N'Dawn                     ', 54)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (770, N'Ghost                    ', 54)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (771, N'Phantom                  ', 54)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (772, N'Wraith                   ', 54)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (773, N'Alhambra                 ', 10)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (774, N'Altea                    ', 10)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (775, N'Altea Freetrack          ', 10)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (776, N'Altea XL                 ', 10)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (777, N'Arosa                    ', 10)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (778, N'Ateca                    ', 10)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (779, N'Cordoba                  ', 10)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (780, N'Exeo                     ', 10)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (781, N'Ibiza                    ', 10)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (782, N'Leon                     ', 10)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (783, N'Mii                      ', 10)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (784, N'Toledo                   ', 10)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (785, N'Citigo                   ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (786, N'Fabia                    ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (787, N'Felicia                  ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (788, N'Kamiq                    ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (789, N'Karoq                    ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (790, N'Kodiaq                   ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (791, N'Octavia                  ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (792, N'Octavia Scout            ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (793, N'Octavia Tour             ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (794, N'Praktik                  ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (795, N'Rapid                    ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (796, N'Rapid Spaceback (NH1)    ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (797, N'Roomster                 ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (798, N'Superb                   ', 11)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (799, N'Yeti                     ', 11)
GO
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (800, N'Forfour                  ', 60)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (801, N'Fortwo                   ', 60)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (802, N'Roadster                 ', 60)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (803, N'Actyon                   ', 77)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (804, N'Actyon Sports            ', 77)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (805, N'Chairman                 ', 77)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (806, N'Korando                  ', 77)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (807, N'Kyron                    ', 77)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (808, N'Musso                    ', 77)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (809, N'Musso Sport              ', 77)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (810, N'Rexton                   ', 77)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (811, N'Rodius                   ', 77)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (812, N'Stavic                   ', 77)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (813, N'Tivoli                   ', 77)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (814, N'XLV                      ', 77)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (815, N'Alto                     ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (816, N'Baleno                   ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (817, N'Celerio                  ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (818, N'Ciaz                     ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (819, N'Grand Vitara             ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (820, N'Grand Vitara XL7         ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (821, N'Ignis                    ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (822, N'Jimny                    ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (823, N'Kizashi                  ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (824, N'Liana                    ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (825, N'Splash                   ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (826, N'Swift                    ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (827, N'SX4                      ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (828, N'Vitara                   ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (829, N'Wagon R                  ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (830, N'Wagon R+                 ', 43)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (831, N'4Runner                  ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (832, N'Alphard                  ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (833, N'Auris                    ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (834, N'Avalon                   ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (835, N'Avensis                  ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (836, N'Avensis Verso            ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (837, N'Aygo                     ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (838, N'C-HR                     ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (839, N'Caldina                  ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (840, N'Camry                    ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (841, N'Celica                   ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (842, N'Corolla                  ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (843, N'Corolla Verso            ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (844, N'FJ Cruiser               ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (845, N'Fortuner                 ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (846, N'GT 86                    ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (847, N'Hiace                    ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (848, N'Highlander               ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (849, N'Hilux                    ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (850, N'iQ                       ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (851, N'ist                      ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (852, N'Land Cruiser             ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (853, N'Land Cruiser Prado       ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (854, N'Mark II                  ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (855, N'Mirai                    ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (856, N'MR2                      ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (857, N'Picnic                   ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (858, N'Previa                   ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (859, N'Prius                    ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (860, N'RAV4                     ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (861, N'Sequoia                  ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (862, N'Sienna                   ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (863, N'Supra                    ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (864, N'Tacoma                   ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (865, N'Tundra                   ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (866, N'Venza                    ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (867, N'Verso                    ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (868, N'Vitz                     ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (869, N'Yaris                    ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (870, N'Yaris Verso              ', 4)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (871, N'Amarok                   ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (872, N'Arteon                   ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (873, N'Beetle                   ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (874, N'Bora                     ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (875, N'Caddy                    ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (876, N'CC                       ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (877, N'Crafter                  ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (878, N'CrossGolf                ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (879, N'CrossPolo                ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (880, N'CrossTouran              ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (881, N'Eos                      ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (882, N'Fox                      ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (883, N'Golf                     ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (884, N'Jetta                    ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (885, N'Lupo                     ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (886, N'Multivan                 ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (887, N'New Beetle               ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (888, N'Passat                   ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (889, N'Passat CC                ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (890, N'Phaeton                  ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (891, N'Pointer                  ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (892, N'Polo                     ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (893, N'Routan                   ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (894, N'Scirocco                 ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (895, N'Sharan                   ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (896, N'T-Roc                    ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (897, N'Teramont                 ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (898, N'Tiguan                   ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (899, N'Touareg                  ', 12)
GO
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (900, N'Touran                   ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (901, N'Transporter              ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (902, N'Up                       ', 12)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (903, N'C30                      ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (904, N'C70                      ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (905, N'C70 Convertible          ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (906, N'C70 Coupe                ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (907, N'S40                      ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (908, N'S60                      ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (909, N'S70                      ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (910, N'S80                      ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (911, N'S90                      ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (912, N'V40                      ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (913, N'V50                      ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (914, N'V60                      ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (915, N'V70                      ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (916, N'V90                      ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (917, N'XC40                     ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (918, N'XC60                     ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (919, N'XC70                     ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (920, N'XC90                     ', 75)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (925, N'A                        ', 18)
INSERT [dbo].[modelo_vehiculo] ([id_modelo], [nombre_modelo], [id_marca_modelo]) VALUES (926, N'ModificaArmando6', 5)
SET IDENTITY_INSERT [dbo].[modelo_vehiculo] OFF
GO
SET IDENTITY_INSERT [dbo].[Pais] ON 

INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (1, N'Afganist                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (2, N'Islas Gland                                                                                         ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (3, N'Albania                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (4, N'Alemania                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (5, N'Andorra                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (6, N'Angola                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (7, N'Anguilla                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (8, N'Antártida                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (9, N'Antigua y Barbuda                                                                                   ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (10, N'Antillas Holandesas                                                                                 ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (11, N'Arabia Saudí                                                                                        ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (12, N'Argelia                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (13, N'Argentina                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (14, N'Armenia                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (15, N'Aruba                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (16, N'Australia                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (17, N'Austria                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (18, N'Azerbaiyán                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (19, N'Bahamas                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (20, N'Bahréin                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (21, N'Bangladesh                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (22, N'Barbados                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (23, N'Bielorrusia                                                                                         ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (24, N'Bélgica                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (25, N'Belice                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (26, N'Benin                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (27, N'Bermudas                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (28, N'Bhután                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (29, N'Bolivia                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (30, N'Bosnia                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (31, N'Botsuana                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (32, N'Isla Bouvet                                                                                         ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (33, N'Brasil                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (34, N'Brunéi                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (35, N'Bulgaria                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (36, N'Burkina Faso                                                                                        ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (37, N'Burundi                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (38, N'Cabo Verde                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (39, N'Islas Caimán                                                                                        ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (40, N'Camboya                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (41, N'Camerún                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (42, N'Canadá                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (43, N'República Centroafricana                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (44, N'Chad                                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (45, N'República Checa                                                                                     ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (46, N'Chile                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (47, N'China                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (48, N'Chipre                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (49, N'Isla de Navidad                                                                                     ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (50, N'Ciudad del Vaticano                                                                                 ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (51, N'Islas Cocos                                                                                         ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (52, N'Colombia                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (53, N'Comoras                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (54, N'República Democrática del Congo                                                                     ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (55, N'Congo                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (56, N'Islas Cook                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (57, N'Corea del Norte                                                                                     ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (58, N'Corea del Sur                                                                                       ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (59, N'Costa de Marfil                                                                                     ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (60, N'Costa Rica                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (61, N'Croacia                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (62, N'Cuba                                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (63, N'Dinamarca                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (64, N'Dominica                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (65, N'República Dominicana                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (66, N'Ecuador                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (67, N'Egipto                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (68, N'El Salvador                                                                                         ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (69, N'Emiratos Árabes Unidos                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (70, N'Eritrea                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (71, N'Eslovaquia                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (72, N'Eslovenia                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (73, N'España                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (74, N'Islas ultramarinas de Estados Unidos                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (75, N'Estados Unidos                                                                                      ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (76, N'Estonia                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (77, N'Etiopía                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (78, N'Islas Feroe                                                                                         ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (79, N'Filipinas                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (80, N'Finlandia                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (81, N'Fiyi                                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (82, N'Francia                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (83, N'Gabón                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (84, N'Gambia                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (85, N'Georgia                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (86, N'Islas Georgias del Sur y Sandwich del Sur                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (87, N'Ghana                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (88, N'Gibraltar                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (89, N'Granada                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (90, N'Grecia                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (91, N'Groenlandia                                                                                         ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (92, N'Guadalupe                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (93, N'Guam                                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (94, N'Guatemala                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (95, N'Guayana Francesa                                                                                    ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (96, N'Guinea                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (97, N'Guinea Ecuatorial                                                                                   ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (98, N'Guinea-Bissau                                                                                       ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (99, N'Guyana                                                                                              ')
GO
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (100, N'Haití                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (101, N'Islas Heard y McDonald                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (102, N'Honduras                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (103, N'Hong Kong                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (104, N'Hungría                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (105, N'India                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (106, N'Indonesia                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (107, N'Irán                                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (108, N'Iraq                                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (109, N'Irlanda                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (110, N'Islandia                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (111, N'Israel                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (112, N'Italia                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (113, N'Jamaica                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (114, N'Japón                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (115, N'Jordania                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (116, N'Kazajstán                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (117, N'Kenia                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (118, N'Kirguistán                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (119, N'Kiribati                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (120, N'Kuwait                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (121, N'Laos                                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (122, N'Lesotho                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (123, N'Letonia                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (124, N'Líbano                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (125, N'Liberia                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (126, N'Libia                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (127, N'Liechtenstein                                                                                       ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (128, N'Lituania                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (129, N'Luxemburgo                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (130, N'Macao                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (131, N'ARY Macedonia                                                                                       ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (132, N'Madagascar                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (133, N'Malasia                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (134, N'Malawi                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (135, N'Maldivas                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (136, N'Malí                                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (137, N'Malta                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (138, N'Islas Malvinas                                                                                      ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (139, N'Islas Marianas del Norte                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (140, N'Marruecos                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (141, N'Islas Marshall                                                                                      ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (142, N'Martinica                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (143, N'Mauricio                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (144, N'Mauritania                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (145, N'Mayotte                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (146, N'México                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (147, N'Micronesia                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (148, N'Moldavia                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (149, N'Mónaco                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (150, N'Mongolia                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (151, N'Montserrat                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (152, N'Mozambique                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (153, N'Myanmar                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (154, N'Namibia                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (155, N'Nauru                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (156, N'Nepal                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (157, N'Nicaragua                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (158, N'Níger                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (159, N'Nigeria                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (160, N'Niue                                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (161, N'Isla Norfolk                                                                                        ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (162, N'Noruega                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (163, N'Nueva Caledonia                                                                                     ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (164, N'Nueva Zelanda                                                                                       ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (165, N'Omán                                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (166, N'Países Bajos                                                                                        ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (167, N'Pakistán                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (168, N'Palau                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (169, N'Palestina                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (170, N'Panamá                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (171, N'Papúa Nueva Guinea                                                                                  ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (172, N'Paraguay                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (173, N'Perú                                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (174, N'Islas Pitcairn                                                                                      ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (175, N'Polinesia Francesa                                                                                  ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (176, N'Polonia                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (177, N'Portugal                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (178, N'Puerto Rico                                                                                         ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (179, N'Qatar                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (180, N'Reino Unido                                                                                         ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (181, N'Reunión                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (182, N'Ruanda                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (183, N'Rumania                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (184, N'Rusia                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (185, N'Sahara Occidental                                                                                   ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (186, N'Islas Salomón                                                                                       ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (187, N'Samoa                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (188, N'Samoa Americana                                                                                     ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (189, N'San Cristóbal y Nevis                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (190, N'San Marino                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (191, N'San Pedro y Miquelón                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (192, N'San Vicente y las Granadinas                                                                        ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (193, N'Santa Helena                                                                                        ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (194, N'Santa Lucía                                                                                         ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (195, N'Santo Tomé y Príncipe                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (196, N'Senegal                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (197, N'Serbia y Montenegro                                                                                 ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (198, N'Seychelles                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (199, N'Sierra Leona                                                                                        ')
GO
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (200, N'Singapur                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (201, N'Siria                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (202, N'Somalia                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (203, N'Sri Lanka                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (204, N'Suazilandia                                                                                         ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (205, N'Sudáfrica                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (206, N'Sudán                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (207, N'Suecia                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (208, N'Suiza                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (209, N'Surinam                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (210, N'Svalbard y Jan Mayen                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (211, N'Tailandia                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (212, N'Taiwán                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (213, N'Tanzania                                                                                            ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (214, N'Tayikistán                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (215, N'Territorio Británico del Océano Índico                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (216, N'Territorios Australes Franceses                                                                     ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (217, N'Timor Oriental                                                                                      ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (218, N'Togo                                                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (219, N'Tokelau                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (220, N'Tonga                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (221, N'Trinidad y Tobago                                                                                   ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (222, N'Túnez                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (223, N'Islas Turcas y Caicos                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (224, N'Turkmenistán                                                                                        ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (225, N'Turquía                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (226, N'Tuvalu                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (227, N'Ucrania                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (228, N'Uganda                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (229, N'Uruguay                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (230, N'Uzbekistán                                                                                          ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (231, N'Vanuatu                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (232, N'Venezuela                                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (233, N'Vietnam                                                                                             ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (234, N'Islas Vírgenes Británicas                                                                           ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (235, N'Islas Vírgenes de los Estados Unidos                                                                ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (236, N'Wallis y Futuna                                                                                     ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (237, N'Yemen                                                                                               ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (238, N'Yibuti                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (239, N'Zambia                                                                                              ')
INSERT [dbo].[Pais] ([id_pais], [nombre_pais]) VALUES (240, N'Zimbabue                                                                                            ')
SET IDENTITY_INSERT [dbo].[Pais] OFF
GO
SET IDENTITY_INSERT [dbo].[Parametros] ON 

INSERT [dbo].[Parametros] ([id_parametro], [nombre], [correo_apertura], [correo_cierre], [monto_minimo]) VALUES (1, N'Armando', N'and.re@hotmail.com', N'and.re@hotmail.com', 3)
SET IDENTITY_INSERT [dbo].[Parametros] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincia] ON 

INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (1, N'SAN JOSE', N'sa', CAST(N'2014-05-23T14:35:40.990' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:40.990' AS DateTime), N'A')
INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (2, N'ALAJUELA', N'sa', CAST(N'2014-05-23T14:35:44.320' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:44.320' AS DateTime), N'A')
INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (3, N'CARTAGO', N'sa', CAST(N'2014-05-23T14:35:46.380' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:46.380' AS DateTime), N'A')
INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (4, N'HEREDIA', N'sa', CAST(N'2014-05-23T14:35:49.277' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:49.277' AS DateTime), N'A')
INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (5, N'GUANACASTE', N'sa', CAST(N'2014-05-23T14:35:53.840' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:53.840' AS DateTime), N'A')
INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (6, N'PUNTARENAS', N'sa', CAST(N'2014-05-23T14:35:56.367' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:56.367' AS DateTime), N'A')
INSERT [dbo].[Provincia] ([id_Provincia], [nombre], [usuarioCrea], [fechaCrea], [usuarioModifica], [fechaModifica], [vc_Estado]) VALUES (7, N'LIMON', N'sa', CAST(N'2014-05-23T14:35:59.307' AS DateTime), N'sa', CAST(N'2014-05-23T14:35:59.307' AS DateTime), N'A')
SET IDENTITY_INSERT [dbo].[Provincia] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_servicio] ON 

INSERT [dbo].[tipo_servicio] ([id_servicio], [nombre_servicio], [precio_servicio]) VALUES (1, N'Lavado                                            ', 10500)
SET IDENTITY_INSERT [dbo].[tipo_servicio] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_vehiculo] ON 

INSERT [dbo].[tipo_vehiculo] ([id_tipo_vehiculo], [nombre_vehiculo]) VALUES (1, N'Motocicleta')
INSERT [dbo].[tipo_vehiculo] ([id_tipo_vehiculo], [nombre_vehiculo]) VALUES (2, N'Automóvil                                         ')
INSERT [dbo].[tipo_vehiculo] ([id_tipo_vehiculo], [nombre_vehiculo]) VALUES (3, N'4x4                                               ')
INSERT [dbo].[tipo_vehiculo] ([id_tipo_vehiculo], [nombre_vehiculo]) VALUES (4, N'Camión                                            ')
INSERT [dbo].[tipo_vehiculo] ([id_tipo_vehiculo], [nombre_vehiculo]) VALUES (5, N'Tráiler                                           ')
INSERT [dbo].[tipo_vehiculo] ([id_tipo_vehiculo], [nombre_vehiculo]) VALUES (6, N'Otro                                              ')
SET IDENTITY_INSERT [dbo].[tipo_vehiculo] OFF
GO
SET IDENTITY_INSERT [dbo].[usuario] ON 

INSERT [dbo].[usuario] ([id_usuario], [tipo_usuario], [nombre_usuario], [contraseña], [correo_usuario], [FechaIngreso]) VALUES (1, N'admin', N'André Chinchilla                                  ', N'1234      ', N'andre@andre.com                                   ', NULL)
INSERT [dbo].[usuario] ([id_usuario], [tipo_usuario], [nombre_usuario], [contraseña], [correo_usuario], [FechaIngreso]) VALUES (2, N'Admin', N'Admin', N'1234', N'admin@admin', CAST(N'2020-08-27' AS Date))
SET IDENTITY_INSERT [dbo].[usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[vehiculos] ON 

INSERT [dbo].[vehiculos] ([id_vehiculo], [placa], [id_marca], [id_tipo_vehiculo], [id_modelo_vehiculo], [cantidad_puertas], [cantidad_ruedas], [año_fabricacion], [id_fabricante_vehiculo]) VALUES (1, 730656, 75, 2, 907, 4, 4, CAST(N'2008-01-01' AS Date), 21)
INSERT [dbo].[vehiculos] ([id_vehiculo], [placa], [id_marca], [id_tipo_vehiculo], [id_modelo_vehiculo], [cantidad_puertas], [cantidad_ruedas], [año_fabricacion], [id_fabricante_vehiculo]) VALUES (2, 12341234, 43, 1, 817, 2, 4, CAST(N'2020-08-17' AS Date), 9)
INSERT [dbo].[vehiculos] ([id_vehiculo], [placa], [id_marca], [id_tipo_vehiculo], [id_modelo_vehiculo], [cantidad_puertas], [cantidad_ruedas], [año_fabricacion], [id_fabricante_vehiculo]) VALUES (1002, 12355, 0, 2, 872, 2, 4, CAST(N'2020-08-22' AS Date), 6)
SET IDENTITY_INSERT [dbo].[vehiculos] OFF
GO
SET IDENTITY_INSERT [dbo].[vehiculos_x_cliente] ON 

INSERT [dbo].[vehiculos_x_cliente] ([id_vehiculo_cliente], [id_vehiculo], [id_cliente]) VALUES (1008, 1, 2)
SET IDENTITY_INSERT [dbo].[vehiculos_x_cliente] OFF
GO
/****** Object:  Index [id_Distrito_pk]    Script Date: 27/8/2020 16:12:59 ******/
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [id_Distrito_pk] PRIMARY KEY NONCLUSTERED 
(
	[id_Distrito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [id_Provincia_pk]    Script Date: 27/8/2020 16:12:59 ******/
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [id_Provincia_pk] PRIMARY KEY NONCLUSTERED 
(
	[id_Provincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Canton] ADD  CONSTRAINT [DF__Canton__usuarioC__1B29CEB6]  DEFAULT (suser_name()) FOR [usuarioCrea]
GO
ALTER TABLE [dbo].[Canton] ADD  CONSTRAINT [DF__Canton__fechaCre__1C1DF2EF]  DEFAULT (getdate()) FOR [fechaCrea]
GO
ALTER TABLE [dbo].[Canton] ADD  CONSTRAINT [DF__Canton__usuarioM__1D121728]  DEFAULT (suser_name()) FOR [usuarioModifica]
GO
ALTER TABLE [dbo].[Canton] ADD  CONSTRAINT [DF__Canton__fechaMod__1E063B61]  DEFAULT (getdate()) FOR [fechaModifica]
GO
ALTER TABLE [dbo].[Canton] ADD  CONSTRAINT [DF__Canton__vc_Estad__1EFA5F9A]  DEFAULT ('A') FOR [vc_Estado]
GO
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [DF__Distrito__usuari__2B60367F]  DEFAULT (suser_name()) FOR [usuarioCrea]
GO
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [DF__Distrito__fechaC__2C545AB8]  DEFAULT (getdate()) FOR [fechaCrea]
GO
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [DF__Distrito__usuari__2D487EF1]  DEFAULT (suser_name()) FOR [usuarioModifica]
GO
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [DF__Distrito__fechaM__2E3CA32A]  DEFAULT (getdate()) FOR [fechaModifica]
GO
ALTER TABLE [dbo].[Distrito] ADD  CONSTRAINT [DF__Distrito__vc_Est__2F30C763]  DEFAULT ('A') FOR [vc_Estado]
GO
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [DF__Provincia__usuar__1388ACEE]  DEFAULT (suser_name()) FOR [usuarioCrea]
GO
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [DF__Provincia__fecha__147CD127]  DEFAULT (getdate()) FOR [fechaCrea]
GO
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [DF__Provincia__usuar__1570F560]  DEFAULT (suser_name()) FOR [usuarioModifica]
GO
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [DF__Provincia__fecha__16651999]  DEFAULT (getdate()) FOR [fechaModifica]
GO
ALTER TABLE [dbo].[Provincia] ADD  CONSTRAINT [DF__Provincia__vc_Es__17593DD2]  DEFAULT ('A') FOR [vc_Estado]
GO
ALTER TABLE [dbo].[caja_chica]  WITH CHECK ADD  CONSTRAINT [FK_caja_chica_usuario1] FOREIGN KEY([id_usuario_apertura])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[caja_chica] CHECK CONSTRAINT [FK_caja_chica_usuario1]
GO
ALTER TABLE [dbo].[caja_chica]  WITH CHECK ADD  CONSTRAINT [FK_caja_chica_usuario2] FOREIGN KEY([id_usuario_cierre])
REFERENCES [dbo].[usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[caja_chica] CHECK CONSTRAINT [FK_caja_chica_usuario2]
GO
ALTER TABLE [dbo].[Canton]  WITH CHECK ADD  CONSTRAINT [Canton_ref_Provincia] FOREIGN KEY([id_Provincia])
REFERENCES [dbo].[Provincia] ([id_Provincia])
GO
ALTER TABLE [dbo].[Canton] CHECK CONSTRAINT [Canton_ref_Provincia]
GO
ALTER TABLE [dbo].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_Provincia] FOREIGN KEY([id_provincia])
REFERENCES [dbo].[Provincia] ([id_Provincia])
GO
ALTER TABLE [dbo].[cliente] CHECK CONSTRAINT [FK_cliente_Provincia]
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [Distrito_ref_Canton] FOREIGN KEY([id_Canton])
REFERENCES [dbo].[Canton] ([id_Canton])
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [Distrito_ref_Canton]
GO
ALTER TABLE [dbo].[fabricante]  WITH CHECK ADD  CONSTRAINT [FK_fabricante_País] FOREIGN KEY([pais])
REFERENCES [dbo].[Pais] ([id_pais])
GO
ALTER TABLE [dbo].[fabricante] CHECK CONSTRAINT [FK_fabricante_País]
GO
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_factura_detalle_factura_encabezado] FOREIGN KEY([id_factura_encabezado])
REFERENCES [dbo].[factura_encabezado] ([id_factura])
GO
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_factura_detalle_factura_encabezado]
GO
ALTER TABLE [dbo].[factura_detalle]  WITH CHECK ADD  CONSTRAINT [FK_factura_detalle_tipo_servicio] FOREIGN KEY([id_servicio])
REFERENCES [dbo].[tipo_servicio] ([id_servicio])
GO
ALTER TABLE [dbo].[factura_detalle] CHECK CONSTRAINT [FK_factura_detalle_tipo_servicio]
GO
ALTER TABLE [dbo].[factura_encabezado]  WITH CHECK ADD  CONSTRAINT [FK_factura_encabezado_cliente] FOREIGN KEY([id_cliente_factura])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[factura_encabezado] CHECK CONSTRAINT [FK_factura_encabezado_cliente]
GO
ALTER TABLE [dbo].[factura_encabezado]  WITH CHECK ADD  CONSTRAINT [FK_factura_encabezado_vehiculos] FOREIGN KEY([vehiculo_id])
REFERENCES [dbo].[vehiculos] ([id_vehiculo])
GO
ALTER TABLE [dbo].[factura_encabezado] CHECK CONSTRAINT [FK_factura_encabezado_vehiculos]
GO
ALTER TABLE [dbo].[marca_vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_marca_vehiculo_fabricante] FOREIGN KEY([id_fabricante])
REFERENCES [dbo].[fabricante] ([id_fabricante])
GO
ALTER TABLE [dbo].[marca_vehiculo] CHECK CONSTRAINT [FK_marca_vehiculo_fabricante]
GO
ALTER TABLE [dbo].[modelo_vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_modelo_vehículo_marca_vehículo] FOREIGN KEY([id_marca_modelo])
REFERENCES [dbo].[marca_vehiculo] ([id_marca])
GO
ALTER TABLE [dbo].[modelo_vehiculo] CHECK CONSTRAINT [FK_modelo_vehículo_marca_vehículo]
GO
ALTER TABLE [dbo].[vehiculos]  WITH CHECK ADD  CONSTRAINT [FK_vehiculos_fabricante] FOREIGN KEY([id_fabricante_vehiculo])
REFERENCES [dbo].[fabricante] ([id_fabricante])
GO
ALTER TABLE [dbo].[vehiculos] CHECK CONSTRAINT [FK_vehiculos_fabricante]
GO
ALTER TABLE [dbo].[vehiculos]  WITH CHECK ADD  CONSTRAINT [FK_vehiculos_tipo_vehiculo] FOREIGN KEY([id_tipo_vehiculo])
REFERENCES [dbo].[tipo_vehiculo] ([id_tipo_vehiculo])
GO
ALTER TABLE [dbo].[vehiculos] CHECK CONSTRAINT [FK_vehiculos_tipo_vehiculo]
GO
ALTER TABLE [dbo].[vehiculos_x_cliente]  WITH CHECK ADD  CONSTRAINT [FK_vehículos_x_cliente_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[vehiculos_x_cliente] CHECK CONSTRAINT [FK_vehículos_x_cliente_cliente]
GO
ALTER TABLE [dbo].[vehiculos_x_cliente]  WITH CHECK ADD  CONSTRAINT [FK_vehículos_x_cliente_vehículos] FOREIGN KEY([id_vehiculo])
REFERENCES [dbo].[vehiculos] ([id_vehiculo])
GO
ALTER TABLE [dbo].[vehiculos_x_cliente] CHECK CONSTRAINT [FK_vehículos_x_cliente_vehículos]
GO
ALTER TABLE [dbo].[Canton]  WITH NOCHECK ADD  CONSTRAINT [Canton_Estado_CkC] CHECK  (([vc_Estado] IS NULL OR ([vc_Estado]='I' OR [vc_Estado]='A')))
GO
ALTER TABLE [dbo].[Canton] NOCHECK CONSTRAINT [Canton_Estado_CkC]
GO
ALTER TABLE [dbo].[Canton]  WITH NOCHECK ADD  CONSTRAINT [CKC_VC_ESTADO_CANTON] CHECK  (([vc_Estado] IS NULL OR ([vc_Estado]='I' OR [vc_Estado]='A')))
GO
ALTER TABLE [dbo].[Canton] NOCHECK CONSTRAINT [CKC_VC_ESTADO_CANTON]
GO
ALTER TABLE [dbo].[Distrito]  WITH CHECK ADD  CONSTRAINT [CKC_VC_ESTADO_DISTRITO] CHECK  (([vc_Estado] IS NULL OR ([vc_Estado]='I' OR [vc_Estado]='A')))
GO
ALTER TABLE [dbo].[Distrito] CHECK CONSTRAINT [CKC_VC_ESTADO_DISTRITO]
GO
ALTER TABLE [dbo].[Provincia]  WITH CHECK ADD  CONSTRAINT [CKC_VC_ESTADO_PROVINCI] CHECK  (([vc_Estado] IS NULL OR ([vc_Estado]='I' OR [vc_Estado]='A')))
GO
ALTER TABLE [dbo].[Provincia] CHECK CONSTRAINT [CKC_VC_ESTADO_PROVINCI]
GO
/****** Object:  StoredProcedure [dbo].[InsertaNuevoModelo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Inserta nuevo Modelo>
-- =============================================
CREATE PROCEDURE [dbo].[InsertaNuevoModelo]
 @nombre_modelo nchar,
 @id_marca_modelo int
AS
BEGIN
Insert into modelo_vehiculo
values (@nombre_modelo, @id_marca_modelo)
END
GO
/****** Object:  StoredProcedure [dbo].[Retorna_Cierres_Caja]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Description:	<retorna cieres de caja>
-- =============================================
CREATE PROCEDURE [dbo].[Retorna_Cierres_Caja]


AS
BEGIN
 SELECT 
	 id_caja,
	 hora_apertura, 
	 hora_cierre, 
	 monto_apertura,
	 monto_cierre_total,
	 id_usuario_apertura,
	 id_usuario_cierre
 FROM caja_chica

END
GO
/****** Object:  StoredProcedure [dbo].[RetornaCantones]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Retorna los registros de la tabla de Cantones tomando en cuenta la columna nombre y id_Provincia>
-- =============================================
CREATE PROCEDURE [dbo].[RetornaCantones]
@nombre [varchar](50)= NULL,
@id_Provincia int= NULL
AS
	
SELECT  tCant.id_Canton,tCant.id_Provincia, tCant.nombre,tProv.nombre 'Provincia', tCant.usuarioCrea, tCant.fechaCrea, tCant.usuarioModifica, tCant.fechaModifica, tCant.vc_Estado,tCant.id_CantonInec
FROM Canton tCant inner join Provincia tProv on tCant.id_Provincia=tProv.id_Provincia
WHERE tCant.[id_Provincia] = (case when @id_Provincia is null then tCant.id_Provincia else @id_Provincia end)
and tCant.[nombre] like (case when @nombre is null then '%%' else '%'+@nombre+'%' end)

GO
/****** Object:  StoredProcedure [dbo].[RetornaUsuario]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetornaUsuario]
@correoElectronico [varchar](50),
@nombreCompleto [varchar](50),
@id_Usuario int
AS
 
SELECT [id_Usuario],[nombre_usuario],[correo_usuario],[contraseña],[FechaIngreso]
FROM [usuario]
WHERE  [nombre_usuario] like (case when @nombreCompleto is null then '%%' else '%'+@nombreCompleto+'%' end)
and [correo_usuario] like (case when @correoElectronico is null then '%%' else '%'+@correoElectronico+'%' end)
and [id_Usuario] = (case when @id_Usuario is null then [id_Usuario] else @id_Usuario end)
GO
/****** Object:  StoredProcedure [dbo].[RetornaUsuarioCorreoPwd]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetornaUsuarioCorreoPwd]
@correoElectronico [varchar](50),
@contrasena [varchar](100)
AS
 
SELECT [id_Usuario],[nombre_usuario],[correo_usuario],[contraseña],[FechaIngreso]
FROM [usuario]
WHERE [contraseña]=@contrasena and [correo_usuario]=@correoElectronico

GO
/****** Object:  StoredProcedure [dbo].[RetornaUsuarioID]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RetornaUsuarioID]
@id_Usuario int
AS
 
SELECT [id_Usuario],[nombre_usuario],[correo_usuario],[contraseña],[FechaIngreso]
FROM [usuario]
WHERE [id_Usuario]=@id_Usuario

GO
/****** Object:  StoredProcedure [dbo].[sp_AnularFactura]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[sp_AnularFactura]
@id_Factura int

AS
BEGIN
 UPDATE factura_encabezado
 SET estado_factura =0
 WHERE id_Factura = @id_Factura
END
GO
/****** Object:  StoredProcedure [dbo].[sp_AperturaCaja]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:	<Apertura de caja>
-- =============================================
CREATE PROCEDURE [dbo].[sp_AperturaCaja]
	
	@monto_apertura float,
	@id_usuarioapertura int


AS
BEGIN
					INSERT INTO
					caja_chica
					VALUES (GETDATE(),
					NULL,
					@monto_apertura,
					0,
					@id_usuarioapertura,
					NULL)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cierra_Caja]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Cierra una caja>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Cierra_Caja]
AS
BEGIN
	
	select MAX(hora_cierre)
	from caja_chica
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Cierre_Caja]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:	<Cierre de caja>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Cierre_Caja]
	

	@id_usuariocierre int


AS
BEGIN
UPDATE caja_chica 	
SET hora_cierre= GETDATE(),
monto_cierre_total = (SELECT SUM(total_pagar) FROM factura_encabezado
WHERE  CAST( fecha_factura as Date) = CAST( GETDATE() as Date)) ,
id_usuario_cierre = @id_usuariocierre

WHERE id_caja = (select MAX(id_caja) from caja_chica) 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_cierre_cajas]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Reporte de cajas cierre>
-- =============================================
CREATE PROCEDURE [dbo].[sp_cierre_cajas]

AS
BEGIN
	SELECT
	CC.id_caja,
	CC.hora_apertura,
	CC.hora_cierre,
	CC.monto_apertura,
	CC.monto_cierre_total,
	CC.id_usuario_apertura,
	CC.id_usuario_cierre,
	USU.nombre_usuario AS nombre_usuario_apertura,
	USU2.nombre_usuario AS nobre_usuario_cierre
	FROM caja_chica AS CC
	INNER JOIN usuario AS USU ON CC.id_usuario_apertura = USU.id_usuario
	INNER JOIN usuario AS USU2 ON CC.id_usuario_cierre = USU2.id_usuario

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Elimina_Fabricante]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Elimna Fabricante>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Elimina_Fabricante]

@id_fabricante int

AS
BEGIN
	DELETE 
	FROM fabricante
	WHERE id_fabricante = @id_fabricante
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Elimina_Modelo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Elimina Modelo>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Elimina_Modelo]

@id_modelo int

AS
BEGIN
	delete 
	from modelo_vehiculo
	where id_modelo = @id_modelo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Elimina_TipoVehiculo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Inserta tipo de Vehículo>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Elimina_TipoVehiculo]
	-- Add the parameters for the stored procedure here
	@id_tipo_vehiculo int

AS
BEGIN
	DELETE tipo_vehiculo
	WHERE id_tipo_vehiculo = @id_tipo_vehiculo
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Elimina_Vehiculos_x_Cliente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:	<Inserta Vehículos por cliente>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Elimina_Vehiculos_x_Cliente]
	-- Add the parameters for the stored procedure here

	@id_vehiculo_cliente int
AS
BEGIN
	
	DELETE vehiculos_x_cliente
	WHERE id_vehiculo_cliente = @id_vehiculo_cliente
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaCanton]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Elimina un registro en la tabla de cantones>
-- =============================================
CREATE PROCEDURE [dbo].[sp_EliminaCanton]
	-- Add the parameters for the stored procedure here
		  @id_Canton int
AS
BEGIN
	DELETE FROM Canton
	WHERE [id_Canton]=@id_Canton
END

GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaCliente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Elimina Cliente>
-- =============================================
CREATE PROCEDURE [dbo].[sp_EliminaCliente]
	-- Add the parameters for the stored procedure here
	@id_cliente int
AS
BEGIN
	DELETE cliente
	WHERE id_cliente = @id_cliente
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaMarca]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Moficia Marca>
-- =============================================
CREATE PROCEDURE [dbo].[sp_EliminaMarca]
@id_modelo int

AS
BEGIN
	
	DELETE FROM modelo_vehiculo
	WHERE id_modelo = @id_modelo
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminaPais]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Elimina un pais la lista>
-- =============================================
CREATE PROCEDURE [dbo].[sp_EliminaPais]
@id_pais INT

AS
BEGIN

	DELETE Pais WHERE
	id_pais = @id_pais

END
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarVehiculo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Armando Ramirez>
-- Create date: <Junio 2020>
-- Description:	<Procedimiento para Eliminar Vehiculo>
-- =============================================
CREATE PROCEDURE [dbo].[sp_EliminarVehiculo]
	-- Parametros
		  @ID int
AS
BEGIN

	delete from vehiculos_x_cliente WHERE id_vehiculo= @ID

	DELETE FROM vehiculos
	WHERE id_vehiculo=@ID
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Fabricante_Update]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Fabricante_Update]
	--PROCEDIMIENTO PARA MODIFICAR FABRICANTE
	@id_fabricante int,
	@nombre_fabricante nvarchar(100),
	@pais int
AS
BEGIN
	
	UPDATE fabricante SET
	nombre_fabricante = @nombre_fabricante,
	pais = @pais
	WHERE id_fabricante = @id_fabricante

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inserta_Fabricante]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_Inserta_Fabricante]
	-- INSERTA UN NUEVO FABRICANTE DE VEHÍCULOS
	
	@nombre_fabricante  nvarchar(100),
	@pais int
AS
BEGIN

INSERT INTO fabricante VALUES 
			(@nombre_fabricante, 
			@pais)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inserta_factura_Detalle]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description: <Inserta Factura Detalle>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Inserta_factura_Detalle]

@id_factura_encabezado int,
@id_servicio int,
@cantidad int,
@precio float


AS
BEGIN


 INSERT  INTO
 factura_detalle
 (id_factura_encabezado,id_servicio,cantidad,precio_servicio)
 VALUES 
 (@id_factura_encabezado,@id_servicio,@cantidad,@precio)

 declare @sumafactura int 
 set @sumafactura = (SELECT 
      total_sin_iv FROM factura_encabezado 
      where id_factura = @id_factura_encabezado)
       
       IF @sumafactura IS NULL 
       BEGIN
        set @sumafactura = 0
       END
      
 UPDATE factura_encabezado
 SET total_sin_iv = @sumafactura+ (@precio*@cantidad),
 total_pagar = ((@sumafactura+ (@precio*@cantidad)) * 0.13)+
      @sumafactura + @precio
      where id_factura = @id_factura_encabezado
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inserta_factura_encabezado]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Inserta Factura Encabezado>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Inserta_factura_encabezado]

	@id_cliente int,
	@vehiculo_id int

AS
BEGIN
	INSERT  INTO
	factura_encabezado (fecha_factura,id_cliente_factura,vehiculo_id,estado_factura)
	VALUES (GETDATE(),@id_cliente,@vehiculo_id,1)
	select Max (id_factura)from factura_encabezado
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inserta_Modelo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:	<Inserta Modelo>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Inserta_Modelo]
	@nombre_modelo nvarchar(25),
	@id_marca_modelo int

AS
BEGIN
Insert into modelo_vehiculo
values (@nombre_modelo,@id_marca_modelo)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inserta_parametro]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Inserta_parametro]

@Nombre nvarchar(50),
@correo_aperture nvarchar(50),
@correo_cierre nvarchar(50),
@monto_minimo float


AS
BEGIN


 INSERT  INTO
 Parametros (nombre, correo_apertura,correo_cierre,monto_minimo)
 VALUES 
 (@Nombre,@correo_aperture,@correo_cierre,@monto_minimo)
END

GO
/****** Object:  StoredProcedure [dbo].[SP_INSERTA_SERVICIO]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_INSERTA_SERVICIO]
	--PROCEDIMIENTO PARA INSERTAR UN NUEVO TIPO DE SERVICIO
	@NOMBRE_SERVICIO NVARCHAR (50),
	@PRECIO_SERVICIO FLOAT
AS
BEGIN
	INSERT INTO tipo_servicio VALUES
	(@NOMBRE_SERVICIO,
	@PRECIO_SERVICIO)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inserta_TipoVehiculo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Inserta tipo de Vehículo>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Inserta_TipoVehiculo]
	-- Add the parameters for the stored procedure here
	@nombre varchar (50)

AS
BEGIN
	INSERT INTO tipo_vehiculo 
	VALUES (@nombre)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inserta_Vehiculo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Inserta un nuevo vehículo>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Inserta_Vehiculo]

@placa int,
@id_marca int,
@id_fabricante_vehiculo int,
@id_tipo_vehiculo int,
@id_modelo_vehiculo int,
@cantidad_puertas smallint,
@cantidad_ruedas smallint,
@año_fabricacion date

AS
BEGIN
	INSERT INTO vehiculos (placa,
	id_fabricante_vehiculo,
	id_marca,
	id_tipo_vehiculo,
	id_modelo_vehiculo,
	cantidad_puertas,
	cantidad_ruedas,
	año_fabricacion)
	VALUES(
	@placa,
	@id_fabricante_vehiculo,
	@id_marca,
	@id_tipo_vehiculo,
	@id_modelo_vehiculo,
	@cantidad_puertas,
	@cantidad_ruedas,
	@año_fabricacion
	)


END
GO
/****** Object:  StoredProcedure [dbo].[sp_Inserta_Vehiculos_x_Cliente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Inserta Vehículos por cliente>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Inserta_Vehiculos_x_Cliente]
	-- Add the parameters for the stored procedure here
	@id_vehiculo int,
	@id_cliente int
AS
BEGIN
	
	INSERT INTO vehiculos_x_cliente 
	VALUES (@id_vehiculo,@id_cliente)
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaCanton]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************PROCEDIMIENTOS ALMACENADOS*****************************************/

-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Inserta un registro en la tabla de cantones>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertaCanton]
	-- Add the parameters for the stored procedure here
		  @id_Provincia int,          
          @nombre varchar(100),          
          @id_CantonInec int          
AS
BEGIN
	INSERT INTO [dbo].Canton
           ([id_Provincia]           
           ,[nombre]
           ,[id_CantonInec])
     VALUES
           (@id_Provincia,		    
            @nombre,
            @id_CantonInec)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaMarca]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:	<Inserta una nueva Marca>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertaMarca]

@nombre_marca nchar(50),
@id_fabricante int 

AS
BEGIN
	
	INSERT INTO marca_vehiculo
	VALUES (@nombre_marca,@id_fabricante)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaNuevoCliente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Inserta un nuevo cliente>
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertaNuevoCliente]
	-- Add the parameters for the stored procedure here
	@nombre nvarchar(100),
	@apellido1 nvarchar (100),
	@apellido2 nvarchar (100),
	@cedula int,
	@id_provincia int,
	@id_canton int,
	@id_distrito int,
	@direccion nvarchar (100),
	@telefono int,
	@email nvarchar (100)
AS
BEGIN
	
	INSERT INTO cliente
	VALUES (@nombre,
	@apellido1,
	@apellido2,
	@cedula,
	@id_provincia,
	@id_canton,
	@id_distrito,
	@direccion,
	@telefono,
	@email)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertaPais]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Inserta un nuevo pais en la tabla "pais">
-- =============================================
CREATE PROCEDURE [dbo].[sp_InsertaPais] 
	@nombrepais varchar (80)
AS
BEGIN
	INSERT INTO Pais 
	values (@nombrepais)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Modifica_Fabricante]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--MODIFICA FABRICANTE--
CREATE PROCEDURE [dbo].[sp_Modifica_Fabricante]

	@id_fabricante int,
	@nombre_fabricante  nvarchar(100),
	@pais int
AS
BEGIN

UPDATE fabricante
SET	nombre_fabricante = @nombre_fabricante,
pais = @pais
WHERE id_fabricante = @id_fabricante

END
GO
/****** Object:  StoredProcedure [dbo].[SP_MODIFICA_SERVICIO]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_MODIFICA_SERVICIO]
	--PROCEDIMIENTO PARA INSERTAR UN NUEVO TIPO DE SERVICIO
	@ID_SERVICIO INT,
	@NOMBRE_SERVICIO NVARCHAR (50),
	@PRECIO_SERVICIO FLOAT
AS
BEGIN
	UPDATE tipo_servicio SET
	nombre_servicio=@NOMBRE_SERVICIO,
	precio_servicio=@PRECIO_SERVICIO
	WHERE id_servicio = @ID_SERVICIO

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Modifica_TipoVehiculo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Inserta tipo de Vehículo>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Modifica_TipoVehiculo]
	-- Add the parameters for the stored procedure here
	@nombre varchar (50),
	@id_tipo_vehiculo int

AS
BEGIN
	UPDATE tipo_vehiculo
	SET nombre_vehiculo = @nombre
	WHERE id_tipo_vehiculo = @id_tipo_vehiculo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Modifica_Vehiculo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Inserta un nuevo vehículo>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Modifica_Vehiculo]
@id_vehiculo int,
@placa int,
@id_fabricante_vehiculo int,
@id_marca int,
@id_tipo_vehiculo int,
@id_modelo_vehiculo int,
@cantidad_puertas smallint,
@cantidad_ruedas smallint,
@año_fabricacion date



AS
BEGIN
	UPDATE  vehiculos SET
	placa=@placa,
	id_fabricante_vehiculo=@id_fabricante_vehiculo,
	id_marca=@id_marca,
	id_tipo_vehiculo=@id_tipo_vehiculo,
	id_modelo_vehiculo=@id_modelo_vehiculo,
	cantidad_puertas=@cantidad_puertas,
	cantidad_ruedas=@cantidad_ruedas,
	año_fabricacion=@año_fabricacion

	WHERE id_vehiculo= @id_vehiculo

END
GO
/****** Object:  StoredProcedure [dbo].[sp_Modifica_Vehiculos_x_Cliente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:	<Inserta Vehículos por cliente>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Modifica_Vehiculos_x_Cliente]
	-- Add the parameters for the stored procedure here
	@id_vehiculo int,
	@id_cliente int,
	@id_vehiculo_cliente int
AS
BEGIN
	
UPDATE vehiculos_x_cliente
SET	
id_vehiculo = @id_vehiculo,
id_cliente = @id_cliente
WHERE id_vehiculo_cliente = @id_vehiculo_cliente
	
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificaCanton]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Modifica un registro en la tabla de cantones>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ModificaCanton]
	-- Add the parameters for the stored procedure here
		  @id_Canton int,
		  @id_Provincia int,          
          @nombre varchar(100),          
          @id_CantonInec int 
AS
BEGIN
	UPDATE Canton
	SET [id_Provincia]=@id_Provincia,
	[nombre]=@nombre,
	[id_CantonInec]=@id_CantonInec
	WHERE [id_Canton]=@id_Canton
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ModificaCliente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Modifica un cliente>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ModificaCliente]
	-- Add the parameters for the stored procedure here
	@id_cliente int,
	@nombre nvarchar(100),
	@apellido1 nvarchar (100),
	@apellido2 nvarchar (100),
	@cedula int,
	@id_provincia int,
	@id_canton int,
	@id_distrito int,
	@direccion nvarchar (100),
	@telefono int,
	@email nvarchar (100)
AS
BEGIN
	
	UPDATE  cliente
	SET nombre_cliente = @nombre,
	apellido1 = @apellido1,
	apellido2 = @apellido2,
	cedula = @cedula,
	id_provincia = @id_provincia,
	id_canton = @id_canton,
	id_distrito = @id_distrito,
	direccion = @direccion,
	telefono = @telefono,
	email = @email
	WHERE id_cliente = @id_cliente

END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificaMarca]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Moficia Marca>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ModificaMarca]
@id_marca int,
@nombre_marca nchar,
@id_fabricante int
AS
BEGIN
	UPDATE marca_vehiculo
	SET nombre_marca =@nombre_marca,
	id_fabricante = @id_fabricante
	WHERE id_marca = @id_marca
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificaModelo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Modifica modelos>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ModificaModelo]
@id_modelo int,
@nombre_modelo nvarchar (50),
@id_marca_modelo int
AS
BEGIN
	update modelo_vehiculo
set nombre_modelo = @nombre_modelo,
id_marca_modelo = @id_marca_modelo
where id_modelo = @id_modelo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificaPais]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Modifica la lista de paises>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ModificaPais]
@id_pais INT,
@nombre varchar (80) = null

AS
BEGIN

	UPDATE Pais
	SET nombre_pais = @nombre WHERE
	id_pais = @id_pais

END
GO
/****** Object:  StoredProcedure [dbo].[sp_MostrarCliente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Author:		<Armando Ramirez>
-- Create date: <Junio 2020>
-- Description:	<Procedimiento para mostrar cliente>
-- =============================================
create PROCEDURE [dbo].[sp_MostrarCliente]

AS
BEGIN

SELECT        dbo.cliente.id_cliente, dbo.cliente.nombre_cliente, dbo.cliente.apellido1, dbo.cliente.apellido2, dbo.cliente.cedula, dbo.Provincia.nombre AS Provincia, dbo.Canton.nombre AS Canton, dbo.Distrito.nombre AS Distrito, 
                         dbo.cliente.direccion, dbo.cliente.telefono, dbo.cliente.email
FROM            dbo.cliente INNER JOIN
                         dbo.Canton ON dbo.cliente.id_canton = dbo.Canton.id_Canton INNER JOIN
                         dbo.Distrito ON dbo.cliente.id_distrito = dbo.Distrito.id_Distrito AND dbo.Canton.id_Canton = dbo.Distrito.id_Canton INNER JOIN
                         dbo.Provincia ON dbo.cliente.id_provincia = dbo.Provincia.id_Provincia AND dbo.Canton.id_Provincia = dbo.Provincia.id_Provincia
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Retorna_cierre_Caja]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Cierra una caja>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Retorna_cierre_Caja]
AS
BEGIN
	
	select MAX(hora_cierre)
	from caja_chica
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Retorna_Fecha_Apertura]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_Retorna_Fecha_Apertura]

AS
BEGIN
 
 select CAST(MAX(hora_apertura) AS DATE)
 from caja_chica
END
GO
/****** Object:  StoredProcedure [dbo].[sp_retorna_parametro]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_retorna_parametro]

AS
BEGIN
 select id_parametro,nombre,correo_apertura,correo_cierre,monto_minimo from Parametros
END
GO
/****** Object:  StoredProcedure [dbo].[sp_retorna_tiposervicio]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<retorna tipo de servicio>
-- =============================================
CREATE PROCEDURE [dbo].[sp_retorna_tiposervicio] 
	
	@id_servicio int
AS
BEGIN
	SELECT 
	id_servicio,
	nombre_servicio,
	precio_servicio
	FROM tipo_servicio
	WHERE id_servicio = @id_servicio
END
GO
/****** Object:  StoredProcedure [dbo].[sp_retorna_TODOS_tiposervicios]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description: <retorna tipo de servicio>
-- =============================================
CREATE PROCEDURE [dbo].[sp_retorna_TODOS_tiposervicios] 

AS
BEGIN
 SELECT 
 id_servicio,
 nombre_servicio,
 precio_servicio
 FROM tipo_servicio
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Retorna_Vehiculos_sin_Cliente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Retorna vehiculos sin cliente>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Retorna_Vehiculos_sin_Cliente]

AS
BEGIN

SELECT
	v.id_vehiculo,
	v.placa,
	v.id_marca,
	TRIM(mv.nombre_marca)as nombre_marca,
	v.id_tipo_vehiculo,
	tpv.nombre_vehiculo,
	v.id_modelo_vehiculo,
	TRIM(modelv.nombre_modelo)as nombre_modelo,
	v.cantidad_puertas,
	v.cantidad_ruedas,
	v.año_fabricacion,
	v.id_fabricante_vehiculo,
	fab.nombre_fabricante
	FROM vehiculos as v
	INNER JOIN marca_vehiculo as mv on mv.id_marca = v.id_marca
	INNER JOIN modelo_vehiculo as modelv on modelv.id_modelo = v.id_modelo_vehiculo
	INNER JOIN fabricante as fab on fab.id_fabricante = v.id_fabricante_vehiculo
	INNER JOIN tipo_vehiculo as tpv on tpv.id_tipo_vehiculo = v.id_tipo_vehiculo
	WHERE id_vehiculo not in (SELECT id_vehiculo
	FROM vehiculos_x_cliente);

END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaCantonesID]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Retorna los registros de la tabla de Cantones tomando en cuenta la columna id_Canton>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaCantonesID]
@id_Canton int
AS
	
SELECT  tCant.id_Canton,tCant.id_Provincia, tCant.nombre,tProv.nombre 'Provincia', tCant.usuarioCrea, tCant.fechaCrea, tCant.usuarioModifica, tCant.fechaModifica, tCant.vc_Estado,tCant.id_CantonInec
FROM Canton tCant inner join Provincia tProv on tCant.id_Provincia=tProv.id_Provincia
WHERE [id_Canton] = @id_Canton
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaCliente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Retorna cliente>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaCliente]
	-- Add the parameters for the stored procedure here
	@nombre nvarchar(100),
	@apellido1 nvarchar (100),
	@apellido2 nvarchar (100),
	@cedula int,
	@id_provincia int,
	@id_canton int,
	@id_distrito int,
	@direccion nvarchar (100),
	@telefono int,
	@email nvarchar (100)

AS
BEGIN
		SELECT 
		tblcliente.id_cliente,
		tblcliente.nombre_cliente, 
		tblcliente.apellido1, 
		tblcliente.apellido2, 
		tblcliente.cedula,
		tblcliente.id_provincia,
		tblprov.nombre 'Provincia',
		tblcliente.id_canton,
		tblcanton.nombre'Cantón',
		tblcliente.id_distrito,
		tbldistrito.nombre'Distrito',
		tblcliente.direccion,
		tblcliente.telefono,
		tblcliente.email
		FROM cliente tblcliente
		INNER JOIN Provincia tblprov ON tblprov.id_Provincia = tblcliente.id_provincia
		INNER JOIN Canton tblcanton on tblcanton.id_Canton = tblcliente.id_canton
		INNER JOIN Distrito tbldistrito on tbldistrito.id_Distrito = tblcliente.id_distrito
		WHERE tblcliente.id_cliente like
		(CASE WHEN @nombre IS NULL THEN '%%' ELSE '%'+@nombre+'%' END)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaCliente_ID]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Retorna Id cliente>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaCliente_ID]
@Id_cliente int
AS
BEGIN
	SELECT 
	tblcliente.id_cliente,
	tblcliente.nombre_cliente, 
		tblcliente.apellido1, 
		tblcliente.apellido2, 
		tblcliente.cedula,
		tblcliente.id_provincia,
		tblprov.nombre 'Provincia',
		tblcliente.id_canton,
		tblcanton.nombre'Cantón',
		tblcliente.id_distrito,
		tbldistrito.nombre'Distrito',
		tblcliente.direccion,
		tblcliente.telefono,
		tblcliente.email
		FROM cliente tblcliente
		INNER JOIN Provincia tblprov ON tblprov.id_Provincia = tblcliente.id_provincia
		INNER JOIN Canton tblcanton on tblcanton.id_Canton = tblcliente.id_canton
		INNER JOIN Distrito tbldistrito on tbldistrito.id_Distrito = tblcliente.id_distrito
		WHERE tblcliente.id_cliente = @Id_cliente
		
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaDistritos]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Create date: <Abril 2018>
-- Description:	<Retorna los registros de la tabla de Distritos tomando en cuenta la columna nombre y id_Canton>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaDistritos]
@nombre [varchar](50)= NULL,
@id_Canton int= NULL
AS
	
SELECT   tDist.id_Distrito,tCant.id_Canton, tDist.nombre,tCant.nombre 'Canton', tDist.usuarioCrea, tDist.fechaCrea, tDist.usuarioModifica, tCant.fechaModifica, tCant.vc_Estado,tDist.id_DistritoInec
FROM Distrito tDist inner join Canton tCant on tDist.id_Canton=tCant.id_Canton
WHERE tDist.[id_Canton] = (case when @id_Canton is null then tCant.[id_Canton] else @id_Canton end)
and tDist.[nombre] like (case when @nombre is null then '%%' else '%'+@nombre+'%' end)
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaDistritos_ID]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_RetornaDistritos_ID]

@id_Distrito int= NULL
AS
	
SELECT   tDist.id_Distrito,tCant.id_Canton, tDist.nombre,tCant.nombre 'Canton', tDist.usuarioCrea, tDist.fechaCrea, tDist.usuarioModifica, tCant.fechaModifica, tCant.vc_Estado,tDist.id_DistritoInec
FROM Distrito tDist inner join Canton tCant on tDist.id_Canton=tCant.id_Canton
WHERE tDist.[id_Distrito] = (case when @id_Distrito is null then tDist.[id_Distrito] else @id_Distrito end)


GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaFabricante_ID]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaFabricante_ID]
	
	@id_fabricante int
AS
BEGIN
	SELECT id_fabricante, nombre_fabricante,nombre_pais,id_pais
	FROM fabricante
	INNER JOIN Pais ON id_pais = pais
	WHERE id_fabricante = @id_fabricante
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaFabricantes]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<RETORNA CASAS FABRICANTES>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaFabricantes]
@id_fabricante int,
@nombrefabr varchar (100),
@pais int


AS
BEGIN

	SELECT TRIM (TBLFABRIC.nombre_fabricante) as nombre_fabricante,TBLFABRIC.id_fabricante,
TRIM (TBLPAIS.nombre_pais) as nombre_pais
FROM fabricante TBLFABRIC
INNER JOIN Pais TBLPAIS ON TBLPAIS.id_pais = TBLFABRIC.pais

WHERE TBLFABRIC.id_fabricante =
	(CASE WHEN @id_fabricante IS NULL THEN TBLFABRIC.id_fabricante ELSE @id_fabricante END)
	AND TBLFABRIC.nombre_fabricante LIKE
	(CASE WHEN @nombrefabr IS NULL THEN '%%'ELSE '%'+@nombrefabr+'%' END)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaFacturaEncabezadoID]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<retorna factura encabezado>
-- =============================================
create PROCEDURE [dbo].[sp_RetornaFacturaEncabezadoID]

@id_factura int


AS
BEGIN
	
	SELECT 
	FE.id_factura,
	FE.fecha_factura,
	FE.id_cliente_factura,
	FE.vehiculo_id,
	FE.total_pagar,
	FE.total_sin_iv,
	FE.estado_factura,
	FD.id_detalle_factura,
	FD.id_factura_encabezado,
	CL.id_cliente,
	CL.cedula,
	CL.nombre_cliente,
	CL.apellido1,
	VC.id_vehiculo_cliente,
	VC.id_vehiculo
	FROM 
	factura_encabezado AS FE
	INNER JOIN factura_detalle AS FD ON id_factura_encabezado= FD.id_factura_encabezado
	INNER JOIN cliente AS CL ON FE.id_cliente_factura = CL.id_cliente
	INNER JOIN vehiculos_x_cliente AS VC ON FE.vehiculo_id = VC.id_vehiculo_cliente

	WHERE id_factura_encabezado = @id_factura

END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaFacturas]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[sp_RetornaFacturas]
 -- Add the parameters for the stored procedure here

AS
BEGIN
  SELECT 
  tblcliente.id_cliente,
  tblcliente.nombre_cliente, 
  tblcliente.apellido1, 
  tblcliente.cedula,
  tblVehiculo.placa,
  tblfactura.total_sin_iv,
  tblfactura.total_pagar,
  tblfactura.fecha_factura,
  tblfactura. estado_factura,
  tblfactura.id_factura
  FROM factura_encabezado tblfactura
  INNER JOIN cliente tblcliente ON tblcliente.id_cliente = tblfactura.id_cliente_factura
  INNER JOIN vehiculos tblVehiculo on tblVehiculo.id_vehiculo = tblfactura.vehiculo_id
  

END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaListaMarca]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create date: <Create Date,,>
-- Description:	<Retorna Marca y fabricante>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaListaMarca]

@id_marca int = null,
@nombre_marca nvarchar (55),
@id_fabricante int = null

AS
BEGIN
	SELECT RTRIM(nombre_marca)AS nombre_marca , nombre_fabricante,b.id_fabricante, a.id_marca
	FROM marca_vehiculo	as a
	INNER JOIN fabricante as b ON b.id_fabricante = a.id_fabricante
	where id_marca =
	(case when @id_marca is null then id_marca else @id_marca end)
	and nombre_marca like
	(case when @nombre_marca is null then '%%' else '%'+@nombre_marca+'%' end)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaMarca_ID]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaMarca_ID]
	@id_marca int
AS
BEGIN
	SELECT a.id_marca,TRIM(a.nombre_marca)as nombre_marca, B.nombre_fabricante,b.id_fabricante
	FROM marca_vehiculo A
	INNER JOIN fabricante B ON B.id_fabricante = A.id_fabricante
	WHERE id_marca = @id_marca
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaModelo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Retorna Modelo>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaModelo]
	@nombre_modelo nvarchar(100),
	@id_fabricante int,
	@id_marca int
AS
BEGIN
SELECT 
TRIM(TBLMARCA.nombre_marca) as nombre_marca,
TRIM(TBLMODELO.nombre_modelo)as nombre_modelo,
TBLFABRICANTE.nombre_fabricante,
TBLFABRICANTE.id_fabricante,
TBLMODELO.id_modelo,
TBLMODELO.id_marca_modelo
FROM modelo_vehiculo TBLMODELO
INNER JOIN marca_vehiculo TBLMARCA ON TBLMARCA.id_marca = TBLMODELO.id_marca_modelo
INNER JOIN fabricante TBLFABRICANTE ON TBLFABRICANTE.id_fabricante = TBLMARCA.id_fabricante

WHERE TBLMARCA.id_marca =
			(CASE WHEN @id_marca IS NULL THEN TBLMARCA.id_marca ELSE @id_marca END) 
			AND TBLMARCA.nombre_marca LIKE
			(CASE WHEN @nombre_modelo IS NULL THEN '%%'ELSE '%'+@nombre_modelo+'%'END)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaModelo_ID]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Inserta nuevo Modelo>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaModelo_ID]
@id_modelo int
AS
BEGIN
	SELECT
	MV.id_modelo,
	MV.id_marca_modelo,
	MV.nombre_modelo,
	M.id_marca,
	M.nombre_marca,
	FB.id_fabricante,
	FB.nombre_fabricante
	FROM modelo_vehiculo AS MV
	INNER JOIN marca_vehiculo M ON MV.id_marca_modelo = M.id_marca
	INNER JOIN fabricante AS FB ON M.id_fabricante = FB.id_fabricante
	WHERE MV.id_modelo = @id_modelo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaPais]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Devuelve la lista de paises>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaPais]

@nombre varchar (80) = null

AS
BEGIN

	SELECT id_pais, TRIM (nombre_pais) AS nombre_pais FROM PAIS
	 WHERE nombre_pais LIKE 
		(CASE WHEN @nombre IS NULL THEN '%%'
		ELSE '%'+@nombre+'%'
		END)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaPais_ID]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Retorna_ID_Pais>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaPais_ID]
	
	@id_pais int
AS
BEGIN
	SELECT nombre_pais, id_pais
	FROM Pais
	WHERE id_pais = @id_pais
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaProvincias]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Cristopher Castillo>
-- Create date: <Abril 2018>
-- Description:	<Retorna los registros de la tabla de provincias tomando en cuenta la columna nombre>
-- =============================================

CREATE PROCEDURE [dbo].[sp_RetornaProvincias]
@nombre [varchar](50)= NULL
AS
	
SELECT  id_Provincia, nombre, usuarioCrea, fechaCrea, usuarioModifica, fechaModifica, vc_Estado
FROM Provincia
WHERE [nombre] like (case when @nombre is null then '%%' else '%'+@nombre+'%' end)

GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaTipoServicio_ID]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Retorna_tipoVehiculo_id>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaTipoServicio_ID]
	
	@id_tipo_servicio INT
AS
BEGIN
	SELECT id_servicio,nombre_servicio
	FROM 
	tipo_servicio WHERE id_servicio= @id_tipo_servicio
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaTipoVehiculo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create date: <Create Date,,>
-- Description:	<Retorna el tipo de vehículo>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaTipoVehiculo]
	-- Add the parameters for the stored procedure here
	@id_tipo_vehiculo int = null,
	@nombre_vehiculo nvarchar(55) = null
AS
BEGIN
	
   
	SELECT id_tipo_vehiculo, nombre_vehiculo
	FROM tipo_vehiculo
	where id_tipo_vehiculo =
	(case when @id_tipo_vehiculo is null then id_tipo_vehiculo else @id_tipo_vehiculo end)
	and nombre_vehiculo like
	(case when @nombre_vehiculo is null then '%%' else '%'+@nombre_vehiculo+'%' end)


END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaTipoVehiculo_ID]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create date: <Create Date,,>
-- Description:	<Retorna el tipo de vehículo_ID>
-- =============================================
Create PROCEDURE [dbo].[sp_RetornaTipoVehiculo_ID]
	-- Add the parameters for the stored procedure here
	@id_tipo_vehiculo int
AS
BEGIN
	
   
	SELECT id_tipo_vehiculo, nombre_vehiculo
	FROM tipo_vehiculo
	where id_tipo_vehiculo =@id_tipo_vehiculo


END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaVehiculo]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description:	<Retorna ID de Vehículo>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaVehiculo]

@id_vehiculo int

AS
BEGIN
	
	SELECT 
	v.id_vehiculo,
	v.placa,
	v.id_marca,
	TRIM(mv.nombre_marca)as nombre_marca,
	v.id_tipo_vehiculo,
	tpv.nombre_vehiculo,
	v.id_modelo_vehiculo,
	TRIM(modelv.nombre_modelo)as nombre_modelo,
	v.cantidad_puertas,
	v.cantidad_ruedas,
	v.año_fabricacion,
	v.id_fabricante_vehiculo,
	fab.nombre_fabricante
	
	FROM vehiculos as v
	INNER JOIN marca_vehiculo as mv on mv.id_marca = v.id_marca
	INNER JOIN modelo_vehiculo as modelv on modelv.id_modelo = v.id_modelo_vehiculo
	INNER JOIN fabricante as fab on fab.id_fabricante = v.id_fabricante_vehiculo
	INNER JOIN tipo_vehiculo as tpv on tpv.id_tipo_vehiculo = v.id_tipo_vehiculo

	WHERE id_vehiculo = 
	(CASE WHEN id_vehiculo IS NULL THEN @id_vehiculo ELSE id_vehiculo END)


END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaVehiculo_ID]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Retorna ID de Vehículo>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaVehiculo_ID]

@id_vehiculo int

AS
BEGIN
	
	SELECT 
	v.id_vehiculo,
	v.placa,
	v.id_marca,
	mv.nombre_marca,
	v.id_tipo_vehiculo,
	tpv.nombre_vehiculo,
	v.id_modelo_vehiculo,
	modelv.nombre_modelo,
	v.cantidad_puertas,
	v.cantidad_ruedas,
	v.año_fabricacion,
	v.id_fabricante_vehiculo,
	fab.nombre_fabricante
	
	FROM vehiculos as v
	INNER JOIN marca_vehiculo as mv on mv.id_marca = v.id_marca
	INNER JOIN modelo_vehiculo as modelv on modelv.id_modelo = v.id_modelo_vehiculo
	INNER JOIN fabricante as fab on fab.id_fabricante = v.id_fabricante_vehiculo
	INNER JOIN tipo_vehiculo as tpv on tpv.id_tipo_vehiculo = v.id_tipo_vehiculo

	WHERE id_vehiculo = @id_vehiculo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaVehiculosxCliente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Retorna Vehículos por cliente>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaVehiculosxCliente]
	@id_vehiculo_cliente int,
	@id_cliente int,
	@id_vehiculo int
AS
BEGIN
	SELECT 
	id_vehiculo_cliente,
	tblcliente.nombre_cliente,
	tblcliente.apellido1,
	tblcliente.apellido2,
	tblvehiculos.id_marca,
	TRIM(tblmarca.nombre_marca) as nombre_marca,
	tblvehiculos.id_modelo_vehiculo,
	TRIM(tblmodelo.nombre_modelo)as nombre_modelo,
	tblvehiculos.placa

	FROM vehiculos_x_cliente as tblvehiculoscliente
	INNER JOIN vehiculos AS tblvehiculos ON tblvehiculos.id_vehiculo = tblvehiculoscliente.id_vehiculo
	INNER JOIN cliente AS tblcliente on tblcliente.id_cliente = tblvehiculoscliente.id_cliente
	INNER JOIN marca_vehiculo AS tblmarca ON tblmarca.id_marca = tblvehiculos.id_marca
	INNER JOIN modelo_vehiculo AS tblmodelo ON tblmodelo.id_modelo = tblvehiculos.id_modelo_vehiculo
	WHERE id_vehiculo_cliente LIKE

	(CASE WHEN @id_vehiculo_cliente IS NULL THEN tblvehiculoscliente.id_vehiculo_cliente ELSE @id_vehiculo_cliente END)
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaVehiculosxClientebyIdCliente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description: <Retorna Vehículos por cliente>
-- =============================================
Create PROCEDURE [dbo].[sp_RetornaVehiculosxClientebyIdCliente]
 @id_cliente int
AS
BEGIN
 SELECT 
 tblvehiculos.id_vehiculo,
 tblvehiculos.placa

 FROM vehiculos_x_cliente as tblvehiculoscliente
 INNER JOIN vehiculos AS tblvehiculos ON tblvehiculos.id_vehiculo = tblvehiculoscliente.id_vehiculo
 INNER JOIN cliente AS tblcliente on tblcliente.id_cliente = tblvehiculoscliente.id_cliente
 WHERE tblcliente.id_cliente  = 3

 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_RetornaVehiculoxCliente_ID]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Retorna Vehiculo ID por cliente>
-- =============================================
CREATE PROCEDURE [dbo].[sp_RetornaVehiculoxCliente_ID]

	@id_vehiculo_cliente int
AS
BEGIN
	SELECT 
	tblvehiculoscliente.id_vehiculo_cliente,
	tblvehiculoscliente.id_vehiculo,
	tblcliente.nombre_cliente,
	tblcliente.apellido1,
	tblcliente.apellido2,
	tblvehiculos.id_marca,
	tblmarca.nombre_marca,
	tblvehiculos.id_modelo_vehiculo,
	tblmodelo.nombre_modelo,
	tblvehiculos.placa

	FROM vehiculos_x_cliente as tblvehiculoscliente
	INNER JOIN vehiculos AS tblvehiculos ON tblvehiculos.id_vehiculo = tblvehiculoscliente.id_vehiculo
	INNER JOIN cliente AS tblcliente on tblcliente.id_cliente = tblvehiculoscliente.id_cliente
	INNER JOIN marca_vehiculo AS tblmarca ON tblmarca.id_marca = tblvehiculos.id_marca
	INNER JOIN modelo_vehiculo AS tblmodelo ON tblmodelo.id_modelo = tblvehiculos.id_modelo_vehiculo
	WHERE id_vehiculo_cliente LIKE

	(CASE WHEN @id_vehiculo_cliente IS NULL THEN tblvehiculoscliente.id_vehiculo_cliente ELSE @id_vehiculo_cliente END)
END

GO
/****** Object:  StoredProcedure [dbo].[sp_UltimaCaja]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Description: < ultima caja >
-- =============================================
create PROCEDURE [dbo].[sp_UltimaCaja]
AS
BEGIN
 
 select top(1)id_caja as Id, hora_apertura, hora_cierre, id_usuario_cierre, id_usuario_apertura, monto_apertura, monto_cierre_total
 from caja_chica
 order by id_caja desc
END
GO
/****** Object:  StoredProcedure [dbo].[sp_update_parametro]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description: <Inserta parametros>
-- =============================================
Create PROCEDURE [dbo].[sp_update_parametro]

@Nombre nchar(50),
@correo_aperture nchar(50),
@correo_cierre nchar(50),
@monto_minimo float


AS
BEGIN
 UPDATE Parametros SET
 nombre=@Nombre,
 correo_apertura=@correo_aperture,
 correo_cierre = @correo_cierre,
 monto_minimo = @monto_minimo
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Veficia_Placa_Existente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Verifica placa>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Veficia_Placa_Existente]
	@placa int
AS
BEGIN
	SELECT COUNT(1)
	FROM 
	vehiculos
	WHERE placa = @placa
END
GO
/****** Object:  StoredProcedure [dbo].[sp_Verifica_Cliente_Existente]    Script Date: 27/8/2020 16:12:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Description:	<Verifica Cedula>
-- =============================================
CREATE PROCEDURE [dbo].[sp_Verifica_Cliente_Existente]
@cedula int
AS
BEGIN
	SELECT COUNT(1)
	FROM cliente
	WHERE cedula = @cedula
END
GO
USE [master]
GO
ALTER DATABASE [LavaCar] SET  READ_WRITE 
GO

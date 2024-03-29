USE [master]
GO
/****** Object:  Database [ConceptMaps]    Script Date: 11/4/2013 8:24:22 AM ******/
CREATE DATABASE [ConceptMaps]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConceptMaps', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ConceptMaps.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ConceptMaps_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\ConceptMaps_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ConceptMaps] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConceptMaps].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConceptMaps] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConceptMaps] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConceptMaps] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConceptMaps] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConceptMaps] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConceptMaps] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ConceptMaps] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ConceptMaps] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConceptMaps] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConceptMaps] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConceptMaps] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConceptMaps] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConceptMaps] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConceptMaps] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConceptMaps] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConceptMaps] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ConceptMaps] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConceptMaps] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConceptMaps] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConceptMaps] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConceptMaps] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConceptMaps] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConceptMaps] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConceptMaps] SET RECOVERY FULL 
GO
ALTER DATABASE [ConceptMaps] SET  MULTI_USER 
GO
ALTER DATABASE [ConceptMaps] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConceptMaps] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConceptMaps] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConceptMaps] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ConceptMaps', N'ON'
GO
USE [ConceptMaps]
GO
/****** Object:  Table [dbo].[ChildNodes]    Script Date: 11/4/2013 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChildNodes](
	[IdNode] [int] NOT NULL,
	[ChildNodes] [int] NOT NULL,
 CONSTRAINT [PK_ChildNodes] PRIMARY KEY CLUSTERED 
(
	[IdNode] ASC,
	[ChildNodes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Documents]    Script Date: 11/4/2013 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[IdBanDo] [int] NOT NULL,
	[IdTaiLieu] [int] NOT NULL,
	[TenTaiLieu] [nvarchar](50) NOT NULL,
	[Url] [nvarchar](200) NOT NULL,
	[Loai] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[IdBanDo] ASC,
	[IdTaiLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FavoriteMaps]    Script Date: 11/4/2013 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteMaps](
	[Id] [int] NOT NULL,
	[IdBanDo] [int] NOT NULL,
 CONSTRAINT [PK_FavoriteMaps] PRIMARY KEY CLUSTERED 
(
	[Id] ASC,
	[IdBanDo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Maps]    Script Date: 11/4/2013 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maps](
	[IdBanDo] [int] NOT NULL,
	[TenBanDo] [nvarchar](150) NOT NULL,
	[Loai] [int] NULL,
	[NguoiTao] [int] NOT NULL,
	[Diem] [int] NULL,
	[MoTa] [nvarchar](200) NULL,
	[ThoiGianTao] [datetime] NOT NULL,
 CONSTRAINT [PK_Maps] PRIMARY KEY CLUSTERED 
(
	[IdBanDo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MapType]    Script Date: 11/4/2013 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MapType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_MapType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Nodes]    Script Date: 11/4/2013 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nodes](
	[IdNode] [int] IDENTITY(1,1) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[MoTa] [nvarchar](200) NULL,
	[IdBanDo] [int] NOT NULL,
 CONSTRAINT [PK_Nodes] PRIMARY KEY CLUSTERED 
(
	[IdNode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/4/2013 8:24:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Password] [nvarchar](40) NOT NULL,
	[HoLot] [nvarchar](40) NOT NULL,
	[Ten] [nvarchar](20) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[SDT] [nvarchar](15) NULL,
	[CMND] [nvarchar](15) NULL,
	[DiaChi] [nvarchar](200) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ChildNodes]  WITH CHECK ADD  CONSTRAINT [FK_ChildNodes_Nodes] FOREIGN KEY([ChildNodes])
REFERENCES [dbo].[Nodes] ([IdNode])
GO
ALTER TABLE [dbo].[ChildNodes] CHECK CONSTRAINT [FK_ChildNodes_Nodes]
GO
ALTER TABLE [dbo].[ChildNodes]  WITH CHECK ADD  CONSTRAINT [FK_ChildNodes_Nodes1] FOREIGN KEY([IdNode])
REFERENCES [dbo].[Nodes] ([IdNode])
GO
ALTER TABLE [dbo].[ChildNodes] CHECK CONSTRAINT [FK_ChildNodes_Nodes1]
GO
ALTER TABLE [dbo].[Documents]  WITH CHECK ADD  CONSTRAINT [FK_Documents_Maps] FOREIGN KEY([IdBanDo])
REFERENCES [dbo].[Maps] ([IdBanDo])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_Maps]
GO
ALTER TABLE [dbo].[FavoriteMaps]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteMaps_Maps] FOREIGN KEY([IdBanDo])
REFERENCES [dbo].[Maps] ([IdBanDo])
GO
ALTER TABLE [dbo].[FavoriteMaps] CHECK CONSTRAINT [FK_FavoriteMaps_Maps]
GO
ALTER TABLE [dbo].[FavoriteMaps]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteMaps_Users] FOREIGN KEY([Id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[FavoriteMaps] CHECK CONSTRAINT [FK_FavoriteMaps_Users]
GO
ALTER TABLE [dbo].[Maps]  WITH CHECK ADD  CONSTRAINT [FK_Maps_MapType] FOREIGN KEY([Loai])
REFERENCES [dbo].[MapType] ([Id])
GO
ALTER TABLE [dbo].[Maps] CHECK CONSTRAINT [FK_Maps_MapType]
GO
ALTER TABLE [dbo].[Maps]  WITH CHECK ADD  CONSTRAINT [FK_Maps_Users] FOREIGN KEY([NguoiTao])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Maps] CHECK CONSTRAINT [FK_Maps_Users]
GO
ALTER TABLE [dbo].[Nodes]  WITH CHECK ADD  CONSTRAINT [FK_Nodes_Maps] FOREIGN KEY([IdBanDo])
REFERENCES [dbo].[Maps] ([IdBanDo])
GO
ALTER TABLE [dbo].[Nodes] CHECK CONSTRAINT [FK_Nodes_Maps]
GO
USE [master]
GO
ALTER DATABASE [ConceptMaps] SET  READ_WRITE 
GO

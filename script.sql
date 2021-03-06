USE [master]
GO
/****** Object:  Database [ETicaret]    Script Date: 25.11.2021 12:10:57 ******/
CREATE DATABASE [ETicaret]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ETicaret', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ETicaret.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ETicaret_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ETicaret_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ETicaret] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ETicaret].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ETicaret] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ETicaret] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ETicaret] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ETicaret] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ETicaret] SET ARITHABORT OFF 
GO
ALTER DATABASE [ETicaret] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ETicaret] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ETicaret] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ETicaret] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ETicaret] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ETicaret] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ETicaret] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ETicaret] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ETicaret] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ETicaret] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ETicaret] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ETicaret] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ETicaret] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ETicaret] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ETicaret] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ETicaret] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ETicaret] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ETicaret] SET RECOVERY FULL 
GO
ALTER DATABASE [ETicaret] SET  MULTI_USER 
GO
ALTER DATABASE [ETicaret] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ETicaret] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ETicaret] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ETicaret] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ETicaret] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ETicaret', N'ON'
GO
USE [ETicaret]
GO
/****** Object:  Table [dbo].[Calisanlar]    Script Date: 25.11.2021 12:10:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calisanlar](
	[CalisanId] [int] IDENTITY(1,1) NOT NULL,
	[Soyad] [nchar](50) NOT NULL,
	[Telefon] [nchar](10) NULL,
	[EklenmeTarihi] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kargocular]    Script Date: 25.11.2021 12:10:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kargocular](
	[KargoId] [int] NOT NULL,
	[FirmaAdi] [nchar](50) NOT NULL,
	[Telefon] [nchar](11) NULL,
 CONSTRAINT [PK_Kargocular] PRIMARY KEY CLUSTERED 
(
	[KargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Kategoriler]    Script Date: 25.11.2021 12:10:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategoriler](
	[KategoriID] [int] IDENTITY(1,1) NOT NULL,
	[KategoriAdi] [nvarchar](25) NOT NULL,
	[Aciklama] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[KategoriID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Siparis Detaylari]    Script Date: 25.11.2021 12:10:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparis Detaylari](
	[SiparisId] [int] NOT NULL,
	[UrunId] [int] NOT NULL,
	[Fiyat] [decimal](6, 2) NOT NULL,
	[Adet] [int] NOT NULL,
 CONSTRAINT [PK_SiparisDetaylari] PRIMARY KEY CLUSTERED 
(
	[SiparisId] ASC,
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Siparisler]    Script Date: 25.11.2021 12:10:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Siparisler](
	[SiparisId] [int] IDENTITY(1,1) NOT NULL,
	[Tarih] [datetime] NOT NULL,
	[CalisanId] [int] NULL,
	[KargoId] [int] NOT NULL,
 CONSTRAINT [PK__Siparisl__C3F03BFD67DE279D] PRIMARY KEY CLUSTERED 
(
	[SiparisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tedarikciler]    Script Date: 25.11.2021 12:10:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tedarikciler](
	[TedarikciID] [int] IDENTITY(1,1) NOT NULL,
	[FirmaAdi] [nvarchar](50) NOT NULL,
	[Telefon] [char](11) NULL,
	[olusturmaZamani] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TedarikciID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[URUNLER]    Script Date: 25.11.2021 12:10:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[URUNLER](
	[UrunId] [int] IDENTITY(1,1) NOT NULL,
	[UrunAdi] [nvarchar](50) NOT NULL,
	[Fiyat] [decimal](6, 2) NOT NULL,
	[KategoriId] [int] NOT NULL,
	[TedarikciId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UrunId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Index [UK_Kargocular_FirmaAdi]    Script Date: 25.11.2021 12:10:58 ******/
ALTER TABLE [dbo].[Kargocular] ADD  CONSTRAINT [UK_Kargocular_FirmaAdi] UNIQUE NONCLUSTERED 
(
	[KargoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ_UNIQUE]    Script Date: 25.11.2021 12:10:58 ******/
ALTER TABLE [dbo].[Tedarikciler] ADD  CONSTRAINT [UQ_UNIQUE] UNIQUE NONCLUSTERED 
(
	[FirmaAdi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Siparis Detaylari] ADD  DEFAULT ((1)) FOR [Adet]
GO
ALTER TABLE [dbo].[Tedarikciler] ADD  DEFAULT (getdate()) FOR [olusturmaZamani]
GO
ALTER TABLE [dbo].[Siparis Detaylari]  WITH CHECK ADD  CONSTRAINT [FK_SiparisId] FOREIGN KEY([SiparisId])
REFERENCES [dbo].[Siparisler] ([SiparisId])
GO
ALTER TABLE [dbo].[Siparis Detaylari] CHECK CONSTRAINT [FK_SiparisId]
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_Siparisler_Kargocular] FOREIGN KEY([KargoId])
REFERENCES [dbo].[Kargocular] ([KargoId])
GO
ALTER TABLE [dbo].[Siparisler] CHECK CONSTRAINT [FK_Siparisler_Kargocular]
GO
ALTER TABLE [dbo].[Siparisler]  WITH CHECK ADD  CONSTRAINT [FK_Siparisler_Siparisler_Calisan] FOREIGN KEY([SiparisId])
REFERENCES [dbo].[Siparisler] ([SiparisId])
GO
ALTER TABLE [dbo].[Siparisler] CHECK CONSTRAINT [FK_Siparisler_Siparisler_Calisan]
GO
ALTER TABLE [dbo].[URUNLER]  WITH CHECK ADD FOREIGN KEY([KategoriId])
REFERENCES [dbo].[Kategoriler] ([KategoriID])
GO
ALTER TABLE [dbo].[URUNLER]  WITH CHECK ADD FOREIGN KEY([TedarikciId])
REFERENCES [dbo].[Tedarikciler] ([TedarikciID])
GO
ALTER TABLE [dbo].[Siparis Detaylari]  WITH CHECK ADD CHECK  (([Fiyat]>(0)))
GO
ALTER TABLE [dbo].[URUNLER]  WITH CHECK ADD CHECK  (([Fiyat]>(0)))
GO
USE [master]
GO
ALTER DATABASE [ETicaret] SET  READ_WRITE 
GO

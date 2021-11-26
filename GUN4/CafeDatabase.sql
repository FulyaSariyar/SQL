USE master
GO
CREATE DATABASE CAFE
GO

USE CAFE
GO

CREATE TABLE KafeBilgi(

       KafeBilgiID INT IDENTITY PRIMARY KEY, 
	   KafeLogo varbinary(MAX),
	   KafeAdi nvarchar(50) NOT NULL,

)
CREATE TABLE Kat(

       KatID INT IDENTITY PRIMARY KEY,
	   KatAdi nvarchar(50) NOT NULL,
	   KatSira int NOT NULL,
	   KatKod nvarchar(50) NOT NULL,

)
CREATE TABLE Kategori(

       KategoriID INT IDENTITY PRIMARY KEY,
	   KategoriAdi nvarchar(100) NOT NULL,
	   Aciklama nvarchar(200),
	   KategoriResim varbinary(MAX),

)
CREATE TABLE Masa(

       MasaID INT IDENTITY PRIMARY KEY,
	   MasaAdi nvarchar(50) NOT NULL,
	   MasaSira int NOT NULL,
	   MasaDurum int Not null,
)
CREATE TABLE Siparis(

       SiparisID INT IDENTITY PRIMARY KEY,
	   SiparisFiyat decimal (6,2)NOT NULL,
	   SiparisAdet int NOT NULL,
	   SiparisAraToplam decimal (6,2) NOT NULL
)

CREATE TABLE Urunler(

       UrunID INT IDENTITY PRIMARY KEY, 
	   UrunAdi nvarchar(50) NOT NULL,
	   UrunFiyat decimal (6,2)NOT NULL,
	   UrunResim varbinary(MAX)
)
 





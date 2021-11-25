USE master --TUM DATABESE TANIMLAMALARDA USE MASTER'A GECMELIYIZ.
GO
CREATE DATABASE ETicaret
GO

USE ETicaret --SAKIN UNUTMA!
GO

CREATE TABLE Kategoriler(

       KategoriID INT IDENTITY PRIMARY KEY, --primaryKey oldugu icin not null olur.
	   KategoriAdi nvarchar(25) NOT NULL,
	   Aciklama nvarchar(200) --default olarak yazmazsak null olur.

)
go
CREATE TABLE URUNLER(
        UrunId INT IDENTITY PRIMARY KEY,
		UrunAdi nvarchar(50) NOT NULL,
		Fiyat decimal (6,2)NOT NULL,
		KategoriId int foreign key references Kategoriler(KategoriId) NOT NULL 
)
GO
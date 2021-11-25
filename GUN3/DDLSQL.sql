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
ALTER TABLE Urunler
ADD CHECK (Fiyat>0);
go

CREATE TABLE Tedarikciler(
        TedarikciID int identity(1,1) PRIMARY KEY,
		FirmaAdi nvarchar(50) not null,
		Telefon char(11),
		olusturmaZamani datetime not null default (getdate())

)



ALTER TABLE Urunler
ADD  TedarikciId int  foreign key references Tedarikciler(TedarikciId)-- tablo dolu olsaydi not null sikinti verirdi.null olmalidir.daha sonra default bir deger atayabiliriz.

ALTER TABLE Tedarikciler
ADD CONSTRAINT UQ_UNIQUE UNIQUE (FirmaAdi)



CREATE TABLE Siparisler(
	SiparisId int identity Primary Key,
	Tarih datetime not null,
)
go
CREATE TABLE[Siparis Detaylari] (
	SiparisId int not null,
	UrunId int not null,
	Fiyat decimal(6,2) not null Check(Fiyat>0),
	Adet int not null default(1),
	CONSTRAINT PK_SiparisDetaylari PRIMARY KEY (SiparisId,UrunId),
	CONSTRAINT FK_UrunId FOREIGN KEY (UrunId) REFERENCES Urunler(UrunId),
	CONSTRAINT FK_SiparisId FOREIGN KEY (SiparisId) REFERENCES Siparisler(SiparisId),

) 

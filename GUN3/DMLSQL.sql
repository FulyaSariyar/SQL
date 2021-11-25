--DML
--INSERT INTO
--DELETE
--UPDATE
INSERT INTO Kategoriler(KategoriAdi,Aciklama)
VALUES('ICECEKLER','SICAK & SOGUK ICECEKLER')
INSERT INTO Kategoriler(KategoriAdi,Aciklama)
VALUES('DENIZ URUNLERI','SICAK & SOGUK DENIZ URUNLERI')
INSERT INTO Kategoriler(KategoriAdi,Aciklama)
VALUES('ELEKTRONIK','SICAK & SOGUK ELEKTRONIK URUNLER')

use master
go
insert into ETicaret.dbo.Kategoriler (KategoriAdi,Aciklama)--dbo semadir.
select CategoryName,[Description]from Northwind.dbo.Categories 

use ETicaret
go

use Northwind
DELETE from Products

use ETicaret
go

SELECT * FROM Kategoriler --ILK ONCE BUL DELETE YORUM SATIRI KALSIN.
--DELETE FROM Kategoriler
WHERE KategoriID=8


SELECT * FROM Kategoriler --SONRA SIL.
DELETE FROM Kategoriler
WHERE KategoriID=8

SELECT* FROM Kategoriler
--UPDATE Kategoriler 
--SET Aciklama='SICAK SOGUK ICECEKLER'
WHERE KategoriID=4
 




use ETicaret

declare @kid int 
select @kid=KategoriId from Kategoriler
where KategoriAdi='ICECEKLER'

insert into URUNLER (UrunAdi,Fiyat,KategoriId,TedarikciId)
values ('Chai',18,4,Null)


SELECT * FROM URUNLER

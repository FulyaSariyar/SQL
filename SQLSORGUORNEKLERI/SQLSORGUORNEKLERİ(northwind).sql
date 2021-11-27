--SQL Sorgu Ornekleri 
--Customers tablosunda bulunan tum sutunlari listeleyiniz.
use Northwind

go

SELECT *
FROM Customers


--Customers tablosunda bulunan ContactName ve City sutunlarini listeleyiniz.
SELECT ContactName, City
FROM Customers

--Customers tablosundaki City sutununda yer alan sehirleri tekrar etmeyecek sekilde listeleyiniz.
SELECT DISTINCT City, ContactName
FROM Customers

--Employess tablosunda bulunan sehri seattle olan calisanlari listeleyiniz.
SELECT City,FirstName,LastName
FROM Employees
WHERE City='SEATTLE'

--SQL AND OR KULLANIMI
--Customers tablosunda bulunan sehri strasbourg ve london olanlari listeleyiniz.
SELECT ContactName
FROM Customers
WHERE City='Strasbourg ' OR City='London'

--Customers tablosunda bulunan ulkesi France olan ve sehri lille olanlari listeleyiniz.
SELECT ContactName
FROM Customers
WHERE Country='France' AND City='Lille'

--Tedarikciler tablosunda bulunan ulkesi USA olan sehri New Orleans veya Boston olanlari listeleyiniz.
SELECT ContactName
FROM Suppliers
WHERE Country='USA' AND(City='New Orleans' OR City='Boston')

--SQL ORDER BY KULLANIMI
--Order by default olarak artan düzeyde kayitlari siralar. Azalan düzeyde siralamak icin Desc kullanilir.
--Urunleri IDlerine göre artan ve azalan sekilde listeleyiniz.
--Artan
SELECT ProductName
FROM Products
ORDER BY ProductID

--Azalan
SELECT ProductName
FROM Products
ORDER BY ProductID DESC

--SQL INSERT INTO KULLANIMI
--Kayit eklemek icin kullanilir.

--Shippers tablosuna bir kayýt ekleyelim.
INSERT INTO Shippers (CompanyName,Phone)
VALUES ('Fulya Sarýyar','501 556-97-32')
SELECT * -- ekledigimiz kaydi göremek icin listeleyelim.
FROM Shippers

--Update kayitlar üzerinde degisiklik yapmak icin kullanilir. Bir onceki ornekde ekledýgýmýz kaydýn soyad kýsmini güncelleyelim.
UPDATE Shippers
SET CompanyName='Fulya Sarýyar Abdullah'
WHERE CompanyName='Fulya Sarýyar'
SELECT*-- Guncelledigimiz kayddin yeni degerini görmek icin listeleyelim.
FROM Shippers

--Delete kullanimi.
--Ekledigimiz kaydi tablodan silelim.
DELETE FROM Shippers
WHERE CompanyName='Fulya Sarýyar Abdullah'
SELECT* --Silindigini görmek icin listeleyiniz.
FROM Shippers

--Select Top kullanimi
--Employees tablosunda ilk 5 kaydi listeleyiniz.
SELECT TOP 5*
FROM Employees

--SQL Like Kullanimi
--Customers tablosunda bulunan CompanyName'i B ile baslayanlari listeleyiniz.
 SELECT *
 FROM Customers
 WHERE CompanyName LIKE 'B%'

--Customers tablosunda bulunan CompanyName'i B ile bitenleri listeleyiniz.
 SELECT *
 FROM Customers
 WHERE CompanyName LIKE '%B'

--Customers tablosunda bulunan ContactName icerisinde 'ton' bulunanlari listeleyiniz.
SELECT *
FROM Customers
WHERE ContactName LIKE '%TON%'


--SQL IN KULLANIMI
--Suppliers tablosunda city London ve Tokyo olan kayitlari listeleyiniz.
SELECT *
FROM Suppliers
WHERE City IN ('London', 'Tokyo')

--SQL BETWEEN KULLANÝMÝ(Sayi metin yada tarih araliði verilebilir.)
--Siparis tablosunda EmployeeID 3 ve 6 arasinda olanlari listeleyiniz.
SELECT *
FROM Orders
WHERE EmployeeID BETWEEN 3 AND 6 --3 ve 6 dahildir.

--Siparis tablosunda OrderDate '1996.07.04' ve '1998.04.27' arasinda olanlari listeleyiniz.
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '1996.07.04' AND '1998.04.27' 

--SQL AS KULLANIMI
--Customer tablosunda bulunan ContactName sutununa gecici bir ad veriniz.
SELECT ContactName AS Ad
FROM Customers
 

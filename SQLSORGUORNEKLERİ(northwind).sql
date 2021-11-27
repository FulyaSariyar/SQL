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
--Order by default olarak artan d�zeyde kayitlari siralar. Azalan d�zeyde siralamak icin Desc kullanilir.
--Urunleri IDlerine g�re artan ve azalan sekilde listeleyiniz.
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

--Shippers tablosuna bir kay�t ekleyelim.
INSERT INTO Shippers (CompanyName,Phone)
VALUES ('Fulya Sar�yar','501 556-97-32')
SELECT * -- ekledigimiz kaydi g�remek icin listeleyelim.
FROM Shippers

--Update kayitlar �zerinde degisiklik yapmak icin kullanilir. Bir onceki ornekde ekled�g�m�z kayd�n soyad k�smini g�ncelleyelim.
UPDATE Shippers
SET CompanyName='Fulya Sar�yar Abdullah'
WHERE CompanyName='Fulya Sar�yar'
SELECT*-- Guncelledigimiz kayddin yeni degerini g�rmek icin listeleyelim.
FROM Shippers

--Delete kullanimi.
--Ekledigimiz kaydi tablodan silelim.
DELETE FROM Shippers
WHERE CompanyName='Fulya Sar�yar Abdullah'
SELECT* --Silindigini g�rmek icin listeleyiniz.
FROM Shippers



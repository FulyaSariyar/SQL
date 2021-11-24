SELECT C.CategoryName,COUNT(0) ADET
FROM Products P
JOIN Categories C ON P.CategoryID=C.CategoryID
GROUP BY  C.CategoryName 
ORDER BY ADET DESC



SELECT C.CategoryName,SUM(P.UnitPrice*UnitsInStock) MALIYET
FROM Products P
JOIN Categories C ON P.CategoryID=C.CategoryID
WHERE P.UnitsInStock>0
GROUP BY  C.CategoryName 
HAVING SUM(P.UnitPrice*UnitsInStock)>10000
ORDER BY MALIYET DESC


SELECT COUNT(0)
FROM [Order Details] OD
HAVING COUNT(0)>100


SELECT C.CategoryName,S.CompanyName,SUM(P.UnitPrice*P.UnitsInStock) MALIYET
FROM Products P
JOIN Categories C ON P.CategoryID=C.CategoryID
JOIN Suppliers S ON S.SupplierID=P.SupplierID
--WHERE P.UnitsInStock>0
GROUP BY  C.CategoryName,S.CompanyName
HAVING SUM(P.UnitPrice*UnitsInStock)>3000
ORDER BY C.CategoryName 



--SÝPARÝÞLERÝ SÝPARÝÞ NUMARASI VE SÝPARÝÞ TOPLAM TUTARI OLARAK LÝSTELEYÝ
SELECT OrderID,ROUND(SUM((1-Discount)*UnitPrice*Quantity),2) Tutar
FROM [Order Details]
GROUP BY OrderID


--HANGÝ ÜRÜNDEN NE KADARLIK SÝPARÝÞ EDÝLMÝÞ.
SELECT P.ProductName,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Products P ON P.ProductID = OD.ProductID
GROUP BY P.ProductName
ORDER BY Tutar DESC

--HANGÝ TEDARÝKCÝDEN NE KADARLIK SÝPARÝÞ YAPILMIÞ.
SELECT S.CompanyName,P.ProductName,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Products P ON P.ProductID = OD.ProductID
JOIN Suppliers S ON S.SupplierID = P.SupplierID
GROUP BY S.CompanyName,P.ProductName
ORDER BY S.CompanyName



--HANGÝ MÜÞTERÝDEN NE KADARLIK SÝPARÝÞ ALINMIÞ
SELECT C.CompanyName,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Orders O ON O.OrderID = OD.OrderID
JOIN Customers C ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName
ORDER BY Tutar DESC

--HANGÝ ÇALIÞANIM NE KADARLIK ÜRÜN SÝPARÝÞ ETMÝÞ.
SELECT E.FirstName+' '+E.LastName AS CALISAN,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM [Order Details] OD
JOIN Orders O ON O.OrderID = OD.OrderID
JOIN Employees E ON E.EmployeeID= O.EmployeeID
GROUP BY E.FirstName,E.LastName
ORDER BY Tutar DESC



--HANGÝ ÜRÜNDEN NE KADARLIK SÝPARÝÞ EDÝLMÝÞ.(YILLARA GÖRE GRUPLAYINIZ)
SELECT P.ProductName,YEAR(O.OrderDate) YIL,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) TUTAR
FROM Products P
JOIN [Order Details] OD ON P.ProductID=OD.ProductID
JOIN Orders O ON OD.OrderID=O.OrderID
GROUP BY P.ProductName,YEAR(O.OrderDate)
ORDER BY P.ProductName ASC, YEAR(O.OrderDate) ASC 


--HANGÝ ÜRÜNDEN NE KADARLIK SÝPARÝÞ EDÝLMÝÞ.(AYLARA GÖRE GRUPLAYINIZ.)
SELECT P.ProductName,MONTH(OrderDate) AY,ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) TUTAR
FROM Products P
JOIN [Order Details] OD ON P.ProductID=OD.ProductID
JOIN Orders O ON OD.OrderID=O.OrderID
GROUP BY P.ProductName,MONTH(O.OrderDate)
ORDER BY P.ProductName ASC,MONTH(O.OrderDate)


--ORTALAMA FÝYATIN ÜSTÜNDE SATTIÐIM ÜRÜNLERÝN LÝSTESÝNÝ GETÝRÝN.
SELECT ProductName,UnitPrice
FROM Products
WHERE UnitPrice > (
	SELECT AVG(P.UnitPrice) Ortalama
	FROM Products P 
)
ORDER BY UnitPrice

--HANGÝ MUSTERILERIM ORTALAMA SIPARISIN USTUNDE VERMIS VE NE KADARLIK SIPARIS VERMISLER 
SELECT C.CompanyName,SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity) TUTAR
FROM Orders O 
JOIN [Order Details] OD ON OD.OrderID = O.OrderID
JOIN Customers C ON C.CustomerID = O.CustomerID
WHERE (1-OD.Discount)*OD.UnitPrice*OD.Quantity>
(
	SELECT AVG((1-OD.Discount)*OD.UnitPrice*OD.Quantity) TUTAR
	FROM [Order Details] OD
)
GROUP BY C.CompanyName
ORDER BY TUTAR DESC
-- adet olarak
SELECT TOP 5 C.CompanyName,COUNT(0) ADET
FROM Orders O 
JOIN Customers C ON C.CustomerID = O.CustomerID
GROUP BY C.CompanyName
HAVING COUNT(0) <
(
	SELECT AVG(SANAL.ADET) ORT
	FROM 
	(
		SELECT O2.CustomerID,COUNT(0) ADET
		FROM Orders O2
		GROUP BY O2.CustomerID
	) AS SANAL
)
ORDER BY ADET ASC


--HENUZ ULASMAMIS SIPARISLERIN TOPLAM MAALIYETI NEDIR 
SELECT ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) Tutar
FROM Orders O
JOIN [Order Details] OD ON OD.OrderID = O.OrderID
WHERE O.ShippedDate IS NULL


--HENUZ ULASMAMIZ URUNLER ORTALAMA KAC GUNDUR BEKLEMEKTE
SELECT AVG(DATEDIFF(DAY,RequiredDate,GETDATE())) "Ortalama Bekleme"
FROM Orders O
WHERE O.ShippedDate IS NULL 


--ORTALAMA TESLIM ZAMANIMIZ (GUN)
SELECT AVG(DATEDIFF(DAY,O.OrderDate,O.ShippedDate)) "Ortalama Bekleme"
FROM Orders O
WHERE O.ShippedDate IS NOT NULL


--SIPARIS VERÝLEN ULKELERIN LISTESI(AYNI ULKE IKI KERE GOSTERILMEYECEK)
SELECT DISTINCT ShipCountry  
FROM Orders

--HENÜZ SIPARIS VERMEMIS MUSTERILER





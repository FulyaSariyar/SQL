USE [Northwind]
GO

/****** Object:  View [dbo].[VW_URUNSIPARIS]    Script Date: 25.11.2021 09:28:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[VW_URUNSIPARIS]
AS
SELECT P.ProductName,CAST(ROUND(SUM((1-OD.Discount)*OD.UnitPrice*OD.Quantity),2) AS decimal (15,3))Tutar --SELECT TOP100  ...
FROM [Order Details] OD
JOIN Products P ON P.ProductID = OD.ProductID
GROUP BY P.ProductName
GO



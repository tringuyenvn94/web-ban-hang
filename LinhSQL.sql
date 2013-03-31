USE Sales_Geleral
GO
CREATE PROC SP_GetList_Customer_ByName
	@Name NVARCHAR(50)
AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM Customer WHERE Name LIKE @Name+N'%'

---------------------------------------
GO
CREATE PROC SP_GetList_Bill_ByDate
	@Date_From DATETIME,@Date_To DATETIME
AS
	SELECT ROW_NUMBER() OVER (Order by b.ID) as STT,b.ID,c.ID AS CustomerID,c.Name,c.Address AS Address,c.Phone AS Phone,c.Email AS Email,c.Gender AS Gender,Date_Purcharse,TotalQuantity,TotalMoney,t.Title_Info AS Title_Info,Status_Payment 
	FROM Customer c INNER JOIN Bill b
	ON c.ID = b.Customer_ID
	INNER JOIN Type_Payment t
	ON b.Type_Payment_ID = t.ID
	WHERE b.Date_Purcharse BETWEEN '2013/03/01' AND '2013/03/09'
	@Date_From AND @Date_To
--------------------------------------------------
-- Sua Proc
DROP PROC SP_GetList_Product
GO
CREATE PROC SP_GetList_Product
AS
	SELECT ROW_NUMBER() OVER (Order by ID DESC) as STT,* FROM Product ORDER BY ID DESC
--------------------------------------------------
-- Sua Proc
--Search By Category Name Product
DROP PROC SP_Get_ProductByCategory
GO
CREATE PROC SP_Get_ProductByCategory
	@Category_ID INT
AS
	SELECT ROW_NUMBER() OVER (Order by ID DESC) as STT,* FROM Product WHERE Category_ID = @Category_ID ORDER BY ID DESC

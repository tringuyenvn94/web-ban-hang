USE MASTER
GO
IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Sales_Geleral')
    DROP DATABASE Sales_Geleral
GO
CREATE DATABASE Sales_Geleral
GO
USE Sales_Geleral
DROP DATABASE Sales_Geleral
---------------------------ADMIN-----------------------------
GO
CREATE TABLE Admin
(
	ID INT IDENTITY PRIMARY KEY,
	UseName NVARCHAR(50) NOT NULL,
	Password NVARCHAR(200) NOT NULL
)
INSERT INTO Admin VALUES(N'admin',N'admin')
INSERT INTO Admin VALUES(N'admin1',N'admin1')
GO
CREATE PROC SP_GetList_Admin
AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM Admin
GO
CREATE PROC SP_Insert_Admin
	@UseName NVARCHAR(200),@Password NVARCHAR(200),@ID INT OUTPUT
AS
	INSERT INTO Admin VALUES(@UseName,@Password)
	SET @ID =@@identity
GO
CREATE PROC SP_Update_Admin
	@UseName NVARCHAR(200),@Password NVARCHAR(200),@ID INT
AS
	UPDATE Admin SET UseName=@UseName,Password = @Password
	WHERE ID=@ID
GO
CREATE PROC SP_Delete_Admin
	@ID INT 
AS
	DELETE FROM Admin WHERE ID =@ID

---------------------------Customer-----------------------------
GO
-- 0 is : Nu,1 is : Nam
CREATE TABLE Customer
(
	ID INT IDENTITY PRIMARY KEY,
	UseName NVARCHAR(50) NOT NULL,
	Password NVARCHAR(200) NOT NULL,
	Name NVARCHAR(50),
	Gender BIT,
	Phone NVARCHAR(20) NOT NULL,
	Address NVARCHAR(100),
	Email NVARCHAR(200) UNIQUE NOT NULL
)
INSERT INTO Customer VALUES(N'linh',N'linh',N'Nguyễn Nhất Linh',0,'01288-408-494',N'Số nhà 21,khu tập thể huyện Thanh Tri-Văn Điển-HN',N'panasonic_hero@yahoo.com')
INSERT INTO Customer VALUES(N'cuong',N'cuong',N'Nguyễn Văn Cường',1,'0965-435-677',N'Làng sinh viên Hasinco',N'cuongnv_c00541@yahoo.com')
GO
CREATE PROC SP_GetList_Customer
AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM Customer
GO
CREATE PROC SP_Insert_Customer
	@UseName NVARCHAR(50),@Password NVARCHAR(200),@Name NVARCHAR(50),@Gender BIT,@Phone NVARCHAR(20),@Address NVARCHAR(100),@Email NVARCHAR(500),@ID INT OUTPUT 
AS
	INSERT INTO Customer VALUES(@UseName,@Password,@Name,@Gender,@Phone,@Address,@Email)
	SET @ID =@@identity
GO
CREATE PROC SP_Update_Customer
	@UseName NVARCHAR(50),@Password NVARCHAR(200),@Name NVARCHAR(50),@Gender BIT,@Phone NVARCHAR(20),@Address NVARCHAR(100),@Email NVARCHAR(500),@ID INT
AS
	UPDATE Customer SET UseName=@UseName,Password = @Password,Name=@Name,Gender=@Gender,Phone=@Phone,Address=@Address,Email=@Email
	WHERE ID=@ID
GO
CREATE PROC SP_Delete_Customer
	@ID INT 
AS
	DELETE FROM Customer WHERE ID =@ID
--delete Bill when delete Customer
GO
CREATE PROC SP_DeleteBillWhenDeleteCustomer
	@ID INT 
AS
	DELETE FROM Bill WHERE Customer_ID = @ID
--delete ShopCart when delete Bill
GO
CREATE PROC SP_DeleteShoppingCartWhenDeleteBill
	@ID INT 
AS
	DELETE FROM ShoppingCart WHERE Bill_ID IN (SELECT ID FROM Bill WHERE Customer_ID = @ID)

---------------------------Categories-----------------------------
GO
CREATE TABLE Category
(
	ID INT IDENTITY PRIMARY KEY,
	Category_Name NVARCHAR(200) NOT NULL,
)
INSERT INTO Category VALUES(N'CÔNG NGHỆ')
INSERT INTO Category VALUES(N'THỜI TRANG')
INSERT INTO Category VALUES(N'CÔNG NGHỆ')
INSERT INTO Category VALUES(N'LÀM ĐẸP')
INSERT INTO Category VALUES(N'GIA DỤNG')
INSERT INTO Category VALUES(N'KHÁC')
GO
CREATE PROC SP_GetList_Category
AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM Category
GO
CREATE PROC SP_Insert_Category
	@Category_Name NVARCHAR(200),@ID INT OUTPUT
AS
	INSERT INTO Category VALUES(@Category_Name)
	SET @ID =@@identity
GO
CREATE PROC SP_Update_Category
	@Category_Name NVARCHAR(200),@ID INT
AS
	UPDATE Category SET Category_Name=@Category_Name
	WHERE ID=@ID
GO
CREATE PROC SP_Delete_Category
	@ID INT 
AS
	DELETE FROM Category WHERE ID =@ID
GO
--Delete Product When Delete Category
CREATE PROC SP_Delete_Product_WhenDeleteCategory
	@Category_ID INT
AS
	DELETE FROM Product WHERE Category_ID = @Category_ID

---------------------------Product-----------------------------
-- 0 is : HOT, 1 is : NEW, 2 is : Normal
GO
CREATE TABLE Product
(
	ID INT IDENTITY PRIMARY KEY,
	Category_ID INT FOREIGN KEY REFERENCES Category(ID),
	Name NVARCHAR(200) UNIQUE NOT NULL,
	Product_Code NVARCHAR(100) NOT NULL,
	Price_Original FLOAT,
	Price_Sale FLOAT,
	Price_Discount INT,
	Quantity_In INT,
	Quantity_Bought INT,
	Image NVARCHAR(500),
	Description NVARCHAR(500),
	Details NTEXT,
	TYPE INT
)
INSERT INTO Product VALUES(1,N'Áo Thu 1',N'A1',100,50,50,10,2,N'image1.jpg',N'Description 1',N'Details 1',0)
INSERT INTO Product VALUES(1,N'Áo Thu 2',N'A2',200,100,50,11,3,N'image2.jpg',N'Description 2',N'Details 2',1)
INSERT INTO Product VALUES(1,N'Áo Thu 3',N'A3',300,150,50,12,3,N'image3.jpg',N'Description 3',N'Details 3',2)

INSERT INTO Product VALUES(2,N'Chuột Game 1',N'C1',100,50,50,13,4,N'image4.jpg',N'Description 4',N'Details 4',0)
INSERT INTO Product VALUES(2,N'Chuột Game 2',N'C2',200,100,50,14,5,N'image5.jpg',N'Description 5',N'Details 5',1)
INSERT INTO Product VALUES(2,N'Chuột Game 3',N'C3',300,150,50,15,5,N'image6.jpg',N'Description 6',N'Details 6',2)

INSERT INTO Product VALUES(3,N'Sữa tắm 1',N'S1',100,50,50,16,6,N'image7.jpg',N'Description 7',N'Details 7',0)
INSERT INTO Product VALUES(3,N'Sữa tắm 2',N'S1',200,100,50,17,7,N'image8.jpg',N'Description 8',N'Details 8',1)
INSERT INTO Product VALUES(3,N'Sữa tắm 3',N'A3',300,150,50,18,3,N'image9.jpg',N'Description 9',N'Details 9',2)

INSERT INTO Product VALUES(4,N'Máy sấy 1',N'M1',100,50,50,19,8,N'image10.jpg',N'Description 10',N'Details 10',0)
INSERT INTO Product VALUES(4,N'Máy sấy 2',N'M1',200,100,50,20,9,N'image11.jpg',N'Description 11',N'Details 11',1)
INSERT INTO Product VALUES(4,N'Máy sấy 3',N'A3',300,150,50,21,3,N'image12.jpg',N'Description 12',N'Details 12',2)

INSERT INTO Product VALUES(5,N'Bộ xếp hình 1',N'B1',100,50,50,22,10,N'image13.jpg',N'Description 13',N'Details 13',0)
INSERT INTO Product VALUES(5,N'Bộ xếp hình 2',N'B1',200,100,50,23,11,N'image14.jpg',N'Description 14',N'Details 14',1)
INSERT INTO Product VALUES(5,N'Bộ xếp hình 3',N'A3',300,150,50,24,3,N'image15.jpg',N'Description 15',N'Details 15',2)
INSERT INTO Product VALUES(5,N'Bộ xếp hình 7',N'A7',3000,1500,50,24,3,N'image15.jpg',N'Description 15',N'Details 15',2)

GO
CREATE PROC SP_GetList_Product
AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM Product
GO
CREATE PROC SP_Insert_Product
	@Category_ID INT,@Name NVARCHAR(200),@Product_Code NVARCHAR(100),@Price_Original FLOAT,@Price_Sale FLOAT,@Price_Discount INT,@Quantity_In INT,@Quantity_Bought INT,@Image NVARCHAR(500),@Description NVARCHAR(500),@Details NTEXT,@TYPE INT,@ID INT OUTPUT
AS
	INSERT INTO Product VALUES(@Category_ID,@Name,@Product_Code,@Price_Original,@Price_Sale,@Price_Discount,@Quantity_In,@Quantity_Bought,@Image,@Description,@Details,@TYPE)
	SET @ID =@@identity
GO
CREATE PROC SP_Update_Product
	@Category_ID INT,@Name NVARCHAR(200),@Product_Code NVARCHAR(100),@Price_Original FLOAT,@Price_Sale FLOAT,@Price_Discount INT,@Quantity_In INT,@Quantity_Bought INT,@Image NVARCHAR(500),@Description NVARCHAR(500),@Details NTEXT,@TYPE INT,@ID INT
AS
	UPDATE Product SET Category_ID=@Category_ID,Name=@Name,Product_Code=@Product_Code,Price_Original=@Price_Original,Price_Sale=@Price_Sale,Price_Discount=@Price_Discount,Quantity_In=@Quantity_In,Quantity_Bought=@Quantity_Bought,Image=@Image,Description=@Description,Details=@Details,TYPE=@TYPE
	WHERE ID=@ID
GO
CREATE PROC SP_Delete_Product
	@ID INT 
AS
	DELETE FROM Product WHERE ID =@ID
GO
--Load Dop Down Category for Product
CREATE PROC SP_Get_DDL_Category
AS
	SELECT * FROM Category
GO
--Search By Category Name Product
CREATE PROC SP_Get_ProductByCategory
	@Category_ID INT
AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM Product WHERE Category_ID = @Category_ID

---------------------------Type Payment-----------------------------
--1 is : Chuyển khoản trực tiếp,2 is :  Thanh toán cho người giao hàng (Chỉ áp dụng tại Hà Nội)
GO
CREATE TABLE Type_Payment
(
	ID INT IDENTITY PRIMARY KEY,
	Title_Info NVARCHAR(300),
	Info NVARCHAR(500)
)
INSERT INTO Type_Payment VALUES(N'Chuyển khoản trực tiếp',N' Quý khách vui lòng chuyển khoản thanh toán cho Ohrequa.com theo thông tin sau:
								Chủ TK: CÔNG TY CỔ PHẦN ĐẦU TƯ PEARL HILL
								Ngân hàng: TECHCOMBANK - 57 Láng Hạ - Hà Nội
								Số TK: 190.2555.9698.011')
INSERT INTO Type_Payment VALUES(N'Thanh toán cho người giao hàng (Chỉ áp dụng tại Hà Nội)',N'Email xác nhận đã gửi cho: panasonic_hero@yahoo.com
								Ohrequa.com sẽ giao hàng tận nơi cho quý khách và quý khách có thể thanh toán trực tiếp cho người giao hàng. ')
GO
CREATE PROC SP_GetList_Type_Payment
AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM Type_Payment
GO
CREATE PROC SP_Insert_Type_Payment
	@Title_Info NVARCHAR(300),@Info NVARCHAR(500),@ID INT OUTPUT
AS
	INSERT INTO Type_Payment VALUES(@Title_Info,@Info)
	SET @ID =@@identity
GO
CREATE PROC SP_Update_Type_Payment
	@Title_Info NVARCHAR(300),@Info NVARCHAR(500),@ID INT
AS
	UPDATE Type_Payment SET Title_Info=@Title_Info,Info=@Info
	WHERE ID=@ID
GO
CREATE PROC SP_Delete_Type_Payment
	@ID INT 
AS
	DELETE FROM Type_Payment WHERE ID =@ID

---------------------------Bill-----------------------------------
--0 is : Not Payment,1 is : Payment
GO
CREATE TABLE Bill
(
	ID INT IDENTITY PRIMARY KEY,
	Customer_ID INT,
	Type_Payment_ID INT,
	Date_Purcharse DATETIME,
	TotalNameProduct NVARCHAR(500),
	TotalQuantity INT,
	TotalMoney FLOAT,
	Status_Payment BIT DEFAULT 0
)
CONVERT(VARCHAR(10), GETDATE(), 103)
GO
INSERT INTO Bill VALUES(1,1,'03-10-2013',N'Áo Thu 1;Áo Thu 2',6,500,0)
INSERT INTO Bill VALUES(2,2,'03-11-2013',N'Chuột Game 1;Chuột Game 2',8,650,1)
INSERT INTO Bill VALUES(2,2,Convert(datetime , Getdate(),103),N'Chuột Game 1;Chuột Game 2',8,650,1)

GO
ALTER TABLE Bill
ADD CONSTRAINT fk_Customer_ID
FOREIGN KEY (Customer_ID)
REFERENCES Customer(ID)
GO
ALTER TABLE Bill
ADD CONSTRAINT fk_Type_Payment_ID
FOREIGN KEY (Type_Payment_ID)
REFERENCES Type_Payment(ID)
GO
CREATE PROC SP_GetList_Bill
	AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM Bill
GO
--Get List ShopCart By Click Bill ID
CREATE PROC SP_GetList_ShopCart_ByClickBillID
	@Bill_ID INT
AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM ShoppingCart WHERE Bill_ID = @Bill_ID
GO
--Get List Bill Info
CREATE PROC SP_GetList_Bill_Info
AS
	SELECT ROW_NUMBER() OVER (Order by b.ID) as STT,b.ID,c.ID AS CustomerID,c.Name,c.Address AS Address,c.Phone AS Phone,c.Email AS Email,c.Gender AS Gender,Date_Purcharse,TotalQuantity,TotalMoney,t.Title_Info AS Title_Info,Status_Payment 
	FROM Customer c INNER JOIN Bill b
	ON c.ID = b.Customer_ID
	INNER JOIN Type_Payment t
	ON b.Type_Payment_ID = t.ID
GO
CREATE PROC SP_Insert_Bill
	@Customer_ID INT,@Type_Payment_ID INT,@Date_Purcharse DATETIME,@TotalNameProduct NVARCHAR(500),@TotalQuantity INT,@TotalMoney FLOAT,@Status_Payment BIT,@ID INT OUTPUT 
AS
	INSERT INTO Bill VALUES(@Customer_ID,@Type_Payment_ID,@Date_Purcharse,@TotalNameProduct,@TotalQuantity,@TotalMoney,@Status_Payment)
	SET @ID =@@identity
GO
CREATE PROC SP_Update_Bill
	@Customer_ID INT,@Type_Payment_ID INT,@Date_Purcharse DATETIME,@TotalNameProduct NVARCHAR(500),@TotalQuantity INT,@TotalMoney FLOAT,@Status_Payment BIT,@ID INT
AS
	UPDATE Bill SET Customer_ID=@Customer_ID,Type_Payment_ID=@Type_Payment_ID,Date_Purcharse=@Date_Purcharse,TotalNameProduct = @TotalNameProduct,TotalQuantity=@TotalQuantity,TotalMoney=@TotalMoney,Status_Payment=@Status_Payment
	WHERE ID=@ID
GO
CREATE PROC SP_Delete_Bill
	@ID INT 
AS
	DELETE FROM Bill WHERE ID =@ID
GO
--Proc Delete ShopCart when Delete Bill(delete ShopCart by ID_Bill)
CREATE PROC SP_Delete_ShoppingCart_By_IDBIll
	@ID INT 
AS
	DELETE FROM ShoppingCart WHERE Bill_ID = @ID

--Proc Update Status Payment for Bill
GO
CREATE PROC SP_Update_StatusPayment
	@ID int,@Status_Payment BIT
AS
	UPDATE Bill SET Status_Payment = @Status_Payment WHERE ID = @ID

---------------------------SHOP_CART-----------------------------
GO
CREATE TABLE ShoppingCart	
(
	ID INT IDENTITY PRIMARY KEY,
	Bill_ID INT FOREIGN KEY REFERENCES Bill(ID),
	NameProduct NVARCHAR(200),
	PriceProduct FLOAT,
	Quantity INT,	
	TotalMoneyProduct FLOAT
)
GO
INSERT INTO ShoppingCart VALUES(1,N'Áo Thu 1',100,2,100)
INSERT INTO ShoppingCart VALUES(1,N'Áo Thu 2',200,4,400)

INSERT INTO ShoppingCart VALUES(2,N'Chuột Game 1',100,3,150)
INSERT INTO ShoppingCart VALUES(2,N'Chuột Game 2',200,5,500)
GO
CREATE PROC SP_GetList_ShoppingCart
AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM ShoppingCart
GO
CREATE PROC SP_Insert_ShoppingCart
	@Bill_ID INT,@NameProduct NVARCHAR(200),@PriceProduct FLOAT,@Quantity INT,@TotalMoneyProduct FLOAT,@ID INT OUTPUT 
AS
	INSERT INTO ShoppingCart VALUES(@Bill_ID,@NameProduct,@PriceProduct,@Quantity,@TotalMoneyProduct)
	SET @ID =@@identity
GO
CREATE PROC SP_Update_ShoppingCart 
	@Bill_ID INT,@NameProduct NVARCHAR(200),@PriceProduct FLOAT,@Quantity INT,@TotalMoneyProduct FLOAT,@ID INT
AS
	UPDATE ShoppingCart SET Bill_ID=@Bill_ID,NameProduct=@NameProduct,PriceProduct=@PriceProduct,Quantity=@Quantity,TotalMoneyProduct=@TotalMoneyProduct 
	WHERE ID=@ID
GO
CREATE PROC SP_Delete_ShoppingCart
	@ID INT
AS
	DELETE FROM ShoppingCart WHERE ID =@ID

---------------------------About - Giới thiệu-----------------------------
GO
CREATE TABLE About
(
	ID INT IDENTITY PRIMARY KEY,
	Title_About NVARCHAR(200),
	Detail_About NTEXT
)
INSERT INTO About VALUES(N'GIỚI THIỆU CÔNG TY',N'Detail About')
GO
CREATE PROC SP_GetList_About
AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM About
GO
CREATE PROC SP_Insert_About
	@Title_About NVARCHAR(200),@Detail_About NTEXT,@ID INT OUTPUT 
AS
	INSERT INTO About VALUES(@Title_About,@Detail_About)
	SET @ID =@@identity
GO
CREATE PROC SP_Update_About
  @Title_About NVARCHAR(200),@Detail_About NTEXT,@ID INT
AS
  UPDATE About SET Title_About=@Title_About,Detail_About = @Detail_About
  WHERE ID=@ID
GO
CREATE PROC SP_Delete_About
	@ID INT 
AS
	DELETE FROM About WHERE ID =@ID

---------------------------Support Online------------------------------
GO
CREATE TABLE Support_Online
(
	ID INT IDENTITY PRIMARY KEY,
	Name NVARCHAR(200),
	Yahoo NVARCHAR(200),
	PhoneSuppot NVARCHAR(100)
)
INSERT INTO Support_Online VALUES(N'Mr Tuấn',N'tuan_tt','0906-011-995')
INSERT INTO Support_Online VALUES(N'Mr Hằng',N'hang_nn','0906-011-887')
GO
CREATE PROC SP_GetList_Support_Online
AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM Support_Online
GO
CREATE PROC SP_Insert_Support_Online
	@Name NVARCHAR(200),@Yahoo NVARCHAR(200),@PhoneSuppot NVARCHAR(100),@ID INT OUTPUT 
AS
	INSERT INTO Support_Online VALUES(@Name,@Yahoo,@PhoneSuppot)
	SET @ID =@@identity
GO
CREATE PROC SP_Update_Support_Online
  @Name NVARCHAR(200),@Yahoo NVARCHAR(200),@PhoneSuppot NVARCHAR(100),@ID INT
AS
  UPDATE Support_Online SET Name=@Name,Yahoo = @Yahoo,PhoneSuppot=@PhoneSuppot
  WHERE ID=@ID
GO
CREATE PROC SP_Delete_Support_Online
	@ID INT 
AS
	DELETE FROM Support_Online WHERE ID =@ID

---------------------------Link -Liên kết -----------------------------
GO
CREATE TABLE Link
(
	ID INT IDENTITY PRIMARY KEY,
	Link NVARCHAR(500),
	Images NVARCHAR(500)
)
INSERT INTO Link VALUES(N'facebook.com',N'facebook.png')
INSERT INTO Link VALUES(N'twitter.com',N'twitter.png')
GO
CREATE PROC SP_GetList_Link
AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM Link
GO
CREATE PROC SP_Insert_Link
	@Link NVARCHAR(500),@Images NVARCHAR(500),@ID INT OUTPUT
AS
	INSERT INTO Link VALUES(@Link,@Images)
	SET @ID =@@identity
GO
CREATE PROC SP_Update_Link
	@Link NVARCHAR(500),@Images NVARCHAR(500),@ID INT
AS
	UPDATE Link SET Link=@Link,Images=@Images
	WHERE ID=@ID
GO
CREATE PROC SP_Delete_Link
	@ID INT 
AS
	DELETE FROM Link WHERE ID =@ID
	
---------------------------Address -Địa chỉ bán hàng -----------------------------
GO
CREATE TABLE AddressSale
(
	ID INT IDENTITY PRIMARY KEY,
	Address NVARCHAR(500),
	Phone NVARCHAR(500)
)
INSERT INTO AddressSale VALUES(N'Địa chỉ 1 : số 7,tổ 6,ngõ 105,Đường Lương Ngọc Quyến - TP Thái Nguyên | Email: loveyou_is_loveme_1501@yahoo.com',N'Phone : 0983165163')
INSERT INTO AddressSale VALUES(N'Địa chỉ 2 : số 21,khu tập thể huyện Thanh Trì,Văn Điển - HN | Email: panasonic_hero@yahoo.com',N'Phone : 01288408494')
GO
CREATE PROC SP_GetList_AddressSale
AS
	SELECT ROW_NUMBER() OVER (Order by ID) as STT,* FROM AddressSale
GO
CREATE PROC SP_Insert_AddressSale
	@Address NVARCHAR(500),@Phone NVARCHAR(500),@ID INT OUTPUT
AS
	INSERT INTO AddressSale VALUES(@Address,@Phone)
	SET @ID =@@identity
GO
CREATE PROC SP_Update_AddressSale
	@Address NVARCHAR(500),@Phone NVARCHAR(500),@ID INT
AS
	UPDATE AddressSale SET Address=@Address,Phone=@Phone
	WHERE ID=@ID
GO
CREATE PROC SP_Delete_AddressSale
	@ID INT
AS
	DELETE FROM AddressSale WHERE ID =@ID





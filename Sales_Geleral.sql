USE MASTER
GO
IF EXISTS(SELECT * FROM sys.databases WHERE NAME = 'Sales_Geleral')
    DROP DATABASE Sales_Geleral
GO
CREATE DATABASE Sales_Geleral
GO
USE Sales_Geleral
---------------------------ADMIN-----------------------------
GO
CREATE TABLE Admin
(
	ID INT IDENTITY PRIMARY KEY,
	UseName NVARCHAR(50) NOT NULL,
	Password NVARCHAR(200) NOT NULL
)
INSERT INTO Admin VALUES('admin','admin')
INSERT INTO Admin VALUES('admin1','admin1')
GO
CREATE PROC SP_GetList_Admin
AS
	SELECT * FROM Admin
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
	Email NVARCHAR(500) UNIQUE NOT NULL,
)
INSERT INTO Customer VALUES('linh','linh','Nguyễn Nhất Linh',0,'01288-408-494','Số nhà 21,khu tập thể huyện Thanh Tri-Văn Điển-HN','panasonic_hero@yahoo.com')
INSERT INTO Customer VALUES('cuong','cuong','Nguyễn Văn Cường',1,'0965-435-677','Làng sinh viên Hasinco','cuongnv_c00541@yahoo.com')
GO
CREATE PROC SP_GetList_Customer
AS
	SELECT * FROM Customer
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
INSERT INTO Category VALUES('DEAL HOT')
INSERT INTO Category VALUES('DEAL NEW')
INSERT INTO Category VALUES('CÔNG NGHỆ')
INSERT INTO Category VALUES('THỜI TRANG')
INSERT INTO Category VALUES('CÔNG NGHỆ')
INSERT INTO Category VALUES('LÀM ĐẸP')
INSERT INTO Category VALUES('GIA DỤNG')
INSERT INTO Category VALUES('KHÁC')
GO
CREATE PROC SP_GetList_Category
AS
	SELECT * FROM Category
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
INSERT INTO Product VALUES(1,'Áo Thu 1','A1',100,50,50,10,2,'image1.jpg','Description 1','Details 1',0)
INSERT INTO Product VALUES(1,'Áo Thu 2','A2',200,100,50,11,3,'image2.jpg','Description 2','Details 2',1)
INSERT INTO Product VALUES(1,'Áo Thu 3','A3',300,150,50,12,3,'image3.jpg','Description 3','Details 3',2)

INSERT INTO Product VALUES(2,'Chuột Game 1','C1',100,50,50,13,4,'image4.jpg','Description 4','Details 4',0)
INSERT INTO Product VALUES(2,'Chuột Game 2','C2',200,100,50,14,5,'image5.jpg','Description 5','Details 5',1)
INSERT INTO Product VALUES(2,'Chuột Game 3','C3',300,150,50,15,5,'image6.jpg','Description 6','Details 6',2)

INSERT INTO Product VALUES(3,'Sữa tắm 1','S1',100,50,50,16,6,'image7.jpg','Description 7','Details 7',0)
INSERT INTO Product VALUES(3,'Sữa tắm 2','S1',200,100,50,17,7,'image8.jpg','Description 8','Details 8',1)
INSERT INTO Product VALUES(3,'Sữa tắm 3','A3',300,150,50,18,3,'image9.jpg','Description 9','Details 9',2)

INSERT INTO Product VALUES(4,'Máy sấy 1','M1',100,50,50,19,8,'image10.jpg','Description 10','Details 10',0)
INSERT INTO Product VALUES(4,'Máy sấy 2','M1',200,100,50,20,9,'image11.jpg','Description 11','Details 11',1)
INSERT INTO Product VALUES(4,'Máy sấy 3','A3',300,150,50,21,3,'image12.jpg','Description 12','Details 12',2)

INSERT INTO Product VALUES(5,'Bộ xếp hình 1','B1',100,50,50,22,10,'image13.jpg','Description 13','Details 13',0)
INSERT INTO Product VALUES(5,'Bộ xếp hình 2','B1',200,100,50,23,11,'image14.jpg','Description 14','Details 14',1)
INSERT INTO Product VALUES(5,'Bộ xếp hình 3','A3',300,150,50,24,3,'image15.jpg','Description 15','Details 15',2)
GO
CREATE PROC SP_GetList_Product
AS
	SELECT * FROM Product
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

---------------------------Type Payment-----------------------------
--0 is : Chuyển khoản trực tiếp,1 is :  Thanh toán cho người giao hàng (Chỉ áp dụng tại Hà Nội)
GO
CREATE TABLE Type_Payment
(
	ID INT IDENTITY PRIMARY KEY,
	TypePayment INT,
	Info NVARCHAR(500)
)
INSERT INTO Type_Payment VALUES(0,' Quý khách vui lòng chuyển khoản thanh toán cho Ohrequa.com theo thông tin sau:
								Chủ TK: CÔNG TY CỔ PHẦN ĐẦU TƯ PEARL HILL
								Ngân hàng: TECHCOMBANK - 57 Láng Hạ - Hà Nội
								Số TK: 190.2555.9698.011')
INSERT INTO Type_Payment VALUES(1,'Email xác nhận đã gửi cho: panasonic_hero@yahoo.com
								Ohrequa.com sẽ giao hàng tận nơi cho quý khách và quý khách có thể thanh toán trực tiếp cho người giao hàng. ')
GO
CREATE PROC SP_GetList_Type_Payment
AS
	SELECT * FROM Type_Payment
GO
CREATE PROC SP_Insert_Type_Payment
	@TypePayment INT,@Info NVARCHAR(500),@ID INT OUTPUT
AS
	INSERT INTO Type_Payment VALUES(@TypePayment,@Info)
	SET @ID =@@identity
GO
CREATE PROC SP_Update_Type_Payment
	@TypePayment INT,@Info NVARCHAR(500),@ID INT
AS
	UPDATE Type_Payment SET TypePayment=@TypePayment,Info=@Info
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
GO
INSERT INTO Bill VALUES(1,1,'03-10-2013','Áo Thu 1;Áo Thu 2',6,500,0)
INSERT INTO Bill VALUES(2,2,'03-11-2013','Chuột Game 1;Chuột Game 2',8,650,1)
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
	SELECT * FROM Bill
GO
--Get List ShopCart By Click Bill ID
CREATE PROC SP_GetList_ShopCart_ByClickBillID
	@Bill_ID INT
AS
	SELECT * FROM ShoppingCart WHERE Bill_ID = @Bill_ID
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
INSERT INTO ShoppingCart VALUES(1,'Áo Thu 1',100,2,100)
INSERT INTO ShoppingCart VALUES(1,'Áo Thu 2',200,4,400)

INSERT INTO ShoppingCart VALUES(2,'Chuột Game 1',100,3,150)
INSERT INTO ShoppingCart VALUES(2,'Chuột Game 2',200,5,500)
GO
CREATE PROC SP_GetList_ShoppingCart
AS
	SELECT * FROM ShoppingCart
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
INSERT INTO About VALUES('GIỚI THIỆU CÔNG TY','Detail About')
GO
CREATE PROC SP_GetList_About
AS
	SELECT * FROM About
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
INSERT INTO Support_Online VALUES('Mr Tuấn','tuan_tt','0906-011-995')
INSERT INTO Support_Online VALUES('Mr Hằng','hang_nn','0906-011-887')
GO
CREATE PROC SP_GetList_Support_Online
AS
	SELECT * FROM Support_Online
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
	Link NVARCHAR(500)
)
INSERT INTO Link VALUES('facebook.com')
GO
CREATE PROC SP_GetList_Link
AS
	SELECT * FROM Link
GO
CREATE PROC SP_Insert_Link
	@Link NVARCHAR(500),@ID INT OUTPUT
AS
	INSERT INTO Link VALUES(@Link)
	SET @ID =@@identity
GO
CREATE PROC SP_Update_Link
	@Link NVARCHAR(500),@ID INT
AS
	UPDATE Link SET Link=@Link
	WHERE ID=@ID
GO
CREATE PROC SP_Delete_Link
	@ID INT 
AS
	DELETE FROM Link WHERE ID =@ID

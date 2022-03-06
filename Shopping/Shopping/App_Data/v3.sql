	Create Table MainAdmin
	(
	Admin_id int Not null identity(1,1) PRIMARY KEY,
	username varchar(225),
	Password varchar(225),
	);

	--4 Seller[admin]-----
	CREATE TABLE Seller
	(
	Seller_id int NOT NULL identity(1,1) PRIMARY KEY,
	Seller_Name varchar(255),
	E_mail varchar (50) unique,
	Address varchar(255),
	Admin_id int NOT NULL,
	[Password] varchar(255) not null,
	[Creation_date] datetime not null
	FOREIGN KEY (Admin_id) REFERENCES MainAdmin(Admin_id),
	);

	--1 Categories----5
	CREATE TABLE [Categories](
	Cat_id INT NOT NULL identity(1,1) PRIMARY KEY,
	Cat_name VARCHAR(100) NOT NULL,
	Cat_Desc ntext null,
	Admin_id INT NOT NULL,
	FOREIGN KEY (Admin_id) REFERENCES MainAdmin(Admin_id),
	);	
	--5 Buyer[Customer]---
	CREATE TABLE Customer
	(
	Cust_id int NOT NULL identity(1,1) PRIMARY KEY,
	Cust_Name varchar(255),
	Address varchar(255),
	E_mail varchar (50) unique,
	[Password] varchar(255) not null,
	[Creation_date] datetime not null,
	Admin_id INT NOT NULL,
	FOREIGN KEY (Admin_id) REFERENCES MainAdmin(Admin_id),
	);
	--5 PasswordRequests---
	Create table tblResetPasswordRequests
		(
	Id UniqueIdentifier Primary key,
	UserId int Foreign key references Customer(Cust_id),
	ResetRequestDateTime DateTime
	)
	--11--E-mail Authentication----
	create Table [EmailVerification]
	(
	Email_id  int NOT NULL identity(1,1) PRIMARY KEY,
	E_mail varchar (50) not null,
	[status] varchar (50) not null,
	Activation_code varchar (50) not null,
	Cust_id int NOT NULL,
	FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id),
	)
	--11--E-mail Authentication Seller----
	--
	CREATE TABLE [dbo].[EmailVerificationSeller] (
    [Email_id]        INT          IDENTITY (1, 1) NOT NULL,
    [E_mail]          VARCHAR (50) NOT NULL,
    [status]          VARCHAR (50) NOT NULL,
    [Activation_code] VARCHAR (50) NOT NULL,
    [Seller_id]         INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Email_id] ASC),
    FOREIGN KEY ([Seller_id]) REFERENCES [dbo].[Seller] ([Seller_id])
);
	--
     -----7product----8
	CREATE TABLE Products(
	Product_id INT NOT NULL identity(1,1) PRIMARY KEY,
	Cat_id INT NOT NULL,
	Seller_id int not null,
	Cat_name varchar(225),
	Pr_name VARCHAR(150) NOT NULL,
	Pr_description TEXT NOT NULL,
	Pr_image varbinary(max),
	Price Int NOT NULL,
	Stock int not null,
	[date] date not null,
	);

	--2 Pro_Categories---6
	create table [pro_cat]
	(
	Product_id int not null,
	Cat_id int not null,
	FOREIGN KEY (Cat_id) REFERENCES [Categories](Cat_id),
	FOREIGN KEY (Product_id) REFERENCES [Products](Product_id),
	);
	
	
	 ----Shipping---
	 CREATE TABLE [Shipping](
	ShipperID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	cust_id int NOT NULL ,
	Order_id int NOT NULL,
	city nvarchar(40) NOT NULL, 
	Phone nvarchar(24) NULL,
	Transport nvarchar(24) NULL,
	);
	
	 --10 Discount[Coupons]----4
	Create Table Coupons
	(
	Coupon_id int not null identity(1,1) primary key,
	Cust_id int not null,
	Coupon_Code int not null,
	Discount_percent int ,
	Till_Date datetime,
	FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id ),	
	);
	----Orders------
	CREATE TABLE [Order]
	(
	Order_id int NOT NULL identity(1,1) primary key,
	Order_Desc varchar(255),
	Cust_Name varchar(255),
	Cust_id int not null,
	Shipping_Id int  null,
	[date] datetime,
	unitPrice int,
	Coupon_id INT UNIQUE FOREIGN KEY REFERENCES [Coupons](Coupon_id) ,
	FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id),
	FOREIGN KEY(Shipping_Id) REFERENCES Shipping(ShipperID),
	);
	----ORDER-PTODUCT----
	Create Table Order_Product(
	 
	 Order_id int not null,
	 Product_id int not null,
	 Foreign Key (Order_id) References [Order](Order_id),
	 Foreign Key (Product_id) References [Products](Product_id),
	 );
--===================
select Cat_id As Id,Cat_name As [Category Name],Cat_Desc As [Description] from Categories
SELECT MAX(Cat_id) AS LastID FROM Categories
--========StoredProcedure
--1
Create proc spResetPassword 
@UserName nvarchar(100)
as
Begin
 Declare @UserId int
 Declare @Email nvarchar(100)
 
 Select @UserId =Cust_id , @Email = E_mail 
 from Customer
 where Cust_Name = @UserName
 
 if(@UserId IS NOT NULL)
 Begin
  --If username exists
  Declare @GUID UniqueIdentifier
  Set @GUID = NEWID()
  
  Insert into tblResetPasswordRequests
  (Id, UserId, ResetRequestDateTime)
  Values(@GUID, @UserId, GETDATE())
  
  Select 1 as ReturnCode, @GUID as UniqueId, @Email as Email
 End
 Else
 Begin
  --If username does not exist
  SELECT 0 as ReturnCode, NULL as UniqueId, NULL as Email
 End
End
--2
--Stored Procedure to check, if the password reset link, is a valid link.

Create Proc spIsPasswordResetLinkValid 
@GUID uniqueidentifier
as
Begin
 Declare @UserId int
 
 If(Exists(Select UserId from tblResetPasswordRequests where Id = @GUID))
 Begin
  Select 1 as IsValidPasswordResetLink
 End
 Else
 Begin
  Select 0 as IsValidPasswordResetLink
 End
End

--Stored Procedure to change password

Create Proc spChangePassword
@GUID uniqueidentifier,
@Password nvarchar(100)
as
Begin
 Declare @UserId int
 
 Select @UserId = UserId 
 from tblResetPasswordRequests
 where Id= @GUID
 
 if(@UserId is null)
 Begin
  -- If UserId does not exist
  Select 0 as IsPasswordChanged
 End
 Else
 Begin
  -- If UserId exists, Update with new password
  Update Customer set
  [Password] = @Password
  where Cust_id = @UserId
  
  -- Delete the password reset request row 
  Delete from tblResetPasswordRequests
  where Id = @GUID
  
  Select 1 as IsPasswordChanged
 End
End

--3
create procedure getproductid
as
SELECT MAX(Product_id) AS LastID FROM Products
go;
--4
create procedure getcat_id
as
SELECT MAX(Cat_id) AS LastID FROM Categories
go;
--5
CREATE PROCEDURE InsertProduct 
	@Catid INT,
	@Sellerid      int ,
	@Catname       varchar(225),
	@Prname        VARCHAR(150),
	@Prdescription TEXT ,
	@Primage        varbinary(max),
	@Price          Int ,
	@Stock           int
AS
BEGIN
Insert into Products(Cat_id,Seller_id,Cat_name,Pr_name,Pr_description,Pr_image,Price,Stock,date)
values(@Catid,@Sellerid,@Catname,@Prname,@Prdescription,@Primage,@Price,@Stock,getdate());
End;
GO;
--6
create procedure GetSellerId @Email varchar(50)
as
select Seller_id from Seller where E_mail=@Email
GO
--7
CREATE PROCEDURE UptadeProduct 
	@Catid INT,
	@Sellerid int ,
	@Productid int ,
	@Catname       varchar(225),
	@Prname        VARCHAR(150),
	@Prdescription TEXT ,
	@Primage        varbinary(max),
	@Price          Int ,
	@Stock           int
AS
BEGIN
UPDATE [Products] SET [Cat_id] = @Catid,Seller_id=@Sellerid,[Cat_name] =@Catname,[Pr_name] =@Prname,[Pr_description] =@Prdescription
                        ,[Pr_image] = @Primage,[Price]=@Price,[Stock]=@Stock,[date]=getdate() WHERE[Product_id] =@Productid
End;
GO;
--8

----Insert Seller---
	Create procedure InsertSeller
	@Seller_Name varchar(255),
	@E_mail varchar (50),
	@Address varchar(255),
	@password varchar(255),
	@date datetime
	AS
	BEGIN 
	Insert into Seller(Seller_Name,E_mail,Address,Admin_id,[password],Creation_date) values(@Seller_Name,@E_mail,@Address,1,@password,@date);	
	END;
	--EXEC InsertSeller 'HELLO','agmail.com','add','123','12-12-2020';
--9
----Insert Customer---
	Create procedure InsertCustomer   
	@Cust_Name varchar(255),
	@Address varchar(255),
	@E_mail varchar (50),
	@Password varchar(255),
	@date datetime
	AS
	BEGIN 
	Insert into Customer(Cust_Name,E_mail,Address,Password,Creation_date) values(@Cust_Name,@E_mail,@Address,@password,@date);
	END
	--10
---BindAllProducts
CREATE PROCEDURE BindAllProducts
AS
select Products.Product_id,Products.Pr_name,Products.Pr_description,Products.Pr_image,Products.Price,
Products.Stock,Seller.Seller_Name from Products inner join Seller on Products.Seller_id=Seller.Seller_id
Exec BindAllProducts
--11
---InserOrder
CREATE PROCEDURE InsertOrder 
	@Cust_id INT,
	@shippingid  int ,
	@status   varchar(50)	

AS
BEGIN
Insert into [Order](Cust_id,Shipping_Id,[date],Coupon_Used_UnUsed)
values(@Cust_id,@shippingid,getdate(),@status);
End;
--12
---InserOrder
CREATE PROCEDURE InsertOrderDetail 
	@oderid INT,
	@productid  int ,
	@quantity int,
	@price   int,
	@sellerid int
AS
BEGIN
Insert into Order_Product(Order_id,Product_id,Quantity,Price,Seller_id)
values(@oderid,@productid,@quantity,@price,@sellerid);
End;
--12
create procedure getOrderId
as
SELECT MAX(Order_id) AS LastID FROM [Order]
go;
 EXEC getOrderId
--13
--GetSellerId
create procedure GetProductSellerId
@pid int
as
SELECT Seller.Seller_id
FROM Seller
INNER JOIN Products ON Products.Seller_id=Seller.Seller_id where Product_id=@pid;
go;
select * from Order_Product
--14
--Update Stock Of Product
create procedure StockUptade
@quantity int,
@pid int
as
UPDATE Products
SET Stock = Stock-@quantity
WHERE Product_id = @pid;
--15
--EmaiVerficationCustomer
create procedure EmailVerifyCustomer
@email varchar(50),
@status varchar(50),
@ActivateCode varchar(50),
@custid int
as
BEGIN
Insert into EmailVerification(E_mail,[status],Activation_code,Cust_id)
values(@email,@status,@ActivateCode,@custid);
End;
--16
--EmaiVerficationSeller
create procedure EmailVerifySeller
@email varchar(50),
@status varchar(50),
@ActivateCode varchar(50),
@Sellerid int
as
BEGIN
Insert into EmailVerificationSeller(E_mail,[status],Activation_code,Seller_id)
values(@email,@status,@ActivateCode,@Sellerid);
End;
--select * from seller
--select Cust_Name from Customer where E_mail='adilaa@gmail.com'

--	select * from Verification where E_mail='adilwaheed131192@gmail.com'
--Update Verification set status='Verified' where E_mail='adilwaheed131192@gmail.com'
--delete  from Verification where E_mail='adilwaheed131192@gmail.com'
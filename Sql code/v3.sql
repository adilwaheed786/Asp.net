	Create Table MainAdmin
	(
	Admin_id int Not null identity(1,1) PRIMARY KEY,
	username varchar(225),
	Password varchar(225),
	);

	--4 Seller[admin]-----
CREATE TABLE [dbo].[Seller] (
    [Seller_id]     INT           IDENTITY (1, 1) NOT NULL,
    [Seller_Name]   VARCHAR (255) NULL,
    [E_mail]        VARCHAR (50)  NULL,
    [Address]       VARCHAR (255) NULL,
    [Admin_id]      INT           NOT NULL,
    [Password]      VARCHAR (255) NOT NULL,
    [Creation_date] DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Seller_id] ASC),
    UNIQUE NONCLUSTERED ([E_mail] ASC),
    FOREIGN KEY ([Admin_id]) REFERENCES [dbo].[MainAdmin] ([Admin_id])
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
	CREATE TABLE [dbo].[Customer] (
    [Cust_id]       INT           IDENTITY (1, 1) NOT NULL,
    [Cust_Name]     VARCHAR (255) NULL,
    [Address]       VARCHAR (255) NULL,
    [E_mail]        VARCHAR (50)  NULL,
    [Password]      VARCHAR (255) NOT NULL,
    [Creation_date] DATETIME      NOT NULL,
    [Admin_id]      INT           NOT NULL,
    PRIMARY KEY CLUSTERED ([Cust_id] ASC),
    UNIQUE NONCLUSTERED ([E_mail] ASC),
    FOREIGN KEY ([Admin_id]) REFERENCES [dbo].[MainAdmin] ([Admin_id])
);
	--5 PasswordRequests---
	CREATE TABLE [dbo].[tblResetPasswordRequests] (
    [Id]                   UNIQUEIDENTIFIER NOT NULL,
    [UserId]               INT              NULL,
    [ResetRequestDateTime] DATETIME         NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC),
    FOREIGN KEY ([UserId]) REFERENCES [dbo].[Customer] ([Cust_id])
);

	--11--E-mail Authentication----
	CREATE TABLE [dbo].[EmailVerification] (
    [Email_id]        INT          IDENTITY (1, 1) NOT NULL,
    [E_mail]          VARCHAR (50) NOT NULL,
    [status]          VARCHAR (50) NOT NULL,
    [Activation_code] VARCHAR (50) NOT NULL,
    [Cust_id]         INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Email_id] ASC),
    FOREIGN KEY ([Cust_id]) REFERENCES [dbo].[Customer] ([Cust_id])
);

	--11--E-mail Authentication Seller----
	--
CREATE TABLE [dbo].[EmailVerificationSeller] (
    [Email_id]        INT          IDENTITY (1, 1) NOT NULL,
    [E_mail]          VARCHAR (50) NOT NULL,
    [status]          VARCHAR (50) NOT NULL,
    [Activation_code] VARCHAR (50) NOT NULL,
    [Seller_id]       INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([Email_id] ASC),
    FOREIGN KEY ([Seller_id]) REFERENCES [dbo].[Seller] ([Seller_id])
);

	--
     -----7product----8

CREATE TABLE [dbo].[Products] (
    [Product_id]     INT             IDENTITY (1, 1) NOT NULL,
    [Cat_id]         INT             NOT NULL,
    [Seller_id]      INT             NOT NULL,
    [Cat_name]       VARCHAR (225)   NULL,
    [Pr_name]        VARCHAR (150)   NOT NULL,
    [Pr_description] TEXT            NOT NULL,
    [Pr_image]       VARBINARY (MAX) NULL,
    [Price]          INT             NOT NULL,
    [Stock]          INT             NOT NULL,
    [date]           DATE            NOT NULL,
    PRIMARY KEY CLUSTERED ([Product_id] ASC)
);

	--2 Pro_Categories---6

	CREATE TABLE [dbo].[pro_cat] (
    [Product_id] INT NOT NULL,
    [Cat_id]     INT NOT NULL,
    FOREIGN KEY ([Cat_id]) REFERENCES [dbo].[Categories] ([Cat_id]),
    FOREIGN KEY ([Product_id]) REFERENCES [dbo].[Products] ([Product_id])
);
	
	 ----Shipping---
CREATE TABLE [dbo].[Shipping] (
    [ShipperID] INT           IDENTITY (1, 1) NOT NULL,
    [cust_id]   INT           NOT NULL,
    [Order_id]  INT           NOT NULL,
    [city]      NVARCHAR (40) NOT NULL,
    [Phone]     NVARCHAR (24) NULL,
    [Transport] NVARCHAR (24) NULL,
    PRIMARY KEY CLUSTERED ([ShipperID] ASC)
);


	
	 --10 Discount[Coupons]----4
	CREATE TABLE [dbo].[Coupons] (
    [Coupon_id]        INT          IDENTITY (1, 1) NOT NULL,
    [Cust_id]          INT          NOT NULL,
    [Coupon_Code]      INT          NOT NULL,
    [Discount_percent] INT          NULL,
    [Till_Date]        DATETIME     NULL,
    [status]           VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Coupon_id] ASC),
    FOREIGN KEY ([Cust_id]) REFERENCES [dbo].[Customer] ([Cust_id])
);

	----Orders------
	CREATE TABLE [dbo].[Order] (
    [Order_id]           INT          IDENTITY (1, 1) NOT NULL,
    [Cust_id]            INT          NOT NULL,
    [Shipping_Id]        INT          NOT NULL,
    [date]               DATETIME     NULL,
    [Coupon_Used_UnUsed] VARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([Order_id] ASC),
    FOREIGN KEY ([Cust_id]) REFERENCES [dbo].[Customer] ([Cust_id])
);

	----ORDER-PTODUCT----
CREATE TABLE [dbo].[Order_Product] (
    [Order_id]   INT NOT NULL,
    [Product_id] INT NOT NULL,
    [Quantity]   INT NULL,
    [Price]      INT NULL,
    [Seller_id]  INT NULL,
    FOREIGN KEY ([Seller_id]) REFERENCES [dbo].[Seller] ([Seller_id]),
    FOREIGN KEY ([Order_id]) REFERENCES [dbo].[Order] ([Order_id]),
    FOREIGN KEY ([Product_id]) REFERENCES [dbo].[Products] ([Product_id])
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
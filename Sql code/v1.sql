
Create database shoppingv3

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
	);
	----Manages-----
	create table [Manages]
	(
	Manages_id INT NOT NULL identity(1,1) PRIMARY KEY,
	Seller_id int not null,
	Cust_id int not null,
	FOREIGN KEY (Seller_id) REFERENCES [Seller](Seller_id),
	FOREIGN KEY (Cust_id) REFERENCES [Customer](Cust_id),
	);

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
	Prod_Cat_id INT NOT NULL identity(1,1) PRIMARY KEY,
	Product_id int not null,
	Cat_id int not null,
	FOREIGN KEY (Cat_id) REFERENCES [Categories](Cat_id),
	FOREIGN KEY (Product_id) REFERENCES [Products](Product_id),
	);
	
	---- product-Selling-----
	Create Table Product_Selling(
	Sell_id int not null identity(1,1) PRIMARY KEY,
	Product_id int not null,
	Seller_id int NOT NULL,
	FOREIGN KEY (Product_id) REFERENCES [Products](Product_id),
	FOREIGN KEY (Seller_id) REFERENCES [SELLER](Seller_id)
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
	Discount_percent int not null,
	FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id ),
	Till_Date datetime,
	);
	----Orders------
	CREATE TABLE [Order]
	(
	Order_id int NOT NULL identity(1,1) primary key,
	Order_Desc varchar(255),
	Cust_Name varchar(255),
	Cust_id int not null,
	Shipping_Id int not null,
	[date] datetime,
	Coupon_id INT UNIQUE FOREIGN KEY REFERENCES [Coupons](Coupon_id) ,
	FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id),
	FOREIGN KEY(Shipping_Id) REFERENCES Shipping(ShipperID),
	);
	----ORDER-PTODUCT----
	Create Table Order_Product(
	 Order_Product_id int Not Null identity(1,1) primary key,
	 Order_id int not null,
	 Product_id int not null,
	 Foreign Key (Order_id) References [Order](Order_id),
	 Foreign Key (Product_id) References [Products](Product_id),
	 );

	--11 Order Details
	CREATE TABLE [Order Details]
	(
	Order_detail_id int not null identity(1,1) primary key,
	Order_id int,
    [UnitPrice] money NOT NULL,
	[Quantity] smallint NOT NULL	
	FOREIGN KEY (Order_id) REFERENCES [Order](Order_id),
	);

		insert into MainAdmin(username,password) Values('Admin','1234');


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
	EXEC InsertSeller 'HELLO','agmail.com','add','123','12-12-2020';

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

EXEC InsertCustomer 'jon','jjj','Ab@gmail.com','poi','12-11-2021';

		 Select *from MainAdmin
		 Select *from Seller
		 Select *from Customer



SELECT MAX(Product_id) AS LastID FROM Products
--store procedure for get produtc_id from products
create procedure getproductid
as
SELECT MAX(Product_id) AS LastID FROM Products
go;
getproductid
-------------
SELECT [Stock], [Price], [Pr_image], [Pr_description], [Pr_name], [Cat_name], [Seller_id], [Cat_id], [Product_id] FROM [Products]
-----------------
select getdate();
------------------
select Cat_id,Cat_name from Categories
SELECT MAX(Cat_id) AS LastID FROM Categories
---store procedure for get CategoryID from Categories
create procedure getcat_id
as
SELECT MAX(Cat_id) AS LastID FROM Categories
go;
getcat_id
------------
select getgenerate( varbinary(max)
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
----------------
Insertproduct 1,1,'s','jacket','jeacket details',0x0101010101,50,200
------------
select * from Products where Seller_id=2004
select * from Seller where Seller_id=2
--GetSellerId------
select Seller_id from Seller where E_mail='agmail.com'
------
create procedure GetSellerId @Email varchar(50)
as
select Seller_id from Seller where E_mail=@Email
GO
--------
GetSellerId	'agmail.com'	
select Seller_Name from Seller where E_mail='agmail.com'
------
select Cat_id from Categories where Cat_name='shirts'

select * from Products where Seller_id=2004

delete from Products where Product_id=42

select cat_id from Categories where Cat_name='kids'
create procedure uptdateproduct

UPDATE [Products] SET [Cat_id] = 2,Seller_id=2004,[Cat_name] ='kids',[Pr_name] ='asdsd',[Pr_description] ='adil'
                        ,[Pr_image] = 0xFFFFFFFF,[Price]=60,[Stock]=7,[date]='2022-01-10' WHERE[Product_id] =52


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

UptadeProduct 2,2004,52,'adil','adil','sdsd',0xFFFFFFF,500,60 
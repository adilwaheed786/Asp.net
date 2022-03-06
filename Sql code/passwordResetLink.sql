
create database samplepractice
CREATE TABLE Customer
	(
	Cust_id int NOT NULL identity(1,1) PRIMARY KEY,
	Cust_Name varchar(255),
	Address varchar(255),
	E_mail varchar (50) unique,
	[Password] varchar(255) not null,
	[Creation_date] datetime not null,
	);

Create table tblResetPasswordRequests
(
 Id UniqueIdentifier Primary key,
 UserId int Foreign key references Customer(Cust_id),
 ResetRequestDateTime DateTime
)

Create proc spResetPassword 'rabia kesa laga'
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
select NEWID()
select * from tblResetPasswordRequests
select * from Customer
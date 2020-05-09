create database project;

use project;

-----------------------------------------------------------------
-- Creating Product table

CREATE TABLE Product (
Product_ID varchar(20) PRIMARY KEY,
Product_Type char(1),
Is_Insurance_Required char(3));

------------------------------ PRODUCT TYPE (PRODUCT) ----------------------------------
alter table [dbo].[Product] with check add constraint [constraint_prodtype] check (([Product_Type] = 'S' 
OR [Product_Type] = 'B' OR [Product_Type] = 'V' OR [Product_Type] = 'F' OR [Product_Type] = 'E'));
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [constraint_prodtype]
GO


DROP TABLE PRODUCT;
SELECT * FROM Product;

-----------------------------------------------------------------
-- Creating Sports table

CREATE TABLE Sports_Equiment(
Product_ID varchar(20),
Product_Name varchar(30),
Make varchar(20),
Game varchar(20),
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID));

SELECT * FROM Sports_Equiment;
DROP TABLE Sports_Equiment;

-------------------------------------------------------------------------------------
-----------------------------------------------------------------
-- Creating Books table

CREATE TABLE Books(
Product_ID varchar(20),
Book_ISBN varchar(20),
Book_Name varchar(30),
Edition int,
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID));

SELECT * FROM Books;
DROP TABLE Books;

----------------------------------------------------------------------------------
-----------------------------------------------------------------
-- Creating vehicles table

CREATE TABLE Vehicles(
Product_ID varchar(20),
Vehicle_Type varchar(20),
Company varchar(30),
Mfg_Year int,
Seat_Capacity int,
Insurance_ID varchar(20)
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID));

SELECT * FROM Vehicles;
DROP TABLE Vehicles;

------------------------------------------------------------------------------------------
-----------------------------------------------------------------
-- Creating Fitness_equipments table

CREATE TABLE Fitness_Equipments(
Product_ID varchar(20),
Product_Name varchar(30),
Make varchar(20),
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID));

SELECT * FROM Fitness_Equipments;
DROP TABLE Fitness_Equipments;

-----------------------------------------------------------------------------------
-----------------------------------------------------------------
-- Creating Electronics table

CREATE TABLE Electronics(
Product_ID varchar(20),
Product_Type varchar(30),
Make varchar(20),
Purchase_year int
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID));

SELECT * FROM Electronics;
DROP TABLE Electronics;

-----------------------------------------------------------------
-- Creating Insurance table

CREATE TABLE Insurance(
Policy_No varchar(20) Primary Key,
Product_ID varchar(20),
Company varchar(30),
[Start_Date] varchar(12),
[End_Date] varchar(12),
Coverage int
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID));


SELECT * FROM Insurance;
DROP TABLE Insurance;

-------------------------------------------------------------------------------------------------
-----------------------------------------------------------------
-- Creating Bank_Details table

create table [BANK_DETAILS] (
​
ACCOUNT_NO bigint NOT NULL ,
ACCOUNT_USER_NAME varchar(30) ,
ROUTING_NO int ,
ZIP_CODE  int,​
constraint ACCOUNT_NO_PK PRIMARY KEY (ACCOUNT_NO)); 

drop table [bank_details];

-------------------------------------------------------------------------------
-----------------------------------------------------------------
-- Creating User table

create table [USER] (
​
[USER_ID] varchar(20) NOT NULL,
ACCOUNT_NO bigint NOT NULL ,
FNAME varchar (20),
LNAME  varchar (20),
[ADDRESS] varchar(30),
EMAIL varchar (15),
[PASSWORD] varchar (10),
PROFILE_PICTURE image ,
GENDER  varchar(6),
DATE_OF_BIRTH date,
CONTACT_NO numeric(10,0),
CARD_NUMBER numeric(16,0),
IS_ADMIN  bit ,
constraint  USER_ID_PK PRIMARY KEY ([USER_ID]),
constraint ACCOUNT_NO_FK FOREIGN KEY(ACCOUNT_NO) REFERENCES [BANK_DETAILS](ACCOUNT_NO)
);

ALTER TABLE [USER]
ALTER COLUMN IS_ADMIN  char(3);

--------------------------------- DOB (USER)------------------------
ALTER TABLE [dbo].[USER] WITH CHECK ADD CONSTRAINT [constraint_dob] CHECK (([DATE_OF_BIRTH]>='1900-01-01' AND [DATE_OF_BIRTH]<='2019-11-19'))
GO
ALTER TABLE [dbo].[USER] CHECK CONSTRAINT [constraint_dob]
GO
----------------------------- GENDER (USER)------------------------
ALTER TABLE [dbo].[USER] WITH CHECK ADD CONSTRAINT [constraint_gender] CHECK (([GENDER] = 'Female' OR [GENDER] = 'Male')) ;
GO
ALTER TABLE [dbo].[USER] CHECK CONSTRAINT [constraint_gender]
GO

​
select * from [BANK_DETAILS];

----------------------------------------------------------------
-----------------------------------------------------------------
-- Creating Post table

CREATE TABLE [Post] (
Post_ID VARCHAR(20) NOT NULL PRIMARY KEY,
User_ID VARCHAR(20) NOT NULL,
Product_ID VARCHAR(20) NOT NULL,
Date_Posted DATE,
From_Date DATE,
To_Date DATE,
Approval_Date DATE,
Approved_By VARCHAR(20) ,
Photos_Videos varchar(50),
[Description] VARCHAR(40),
Rate VARCHAR(20),
Negotiable char(3),
[Location] VARCHAR(40),
Is_Available char(3),
FOREIGN KEY (User_ID) REFERENCES [User](User_ID),
FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
);

ALTER TABLE [Post]
ALTER COLUMN Rate  int;

------------------------ Negotiable (POST)----------------------------
ALTER TABLE [dbo].[Post] WITH CHECK ADD CONSTRAINT [constraint_negotiable] CHECK (([Negotiable] = 'Yes' OR [Negotiable] = 'No')) ;
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [constraint_negotiable]
GO
------------------------ RATE OF PRODUCT (POST)-------------------------
ALTER TABLE [dbo].[Post] WITH CHECK ADD CONSTRAINT [constraint_RateCheck] CHECK (( [Rate] > 0 )) ;
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [constraint_RateCheck]
GO


-----------------------------------------------------------------
-- Creating Order table

CREATE TABLE [Order] (
Order_ID VARCHAR(20) NOT NULL,
User_ID VARCHAR(20) NOT NULL,
Post_ID VARCHAR(20) NOT NULL,
Pickup_Location VARCHAR(40),
Drop_Location VARCHAR(40),
From_Date DATE ,
To_Date DATE,
Order_Status varchar(20)
PRIMARY KEY (Order_ID, Post_ID),
FOREIGN KEY (User_ID) REFERENCES [User](User_ID),
FOREIGN KEY (Post_ID) REFERENCES [Post](Post_ID),
);

drop table [Order];

-----------------------------------------------------------------
-- Creating Invoice table
CREATE TABLE "Invoice" (
Invoice_ID VARCHAR(20) NOT NULL PRIMARY KEY,
Order_ID VARCHAR(20) NOT NULL,
Invoice_Date DATE,
Total_Amount int ,
);

drop table Invoice;



-- Procedure for search functionality using category and min-max price
CREATE PROCEDURE search @category char, @minPrice int, @maxPrice int  
AS
if(@minPrice = 0 and @maxPrice = 0)
BEGIN
	   SELECT * from Post where Product_ID in (select Product_ID from product where product_type = @category);
END
ELSE if(@category = 'S')
BEGIN	
	SELECT * from Post where Product_ID in 
	(select Product_ID from Sports_Equiment) and Rate <= @maxPrice and Rate >= @minPrice;
END
ELSE if(@category = 'B')
BEGIN	
	SELECT * from Post where Product_ID in 
	(select Product_ID from Books) and Rate <= @maxPrice and Rate >= @minPrice;
END
ELSE if(@category = 'V')
BEGIN	
	SELECT * from Post where Product_ID in 
	(select Product_ID from Vehicles) and Rate <= @maxPrice and Rate >= @minPrice;
END
ELSE if(@category = 'F')
BEGIN	
	SELECT * from Post where Product_ID in 
	(select Product_ID from Fitness_Equipments) and Rate <= @maxPrice and Rate >= @minPrice;
END
ELSE if(@category = 'E')
BEGIN	
	SELECT * from Post where Product_ID in 
	(select Product_ID from Electronics) and Rate <= @maxPrice and Rate >= @minPrice;
END

drop procedure search;

EXEC search  'F', 0, 500;

select * from Post;
select * from [Order];



-------------------------------------------------------------------------------------------------
-- Procedure to calculate the bill
CREATE FUNCTION Cal_TotalAmt (@orderId varchar(20))
RETURNS int
AS
BEGIN		
		Declare @totAmt int;
		select @totAmt = sum(p.Rate*((DATEDIFF(DAY,o.From_Date,o.To_Date)+1))) from post p join [Order] o 
		on p.Post_ID=o.Post_ID where o.Order_ID = @orderId group by o.Order_ID;		
		Return @totAmt;
END

Drop procedure Cal_TotalAmt;

Declare @TotAmt int;
EXEC @TotAmt = Cal_TotalAmt
@orderId = 'OR002';
SELECT @TotAmt as 'Total_Amount';



------------------------------------------------------------------------
-- Procedure for  order history of a particular User
CREATE PROCEDURE Order_History @user_id varchar(20)
AS
BEGIN
		Select * from [Order] where User_ID = @user_id;
END

EXEC Order_History 'PS001';


------------------------------------------------------------------------
-- Procedure for  post history of a particular User
CREATE PROCEDURE Post_History @user_id varchar(20)
AS
BEGIN
		Select * from Post where User_ID = @user_id;
END

EXEC Post_History 'PS001';


------------------------------------------------------------------------
-- Procedure for  post and order history of all User
CREATE PROCEDURE All_User
As
BEGIN
Select Distinct p.USER_ID, p.POST_ID as POSTED_POSTS from Post p order by p.user_id, p.post_id;
Select DISTINCT o.USER_ID, o.ORDER_ID AS ORDER_NOS, o.post_id AS ORDERED_POST from [order] o order by o.user_id, o.order_id;
END;

EXEC All_User;


--Procedure for encryption of password	
CREATE PROCEDURE Decrypt_Password @user_id varchar(20), @password varchar(10), @bit BIT OUTPUT
AS
	declare @passwrd varchar(10);
	declare @encrypt_password varbinary(MAX);
	declare @count int;
	select @count = COUNT(Password_encrypt) from [USER] where USER_ID = @user_id;
	if(@count = 0)
		Begin
		SET @bit = 0
		print @bit
		End
	else
		Begin
		OPEN SYMMETRIC KEY SymKey_test
		DECRYPTION BY CERTIFICATE Certificate_test;
		declare @encr_pass varbinary(MAX);
		declare @decr_pass varchar(10);
		SELECT @encr_pass = Password_encrypt from [USER] where USER_ID = @user_id ;
			--print @encr_pass
			select @decr_pass = CONVERT(varchar, DecryptByKey(@encr_pass));
			if(@decr_pass = @password)
			Begin
			SET @bit = 1
			print @bit
			End
	else
		Begin
		SET @bit = 0
		print @bit
		End
	--print @decr_pass
		CLOSE SYMMETRIC KEY SymKey_test;
	End
	-- select * from [user];
	declare @bit BIT
	EXEC Decrypt_Password 'IM008', 'Wder@122', @bit OUTPUT
	DROP PROCEDURE Decrypt_Password;
	CREATE PROCEDURE Encrypt_Password @password varchar(10), @decrp_password varbinary(MAX) OUTPUT
	AS
	--declare @decrp_password varbinary(max);
	OPEN SYMMETRIC KEY SymKey_test
	DECRYPTION BY CERTIFICATE Certificate_test;
	SET @decrp_password = EncryptByKey (Key_GUID('SymKey_test'), @password)
	print @decrp_password
	CLOSE SYMMETRIC KEY SymKey_test;
	declare @decrp_password varbinary(MAX)
	EXEC Encrypt_Password 'Wder@122', @decrp_password OUTPUT

------------------------------------------------------------------------
-- Trigger for calculating total amount while inserting into Invoice Table

CREATE TRIGGER Invoice_amt
ON Invoice
for INSERT
AS
BEGIN
	Declare @TotAmt int;
	declare @oid varchar(20);
	Select @oid = [Order_ID] from inserted invoice;
	EXEC @TotAmt = Cal_TotalAmt
	@orderId = @oid;
	Update  invoice set Total_Amount= @TotAmt where invoice_id = (select invoice_id from inserted invoice);
END

Insert into invoice values('INV0123456', 'OR002', '2020-04-06', 0);

drop trigger invoice_amt;


------------------------------------------------------------------------
-- Trigger for Updating the status of post once ordered
CREATE TRIGGER Update_Post_Status
ON [Order]
for INSERT
AS
BEGIN
	Declare @pid varchar(20);
	Select @pid = [Post_ID] from inserted [Order];
	Update Post set Is_Available='No' where Post_ID = @pid;
END;





	
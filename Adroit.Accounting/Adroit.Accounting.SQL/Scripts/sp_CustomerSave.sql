/****** Object:  StoredProcedure [dbo].[sp_CustomerSave]    Script Date: 20-02-2023 20:22:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_CustomerSave]
(
	 @ID int
	,@Name varchar(50)
	,@Address1 varchar(200)
	,@Address2 varchar(200)
	,@Address3 varchar(200)
	,@CityId int
	,@StateId int
	,@EmailOtp varchar(6)
	,@MobileOtp varchar(6)
	,@ContactPersonName varchar(100)
	,@Mobile varchar(15)
	,@MobileAlternate varchar(15)
	,@Phone varchar(20)
	,@Email varchar(50)
	,@BusinessId smallint
	,@Requirement nvarchar(max)
	,@TotalFirm smallint
	,@CustomerType char(1)
	,@AdharUID varchar(12)
	,@TotalUsers smallint
	,@IsDeleted bit
	,@IsActive bit
	,@StatusId int
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Customer WHERE Id = @ID)
		BEGIN
			UPDATE Customer SET
			[Name] = @Name
			,Address1 = @Address1
			,Address2 = @Address2
			,CityId = @CityId
			,StateId = @StateId
			,EmailOtp = @EmailOtp
			,MobileOtp = @MobileOtp
			,ContactPersonName = @ContactPersonName
			,Mobile = @Mobile
			,MobileAlternate = @MobileAlternate
			,Phone = @Phone
			,Email = @Email
			,BusinessId = @BusinessId
			,Requirement = @Requirement
			,TotalFirm = @TotalFirm
			,CustomerType = @CustomerType
			,AdharUID = @AdharUID
			,TotalUsers = @TotalUsers
			,IsDeleted = @IsDeleted
			,IsActive = @IsActive
			,StatusId = @StatusId
			WHERE ID = @ID
			SELECT @ID;
		END
	ELSE
		BEGIN
			INSERT INTO Customer
			([Name],Address1,Address2,CityId,StateId,ContactPersonName,Mobile,MobileAlternate,Phone,Email,BusinessId,Requirement,TotalFirm,CustomerType,AdharUID,TotalUsers,IsDeleted,IsActive,EmailOtp,MobileOtp,StatusId)
			VALUES
			(@Name,@Address1,@Address2,@CityId,@StateId,@ContactPersonName,@Mobile,@MobileAlternate,@Phone,@Email,@BusinessId,@Requirement,@TotalFirm,@CustomerType,@AdharUID,@TotalUsers,@IsDeleted,@IsActive,@EmailOtp,@MobileOtp,@StatusId)

			SET @ID = SCOPE_IDENTITY();
			SELECT @ID;
		END
END
GO
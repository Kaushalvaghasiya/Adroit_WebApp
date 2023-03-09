CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerSave]
(
	 @Id int,
	 @Name varchar(50),
	 @BusinessName varchar(250),
	 @Address1 varchar(200),
	 @Address2 varchar(200),
	 @Address3 varchar(200),
	 @CityId int,
	 @StateId int,
	 @EmailOtp varchar(6),
	 @MobileOtp varchar(6),
	 @ContactPersonName varchar(100),
	 @Mobile varchar(15),
	 @MobileAlternate varchar(15),
	 @Phone varchar(20),
	 @Email varchar(50),
	 @BusinessId smallint,
	 @Requirement nvarchar(max),
	 @TotalFirm smallint,
	 @CustomerType char(1),
	 @AdharUID varchar(12),
	 @StatusId tinyint,
	 @TotalUsers smallint,
	 @AgreeTerms bit
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Customer WHERE Id = @Id)
		BEGIN
			UPDATE Customer SET
				[Name] = @Name,
				BusinessName = @BusinessName,
				Address1 = @Address1,
				Address2 = @Address2,
				CityId = @CityId,
				StateId = @StateId,
				EmailOtp = @EmailOtp,
				MobileOtp = @MobileOtp,
				ContactPersonName = @ContactPersonName,
				Mobile = @Mobile,
				MobileAlternate = @MobileAlternate,
				Phone = @Phone,
				Email = @Email,
				BusinessId = @BusinessId,
				Requirement = @Requirement,
				TotalFirm = @TotalFirm,
				CustomerType = @CustomerType,
				AdharUID = @AdharUID,
				TotalUsers = @TotalUsers,
				StatusId = @StatusId,
				AgreeTerms = @AgreeTerms
				WHERE ID = @Id
			SELECT @Id;
		END
	ELSE
		BEGIN
			INSERT INTO Customer
				([Name], BusinessName, Address1, Address2, CityId, StateId, ContactPersonName, Mobile, MobileAlternate, Phone,
					Email, BusinessId, Requirement, TotalFirm, CustomerType, AdharUID, TotalUsers, IsActive, EmailOtp, MobileOtp, StatusId, AgreeTerms)
			VALUES
				(@Name, @BusinessName, @Address1, @Address2, @CityId, @StateId, @ContactPersonName, @Mobile, @MobileAlternate, @Phone,
					@Email, @BusinessId, @Requirement, @TotalFirm, @CustomerType, @AdharUID, @TotalUsers, 1, @EmailOtp, @MobileOtp, @StatusId, @AgreeTerms)

			SET @Id = SCOPE_IDENTITY();
			SELECT @Id;
		END
END
GO
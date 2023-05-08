CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerSave]
(
	 @Id int,
	 @Name varchar(50),
	 @Address1 varchar(200),
	 @Address2 varchar(200),
	 @Address3 varchar(200),
	 @CityId int,
	 @StateId int,
	 @PinCode VARCHAR(10),
	 @ContactPersonName varchar(100),
	 @Mobile varchar(15),
	 @MobileAlternate varchar(15),
	 @Phone varchar(20),
	 @Email varchar(50),
	 @BusinessId smallint,
	 @Requirement nvarchar(max),
	 @TotalFirm smallint,
	 @CustomerType varchar(1),
	 @IsDeleted bit,
	 @AdharUID varchar(12),
	 @TotalUsers smallint,
	 @IsActive bit,
	 @EmailOtp varchar(6),
	 @MobileOtp varchar(6),
	 @StatusId varchar(1),
	 @BusinessName varchar(250),
	 @AgreeTerms bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM Customer WHERE Id = @Id)
			BEGIN
				UPDATE Customer SET
					[Name] = @Name,
					Address1 = @Address1,
					Address2 = @Address2,
					Address3=@Address3,
					CityId = @CityId,
					StateId = @StateId,
					Pincode=@Pincode,
					ContactPersonName = @ContactPersonName,
					Mobile = @Mobile,
					MobileAlternate = @MobileAlternate,
					Phone = @Phone,
					Email = @Email,
					BusinessId = @BusinessId,
					Requirement = @Requirement,
					TotalFirm = @TotalFirm,
					CustomerType = @CustomerType,
					IsDeleted=@IsDeleted,
					AdharUID = @AdharUID,
					TotalUsers = @TotalUsers,
					IsActive=@IsActive,
					EmailOtp = @EmailOtp,
					MobileOtp = @MobileOtp,
					StatusId=@StatusId,
					BusinessName=@BusinessName,
					AgreeTerms = @AgreeTerms
					WHERE ID = @Id
			END
		ELSE
			BEGIN
				INSERT INTO Customer
					([Name], Address1, Address2,Address3, CityId, StateId,Pincode,ContactPersonName, Mobile, MobileAlternate, Phone, Email, BusinessId, Requirement, TotalFirm, CustomerType,IsDeleted ,
					 AdharUID, TotalUsers, IsActive, EmailOtp,MobileOtp,StatusId,BusinessName, AgreeTerms)
				VALUES
					(
				 @Name,@Address1,@Address2 ,@Address3 ,@CityId ,@StateId,@PinCode ,@ContactPersonName ,@Mobile,
				 @MobileAlternate,@Phone,@Email,@BusinessId,@Requirement,@TotalFirm,@CustomerType,@IsDeleted,
				 @AdharUID,@TotalUsers,@IsActive,@EmailOtp,@MobileOtp,@StatusId,@BusinessName,@AgreeTerms
					)

				SET @Id = SCOPE_IDENTITY()

				
			END

		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
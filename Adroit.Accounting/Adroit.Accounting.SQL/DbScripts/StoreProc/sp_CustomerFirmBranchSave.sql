CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchSave]
(
	 @Id int,
	 @FirmId INT,
	 @Title varchar(100),
	 @PrintTitle varchar(100),
	 @ShortTitle varchar(10),
	 @FirmBranchTypeId INT,
	 @Address1 varchar(200),
	 @Address2 varchar(200),
	 @Address3 varchar(200),
	 @CityId int,
	 @StateId int,
	 @CountryId INT,
	 @PinCode VARCHAR(12),
	 @Phone varchar(15),
	 @ContactPersonName varchar(30),
	 @Mobile varchar(15),
	 @MobileAlternate varchar(15),
	 @Email varchar(50),
	 @GSTNumber varchar(15),
	 @PAN varchar(10),
	 @EWBAddress1 varchar(200),
	 @EWBAddress2 nvarchar(200),
	 @RenewalDate datetime,
	 @SetupPrice decimal(16,2),
	 @RenewalPrice decimal(16,2),
	 @OrderNumber smallint,
	 @Active bit,
	 @SoftwarePlanId tinyint,
	 @LoginId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM CustomerFirmBranch WHERE FirmId IN (SELECT Id FROM [CustomerFirm] WHERE [CustomerId] = @CustomerId) AND Id = @Id)
			BEGIN
				UPDATE CustomerFirmBranch SET
					--FirmId= @FirmId,
					--Title= @Title,
					PrintTitle= @PrintTitle,
					ShortTitle= @ShortTitle,
					--FirmBranchTypeId= @FirmBranchTypeId,
					Address1= @Address1,
					Address2= @Address2,
					Address3= @Address3,
					CityId= @CityId,
					StateId= @StateId, 
					CountryId=@CountryId,  
					Pincode= @PinCode, 
					Phone= @Phone,
					--ContactPersonName= @ContactPersonName, 
					--Mobile= @Mobile, 
					MobileAlternate= @MobileAlternate,
					--Email= @Email, 
					--GSTNumber= @GSTNumber,
					--PAN=@PAN,  
					--EWBAddress1= @EWBAddress1,
					--EWBAddress2=@EWBAddress2,  
					--RenewalDate= @RenewalDate, 
					--SetupPrice= @SetupPrice,
					--RenewalPrice= @RenewalPrice, 
					--OrderNumber= @OrderNumber, 
					ModifiedById=@LoginId, 
					ModifiedOn=GETUTCDATE()
					--Active=@Active,
					--SoftwarePlanId = @SoftwarePlanId
					WHERE FirmId IN (SELECT Id FROM [CustomerFirm] WHERE [CustomerId] = @CustomerId) AND ID = @Id
			END
		ELSE
			BEGIN
				declare @branchlimit int = 0
				declare @branchcreated int = 0
				SELECT @branchlimit = BranchLimit FROM CustomerFirm Where [CustomerId] = @CustomerId AND Id = @FirmId
				SELECT @branchcreated = count(*) FROM CustomerFirmBranch Where FirmId = @FirmId AND Deleted = 0
				IF (@branchcreated >= @branchlimit)
				BEGIN
					RAISERROR ('%s', 16, 1, 'Branch limit exceeded');
				END

				INSERT INTO CustomerFirmBranch
					(FirmId,Title,PrintTitle,ShortTitle,FirmBranchTypeId,Address1,Address2,Address3,CityId,
					StateId,CountryId,Pincode,Phone,ContactPersonName,Mobile,MobileAlternate,Email,GSTNumber,
					PAN,EWBAddress1,EWBAddress2,RenewalDate,SetupPrice,RenewalPrice,OrderNumber,AddedById,AddedOn,
					Active,SoftwarePlanId)
				VALUES
					(@FirmId,@Title,@PrintTitle,@ShortTitle,@FirmBranchTypeId,@Address1,@Address2,@Address3,@CityId,
					@StateId,@CountryId,@PinCode,@Phone,@ContactPersonName,@Mobile,@MobileAlternate,@Email,@GSTNumber,
					@PAN,@EWBAddress1,@EWBAddress2,@RenewalDate,@SetupPrice,@RenewalPrice,@OrderNumber,@LoginId,GETUTCDATE(),
					@Active,@SoftwarePlanId
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
		IF (CHARINDEX('IX_CustomerFirmBranchShortTitle', @message) > 0)
		BEGIN
			SET @message = 'Branch short title ('+ @ShortTitle +') already exist!'
		END
		ELSE IF (CHARINDEX('IX_CustomerFirmBranch', @message) > 0)
		BEGIN
			SET @message = 'Branch ('+ @Title +') already exist!'
		END

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
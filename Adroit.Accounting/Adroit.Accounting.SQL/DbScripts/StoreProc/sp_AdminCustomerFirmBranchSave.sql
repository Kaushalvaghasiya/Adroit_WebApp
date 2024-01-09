CREATE OR ALTER PROCEDURE [dbo].[sp_AdminCustomerFirmBranchSave]
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
	 @AddedById INT,
	 @ModifiedById INT,
	 @Active bit,
	 @SoftwarePlanId tinyint
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		DECLARE @CustomerId int = dbo.fn_GetCustomerId(@AddedById);

		DECLARE @TalukaId INT
		SELECT @TalukaId = City.TalukaId from City WHERE City.Id = @CityId;

		DECLARE @DistrictId INT
		SELECT @DistrictId = Taluka.DistrictId from Taluka WHERE Taluka.Id = @TalukaId;

		DECLARE @StateId INT
		SELECT @StateId = District.StateId from District WHERE District.Id = @DistrictId;

		DECLARE @CountryId SMALLINT
		SELECT @CountryId = State.CountryId from State WHERE State.Id = @StateId;

		IF EXISTS (SELECT 1 FROM CustomerFirmBranch WHERE Id = @Id)
		BEGIN
			UPDATE CustomerFirmBranch SET
				FirmId= @FirmId,
				Title= @Title,
				PrintTitle= @PrintTitle,
				ShortTitle= @ShortTitle,
				FirmBranchTypeId= @FirmBranchTypeId,
				Address1= @Address1,
				Address2= @Address2,
				Address3= @Address3,
				CityId= @CityId,
				StateId= @StateId, 
				CountryId=@CountryId,  
				Pincode= @PinCode, 
				Phone= @Phone,
				ContactPersonName= @ContactPersonName, 
				Mobile= @Mobile, 
				MobileAlternate= @MobileAlternate,
				Email= @Email, 
				GSTNumber= @GSTNumber,
				PAN=@PAN,  
				EWBAddress1= @EWBAddress1,
				EWBAddress2=@EWBAddress2,  
				RenewalDate= @RenewalDate, 
				SetupPrice= @SetupPrice,
				RenewalPrice= @RenewalPrice, 
				OrderNumber= @OrderNumber, 
				ModifiedById=@ModifiedById, 
				ModifiedOn=GETUTCDATE(),
				Active=@Active,
				SoftwarePlanId = @SoftwarePlanId
				WHERE ID = @Id
		END
		ELSE
		BEGIN

			declare @branchlimit int = 0
			declare @branchcreated int = 0
			SELECT @branchlimit = BranchLimit FROM CustomerFirm Where Id = @FirmId
			SELECT @branchcreated = count(*) FROM CustomerFirmBranch Where FirmId = @FirmId ANd Deleted = 0
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
				@PAN,@EWBAddress1,@EWBAddress2,@RenewalDate,@SetupPrice,@RenewalPrice,@OrderNumber,@AddedById,GETUTCDATE(),
				@Active,@SoftwarePlanId)

			SET @Id = SCOPE_IDENTITY()

			DECLARE @ProductBranchId NVARCHAR(max) = (
				SELECT STRING_AGG(CAST(Id AS NVARCHAR(max)), ',') WITHIN GROUP (ORDER BY Id) 
				FROM (
					SELECT DISTINCT Id
					FROM Product
					WHERE CustomerId = @CustomerId
				)ProductId
			)

			INSERT INTO [ProductBranchMapping] (ProductId,BranchId,AddedById,AddedOn)
			SELECT Id,@Id,@AddedById,GETUTCDATE()
			FROM dbo.[fnStringToIntArray](@ProductBranchId)

			DECLARE @CustomerAccountBranchId NVARCHAR(max) = (
				SELECT STRING_AGG(CAST(Id AS NVARCHAR(max)), ',') WITHIN GROUP (ORDER BY Id) 
				FROM (
					SELECT DISTINCT Id
					FROM CustomerAccount
					WHERE CustomerId = @CustomerId
				)AccountId
			)

			INSERT INTO [CustomerAccountBranchMapping] (AccountId,BranchId,AddedById,AddedOn)
			SELECT Id,@Id,@AddedById,GETUTCDATE()
			FROM dbo.[fnStringToIntArray](@CustomerAccountBranchId)

			DECLARE @CustomerBookBranchId NVARCHAR(max) = (
				SELECT STRING_AGG(CAST(Id AS NVARCHAR(max)), ',') WITHIN GROUP (ORDER BY Id) 
				FROM (
					SELECT DISTINCT Id
					FROM CustomerBook
					WHERE CustomerId = @CustomerId
				)BookId
			)

			INSERT INTO [CustomerBookBranchMapping] (BookId,BranchId,AddedById,AddedOn)
			SELECT Id,@Id,@AddedById,GETUTCDATE()
			FROM dbo.[fnStringToIntArray](@CustomerBookBranchId)

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
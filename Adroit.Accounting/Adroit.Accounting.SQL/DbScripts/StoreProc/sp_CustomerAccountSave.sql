CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountSave]
(
	@Id INT
	,@LoginId INT
	,@FirmId INT
	,@Name NVARCHAR(100)
	,@PrintName NVARCHAR(100)
	,@AccountGroupId INT
	,@Address1 NVARCHAR(100)
	,@Address2 NVARCHAR(100)
	,@Address3 NVARCHAR(100)
	,@CityId INT
	,@StateId INT
	,@CountryId INT
	,@Pincode VARCHAR(10)
	,@KM VARCHAR(4)
	,@ContactPersonName NVARCHAR(30)
	,@Mobile VARCHAR(15)
	,@MobileAlternate VARCHAR(15)
	,@Email VARCHAR(50)
	,@GSTNumber VARCHAR(15)
	,@PAN VARCHAR(12)
	,@AreaName VARCHAR(20)
	,@RateWithGST BIT
	,@GSTInvoiceTypeId INT
	,@EximCode VARCHAR(30)
	,@IsIGST BIT
	,@GSTNumberTransport VARCHAR(15)
	,@TransportName VARCHAR(50)
	,@VehicleNumber VARCHAR(15)
	,@DeliveryAccountBranchMappingId INT
	,@ShippingAccountBranchMappingId INT
	,@BrokerMappingId INT
	,@CreditDays INT
	,@Discount DECIMAL(18,3)
	,@TDS DECIMAL(18,3)
	,@TCS DECIMAL(18,3)
	,@CreditLimit DECIMAL(18,0)
	,@InterestRate DECIMAL(2,2)
	,@Commission DECIMAL(5,3)
	,@IsEcommerce BIT
	,@AdharUID VARCHAR(12)
	,@TAN  VARCHAR(10)
	,@CompositParty BIT
	,@RCMParty BIT
	,@CapitalPercentage DECIMAL(5,2)
	,@OwnerBranchId INT
	,@Active BIT
	,@City NVARCHAR(100)
	,@DistrictId INT
	,@District  NVARCHAR(100)
	,@TalukaId INT
	,@Taluka NVARCHAR(100)
	,@Remarks  NVARCHAR(max)
	,@CustomerAccountBranchIds NVARCHAR(MAX)

)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

		IF(ISNULL(@CountryId,0) >= 0 AND ISNULL(@StateId,0) >= 0)
		BEGIN 			
			IF(ISNULL(@District,'') != '' AND ISNULL(@DistrictId,0) <= 0)
			BEGIN 
				EXEC @DistrictId = [dbo].[sp_DistrictSave] 0,@District,@StateId,1
				SELECT @DistrictId = Id FROM District WHERE Title = @District AND Active = 1
			END
			
			IF(ISNULL(@DistrictId,0) >= 0 AND ISNULL(@Taluka,'') != '' AND ISNULL(@TalukaId,0) <= 0)
			BEGIN 
				EXEC @TalukaId = [dbo].[sp_TalukaSave] 0,@Taluka,@DistrictId,1
				SELECT @TalukaId = Id FROM Taluka WHERE Title = @Taluka AND Active = 1
			END

			IF(ISNULL(@TalukaId,0) >= 0 AND ISNULL(@City,'') != '' AND ISNULL(@CityId,0) <= 0)
			BEGIN 
				EXEC @CityId = [dbo].[sp_CitySave] 0,@City,@TalukaId,1
				SELECT @CityId = Id FROM City WHERE Title = @City AND Active = 1
			END
		END

		IF EXISTS (SELECT 1 FROM CustomerAccount WHERE Id = @Id) OR EXISTS (SELECT 1 FROM CustomerAccount WHERE [Name] = @Name AND Deleted = 1)
			BEGIN
				UPDATE  CustomerAccount SET
						[CustomerId] = @CustomerId
						,[Name] = @Name
						,[PrintName] = @PrintName
						,[AccountGroupId] = @AccountGroupId
						,[Address1] = @Address1
						,[Address2] = @Address2
						,[Address3] = @Address3
						,[CityId] = @CityId
						,[StateId] = @StateId
						,[CountryId] = @CountryId
						,[Pincode] = @Pincode
						,[KM] = @KM
						,[ContactPersonName] = @ContactPersonName
						,[Mobile] = @Mobile
						,[MobileAlternate] = @MobileAlternate
						,[Email] = @Email
						,[GSTNumber] = @GSTNumber
						,[PAN] = @PAN
						,[AreaName] = @AreaName
						,[RateWithGST] = @RateWithGST
						,[GSTInvoiceTypeId] = @GSTInvoiceTypeId
						,[EximCode] = @EximCode
						,[IsIGST] = @IsIGST
						,[GSTNumberTransport] = @GSTNumberTransport
						,[TransportName] = @TransportName
						,[VehicleNumber] = @VehicleNumber
						,[DeliveryAccountBranchMappingId] = @DeliveryAccountBranchMappingId
						,[ShippingAccountBranchMappingId] = @ShippingAccountBranchMappingId
						,[BrokerMappingId] = @BrokerMappingId
						,[CreditDays] = @CreditDays
						,[Discount] = @Discount
						,[TDS] = @TDS
						,[TCS] = @TCS
						,[CreditLimit] = @CreditLimit
						,[InterestRate] = @InterestRate
						,[Commission] = @Commission
						,[IsEcommerce] = @IsEcommerce
						,[AdharUID] = @AdharUID
						,[TAN] = @TAN
						,[CompositParty] = @CompositParty
						,[RCMParty] = @RCMParty
						,[CapitalPercentage] = @CapitalPercentage
						,[OwnerBranchId] = @OwnerBranchId
						,[ModifiedById] = @LoginId
						,[ModifiedOn] = GETUTCDATE()
						,[Remarks] = @Remarks
						,[Active] = @Active
						,DeletedById = NULL
						,DeletedOn = NULL
						,Deleted = 0
					WHERE ID = @Id

					IF(ISNULL(@Id, 0) <= 0)
					BEGIN 
						SELECT @Id=Id FROM CustomerAccount WHERE [Name] = @Name 
					END

					DELETE FROM [CustomerAccountBranchMapping] WHERE AccountId = @Id
				END		
		ELSE
			BEGIN
				INSERT INTO CustomerAccount
					([CustomerId], [Name], [PrintName], [AccountGroupId], [Address1], [Address2], [Address3], [CityId], [StateId], [CountryId], [Pincode], 
					 [KM], [ContactPersonName], [Mobile], [MobileAlternate], [Email], [GSTNumber], [PAN], [AreaName], [RateWithGST], [GSTInvoiceTypeId], 
					 [EximCode], [IsIGST], [GSTNumberTransport], [TransportName], [VehicleNumber], [DeliveryAccountBranchMappingId], [ShippingAccountBranchMappingId], 
					 [BrokerMappingId], [CreditDays], [Discount], [TDS], [TCS], [CreditLimit], [InterestRate], [Commission], [IsEcommerce], [AdharUID], [TAN], 
					 [CompositParty], [RCMParty], [CapitalPercentage], [AddedOn], [AddedById], [OwnerBranchId], [Active], [Deleted], [Remarks])
				VALUES
					(@CustomerId, @Name, @PrintName, @AccountGroupId, @Address1, @Address2, @Address3, @CityId, @StateId, @CountryId, @Pincode, 
					 @KM, @ContactPersonName, @Mobile, @MobileAlternate, @Email, @GSTNumber, @PAN, @AreaName, @RateWithGST, @GSTInvoiceTypeId, 
					 @EximCode, @IsIGST, @GSTNumberTransport, @TransportName, @VehicleNumber, @DeliveryAccountBranchMappingId, @ShippingAccountBranchMappingId, 
					 @BrokerMappingId, @CreditDays, @Discount, @TDS, @TCS, @CreditLimit, @InterestRate, @Commission, @IsEcommerce, @AdharUID, @TAN, 
					 @CompositParty, @RCMParty, @CapitalPercentage, GETUTCDATE(), @LoginId, @OwnerBranchId, @Active, 0, @Remarks)

				SET @Id = SCOPE_IDENTITY()
			END

			INSERT INTO [CustomerAccountBranchMapping] 
				(AccountId,BranchId,AddedById,AddedOn)
			SELECT  @Id,Id,@LoginId,GETUTCDATE()
			FROM dbo.[fnStringToIntArray](@CustomerAccountBranchIds)

		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		IF (@message LIKE '%Violation of UNIQUE KEY%')
		BEGIN
			SET @message = 'Account ''' + @Name + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
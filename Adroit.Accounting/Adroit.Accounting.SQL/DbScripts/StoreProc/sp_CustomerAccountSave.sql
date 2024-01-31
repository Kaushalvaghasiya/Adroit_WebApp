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
	,@DeliveryAccountId INT
	,@ShippingAccountId INT
	,@BrokerId INT
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
	,@Remarks  NVARCHAR(max)
	,@CustomerAccountBranchIds NVARCHAR(MAX)

)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

		DECLARE @TalukaId INT
		SELECT @TalukaId = City.TalukaId from City WHERE City.Id = @CityId;

		DECLARE @DistrictId INT
		SELECT @DistrictId = Taluka.DistrictId from Taluka WHERE Taluka.Id = @TalukaId;

		DECLARE @StateId INT
		SELECT @StateId = District.StateId from District WHERE District.Id = @DistrictId;

		DECLARE @CountryId SMALLINT
		SELECT @CountryId = State.CountryId from State WHERE State.Id = @StateId;

		DECLARE @StateCode VARCHAR(5) = (
			SELECT Code
			FROM State
			WHERE Id = @StateId 
		)
		DECLARE @message VARCHAR(4000)

		IF LEFT(@GSTNumber, 2) != @StateCode AND @GSTNumber != ''
		BEGIN

			SET @message = 'Invaild GST Number.';
			RAISERROR ('%s', 16, 1, @message);
		END

		DECLARE @IdCheck INT
		SELECT @IdCheck = ID FROM CustomerAccount WHERE Id = @Id AND [CustomerId] = @CustomerId OR ([Name] = @Name AND Deleted = 1)

		IF ISNULL(@IdCheck, 0) = 0
		BEGIN
			INSERT INTO CustomerAccount
				([CustomerId], [Name], [PrintName], [AccountGroupId], [Address1], [Address2], [Address3], [CityId], [StateId], [CountryId], [Pincode], 
					[KM], [ContactPersonName], [Mobile], [MobileAlternate], [Email], [GSTNumber], [PAN], [AreaName], [RateWithGST], [GSTInvoiceTypeId], 
					[EximCode], [IsIGST], [GSTNumberTransport], [TransportName], [VehicleNumber], [DeliveryAccountId], [ShippingAccountId], 
					[BrokerId], [CreditDays], [Discount], [TDS], [TCS], [CreditLimit], [InterestRate], [Commission], [IsEcommerce], [AdharUID], [TAN], 
					[CompositParty], [RCMParty], [CapitalPercentage], [AddedOn], [AddedById], [OwnerBranchId], [Active], [Deleted], [Remarks])
			VALUES
				(@CustomerId, @Name, @PrintName, @AccountGroupId, @Address1, @Address2, @Address3, @CityId, @StateId, @CountryId, @Pincode, 
					@KM, @ContactPersonName, @Mobile, @MobileAlternate, @Email, @GSTNumber, @PAN, @AreaName, @RateWithGST, @GSTInvoiceTypeId, 
					@EximCode, @IsIGST, @GSTNumberTransport, @TransportName, @VehicleNumber, @DeliveryAccountId, @ShippingAccountId, 
					@BrokerId, @CreditDays, @Discount, @TDS, @TCS, @CreditLimit, @InterestRate, @Commission, @IsEcommerce, @AdharUID, @TAN, 
					@CompositParty, @RCMParty, @CapitalPercentage, GETUTCDATE(), @LoginId, @OwnerBranchId, @Active, 0, @Remarks)

			SET @Id = SCOPE_IDENTITY()
		END
		ELSE
		BEGIN
			SET @Id = @IdCheck
			
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
				,[DeliveryAccountId] = @DeliveryAccountId
				,[ShippingAccountId] = @ShippingAccountId
				,[BrokerId] = @BrokerId
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

			UPDATE  CustomerAccountBranchMapping SET
					DeletedById = @LoginId,
					DeletedOn = GETUTCDATE(),
					Deleted = 1
			WHERE AccountId = @Id AND [BranchId] NOT IN ( SELECT Id FROM dbo.[fnStringToIntArray](@CustomerAccountBranchIds))

			UPDATE  CustomerAccountBranchMapping SET
					DeletedById = NULL,
					DeletedOn = NULL,
					Deleted = 0
			WHERE AccountId = @Id AND [BranchId] IN ( SELECT Id FROM dbo.[fnStringToIntArray](@CustomerAccountBranchIds))

		END

		INSERT INTO [CustomerAccountBranchMapping] (AccountId,BranchId,AddedById,AddedOn)
		SELECT @Id,Id,@LoginId,GETUTCDATE()
		FROM dbo.[fnStringToIntArray](@CustomerAccountBranchIds)
		EXCEPT
		SELECT AccountId,BranchId,@loginId,GETUTCDATE() 
		FROM [dbo].[CustomerAccountBranchMapping]

		COMMIT TRAN
		SELECT @Id

	END TRY
	BEGIN CATCH
		DECLARE @error INT, @xstate INT;
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
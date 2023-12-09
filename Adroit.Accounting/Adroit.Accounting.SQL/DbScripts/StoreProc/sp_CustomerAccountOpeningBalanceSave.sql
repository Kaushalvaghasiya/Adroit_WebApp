CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountOpeningBalanceSave]
(
	@Id INT
	,@LoginId INT
	,@Name NVARCHAR(100)
	--,@PrintName NVARCHAR(100)
	--,@AccountGroupId INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

		--DECLARE @StateCode VARCHAR(5) = (
		--	SELECT Code
		--	FROM State
		--	WHERE Id = @StateId 
		--)
		DECLARE @message VARCHAR(4000)

		--IF LEFT(@GSTNumber, 2) != @StateCode AND @GSTNumber != ''
		--BEGIN

		--	SET @message = 'Invaild GST Number.';
		--	RAISERROR ('%s', 16, 1, @message);
		--END

		--IF(ISNULL(@CountryId,0) >= 0 AND ISNULL(@StateId,0) >= 0)
		--BEGIN 			
		--	IF(ISNULL(@District,'') != '' AND ISNULL(@DistrictId,0) <= 0)
		--	BEGIN 
		--		EXEC @DistrictId = [dbo].[sp_DistrictSave] 0,@District,@StateId,1
		--		SELECT @DistrictId = Id FROM District WHERE Title = @District AND Active = 1
		--	END
			
		--	IF(ISNULL(@DistrictId,0) >= 0 AND ISNULL(@Taluka,'') != '' AND ISNULL(@TalukaId,0) <= 0)
		--	BEGIN 
		--		EXEC @TalukaId = [dbo].[sp_TalukaSave] 0,@Taluka,@DistrictId,1
		--		SELECT @TalukaId = Id FROM Taluka WHERE Title = @Taluka AND Active = 1
		--	END

		--	IF(ISNULL(@TalukaId,0) >= 0 AND ISNULL(@City,'') != '' AND ISNULL(@CityId,0) <= 0)
		--	BEGIN 
		--		EXEC @CityId = [dbo].[sp_CitySave] 0,@City,@TalukaId,1
		--		SELECT @CityId = Id FROM City WHERE Title = @City AND Active = 1
		--	END
		--END

		--DECLARE @IdCheck INT
		--SELECT @IdCheck = ID FROM CustomerAccount WHERE Id = @Id OR ([Name] = @Name AND Deleted = 1)

		--IF ISNULL(@IdCheck, 0) = 0
		--BEGIN
		--	INSERT INTO CustomerAccount
		--		([CustomerId], [Name], [PrintName], [AccountGroupId], [Address1], [Address2], [Address3], [CityId], [StateId], [CountryId], [Pincode], 
		--			[KM], [ContactPersonName], [Mobile], [MobileAlternate], [Email], [GSTNumber], [PAN], [AreaName], [RateWithGST], [GSTInvoiceTypeId], 
		--			[EximCode], [IsIGST], [GSTNumberTransport], [TransportName], [VehicleNumber], [DeliveryAccountBranchMappingId], [ShippingAccountBranchMappingId], 
		--			[BrokerMappingId], [CreditDays], [Discount], [TDS], [TCS], [CreditLimit], [InterestRate], [Commission], [IsEcommerce], [AdharUID], [TAN], 
		--			[CompositParty], [RCMParty], [CapitalPercentage], [AddedOn], [AddedById], [OwnerBranchId], [Active], [Deleted], [Remarks])
		--	VALUES
		--		(@CustomerId, @Name, @PrintName, @AccountGroupId, @Address1, @Address2, @Address3, @CityId, @StateId, @CountryId, @Pincode, 
		--			@KM, @ContactPersonName, @Mobile, @MobileAlternate, @Email, @GSTNumber, @PAN, @AreaName, @RateWithGST, @GSTInvoiceTypeId, 
		--			@EximCode, @IsIGST, @GSTNumberTransport, @TransportName, @VehicleNumber, @DeliveryAccountBranchMappingId, @ShippingAccountBranchMappingId, 
		--			@BrokerMappingId, @CreditDays, @Discount, @TDS, @TCS, @CreditLimit, @InterestRate, @Commission, @IsEcommerce, @AdharUID, @TAN, 
		--			@CompositParty, @RCMParty, @CapitalPercentage, GETUTCDATE(), @LoginId, @OwnerBranchId, @Active, 0, @Remarks)

		--	SET @Id = SCOPE_IDENTITY()
		--END
		--ELSE
		--BEGIN
		--	SET @Id = @IdCheck
			
		--	UPDATE  CustomerAccount SET
		--		[CustomerId] = @CustomerId
		--		,[Name] = @Name
		--		,[PrintName] = @PrintName
		--		,[AccountGroupId] = @AccountGroupId
		--		,[Address1] = @Address1
		--		,[Address2] = @Address2
		--		,[Address3] = @Address3
		--		,[CityId] = @CityId
		--		,[StateId] = @StateId
		--		,[CountryId] = @CountryId
		--		,[Pincode] = @Pincode
		--		,[KM] = @KM
		--		,[ContactPersonName] = @ContactPersonName
		--		,[Mobile] = @Mobile
		--		,[MobileAlternate] = @MobileAlternate
		--		,[Email] = @Email
		--		,[GSTNumber] = @GSTNumber
		--		,[PAN] = @PAN
		--		,[AreaName] = @AreaName
		--		,[RateWithGST] = @RateWithGST
		--		,[GSTInvoiceTypeId] = @GSTInvoiceTypeId
		--		,[EximCode] = @EximCode
		--		,[IsIGST] = @IsIGST
		--		,[GSTNumberTransport] = @GSTNumberTransport
		--		,[TransportName] = @TransportName
		--		,[VehicleNumber] = @VehicleNumber
		--		,[DeliveryAccountBranchMappingId] = @DeliveryAccountBranchMappingId
		--		,[ShippingAccountBranchMappingId] = @ShippingAccountBranchMappingId
		--		,[BrokerMappingId] = @BrokerMappingId
		--		,[CreditDays] = @CreditDays
		--		,[Discount] = @Discount
		--		,[TDS] = @TDS
		--		,[TCS] = @TCS
		--		,[CreditLimit] = @CreditLimit
		--		,[InterestRate] = @InterestRate
		--		,[Commission] = @Commission
		--		,[IsEcommerce] = @IsEcommerce
		--		,[AdharUID] = @AdharUID
		--		,[TAN] = @TAN
		--		,[CompositParty] = @CompositParty
		--		,[RCMParty] = @RCMParty
		--		,[CapitalPercentage] = @CapitalPercentage
		--		,[OwnerBranchId] = @OwnerBranchId
		--		,[ModifiedById] = @LoginId
		--		,[ModifiedOn] = GETUTCDATE()
		--		,[Remarks] = @Remarks
		--		,[Active] = @Active
		--		,DeletedById = NULL
		--		,DeletedOn = NULL
		--		,Deleted = 0
		--	WHERE ID = @Id

		--	UPDATE  CustomerAccountBranchMapping SET
		--			DeletedById = @LoginId,
		--			DeletedOn = GETUTCDATE(),
		--			Deleted = 1
		--	WHERE AccountId = @Id AND [BranchId] NOT IN ( SELECT Id FROM dbo.[fnStringToIntArray](@CustomerAccountBranchIds))

		--	UPDATE  CustomerAccountBranchMapping SET
		--			DeletedById = NULL,
		--			DeletedOn = NULL,
		--			Deleted = 0
		--	WHERE AccountId = @Id AND [BranchId] IN ( SELECT Id FROM dbo.[fnStringToIntArray](@CustomerAccountBranchIds))

		--END

		COMMIT TRAN
		SELECT @Id

	END TRY
	BEGIN CATCH
		DECLARE @error INT, @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		IF (@message LIKE '%Violation of UNIQUE KEY%')
		BEGIN
			SET @message = 'Account opening balance''' + @Name + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
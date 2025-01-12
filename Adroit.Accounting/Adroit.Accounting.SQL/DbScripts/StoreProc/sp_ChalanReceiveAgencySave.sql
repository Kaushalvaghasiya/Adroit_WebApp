CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanReceiveAgencySave]
(
	@LoginId INT,
	@BranchId INT,
	@Id INT,
	@SenderBranchAccountMappingid INT,
    @ArrivalDate DATETIME,
    @BillNumberBranch INT,
    @BillNumberFirm VARCHAR(20),
    @FirmChalanNumber VARCHAR(30),
    @FirmChalanDate DATETIME,
    @CityIdFrom INT,
    @CityIdTo INT,
    @VehicleId INT,
    @BillAccountBranchMappingId INT,
    @DriverId INT,
    @EwayBillNo VARCHAR(25),
    @GoDownNumber INT,
    @ToPayAmount DECIMAL(9, 2),
    @SalesAccountBranchMappingId INT,
    @ToPayAccountBranchMappingId INT,
    @CrossingAmount DECIMAL(9, 2),
    @CrossingAmountAccountBranchMappingId INT,
    @CrossingCommission DECIMAL(9, 2),
    @CrossingCommissionAccountBranchMappingId INT,
    @CrossingHamali DECIMAL(9, 2),
    @CrossingHamaliAccountBranchMappingId INT,
    @CrossingDeliveryCharge DECIMAL(9, 2),
    @CrossingDeliveryAccountBranchMappingId INT,
    @BrokerAmount DECIMAL(9, 2),
    @BrokerBranchMappingId INT,
    @TaxableAmount DECIMAL(9, 2),
    @TDSPercent DECIMAL(9, 2),
    @TDSAmount DECIMAL(9, 2),
    @AdvanceCash DECIMAL(9, 2),
    @AdvanceNeft DECIMAL(9, 2),
    @OtherLess DECIMAL(9, 2),
    @ReceiveCash DECIMAL(9, 2),
    @OtherPlus DECIMAL(9, 2),
	@NetAmount DECIMAL(9, 2),
    @Notes NVARCHAR(250),
    @ChalanReceiveAgencyDetailTableList NVARCHAR(MAX),
	@IsAutoLR BIT,
    @Deleted BIT
)
AS
BEGIN
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);
	BEGIN TRAN
	BEGIN TRY
		exec [sp_ValidateLoginBranch] @LoginId, @BranchId, @YearId

		DECLARE @FirmId INT = DBO.fn_GetLoggedInFirmId (@LoginId);
	
		DECLARE @message VARCHAR(4000);

		IF @YearId IS NULL
		BEGIN
			SET @message = 'Year Not Found!';
			RAISERROR ('%s', 16, 1, @message);
		END

		  DECLARE @ChalanReceiveAgencyDetailTable TABLE(
		    SrNumber INT,
		    EwayBillNo VARCHAR(25) ,
		    LRNumber VARCHAR(20) ,
		    LRDate DATETIME,
		    PrivateMarka NVARCHAR(30) ,
		    CityIdFrom INT,
		    CityIdTo INT,
		    AccountBranchMappingId INT,
		    DeliveryAccountBranchMappingId INT,
		    LRPayTypeId TINYINT,
		    Parcel SMALLINT ,
		    ChargeWeight DECIMAL(18, 3) ,
		    BillAccountBranchMappingId INT ,
		    NetAmount DECIMAL(18, 3) 
		   
		);

	    INSERT INTO @ChalanReceiveAgencyDetailTable
		SELECT
		    SrNumber, EwayBillNo, LRNumber, LRDate, PrivateMarka, CityIdFrom, CityIdTo, AccountBranchMappingId, DeliveryAccountBranchMappingId, LRPayTypeId, Parcel, ChargeWeight, BillAccountBranchMappingId, NetAmount
		FROM OPENJSON(@ChalanReceiveAgencyDetailTableList)
		WITH (
			SrNumber INT,
		    EwayBillNo VARCHAR(25) ,
		    LRNumber VARCHAR(20) ,
		    LRDate DATETIME,
		    PrivateMarka NVARCHAR(30) ,
		    CityIdFrom INT,
		    CityIdTo INT,
		    AccountBranchMappingId INT,
		    DeliveryAccountBranchMappingId INT,
		    LRPayTypeId TINYINT,
		    Parcel SMALLINT,
		    ChargeWeight DECIMAL(18, 3) ,
		    BillAccountBranchMappingId INT ,
		    NetAmount DECIMAL(18, 3) 
		);

	


		IF ISNULL(@BillNumberBranch, 0) = 0
		BEGIN
			SELECT @BillNumberBranch = ISNULL(MAX(BillNumberBranch),0) + 1
			FROM [Z-ChalanReceiveAgencyMaster-Z]
			WHERE [Z-ChalanReceiveAgencyMaster-Z].BranchId = @BranchId AND [Z-ChalanReceiveAgencyMaster-Z].YearId = @YearId AND [Z-ChalanReceiveAgencyMaster-Z].SenderBranchAccountMappingid = @SenderBranchAccountMappingid
		END

		IF ISNULL(@BillNumberFirm, 0) = 0
		BEGIN
			SELECT @BillNumberFirm = ISNULL(MAX(BillNumberFirm),0) + 1
			FROM [Z-ChalanReceiveAgencyMaster-Z]
			WHERE [Z-ChalanReceiveAgencyMaster-Z].FirmId = @FirmId AND [Z-ChalanReceiveAgencyMaster-Z].YearId = @YearId AND [Z-ChalanReceiveAgencyMaster-Z].SenderBranchAccountMappingid = @SenderBranchAccountMappingid
		END
		IF ISNULL(@FirmChalanNumber, 0) = 0
		BEGIN
			SELECT @FirmChalanNumber = ISNULL(MAX(FirmChalanNumber),0) + 1
			FROM [Z-ChalanReceiveAgencyMaster-Z]
			WHERE [Z-ChalanReceiveAgencyMaster-Z].FirmId = @FirmId AND [Z-ChalanReceiveAgencyMaster-Z].YearId = @YearId AND [Z-ChalanReceiveAgencyMaster-Z].SenderBranchAccountMappingid = @SenderBranchAccountMappingid
		END

		DECLARE @IdCheck INT
		SELECT @IdCheck = ID FROM [Z-ChalanReceiveAgencyMaster-Z] 
							WHERE (Id = @Id) 
							OR (BranchId = @BranchId AND BillNumberBranch = @BillNumberBranch AND BillNumberFirm = @BillNumberFirm AND FirmChalanNumber = @FirmChalanNumber AND Deleted = 1)
		IF ISNULL(@IdCheck, 0) = 0
		BEGIN

			INSERT INTO [Z-ChalanReceiveAgencyMaster-Z] 
				([BranchId], [FirmId], [YearId], [SenderBranchAccountMappingid], [ArrivalDate], [BillNumberBranch], [BillNumberFirm], [FirmChalanNumber], [FirmChalanDate],
				[CityIdFrom], [CityIdTo], [VehicleId], [BillAccountBranchMappingId], [DriverId], [EwayBillNo], [GoDownNumber], [ToPayAmount], [SalesAccountBranchMappingId],
				[ToPayAccountBranchMappingId], [CrossingAmount], [CrossingAmountAccountBranchMappingId], [CrossingCommission], [CrossingCommissionAccountBranchMappingId],
				[CrossingHamali], [CrossingHamaliAccountBranchMappingId], [CrossingDeliveryCharge], [CrossingDeliveryAccountBranchMappingId], [BrokerAmount], [BrokerBranchMappingId],
				[TaxableAmount], [TDSPercent], [TDSAmount], [AdvanceCash], [AdvanceNeft], [OtherLess], [ReceiveCash], [OtherPlus],[NetAmount], [Notes],[IsAutoLR], [AddedOn], [AddedById],
				[ModifiedById], [ModifiedOn], [Deleted], [DeletedById], [DeletedOn])
			VALUES 
				(@BranchId, @FirmId, @YearId, @SenderBranchAccountMappingid, @ArrivalDate, @BillNumberBranch, @BillNumberFirm, @FirmChalanNumber, @FirmChalanDate,
				@CityIdFrom, @CityIdTo, @VehicleId, @BillAccountBranchMappingId, @DriverId, @EwayBillNo, @GoDownNumber, @ToPayAmount, @SalesAccountBranchMappingId,
				@ToPayAccountBranchMappingId, @CrossingAmount, @CrossingAmountAccountBranchMappingId, @CrossingCommission, @CrossingCommissionAccountBranchMappingId,
				@CrossingHamali, @CrossingHamaliAccountBranchMappingId, @CrossingDeliveryCharge, @CrossingDeliveryAccountBranchMappingId, @BrokerAmount, @BrokerBranchMappingId,
				@TaxableAmount, @TDSPercent, @TDSAmount, @AdvanceCash, @AdvanceNeft, @OtherLess, @ReceiveCash, @OtherPlus,@NetAmount, @Notes,@IsAutoLR ,GETUTCDATE(), @LoginId,
				NULL, NULL, 0, NULL, NULL)

			SET @Id = SCOPE_IDENTITY();
			
		END
		ELSE
		BEGIN
		SET @Id = @IdCheck

			UPDATE [Z-ChalanReceiveAgencyMaster-Z] SET 
			[SenderBranchAccountMappingid] = @SenderBranchAccountMappingid, [ArrivalDate] = @ArrivalDate,
			[BillNumberBranch] = @BillNumberBranch, [BillNumberFirm] = @BillNumberFirm, [FirmChalanNumber] = @FirmChalanNumber, [FirmChalanDate] = @FirmChalanDate,
			[CityIdFrom] = @CityIdFrom, [CityIdTo] = @CityIdTo, [VehicleId] = @VehicleId, [BillAccountBranchMappingId] = @BillAccountBranchMappingId, [DriverId] = @DriverId,
			[EwayBillNo] = @EwayBillNo, [GoDownNumber] = @GoDownNumber, [ToPayAmount] = @ToPayAmount, [SalesAccountBranchMappingId] = @SalesAccountBranchMappingId,
			[ToPayAccountBranchMappingId] = @ToPayAccountBranchMappingId, [CrossingAmount] = @CrossingAmount, [CrossingAmountAccountBranchMappingId] = @CrossingAmountAccountBranchMappingId,
			[CrossingCommission] = @CrossingCommission, [CrossingCommissionAccountBranchMappingId] = @CrossingCommissionAccountBranchMappingId, [CrossingHamali] = @CrossingHamali,
			[CrossingHamaliAccountBranchMappingId] = @CrossingHamaliAccountBranchMappingId, [CrossingDeliveryCharge] = @CrossingDeliveryCharge,
			[CrossingDeliveryAccountBranchMappingId] = @CrossingDeliveryAccountBranchMappingId, [BrokerAmount] = @BrokerAmount, [BrokerBranchMappingId] = @BrokerBranchMappingId,
			[TaxableAmount] = @TaxableAmount, [TDSPercent] = @TDSPercent, [TDSAmount] = @TDSAmount, [AdvanceCash] = @AdvanceCash, [AdvanceNeft] = @AdvanceNeft,
			[OtherLess] = @OtherLess, [ReceiveCash] = @ReceiveCash, [OtherPlus] = @OtherPlus,[NetAmount] = @NetAmount, [Notes] = @Notes, [ModifiedById] = @LoginId, [ModifiedOn] = GETUTCDATE(),
			[Deleted] = 0, [DeletedById] = NULL, [DeletedOn] = NULL
			WHERE [Id] = @Id;

			UPDATE  [Z-ChalanReceiveAgencyDetail-Z] SET
					DeletedById = @LoginId,
					DeletedOn = GETUTCDATE(),
					Deleted = 1
			WHERE ChalanReceiveAgencyMasterId = @Id AND LRNumber NOT IN ( SELECT LRNumber FROM @ChalanReceiveAgencyDetailTable)

			UPDATE  [Z-ChalanReceiveAgencyDetail-Z] SET
					DeletedById = NULL,
					DeletedOn = NULL,
					Deleted = 0
			WHERE ChalanReceiveAgencyMasterId = @Id AND LRNumber IN ( SELECT LRNumber FROM @ChalanReceiveAgencyDetailTable)
		END

		MERGE INTO [Z-ChalanReceiveAgencyDetail-Z] AS ChalanReceiveAgencyTarget
		USING @ChalanReceiveAgencyDetailTable AS ChalanReceiveAgencySource
		ON ChalanReceiveAgencyTarget.ChalanReceiveAgencyMasterId = @Id AND ChalanReceiveAgencyTarget.LRNumber = ChalanReceiveAgencySource.LRNumber
		WHEN MATCHED THEN
		   UPDATE SET 
		    ChalanReceiveAgencyTarget.SenderBranchAccountMappingid = @SenderBranchAccountMappingid,
			 ChalanReceiveAgencyTarget.EwayBillNo = ChalanReceiveAgencySource.EwayBillNo,
			 ChalanReceiveAgencyTarget.LRNumber = ChalanReceiveAgencySource.LRNumber,
			 ChalanReceiveAgencyTarget.LRDate = ChalanReceiveAgencySource.LRDate,
			 ChalanReceiveAgencyTarget.PrivateMarka = ChalanReceiveAgencySource.PrivateMarka,
			 ChalanReceiveAgencyTarget.CityIdFrom = ChalanReceiveAgencySource.CityIdFrom,
			 ChalanReceiveAgencyTarget.CityIdTo = ChalanReceiveAgencySource.CityIdTo,
			 ChalanReceiveAgencyTarget.AccountBranchMappingId = ChalanReceiveAgencySource.AccountBranchMappingId,
			 ChalanReceiveAgencyTarget.DeliveryAccountBranchMappingId = ChalanReceiveAgencySource.DeliveryAccountBranchMappingId,
			 ChalanReceiveAgencyTarget.LRPayTypeId = ChalanReceiveAgencySource.LRPayTypeId,
			 ChalanReceiveAgencyTarget.Parcel = ChalanReceiveAgencySource.Parcel,
			 ChalanReceiveAgencyTarget.ChargeWeight = ChalanReceiveAgencySource.ChargeWeight,
			 ChalanReceiveAgencyTarget.BillAccountBranchMappingId = ChalanReceiveAgencySource.BillAccountBranchMappingId,
			 ChalanReceiveAgencyTarget.NetAmount = ChalanReceiveAgencySource.NetAmount,
			 ModifiedById = @LoginId,
			 ModifiedOn = GETUTCDATE() 
			  
			WHEN NOT MATCHED THEN
		   INSERT (
			     SrNumber, ChalanReceiveAgencyMasterId, YearId, SenderBranchAccountMappingid, 
				 EwayBillNo, LRNumber, LRDate, PrivateMarka, CityIdFrom,
			     CityIdTo, AccountBranchMappingId, DeliveryAccountBranchMappingId, LRPayTypeId,
			     Parcel, ChargeWeight, BillAccountBranchMappingId, NetAmount, AddedOn, AddedById,
				ModifiedById, ModifiedOn, Deleted, DeletedById, DeletedOn
			 )
			 VALUES (
			     ChalanReceiveAgencySource.SrNumber, @Id, @YearId, @SenderBranchAccountMappingid, 
				 ChalanReceiveAgencySource.EwayBillNo,
			     ChalanReceiveAgencySource.LRNumber, ChalanReceiveAgencySource.LRDate, ChalanReceiveAgencySource.PrivateMarka,
			     ChalanReceiveAgencySource.CityIdFrom, ChalanReceiveAgencySource.CityIdTo,
			     ChalanReceiveAgencySource.AccountBranchMappingId, ChalanReceiveAgencySource.DeliveryAccountBranchMappingId,
			     ChalanReceiveAgencySource.LRPayTypeId, ChalanReceiveAgencySource.Parcel,
			     ChalanReceiveAgencySource.ChargeWeight, ChalanReceiveAgencySource.BillAccountBranchMappingId,
			     ChalanReceiveAgencySource.NetAmount,GETUTCDATE(), @LoginId,
				NULL, NULL, 0, NULL, NULL
			 );

		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanSave]
(
	 @LoginId INT
	,@FirmId INT
	,@BranchId INT
	,@Id INT 
	,@BillNumberBranch INT  
	,@BillNumberFirm VARCHAR(20) 
	,@BillDate DATETIME  
	,@CityIdFrom INT
	,@CityIdTo INT
	,@VehicleId INT
	,@AccountBranchMappingId INT
	,@DriverId INT
	,@EwayBillNumber VARCHAR(25)
	,@ToPayAmount DECIMAL(9,2)
	,@ToPayAccountBranchMappingId INT
	,@CrossingAmount DECIMAL(9,2)
	,@CrossingCommission DECIMAL(9,2)
	,@CrossingHamali DECIMAL(9,2)
	,@CrossingDeliveryCharge DECIMAL(9,2)
	,@CrossingAmountAccountBranchMappingId INT
	,@CrossingCommissionAccountBranchMappingId INT
	,@CrossingHamaliAccountBranchMappingId INT
	,@CrossingDeliveryAccountBranchMappingId INT
	,@BrokerAmount DECIMAL(9,2)
	,@BrokerBranchMappingId INT
	,@Notes NVARCHAR(250)
	,@TaxableAmount DECIMAL(9,2)
	,@TDSAmount DECIMAL(9,2)
	,@AdvanceCash DECIMAL(9,2)
	,@AdvanceNeft DECIMAL(9,2)
	,@ReceiveCash DECIMAL(9,2)
	,@OtherPlus DECIMAL(9,2)
	,@OtherLess DECIMAL(9,2)
	,@LRNumberIds NVARCHAR(MAX)
	,@IsAutoLedger BIT
	,@ValidDateFrom DATETIME 
	,@ValidDateTo DATETIME 
	,@TDSPercent DECIMAL(9,2) 
	,@SGSTTotal DECIMAL(9,2) 
	,@CGSTTotal DECIMAL(9,2) 
	,@IGSTTotal DECIMAL(9,2) 
	,@GSTStateCessTotal DECIMAL(9,2) 
	,@GSTCentralCessTotal DECIMAL(9,2) 
	,@TCSPercent DECIMAL(9,2) 
	,@TCSAmount DECIMAL(9,2) 
	,@CreditDays DECIMAL(9,2) 
	,@RoundOff DECIMAL(9,2) 
	,@BillAmount DECIMAL(9,2) 
	,@SalesAccountBranchMappingId INT 
	,@GenaralPurchaseAccountBranchMappingId INT 
	,@SkipInGSTR BIT 
	,@RCMId INT 
	,@RCMBillNumber INT 
	,@BillTypeID INT 
	,@ReturnBillNumber VARCHAR(30) 
	,@ReturnBillDate DATETIME 
	,@ReturnReasonId INT 
	,@PurchaseOrderRefNo VARCHAR(30) 
	,@EntryTypeName VARCHAR(25) 
	,@BranchIdTo INT 
	,@BillNumberTable VARCHAR(30) = 'Static'
	,@BillNumberBranchTable VARCHAR(30) = 'Static'
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

		DECLARE @message VARCHAR(4000);

		IF @YearId IS NULL
		BEGIN
			SET @message = 'Year Not Found!';
			RAISERROR ('%s', 16, 1, @message);
		END

		DECLARE @BookBranchMappingId INT = (
			SELECT PurcahseBookBranchMappingId
			FROM CustomerFirmBranchTransportSetting
			WHERE CustomerFirmBranchTransportSetting.BranchId = @BranchId
		);

		DECLARE @EntryTypeId INT = (
			SELECT Id
			FROM [BillEntryTypeAdmin]
			WHERE [BillEntryTypeAdmin].Code = @EntryTypeName 
			AND [BillEntryTypeAdmin].Active = 1
		);

		IF ISNULL(@BillNumberBranch, 0) = 0
		BEGIN
			SELECT @BillNumberBranch = ISNULL(MAX(BillNumberBranch),0) + 1
			FROM [Z-PurchaseBillMaster-Z]
			WHERE [Z-PurchaseBillMaster-Z].BranchId = @BranchId AND [Z-PurchaseBillMaster-Z].YearId = @YearId AND [Z-PurchaseBillMaster-Z].BookBranchMappingId = @BookBranchMappingId 
		END

		IF ISNULL(@BillNumberFirm, 0) = 0
		BEGIN
			SELECT @BillNumberFirm = ISNULL(MAX(BillNumberFirm),0) + 1
			FROM [Z-PurchaseBillMaster-Z]
			WHERE [Z-PurchaseBillMaster-Z].FirmId = @FirmId AND [Z-PurchaseBillMaster-Z].YearId = @YearId AND [Z-PurchaseBillMaster-Z].BookBranchMappingId = @BookBranchMappingId 
		END

		DECLARE @IdCheck INT
		SELECT @IdCheck = ID FROM [Z-PurchaseBillMaster-Z] 
							WHERE (Id = @Id) 
							OR (BranchId = @BranchId AND BillNumberBranch = @BillNumberBranch AND Deleted = 1)

		IF ISNULL(@IdCheck, 0) = 0
		BEGIN

			INSERT INTO [Z-PurchaseBillMaster-Z]
				(AccountBranchMappingId,BookBranchMappingId,BillNumberFirm,BillNumberTable,BillNumberBranch,BillNumberBranchTable,EntryTypeId,BillDate,VehicleId,CityIdFrom,CityIdTo,DriverId
				,DeliveryBranchId,EwayBillNumber,ValidDateFrom,ValidDateTo,TaxableAmount,TDSPercent,TDSAmount,AdvanceCash,AdvanceNeft,OtherLess,ReceiveCash,OtherPlus,SGSTTotal,CGSTTotal,IGSTTotal
				,GSTStateCessTotal,GSTCentralCessTotal,TCSPercent,TCSAmount,ToPayAmount,CrossingAmount,CrossingCommission,CrossingHamali,CrossingDeliveryCharge,CreditDays,RoundOff,BillAmount
				,BrokerBranchMappingId,BrokerAmount,Notes,ToPayAccountBranchMappingId,CrossingAmountAccountBranchMappingId,CrossingCommissionAccountBranchMappingId,CrossingHamaliAccountBranchMappingId
				,CrossingDeliveryAccountBranchMappingId,SalesAccountBranchMappingId,GenaralPurchaseAccountBranchMappingId,SkipInGSTR,RCMId,RCMBillNumber,BillTypeID,ReturnBillNumber,ReturnBillDate
				,ReturnReasonId,PurchaseOrderRefNo,AddedOn,AddedById,BranchId,YearId,IsAutoLedger,FirmId,BranchIdTo)
			VALUES 
				(@AccountBranchMappingId,@BookBranchMappingId,@BillNumberFirm,@BillNumberTable,@BillNumberBranch,@BillNumberBranchTable,@EntryTypeId,@BillDate,@VehicleId,@CityIdFrom
				,@CityIdTo,@DriverId,@BranchId,@EwayBillNumber,@ValidDateFrom,@ValidDateTo,@TaxableAmount,@TDSPercent,@TDSAmount,@AdvanceCash,@AdvanceNeft,@OtherLess,@ReceiveCash
				,@OtherPlus,@SGSTTotal,@CGSTTotal,@IGSTTotal,@GSTStateCessTotal,@GSTCentralCessTotal,@TCSPercent,@TCSAmount,@ToPayAmount,@CrossingAmount,@CrossingCommission,@CrossingHamali
				,@CrossingDeliveryCharge,@CreditDays,@RoundOff,@BillAmount,@BrokerBranchMappingId,@BrokerAmount,@Notes,@ToPayAccountBranchMappingId,@CrossingAmountAccountBranchMappingId
				,@CrossingCommissionAccountBranchMappingId,@CrossingHamaliAccountBranchMappingId,@CrossingDeliveryAccountBranchMappingId,@SalesAccountBranchMappingId
				,@GenaralPurchaseAccountBranchMappingId,@SkipInGSTR,@RCMId,@RCMBillNumber,@BillTypeID,@ReturnBillNumber,@ReturnBillDate,@ReturnReasonId,@PurchaseOrderRefNo,GETUTCDATE()
				,@LoginId,@BranchId,@YearId,@IsAutoLedger,@FirmId,@BranchIdTo)

			SET @Id = SCOPE_IDENTITY();
			
		END
		ELSE
		BEGIN
			SET @Id = @IdCheck

			UPDATE [Z-PurchaseBillMaster-Z] SET
			AccountBranchMappingId = @AccountBranchMappingId 
			,BookBranchMappingId = @BookBranchMappingId 
			,BillNumberFirm = @BillNumberFirm 
			,BillNumberTable = @BillNumberTable 
			,BillNumberBranch = @BillNumberBranch 
			,BillNumberBranchTable = @BillNumberBranchTable 
			,EntryTypeId = @EntryTypeId 
			,BillDate = @BillDate 
			,VehicleId = @VehicleId 
			,CityIdFrom = @CityIdFrom 
			,CityIdTo = @CityIdTo 
			,DriverId = @DriverId 
			,DeliveryBranchId = @BranchId 
			,EwayBillNumber = @EwayBillNumber 
			,ValidDateFrom = @ValidDateFrom 
			,ValidDateTo = @ValidDateTo 
			,TaxableAmount = @TaxableAmount 
			,TDSPercent = @TDSPercent 
			,TDSAmount = @TDSAmount 
			,AdvanceCash = @AdvanceCash 
			,AdvanceNeft = @AdvanceNeft 
			,OtherLess = @OtherLess 
			,ReceiveCash = @ReceiveCash 
			,OtherPlus = @OtherPlus 
			,SGSTTotal = @SGSTTotal 
			,CGSTTotal = @CGSTTotal 
			,IGSTTotal = @IGSTTotal 
			,GSTStateCessTotal = @GSTStateCessTotal 
			,GSTCentralCessTotal = @GSTCentralCessTotal 
			,TCSPercent = @TCSPercent 
			,TCSAmount = @TCSAmount 
			,ToPayAmount = @ToPayAmount 
			,CrossingAmount = @CrossingAmount 
			,CrossingCommission = @CrossingCommission 
			,CrossingHamali = @CrossingHamali 
			,CrossingDeliveryCharge = @CrossingDeliveryCharge 
			,CreditDays = @CreditDays 
			,RoundOff = @RoundOff 
			,BillAmount = @BillAmount 
			,BrokerBranchMappingId = @BrokerBranchMappingId 
			,BrokerAmount = @BrokerAmount 
			,Notes = @Notes 
			,ToPayAccountBranchMappingId = @ToPayAccountBranchMappingId 
			,CrossingAmountAccountBranchMappingId = @CrossingAmountAccountBranchMappingId 
			,CrossingCommissionAccountBranchMappingId = @CrossingCommissionAccountBranchMappingId 
			,CrossingHamaliAccountBranchMappingId = @CrossingHamaliAccountBranchMappingId 
			,CrossingDeliveryAccountBranchMappingId = @CrossingDeliveryAccountBranchMappingId 
			,SalesAccountBranchMappingId = @SalesAccountBranchMappingId 
			,GenaralPurchaseAccountBranchMappingId = @GenaralPurchaseAccountBranchMappingId 
			,SkipInGSTR = @SkipInGSTR 
			,RCMId = @RCMId 
			,RCMBillNumber = @RCMBillNumber 
			,BillTypeID = @BillTypeID 
			,ReturnBillNumber = @ReturnBillNumber 
			,ReturnBillDate = @ReturnBillDate 
			,ReturnReasonId = @ReturnReasonId 
			,PurchaseOrderRefNo = @PurchaseOrderRefNo 
			,DeletedById = NULL 
			,DeletedOn = NULL 
			,ModifiedById = @LoginId 
			,ModifiedOn = GETUTCDATE() 
			,Deleted = 0 
			,BranchId = @BranchId 
			,FirmId = @FirmId 
			,YearId = @YearId 
			,IsAutoLedger = @IsAutoLedger 
			,BranchIdTo = @BranchIdTo
			WHERE Id = @Id

			UPDATE  [Z-PurchaseBillDetail-Z] SET
					DeletedById = @LoginId,
					DeletedOn = GETUTCDATE(),
					Deleted = 1
			WHERE PurchaseBillMasterId = @Id AND [LRBookingId] NOT IN ( SELECT Id FROM dbo.[fnStringToIntArray](@LRNumberIds))

			UPDATE  [Z-PurchaseBillDetail-Z] SET
					DeletedById = NULL,
					DeletedOn = NULL,
					Deleted = 0
			WHERE PurchaseBillMasterId = @Id AND [LRBookingId] IN ( SELECT Id FROM dbo.[fnStringToIntArray](@LRNumberIds))
		END

		INSERT INTO [Z-PurchaseBillDetail-Z] (PurchaseBillMasterId,ProductBranchMappingId,LRBookingId,AddedById,AddedOn)
		SELECT @Id,PBM.ProductBranchMappingId,LRN.Id,@LoginId,GETUTCDATE()
		FROM dbo.[fnStringToIntArray](@LRNumberIds) AS LRN
		INNER JOIN [Z-LRBooking-Z] AS PBM ON PBM.Id = LRN.Id
		EXCEPT
		SELECT PurchaseBillMasterId,ProductBranchMappingId,LRBookingId,@LoginId,GETUTCDATE() 
		FROM [dbo].[Z-PurchaseBillDetail-Z]
		
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
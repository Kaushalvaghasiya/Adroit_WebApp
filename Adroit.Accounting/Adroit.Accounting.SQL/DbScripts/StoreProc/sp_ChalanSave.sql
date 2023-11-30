CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanSave]
(
	 @loginId INT
	,@firmId INT
	,@branchId INT
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
	,@LRNumberId NVARCHAR(MAX)
	,@IsAutoLedger BIT

	,@BillNumberTable VARCHAR(30) = 'Static'
	,@BillNumberBranchTable VARCHAR(30) = 'Static'
	,@ValidDateFrom DATETIME = NULL
	,@ValidDateTo DATETIME = NULL
	,@TDSPercent DECIMAL(9,2) = NULL
	,@SGSTTotal DECIMAL(9,2) = NULL
	,@CGSTTotal DECIMAL(9,2) = NULL
	,@IGSTTotal DECIMAL(9,2) = NULL
	,@GSTStateCessTotal DECIMAL(9,2) = NULL
	,@GSTCentralCessTotal DECIMAL(9,2) = NULL
	,@TCSPercent DECIMAL(9,2) = NULL
	,@TCSAmount DECIMAL(9,2) = NULL
	,@CreditDays DECIMAL(9,2) = NULL
	,@RoundOff DECIMAL(9,2) = NULL
	,@BillAmount DECIMAL(9,2) = NULL
	,@SalesAccountBranchMappingId INT = NULL
	,@GenaralPurchaseAccountBranchMappingId INT = NULL
	,@SkipInGSTR BIT = 0
	,@RCMId INT = NULL
	,@RCMBillNumber INT = NULL
	,@BillTypeID INT = NULL
	,@ReturnBillNumber VARCHAR(30) = 'Static'
	,@ReturnBillDate DATETIME = NULL
	,@ReturnReasonId INT = NULL
	,@PurchaseOrderRefNo VARCHAR(30) = 'Static'
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		DECLARE @YearId INT = dbo.fn_GetYearId(@firmId,@loginId);

		DECLARE @BookBranchMappingId INT = (
			SELECT PurcahseBookBranchMappingId
			FROM CustomerFirmBranchTransportSetting
			WHERE CustomerFirmBranchTransportSetting.BranchId = @branchId
		);

		DECLARE @EntryTypeId INT = (
			SELECT Id
			FROM [BillEntryTypeAdmin]
			WHERE [BillEntryTypeAdmin].Code = 'PUR'
			AND [BillEntryTypeAdmin].Active = 1
		);

		IF ISNULL(@BillNumberBranch, 0) = 0
		BEGIN
			SELECT @BillNumberBranch = ISNULL(MAX(BillNumberBranch),0) + 1
			FROM [Z-PurchaseBillMaster-Z]
			WHERE BranchId = @branchId
		END

		IF ISNULL(@BillNumberFirm, 0) = 0
		BEGIN
			SELECT @BillNumberFirm = ISNULL(MAX(BillNumberFirm),0) + 1
			FROM [Z-PurchaseBillMaster-Z]
			INNER JOIN CustomerFirmBranch on CustomerFirmBranch.Id = [Z-PurchaseBillMaster-Z].BranchId
			WHERE BranchId = @branchId AND CustomerFirmBranch.FirmId = @firmId
		END

		DECLARE @message VARCHAR(4000);

		IF ISNULL(@YearId, -1) = -1
		BEGIN
			SET @message = 'Year Not Found!';
			RAISERROR ('%s', 16, 1, @message);
		END

		DECLARE @IdCheck INT
		SELECT @IdCheck = ID FROM [Z-PurchaseBillMaster-Z] 
							WHERE (Id = @Id) 
							OR (BranchId = @branchId AND BillNumberBranch = @BillNumberBranch AND Deleted = 1)

		IF ISNULL(@IdCheck, 0) = 0
		BEGIN

			INSERT INTO [Z-PurchaseBillMaster-Z]
				(AccountBranchMappingId,BookBranchMappingId,BillNumberFirm,BillNumberTable,BillNumberBranch,BillNumberBranchTable,EntryTypeId,BillDate,VehicleId,CityIdFrom,CityIdTo,DriverId
				,DeliveryBranchId,EwayBillNumber,ValidDateFrom,ValidDateTo,TaxableAmount,TDSPercent,TDSAmount,AdvanceCash,AdvanceNeft,OtherLess,ReceiveCash,OtherPlus,SGSTTotal,CGSTTotal,IGSTTotal
				,GSTStateCessTotal,GSTCentralCessTotal,TCSPercent,TCSAmount,ToPayAmount,CrossingAmount,CrossingCommission,CrossingHamali,CrossingDeliveryCharge,CreditDays,RoundOff,BillAmount
				,BrokerBranchMappingId,BrokerAmount,Notes,ToPayAccountBranchMappingId,CrossingAmountAccountBranchMappingId,CrossingCommissionAccountBranchMappingId,CrossingHamaliAccountBranchMappingId
				,CrossingDeliveryAccountBranchMappingId,SalesAccountBranchMappingId,GenaralPurchaseAccountBranchMappingId,SkipInGSTR,RCMId,RCMBillNumber,BillTypeID,ReturnBillNumber,ReturnBillDate
				,ReturnReasonId,PurchaseOrderRefNo,AddedOn,AddedById,BranchId,YearId,IsAutoLedger)
			VALUES 
				(@AccountBranchMappingId,@BookBranchMappingId,@BillNumberFirm,@BillNumberTable,@BillNumberBranch,@BillNumberBranchTable,@EntryTypeId,@BillDate,@VehicleId,@CityIdFrom
				,@CityIdTo,@DriverId,@branchId,@EwayBillNumber,@ValidDateFrom,@ValidDateTo,@TaxableAmount,@TDSPercent,@TDSAmount,@AdvanceCash,@AdvanceNeft,@OtherLess,@ReceiveCash
				,@OtherPlus,@SGSTTotal,@CGSTTotal,@IGSTTotal,@GSTStateCessTotal,@GSTCentralCessTotal,@TCSPercent,@TCSAmount,@ToPayAmount,@CrossingAmount,@CrossingCommission,@CrossingHamali
				,@CrossingDeliveryCharge,@CreditDays,@RoundOff,@BillAmount,@BrokerBranchMappingId,@BrokerAmount,@Notes,@ToPayAccountBranchMappingId,@CrossingAmountAccountBranchMappingId
				,@CrossingCommissionAccountBranchMappingId,@CrossingHamaliAccountBranchMappingId,@CrossingDeliveryAccountBranchMappingId,@SalesAccountBranchMappingId
				,@GenaralPurchaseAccountBranchMappingId,@SkipInGSTR,@RCMId,@RCMBillNumber,@BillTypeID,@ReturnBillNumber,@ReturnBillDate,@ReturnReasonId,@PurchaseOrderRefNo,GETUTCDATE()
				,@loginId,@branchId,@YearId,@IsAutoLedger)

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
			,DeliveryBranchId = @branchId 
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
			,ModifiedById = @loginId 
			,ModifiedOn = GETUTCDATE() 
			,Deleted = 0 
			,BranchId = @branchId 
			,YearId = @YearId 
			,IsAutoLedger = @IsAutoLedger 
			WHERE Id = @Id

			UPDATE  [Z-PurchaseBillDetail-Z] SET
					DeletedById = @loginId,
					DeletedOn = GETUTCDATE(),
					Deleted = 1
			WHERE PurchaseBillMasterId = @Id AND [LRBookingId] NOT IN ( SELECT Id FROM dbo.[fnStringToIntArray](@LRNumberId))

			UPDATE  [Z-PurchaseBillDetail-Z] SET
					DeletedById = NULL,
					DeletedOn = NULL,
					Deleted = 0
			WHERE PurchaseBillMasterId = @Id AND [LRBookingId] IN ( SELECT Id FROM dbo.[fnStringToIntArray](@LRNumberId))
		END

		INSERT INTO [Z-PurchaseBillDetail-Z] (PurchaseBillMasterId,ProductBranchMappingId,LRBookingId,AddedById,AddedOn)
		SELECT @Id,PBM.ProductBranchMappingId,LRN.Id,@loginId,GETUTCDATE()
		FROM dbo.[fnStringToIntArray](@LRNumberId) AS LRN
		INNER JOIN [Z-LRBooking-Z] AS PBM ON PBM.Id = LRN.Id
		EXCEPT
		SELECT PurchaseBillMasterId,ProductBranchMappingId,LRBookingId,@loginId,GETUTCDATE() 
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
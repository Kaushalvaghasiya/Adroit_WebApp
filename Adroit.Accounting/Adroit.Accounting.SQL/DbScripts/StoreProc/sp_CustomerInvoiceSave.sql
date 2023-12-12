CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerInvoiceSave]
(
	 @LoginId INT
	,@FirmId INT
	,@BranchId INT
	,@Id INT 
	,@AccountBranchMappingId int
    ,@BookBranchMappingId int
    ,@BillNumber int
    ,@EntryTypeId tinyint
    ,@BillDate datetime
    ,@SerialNumberOfBranch int
    ,@InvoiceMemo varchar(1)
    ,@SalesBillFromId char(1)
    ,@ChalanDateFrom date
    ,@ChalanDateTo date
    ,@ChalanNo int
    ,@SalesOrderNumber varchar(25)
    ,@BillTypeId tinyint
    ,@DeliveryPartyAccountBranchMappingId int
    ,@ShippingAccountBranchMappingId int
    ,@HastePartyAccountBranchMappingId int
    ,@DeliveryLRBookingId int
    ,@SalesPartyName1 nvarchar(100)
    ,@SalesPartyName2 nvarchar(100)
    ,@CreditDays int
    ,@TaxableAmount decimal(10,2)
    ,@SGSTTotal decimal(10,2)
    ,@CGSTTotal decimal(10,2)
    ,@IGSTTotal decimal(10,2)
    ,@GSTStateCessTotal decimal(10,2)
    ,@GSTCentralCessTotal decimal(10,2)
    ,@TCSPercentage decimal(5,3)
    ,@TCSAmount decimal(10,2)
    ,@TDSPercentage decimal(5,3)
    ,@TDSAmount decimal(10,2)
    ,@ExtraAmount decimal(10,2)
    ,@RoundOff decimal(4,2)
    ,@BillAmount decimal(10,2)
    ,@BrokerBranchMappingId int
    ,@Notes nvarchar(250)
    ,@EwayBillNumber varchar(20)
    ,@IRNNumber varchar(250)
    ,@AcknowledgementNumber varchar(50)
    ,@IRNDate datetime
    ,@ReturnBillNumber varchar(50)
    ,@ReturnBillDate date
    ,@ReturnReasonId tinyint
    ,@VehicleNumber varchar(12)
    ,@TransportGSTNumber varchar(15)
    ,@TransportLRNumber varchar(15)
    ,@TransportLRDate date
    ,@TransportName nvarchar(50)
    ,@TransportModeId tinyint
    ,@ToStationCityId int
    ,@HeaderBox1 nvarchar(20)
    ,@HeaderBox2 nvarchar(20)
    ,@HeaderBox3 nvarchar(20)
    ,@HeaderBox4 nvarchar(20)
    ,@HeaderBox5 nvarchar(20)
    ,@PaidAmount decimal(10,2)
    ,@UnPaidAmount decimal(10,2)
    ,@Charge1 decimal(6,2)
    ,@Charge2 decimal(6,2)
    ,@Charge3 decimal(6,2)
    ,@Charge4 decimal(6,2)
    ,@Charge5 decimal(6,2)
    ,@Charge6 decimal(6,2)
    ,@CreditNoteId int
	,@LRNumberId int
	,@BillNumberBranch int
	
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

		--DECLARE @BookBranchMappingId INT = (
		--	SELECT PurcahseBookBranchMappingId
		--	FROM CustomerFirmBranchTransportSetting
		--	WHERE CustomerFirmBranchTransportSetting.BranchId = @BranchId
		--);

		--DECLARE @EntryTypeId INT = (
		--	SELECT Id
		--	FROM [BillEntryTypeAdmin]
		--	WHERE [BillEntryTypeAdmin].Code = 'PUR'
		--	AND [BillEntryTypeAdmin].Active = 1
		--);

		IF ISNULL(@BillNumberBranch, 0) = 0
		BEGIN
			SELECT @BillNumberBranch = ISNULL(MAX(BillNumberBranch),0) + 1
			FROM [Z-PurchaseBillMaster-Z]
			WHERE BranchId = @BranchId
		END

		--IF ISNULL(@BillNumberFirm, 0) = 0
		--BEGIN
		--	SELECT @BillNumberFirm = ISNULL(MAX(BillNumberFirm),0) + 1
		--	FROM [Z-PurchaseBillMaster-Z]
		--	INNER JOIN CustomerFirmBranch on CustomerFirmBranch.Id = [Z-PurchaseBillMaster-Z].BranchId
		--	WHERE BranchId = @BranchId AND CustomerFirmBranch.FirmId = @FirmId
		--END

		DECLARE @message VARCHAR(4000);

		IF @YearId IS NULL
		BEGIN
			SET @message = 'Year Not Found!';
			RAISERROR ('%s', 16, 1, @message);
		END

		DECLARE @IdCheck INT
		SELECT @IdCheck = ID FROM [Z-SalesBillMaster-Z] 
							WHERE (Id = @Id) 
							--OR (BranchId = @BranchId AND BillNumberBranch = @BillNumberBranch AND Deleted = 1)

		IF ISNULL(@IdCheck, 0) = 0
		BEGIN

			INSERT INTO [Z-SalesBillMaster-Z]
				(AccountBranchMappingId,BookBranchMappingId,BillNumber,EntryTypeId,BillDate,SerialNumberOfBranch,InvoiceMemo,SalesBillFromId,ChalanDateFrom
				,ChalanDateTo,ChalanNo,SalesOrderNumber,BillTypeId,DeliveryPartyAccountBranchMappingId,ShippingAccountBranchMappingId,HastePartyAccountBranchMappingId
				,DeliveryLRBookingId,SalesPartyName1,SalesPartyName2,CreditDays,TaxableAmount,SGSTTotal,CGSTTotal,IGSTTotal,GSTStateCessTotal,GSTCentralCessTotal
				,TCSPercentage,TCSAmount,TDSPercentage,TDSAmount,ExtraAmount,RoundOff,BillAmount,BrokerBranchMappingId,Notes,EwayBillNumber,IRNNumber,AcknowledgementNumber
				,IRNDate,ReturnBillNumber,ReturnBillDate,ReturnReasonId,VehicleNumber,TransportGSTNumber,TransportLRNumber,TransportLRDate,TransportName,TransportModeId
				,ToStationCityId,HeaderBox1,HeaderBox2,HeaderBox3,HeaderBox4,HeaderBox5,PaidAmount,UnPaidAmount,Charge1,Charge2,Charge3,Charge4,Charge5,Charge6,CreditNoteId
				,AddedOn,AddedById)			
			VALUES 
				(
				 @AccountBranchMappingId,@BookBranchMappingId,@BillNumber,@EntryTypeId,@BillDate,@SerialNumberOfBranch,@InvoiceMemo,@SalesBillFromId,@ChalanDateFrom
				,@ChalanDateTo,@ChalanNo,@SalesOrderNumber,@BillTypeId,@DeliveryPartyAccountBranchMappingId,@ShippingAccountBranchMappingId,@HastePartyAccountBranchMappingId
				,@DeliveryLRBookingId,@SalesPartyName1,@SalesPartyName2,@CreditDays,@TaxableAmount,@SGSTTotal,@CGSTTotal,@IGSTTotal,@GSTStateCessTotal,@GSTCentralCessTotal
				,@TCSPercentage,@TCSAmount,@TDSPercentage,@TDSAmount,@ExtraAmount,@RoundOff,@BillAmount,@BrokerBranchMappingId,@Notes,@EwayBillNumber,@IRNNumber,@AcknowledgementNumber
				,@IRNDate,@ReturnBillNumber,@ReturnBillDate,@ReturnReasonId,@VehicleNumber,@TransportGSTNumber,@TransportLRNumber,@TransportLRDate,@TransportName,@TransportModeId
				,@ToStationCityId,@HeaderBox1,@HeaderBox2,@HeaderBox3,@HeaderBox4,@HeaderBox5,@PaidAmount,@UnPaidAmount,@Charge1,@Charge2,@Charge3,@Charge4,@Charge5,@Charge6,@CreditNoteId
				,GETUTCDATE(),@LoginId)

			SET @Id = SCOPE_IDENTITY();
			
		END
		ELSE
		BEGIN
			SET @Id = @IdCheck

			UPDATE [Z-SalesBillMaster-Z] SET
			 AccountBranchMappingId = @AccountBranchMappingId
			,BookBranchMappingId = @BookBranchMappingId
			,BillNumber = @BillNumber
			,EntryTypeId = @EntryTypeId
			,BillDate = @BillDate
			,SerialNumberOfBranch = @SerialNumberOfBranch
			,InvoiceMemo = @InvoiceMemo
			,SalesBillFromId = @SalesBillFromId
			,ChalanDateFrom = @ChalanDateFrom
			,ChalanDateTo = @ChalanDateTo
			,ChalanNo = @ChalanNo
			,SalesOrderNumber = @SalesOrderNumber
			,BillTypeId = @BillTypeId
			,DeliveryPartyAccountBranchMappingId = @DeliveryPartyAccountBranchMappingId
			,ShippingAccountBranchMappingId = @ShippingAccountBranchMappingId
			,HastePartyAccountBranchMappingId = @HastePartyAccountBranchMappingId
			,DeliveryLRBookingId = @DeliveryLRBookingId
			,SalesPartyName1 = @SalesPartyName1
			,SalesPartyName2 = @SalesPartyName2
			,CreditDays = @CreditDays
			,TaxableAmount = @TaxableAmount
			,SGSTTotal = @SGSTTotal
			,CGSTTotal = @CGSTTotal
			,IGSTTotal = @IGSTTotal
			,GSTStateCessTotal = @GSTStateCessTotal
			,GSTCentralCessTotal = @GSTCentralCessTotal
			,TCSPercentage = @TCSPercentage
			,TCSAmount = @TCSAmount
			,TDSPercentage = @TDSPercentage
			,TDSAmount = @TDSAmount
			,ExtraAmount = @ExtraAmount
			,RoundOff = @RoundOff
			,BillAmount = @BillAmount
			,BrokerBranchMappingId = @BrokerBranchMappingId
			,Notes = @Notes
			,EwayBillNumber = @EwayBillNumber
			,IRNNumber = @IRNNumber
			,AcknowledgementNumber = @AcknowledgementNumber
			,IRNDate = @IRNDate
			,ReturnBillNumber = @ReturnBillNumber
			,ReturnBillDate = @ReturnBillDate
			,ReturnReasonId = @ReturnReasonId
			,VehicleNumber = @VehicleNumber
			,TransportGSTNumber = @TransportGSTNumber
			,TransportLRNumber = @TransportLRNumber
			,TransportLRDate = @TransportLRDate
			,TransportName = @TransportName
			,TransportModeId = @TransportModeId
			,ToStationCityId = @ToStationCityId
			,HeaderBox1 = @HeaderBox1
			,HeaderBox2 = @HeaderBox2
			,HeaderBox3 = @HeaderBox3
			,HeaderBox4 = @HeaderBox4
			,HeaderBox5 = @HeaderBox5
			,PaidAmount = @PaidAmount
			,UnPaidAmount = @UnPaidAmount
			,Charge1 = @Charge1
			,Charge2 = @Charge2
			,Charge3 = @Charge3
			,Charge4 = @Charge4
			,Charge5 = @Charge5
			,Charge6 = @Charge6
			,CreditNoteId = @CreditNoteId
			,AddedOn = GETUTCDATE()
			,AddedById = @LoginId
			,DeletedById = NULL 
			,DeletedOn = NULL 
			,Deleted = 0 
			WHERE Id = @Id

			UPDATE  [Z-SalesBillDetail-Z] SET
					DeletedById = @LoginId,
					DeletedOn = GETUTCDATE(),
					Deleted = 1
			WHERE SalesBillMasterId = @Id AND [LRBookingId] NOT IN ( SELECT Id FROM dbo.[fnStringToIntArray](@LRNumberId))

			UPDATE  [Z-SalesBillDetail-Z] SET
					DeletedById = NULL,
					DeletedOn = NULL,
					Deleted = 0
			WHERE SalesBillMasterId = @Id AND [LRBookingId] IN ( SELECT Id FROM dbo.[fnStringToIntArray](@LRNumberId))
		END

		--INSERT INTO [Z-SalesBillDetail-Z] (SalesBillMasterId,ProductBranchMappingId,LRBookingId,AddedById,AddedOn)
		--SELECT @Id,PBM.ProductBranchMappingId,LRN.Id,@LoginId,GETUTCDATE()
		--FROM dbo.[fnStringToIntArray](@LRNumberId) AS LRN
		--INNER JOIN [Z-LRBooking-Z] AS PBM ON PBM.Id = LRN.Id
		--EXCEPT
		--SELECT SalesBillMasterId,ProductBranchMappingId,LRBookingId,@LoginId,GETUTCDATE() 
		--FROM [dbo].[Z-SalesBillDetail-Z]
		
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
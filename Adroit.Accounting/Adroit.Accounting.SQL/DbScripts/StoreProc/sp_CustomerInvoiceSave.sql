CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerInvoiceSave]
(
	 @LoginId INT
	,@FirmId INT
	,@BranchId INT
	,@Id INT 
	,@AccountBranchMappingId int
    ,@BillDate datetime
    ,@SerialNumberOfBranch int
    ,@InvoiceMemo varchar(1) 
    ,@SalesBillFromId char(1) = '0'
    ,@ChalanDateFrom date
    ,@ChalanDateTo date
    ,@ChalanNo int = NULL
    ,@SalesOrderNumber varchar(25) = NULL
    ,@BillTypeId tinyint = 0
    ,@DeliveryPartyAccountBranchMappingId int 
    ,@ShippingAccountBranchMappingId int = NULL
    ,@HastePartyAccountBranchMappingId int = NULL
    ,@DeliveryLRBookingId int = NULL
    ,@SalesPartyName1 nvarchar(100) = NULL
    ,@SalesPartyName2 nvarchar(100) = NULL
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
    ,@ExtraAmount decimal(10,2) = 0
    ,@RoundOff decimal(4,2)
    ,@BillAmount decimal(10,2)
    ,@BrokerBranchMappingId int = NULL
    ,@Notes nvarchar(250)
    ,@EwayBillNumber varchar(20) = NULL
    ,@IRNNumber varchar(250) = NULL
    ,@AcknowledgementNumber varchar(50) = NULL
    ,@IRNDate datetime = NULL
    ,@ReturnBillNumber varchar(50) = NULL
    ,@ReturnBillDate date = NULL 
    ,@ReturnReasonId tinyint = NULL
    ,@VehicleNumber varchar(12) = NULL
    ,@TransportGSTNumber varchar(15) = NULL
    ,@TransportLRNumber varchar(15) = NULL
    ,@TransportLRDate date = NULL
    ,@TransportName nvarchar(50) = NULL
    ,@TransportModeId tinyint = NULL
    ,@ToStationCityId int = NULL
    ,@HeaderBox1 nvarchar(20) = NULL
    ,@HeaderBox2 nvarchar(20) = NULL
    ,@HeaderBox3 nvarchar(20) = NULL
    ,@HeaderBox4 nvarchar(20) = NULL
    ,@HeaderBox5 nvarchar(20) = 0
    ,@PaidAmount decimal(10,2)  = 0
    ,@UnPaidAmount decimal(10,2) = 0
    ,@CreditNoteId int = null
	,@BillNumber int
	,@LRDetailsList NVARCHAR(MAX)
	,@Prefix VARCHAR(15)  = null
	,@Postfix VARCHAR(15)  = null 

)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
		DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

		DECLARE @message VARCHAR(4000);

		IF @YearId IS NULL
		BEGIN
			SET @message = 'Year Not Found!';
			RAISERROR ('%s', 16, 1, @message);
		END

		    DECLARE @LRDetails TABLE
			(
			    LRNumber NVARCHAR(255),
			    LRDate DATETIME,
			    Parcel NVARCHAR(255),
			    ChargeWeight DECIMAL(18, 2),
			    TaxableAmount DECIMAL(18, 2),
			    Rate DECIMAL(18, 2),
			    Freight DECIMAL(18, 2),
			    Charges1 DECIMAL(18, 2),
			    Charges2 DECIMAL(18, 2),
			    Charges3 DECIMAL(18, 2),
			    Charges4 DECIMAL(18, 2),
			    Charges5 DECIMAL(18, 2),
			    Charges6 DECIMAL(18, 2)
			);

	    INSERT INTO @LRDetails
		SELECT
		    LRNumber,LRDate,Parcel,ChargeWeight,TaxableAmount,Rate,Freight,Charges1,Charges2,Charges3,Charges4,Charges5,Charges6
		FROM OPENJSON(@LRDetailsList)
		WITH (
		    LRNumber NVARCHAR(255),
		    LRDate DATETIME,
		    Parcel NVARCHAR(255),
		    ChargeWeight DECIMAL(18, 2),
		    TaxableAmount DECIMAL(18, 2),
		    Rate DECIMAL(18, 2),
		    Freight DECIMAL(18, 2),
		    Charges1 DECIMAL(18, 2),
		    Charges2 DECIMAL(18, 2),
		    Charges3 DECIMAL(18, 2),
		    Charges4 DECIMAL(18, 2),
		    Charges5 DECIMAL(18, 2),
		    Charges6 DECIMAL(18, 2)
		);

		DECLARE @ProductBranchMappingId INT = (
			SELECT ProductBranchMapping.Id 
			FROM CustomerFirmTransportSetting 
				INNER JOIN ProductBranchMapping on ProductBranchMapping.ProductId = CustomerFirmTransportSetting.ProductIdForSales 
				AND ProductBranchMapping.BranchId = @BranchId
			WHERE CustomerFirmTransportSetting.FirmId = @FirmId
		);

		DECLARE @BookBranchMappingId INT = (
			SELECT BookingSalesBookBranchMappingId
			FROM CustomerFirmBranchTransportSetting
			WHERE CustomerFirmBranchTransportSetting.BranchId = @BranchId
		);

		SELECT @SalesBillFromId = (
			SELECT Id
			FROM SalesBillFromAdmin
			WHERE SalesBillFromAdmin.Title = 'Sales'
			AND SalesBillFromAdmin.Active = 1 AND SalesBillFromAdmin.Deleted = 0
		);

		SELECT @Prefix = CustomerBook.BillNoPrefix, @Postfix = CustomerBook.BillNoPostfix, @BillTypeId = CustomerBook.BillTypeID, @SalesBillFromId = CustomerBook.SalesBillFrom
		FROM CustomerBookBranchMapping
		INNER JOIN CustomerBook on CustomerBook.Id = CustomerBookBranchMapping.BookId AND CustomerBook.CustomerId = @CustomerId AND CustomerBook.Active = 1 AND CustomerBook.Deleted = 0
		WHERE CustomerBookBranchMapping.Id = @BookBranchMappingId
		AND CustomerBookBranchMapping.Deleted = 0 

		DECLARE @EntryTypeId INT = (
			SELECT Id
			FROM [BillEntryTypeAdmin]
			WHERE [BillEntryTypeAdmin].Code = 'SAL'
			AND [BillEntryTypeAdmin].Active = 1
		);

		IF ISNULL(@SerialNumberOfBranch, 0) = 0
		BEGIN
			SELECT @SerialNumberOfBranch = ISNULL(MAX(SerialNumberOfBranch),0) + 1
			FROM [Z-SalesBillMaster-Z]
			WHERE [Z-SalesBillMaster-Z].BranchId = @BranchId AND [Z-SalesBillMaster-Z].YearId = @YearId AND [Z-SalesBillMaster-Z].BookBranchMappingId = @BookBranchMappingId 
		END

		IF ISNULL(@BillNumber, 0) = 0
		BEGIN
			SELECT @BillNumber = ISNULL(MAX(BillNumber),0) + 1
			FROM [Z-SalesBillMaster-Z]
			WHERE [Z-SalesBillMaster-Z].FirmId = @FirmId AND [Z-SalesBillMaster-Z].YearId = @YearId AND [Z-SalesBillMaster-Z].BookBranchMappingId = @BookBranchMappingId 
		END

		DECLARE @IdCheck INT
		SELECT @IdCheck = ID FROM [Z-SalesBillMaster-Z] 
							WHERE (Id = @Id) 
							OR (BranchId = @BranchId AND SerialNumberOfBranch = @SerialNumberOfBranch AND BillNumber = @BillNumber AND Deleted = 1)

		IF ISNULL(@IdCheck, 0) = 0
		BEGIN

			INSERT INTO [Z-SalesBillMaster-Z]
				(AccountBranchMappingId,BookBranchMappingId,BillNumber,EntryTypeId,BillDate,SerialNumberOfBranch,InvoiceMemo,SalesBillFromId,ChalanDateFrom
				,ChalanDateTo,ChalanNo,SalesOrderNumber,BillTypeId,DeliveryPartyAccountBranchMappingId,ShippingAccountBranchMappingId,HastePartyAccountBranchMappingId
				,DeliveryLRBookingId,SalesPartyName1,SalesPartyName2,CreditDays,TaxableAmount,SGSTTotal,CGSTTotal,IGSTTotal,GSTStateCessTotal,GSTCentralCessTotal
				,TCSPercentage,TCSAmount,TDSPercentage,TDSAmount,ExtraAmount,RoundOff,BillAmount,BrokerBranchMappingId,Notes,EwayBillNumber,IRNNumber,AcknowledgementNumber
				,IRNDate,ReturnBillNumber,ReturnBillDate,ReturnReasonId,VehicleNumber,TransportGSTNumber,TransportLRNumber,TransportLRDate,TransportName,TransportModeId
				,ToStationCityId,HeaderBox1,HeaderBox2,HeaderBox3,HeaderBox4,HeaderBox5,PaidAmount,UnPaidAmount,CreditNoteId
				,Prefix,Postfix,BranchId,FirmId,YearId,AddedOn,AddedById)			
			VALUES 
				(@AccountBranchMappingId,@BookBranchMappingId,@BillNumber,@EntryTypeId,@BillDate,@SerialNumberOfBranch,@InvoiceMemo,@SalesBillFromId,@ChalanDateFrom
				,@ChalanDateTo,@ChalanNo,@SalesOrderNumber,@BillTypeId,@DeliveryPartyAccountBranchMappingId,@ShippingAccountBranchMappingId,@HastePartyAccountBranchMappingId
				,@DeliveryLRBookingId,@SalesPartyName1,@SalesPartyName2,@CreditDays,@TaxableAmount,@SGSTTotal,@CGSTTotal,@IGSTTotal,@GSTStateCessTotal,@GSTCentralCessTotal
				,@TCSPercentage,@TCSAmount,@TDSPercentage,@TDSAmount,@ExtraAmount,@RoundOff,@BillAmount,@BrokerBranchMappingId,@Notes,@EwayBillNumber,@IRNNumber,@AcknowledgementNumber
				,@IRNDate,@ReturnBillNumber,@ReturnBillDate,@ReturnReasonId,@VehicleNumber,@TransportGSTNumber,@TransportLRNumber,@TransportLRDate,@TransportName,@TransportModeId
				,@ToStationCityId,@HeaderBox1,@HeaderBox2,@HeaderBox3,@HeaderBox4,@HeaderBox5,@PaidAmount,@UnPaidAmount,@CreditNoteId
				,@Prefix,@Postfix,@BranchId,@FirmId,@YearId,GETUTCDATE(),@LoginId)

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
			,CreditNoteId = @CreditNoteId
			,Prefix = @Prefix
			,Postfix = @Postfix
			,BranchId = @BranchId
			,FirmId = @FirmId
			,YearId = @YearId
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
			WHERE SalesBillMasterId = @Id AND [LRBookingId] NOT IN ( SELECT LRNumber FROM @LRDetails)

			UPDATE  [Z-SalesBillDetail-Z] SET
					DeletedById = NULL,
					DeletedOn = NULL,
					Deleted = 0
			WHERE SalesBillMasterId = @Id AND [LRBookingId] IN ( SELECT LRNumber FROM @LRDetails)
		END

		MERGE INTO [Z-SalesBillDetail-Z] AS LRTarget
		USING @LRDetails AS LRSource
		ON LRTarget.SalesBillMasterId = @Id AND LRTarget.LRBookingId = LRSource.LRNumber
		WHEN MATCHED THEN
		    UPDATE SET 
		        LRTarget.BasicAmount = LRSource.TaxableAmount,
		        LRTarget.Rate = LRSource.Rate,
		        LRTarget.FreightAmount = LRSource.Freight,
		        LRTarget.Charge1 = LRSource.Charges1,
		        LRTarget.Charge2 = LRSource.Charges2,
		        LRTarget.Charge3 = LRSource.Charges3,
		        LRTarget.Charge4 = LRSource.Charges4,
		        LRTarget.Charge5 = LRSource.Charges5,
		        LRTarget.Charge6 = LRSource.Charges6,
		        LRTarget.ProductBranchMappingId = @ProductBranchMappingId,
		        LRTarget.ModifiedOn = GETUTCDATE(),
		        LRTarget.ModifiedById = @LoginId
		WHEN NOT MATCHED THEN
		    INSERT (
		        SalesBillMasterId, LRBookingId, BasicAmount, Rate, FreightAmount, Charge1, Charge2, Charge3, Charge4, Charge5, Charge6,
		        QuantityDiscountPercentage, QuantityDiscountAmount, SpecialDiscount1, SpecialDiscount2, SpecialDiscount3,
		        SGSTPercentage, SGSTAmount, CGSTPercentage, CGSTAmount, IGSTPercentage, IGSTAmount,
		        GSTStateCessPercentage, GSTStateCessAmount, GSTCentralCessPercentage, GSTCentralCessAmount,
		        NetRate, DiscountPercentage, DiscountAmount, OtherCharges,
		        Quantity1, Quantity2, Quantity3, Quantity4, Quantity5, Quantity6,
		        ProductBranchMappingId, AddedOn, AddedById
		    )
		    VALUES (
		        @Id, LRSource.LRNumber, LRSource.TaxableAmount, LRSource.Rate, LRSource.Freight, 
				LRSource.Charges1, LRSource.Charges2, LRSource.Charges3, LRSource.Charges4, LRSource.Charges5, LRSource.Charges6,
		        0, 0, 0, 0, 0,
		        0, 0, 0, 0, 0, 0,
		        0, 0, 0, 0,
		        0, 0, 0, 0,
		        0, 0, 0, 0, 0, 0,
		        @ProductBranchMappingId, GETUTCDATE(), @LoginId
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
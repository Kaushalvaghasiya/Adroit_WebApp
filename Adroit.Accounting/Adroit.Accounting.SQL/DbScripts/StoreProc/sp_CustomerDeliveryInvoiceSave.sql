CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerDeliveryInvoiceSave]
(
	 @LoginId INT
	,@FirmId INT 
	,@BranchId INT
	,@YearId INT 
	,@Id INT 
	,@AccountBranchMappingId int
    ,@BillDate datetime
    ,@SerialNumberOfBranch int
    ,@InvoiceMemo bit 
    ,@SalesBillFromName varchar(25) 
    ,@EntryTypeName varchar(25) 
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
    ,@CreditNoteId int 
	,@BillNumber int 
	,@Prefix VARCHAR(15) 
	,@Postfix VARCHAR(15) 
	,@LRDetailsJson NVARCHAR(MAX)
	,@IsGatePass BIT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		exec [sp_ValidateLoginBranch] @LoginId, @BranchId, @YearId

		DECLARE @BillDateOnly DATETIME = CAST(@BillDate AS DATE)
		DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);
		DECLARE @InvoiceMaxDate Date=NULL, @InvoiceMinDate Date=NULL;

		DECLARE @message VARCHAR(4000);

		DECLARE @BookBranchMappingId INT = (
			SELECT CASE @IsGatePass WHEN 0 THEN DeliverySalesBookBranchMappingId ELSE GatePassBookBranchMappingId END
			FROM CustomerFirmBranchTransportSetting
			WHERE CustomerFirmBranchTransportSetting.BranchId = @BranchId
		);

		DECLARE @BookId INT = (SELECT BookId FROM CustomerBookBranchMapping WHERE Id = @BookBranchMappingId AND BranchId = @BranchId);

		DECLARE @EntryTypeId INT = (
			SELECT Id
			FROM [BillEntryTypeAdmin]
			WHERE [BillEntryTypeAdmin].Code = @EntryTypeName 
			AND [BillEntryTypeAdmin].Active = 1
		);

		IF (ISNULL(@SerialNumberOfBranch,0) = 0 AND ISNULL(@BillNumber,0) = 0)
		BEGIN
		    SELECT @InvoiceMaxDate = Cast(MAX(BillDate) as Date) 
			FROM [Z-SalesBillMaster-Z]
			WHERE FirmId = @FirmId 
			AND BranchId = @BranchId 
			AND YearId = @YearId 
			AND BookBranchMappingId = @BookBranchMappingId
			AND EntryTypeId = @EntryTypeId
			SET @InvoiceMaxDate  = ISNULL(@InvoiceMaxDate , CAST(GETDATE() AS DATE))

		    IF (@BillDateOnly < @InvoiceMaxDate)
		    BEGIN
		        SET @message = 'Please select a date on or after ' + CONVERT(VARCHAR, @InvoiceMaxDate, 103);
		        RAISERROR ('%s', 16, 1, @message);
		    END
		END
		ELSE IF (ISNULL(@SerialNumberOfBranch,0) = 0)
		BEGIN
		    SELECT @InvoiceMaxDate = CAST(MAX(BillDate) AS DATE)
			FROM [Z-SalesBillMaster-Z]
			WHERE BranchId = @BranchId 
			AND YearId = @YearId 
			AND BookBranchMappingId = @BookBranchMappingId 
			AND EntryTypeId = @EntryTypeId
			SET @InvoiceMaxDate  = ISNULL(@InvoiceMaxDate , CAST(GETDATE() AS DATE))

		    IF (@BillDateOnly < @InvoiceMaxDate)
		    BEGIN
		        SET @message = 'Please select a date on or after ' + CONVERT(VARCHAR, @InvoiceMaxDate, 103);
		        RAISERROR ('%s', 16, 1, @message);
		    END
		END
		ELSE IF (ISNULL(@BillNumber,0) = 0)
		BEGIN
		    SELECT @InvoiceMaxDate = CAST(MAX(BillDate) AS DATE)
			FROM [Z-SalesBillMaster-Z]
			WHERE FirmId = @FirmId 
			AND YearId = @YearId 
			AND BookBranchMappingId = @BookBranchMappingId 
			AND EntryTypeId = @EntryTypeId
			SET @InvoiceMaxDate  = ISNULL(@InvoiceMaxDate , CAST(GETDATE() AS DATE))
			
		    IF (@BillDateOnly < @InvoiceMaxDate)
		    BEGIN
		        SET @message = 'Please select a date on or after ' + CONVERT(VARCHAR, @InvoiceMaxDate, 103);
		        RAISERROR ('%s', 16, 1, @message);
		    END
		END
		ELSE
		BEGIN
		    SELECT TOP 1 @InvoiceMaxDate = CAST(BillDate AS DATE)
		    FROM [Z-SalesBillMaster-Z]
		    WHERE BranchId = @BranchId 
				AND SerialNumberOfBranch < @SerialNumberOfBranch 
				AND BillNumber < @BillNumber 
				AND YearId = @YearId 
				AND BookBranchMappingId = @BookBranchMappingId 
				AND EntryTypeId = @EntryTypeId
		    ORDER BY SerialNumberOfBranch, BillNumber DESC;
			SET @InvoiceMaxDate  = ISNULL(@InvoiceMaxDate , DATEADD(DAY, -1, CAST(GETDATE() AS DATE)))
			
		    SELECT TOP 1 @InvoiceMinDate = CAST(ISNULL(BillDate, DATEADD(DAY, 1, @InvoiceMaxDate)) AS DATE)
		    FROM [Z-SalesBillMaster-Z]
		    WHERE BranchId = @BranchId 
				AND SerialNumberOfBranch > @SerialNumberOfBranch 
				AND BillNumber > @BillNumber 
				AND YearId = @YearId 
				AND BookBranchMappingId = @BookBranchMappingId 
				AND EntryTypeId = @EntryTypeId
		    ORDER BY SerialNumberOfBranch, BillNumber DESC;
			
			SET @InvoiceMinDate  = ISNULL(@InvoiceMinDate , DATEADD(DAY, 365, @InvoiceMaxDate))
			
		    IF NOT (@BillDateOnly BETWEEN @InvoiceMaxDate AND @InvoiceMinDate)
		    BEGIN
		        SET @message = 'Please select a date between ' + CONVERT(VARCHAR, @InvoiceMaxDate, 103) + ' and ' + CONVERT(VARCHAR, @InvoiceMinDate, 103);
		        RAISERROR ('%s', 16, 1, @message);
		    END
		END

		DECLARE @LRDetails TABLE
		(
			LRBookingId int,
			FreightAmount DECIMAL(10, 2),
			Charge1 DECIMAL(6, 2),
			Charge2 DECIMAL(6, 2),
			Charge3 DECIMAL(6, 2),
			Charge4 DECIMAL(6, 2),
			Charge5 DECIMAL(6, 2),
			Charge6 DECIMAL(6, 2),
			BasicAmount DECIMAL(10, 2),

			SGSTPercentage DECIMAL(10, 2),
			SGSTAmount DECIMAL(10, 2),
			CGSTPercentage DECIMAL(10, 2),
			CGSTAmount DECIMAL(10, 2),
			IGSTPercentage DECIMAL(10, 2),
			IGSTAmount DECIMAL(10, 2),

			GSTStateCessPercentage DECIMAL(10, 2),
			GSTStateCessAmount DECIMAL(10, 2),
			GSTCentralCessPercentage DECIMAL(10, 2),
			GSTCentralCessAmount DECIMAL(10, 2),
			GSTCentralCess DECIMAL(10, 2),
			IsAgency BIT NOT NULL
		);

	    INSERT INTO @LRDetails
		SELECT
		    LRBookingId, FreightAmount, Charge1, Charge2, Charge3, Charge4, Charge5, Charge6,
			BasicAmount, SGSTPercentage, SGSTAmount, CGSTPercentage, CGSTAmount, IGSTPercentage, IGSTAmount,
			GSTStateCessPercentage, GSTStateCessAmount, GSTCentralCessPercentage, GSTCentralCessAmount, GSTCentralCess,
			IsAgency
		FROM OPENJSON(@LRDetailsJson)
		WITH (
		    LRBookingId int,
			FreightAmount DECIMAL(10, 2),
			Charge1 DECIMAL(6, 2),
			Charge2 DECIMAL(6, 2),
			Charge3 DECIMAL(6, 2),
			Charge4 DECIMAL(6, 2),
			Charge5 DECIMAL(6, 2),
			Charge6 DECIMAL(6, 2),
			BasicAmount DECIMAL(10, 2),

			SGSTPercentage DECIMAL(10, 2),
			SGSTAmount DECIMAL(10, 2),
			CGSTPercentage DECIMAL(10, 2),
			CGSTAmount DECIMAL(10, 2),
			IGSTPercentage DECIMAL(10, 2),
			IGSTAmount DECIMAL(10, 2),

			GSTStateCessPercentage DECIMAL(10, 2),
			GSTStateCessAmount DECIMAL(10, 2),
			GSTCentralCessPercentage DECIMAL(10, 2),
			GSTCentralCessAmount DECIMAL(10, 2),
			GSTCentralCess DECIMAL(10, 2),
			IsAgency BIT
		);

		--Check LR in another invoices (Own)
		IF EXISTS (SELECT [Z-SalesBillDetail-Z].LRBookingId
					FROM [Z-SalesBillMaster-Z]
					INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].Id = [Z-SalesBillDetail-Z].SalesBillMasterId
					INNER JOIN @LRDetails AS LRDetails ON [Z-SalesBillDetail-Z].LRBookingId = LRDetails.LRBookingId AND IsAgency = 0
					WHERE [Z-SalesBillMaster-Z].Id <> @Id AND (EntryTypeId = 24 OR EntryTypeId = 25)) 
		BEGIN
			DECLARE @LRNumber INT
			SELECT top 1 @LRNumber = LRBooking.LRNumber 
					FROM [Z-SalesBillMaster-Z]
					INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].Id = [Z-SalesBillDetail-Z].SalesBillMasterId
					INNER JOIN @LRDetails AS LRDetails ON [Z-SalesBillDetail-Z].LRBookingId = LRDetails.LRBookingId AND IsAgency = 0
					INNER JOIN [Z-LRBooking-Z] AS LRBooking ON [Z-SalesBillDetail-Z].LRBookingId = LRBooking.Id
					WHERE [Z-SalesBillMaster-Z].Id <> @Id 
					AND (EntryTypeId = 24 OR EntryTypeId = 25)
			RAISERROR ('LR# %d is already used in another invoice, please remove it from this invoice.', 16, 1, @LRNumber);
		END

		--Check LR in another invoices (Agency)
		IF EXISTS (SELECT [Z-SalesBillDetail-Z].AgencyLRBookingId 
					FROM [Z-SalesBillMaster-Z]
					INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].Id = [Z-SalesBillDetail-Z].SalesBillMasterId
					INNER JOIN @LRDetails AS LRDetails ON [Z-SalesBillDetail-Z].LRBookingId = LRDetails.LRBookingId AND IsAgency = 1
					WHERE [Z-SalesBillMaster-Z].Id <> @Id AND (EntryTypeId = 24 OR EntryTypeId = 25)) 
		BEGIN
			DECLARE @LRNumberAgency INT
			SELECT top 1 @LRNumberAgency = LRBooking.LRNumber 
					FROM [Z-SalesBillMaster-Z]
					INNER JOIN [Z-SalesBillDetail-Z] ON [Z-SalesBillMaster-Z].Id = [Z-SalesBillDetail-Z].SalesBillMasterId
					INNER JOIN @LRDetails AS LRDetails ON [Z-SalesBillDetail-Z].LRBookingId = LRDetails.LRBookingId AND IsAgency = 1
					INNER JOIN [Z-ChalanReceiveAgencyDetail-Z] AS LRBooking ON [Z-SalesBillDetail-Z].LRBookingId = LRBooking.Id
					WHERE [Z-SalesBillMaster-Z].Id <> @Id 
					AND (EntryTypeId = 24 OR EntryTypeId = 25)
			RAISERROR ('LR# %d is already used in another invoice, please remove it from this invoice.', 16, 1, @LRNumber);
		END

		DECLARE @ProductBranchMappingId INT = (
			SELECT ProductBranchMapping.Id 
			FROM CustomerFirmTransportSetting 
				INNER JOIN ProductBranchMapping on ProductBranchMapping.ProductId = CustomerFirmTransportSetting.ProductIdForSales 
				AND ProductBranchMapping.BranchId = @BranchId
			WHERE CustomerFirmTransportSetting.FirmId = @FirmId
		);

		DECLARE @SalesBillFromId INT = (
			SELECT Id
			FROM SalesBillFromAdmin
			WHERE SalesBillFromAdmin.Title = @SalesBillFromName 
			AND SalesBillFromAdmin.Active = 1 AND SalesBillFromAdmin.Deleted = 0
		);

		SELECT 
			@Prefix = CustomerBook.BillNoPrefix, 
			@Postfix = CustomerBook.BillNoPostfix, 
			@BillTypeId = CustomerBook.BillTypeID, 
			@SalesBillFromId = CustomerBook.SalesBillFrom
		FROM CustomerBookBranchMapping
		INNER JOIN CustomerBook on CustomerBook.Id = CustomerBookBranchMapping.BookId AND CustomerBook.CustomerId = @CustomerId
		WHERE CustomerBookBranchMapping.Id = @BookBranchMappingId
		AND CustomerBookBranchMapping.Deleted = 0 

		IF ISNULL(@SerialNumberOfBranch, 0) = 0
		BEGIN
			SELECT @SerialNumberOfBranch = ISNULL(MAX(SerialNumberOfBranch),0) + 1
			FROM [Z-SalesBillMaster-Z]
			WHERE [Z-SalesBillMaster-Z].BranchId = @BranchId 
			AND [Z-SalesBillMaster-Z].YearId = @YearId 
			AND [Z-SalesBillMaster-Z].BookBranchMappingId = @BookBranchMappingId 
			AND [Z-SalesBillMaster-Z].EntryTypeId = @EntryTypeId 
		END

		IF ISNULL(@BillNumber, 0) = 0
		BEGIN
			SELECT @BillNumber = ISNULL(MAX(BillNumber),0) + 1
			FROM [Z-SalesBillMaster-Z]
			WHERE [Z-SalesBillMaster-Z].FirmId = @FirmId 
			AND [Z-SalesBillMaster-Z].YearId = @YearId 
			AND [Z-SalesBillMaster-Z].BookBranchMappingId = @BookBranchMappingId 
			AND [Z-SalesBillMaster-Z].EntryTypeId = @EntryTypeId 
		END

		DECLARE @IdCheck INT
		SELECT @IdCheck = ID FROM [Z-SalesBillMaster-Z] 
							WHERE (Id = @Id) 
								OR (BranchId = @BranchId 
									AND SerialNumberOfBranch = @SerialNumberOfBranch 
									AND BillNumber = @BillNumber 
									AND Deleted = 1)

		IF ISNULL(@IdCheck, 0) = 0
		BEGIN

			INSERT INTO [Z-SalesBillMaster-Z]
				(AccountBranchMappingId,BookBranchMappingId,BillNumber,EntryTypeId,BillDate,SerialNumberOfBranch,InvoiceMemo,SalesBillFromId,ChalanDateFrom
				,ChalanDateTo,ChalanNo,SalesOrderNumber,BillTypeId,DeliveryPartyAccountBranchMappingId,ShippingAccountBranchMappingId,HastePartyAccountBranchMappingId
				,DeliveryLRBookingId,SalesPartyName1,SalesPartyName2,CreditDays,TaxableAmount,SGSTTotal,CGSTTotal,IGSTTotal,GSTStateCessTotal,GSTCentralCessTotal
				,TCSPercentage,TCSAmount,TDSPercentage,TDSAmount,ExtraAmount,RoundOff,BillAmount,BrokerBranchMappingId,Notes,EwayBillNumber,IRNNumber,AcknowledgementNumber
				,IRNDate,ReturnBillNumber,ReturnBillDate,ReturnReasonId,VehicleNumber,TransportGSTNumber,TransportLRNumber,TransportLRDate,TransportName,TransportModeId
				,ToStationCityId,HeaderBox1,HeaderBox2,HeaderBox3,HeaderBox4,HeaderBox5,PaidAmount,UnPaidAmount,CreditNoteId
				,Prefix,Postfix,BranchId,FirmId,YearId,AddedOn,AddedById, BookId)
			VALUES 
				(@AccountBranchMappingId,@BookBranchMappingId,@BillNumber,@EntryTypeId,@BillDate,@SerialNumberOfBranch,@InvoiceMemo,@SalesBillFromId,@ChalanDateFrom
				,@ChalanDateTo,@ChalanNo,@SalesOrderNumber,@BillTypeId,@DeliveryPartyAccountBranchMappingId,@ShippingAccountBranchMappingId,@HastePartyAccountBranchMappingId
				,@DeliveryLRBookingId,@SalesPartyName1,@SalesPartyName2,@CreditDays,@TaxableAmount,@SGSTTotal,@CGSTTotal,@IGSTTotal,@GSTStateCessTotal,@GSTCentralCessTotal
				,@TCSPercentage,@TCSAmount,@TDSPercentage,@TDSAmount,@ExtraAmount,@RoundOff,@BillAmount,@BrokerBranchMappingId,@Notes,@EwayBillNumber,@IRNNumber,@AcknowledgementNumber
				,@IRNDate,@ReturnBillNumber,@ReturnBillDate,@ReturnReasonId,@VehicleNumber,@TransportGSTNumber,@TransportLRNumber,@TransportLRDate,@TransportName,@TransportModeId
				,@ToStationCityId,@HeaderBox1,@HeaderBox2,@HeaderBox3,@HeaderBox4,@HeaderBox5,@PaidAmount,@UnPaidAmount,@CreditNoteId
				,@Prefix,@Postfix,@BranchId,@FirmId,@YearId,GETUTCDATE(),@LoginId, @BookId)

			SET @Id = SCOPE_IDENTITY();
			
		END
		ELSE
		BEGIN
			SET @Id = @IdCheck

			UPDATE [Z-SalesBillMaster-Z] SET
			 AccountBranchMappingId = @AccountBranchMappingId
			,BookBranchMappingId = @BookBranchMappingId
			,BookId = @BookId
			,BillNumber = @BillNumber
			,EntryTypeId = @EntryTypeId
			,BillDate = @BillDate
			,SerialNumberOfBranch = @SerialNumberOfBranch
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

			--delete own 
			DELETE [Z-SalesBillDetail-Z]  WHERE SalesBillMasterId = @Id 
				AND [LRBookingId] IS NOT NULL
				AND [LRBookingId] NOT IN (SELECT LRBookingId FROM @LRDetails WHERE IsAgency = 0)

			--delete agency
			DELETE [Z-SalesBillDetail-Z]  WHERE SalesBillMasterId = @Id 
				AND AgencyLRBookingId IS NOT NULL
				AND AgencyLRBookingId NOT IN (SELECT LRBookingId FROM @LRDetails WHERE IsAgency = 1)
		END

		SELECT * INTO #LRDATA FROM @LRDetails WHERE IsAgency = 0
		SELECT * INTO #AGENCYDATA FROM @LRDetails WHERE IsAgency = 1
		--Own LR
		MERGE INTO [Z-SalesBillDetail-Z] AS LRTarget
		USING #LRDATA AS LRSource ON LRTarget.SalesBillMasterId = @Id 
						AND ISNULL(LRTarget.LRBookingId, 0) = LRSource.LRBookingId 
		WHEN MATCHED THEN
		    UPDATE SET 
		        LRTarget.FreightAmount = LRSource.FreightAmount,
		        LRTarget.Charge1 = LRSource.Charge1,
		        LRTarget.Charge2 = LRSource.Charge2,
		        LRTarget.Charge3 = LRSource.Charge3,
		        LRTarget.Charge4 = LRSource.Charge4,
		        LRTarget.Charge5 = LRSource.Charge5,
		        LRTarget.Charge6 = LRSource.Charge6,
				LRTarget.SGSTPercentage = LRSource.SGSTPercentage,
				LRTarget.SGSTAmount = LRSource.SGSTAmount,
				LRTarget.CGSTPercentage = LRSource.CGSTPercentage,
				LRTarget.CGSTAmount = LRSource.CGSTAmount,
				LRTarget.IGSTPercentage = LRSource.IGSTPercentage,
				LRTarget.IGSTAmount = LRSource.IGSTAmount,
				LRTarget.GSTStateCessPercentage = LRSource.GSTStateCessPercentage,
				LRTarget.GSTStateCessAmount = LRSource.GSTStateCessAmount,
				LRTarget.GSTCentralCessPercentage = LRSource.GSTCentralCessPercentage,
				LRTarget.GSTCentralCessAmount = LRSource.GSTCentralCessAmount,
				LRTarget.GSTCentralCess = LRSource.GSTCentralCess,
		        LRTarget.ProductBranchMappingId = @ProductBranchMappingId,
		        LRTarget.ModifiedOn = GETUTCDATE(),
		        LRTarget.ModifiedById = @LoginId
		WHEN NOT MATCHED THEN
		    INSERT (
		        SalesBillMasterId, LRBookingId, AgencyLRBookingId, BasicAmount, Rate, FreightAmount, 
				Charge1, Charge2, Charge3, Charge4, Charge5, Charge6,
		        QuantityDiscountPercentage, QuantityDiscountAmount, SpecialDiscount1, SpecialDiscount2, SpecialDiscount3,
		        SGSTPercentage, SGSTAmount, CGSTPercentage, CGSTAmount, IGSTPercentage, IGSTAmount,
		        GSTStateCessPercentage, GSTStateCessAmount, GSTCentralCessPercentage, GSTCentralCessAmount, GSTCentralCess,
		        NetRate, DiscountPercentage, DiscountAmount, OtherCharges,
		        Quantity1, Quantity2, Quantity3, Quantity4, Quantity5, Quantity6,
		        ProductBranchMappingId, AddedOn, AddedById
		    )
		    VALUES (
		        @Id, LRSource.LRBookingId, NULL, LRSource.BasicAmount, 0, LRSource.FreightAmount, 
				LRSource.Charge1, LRSource.Charge2, LRSource.Charge3, LRSource.Charge4, LRSource.Charge5, LRSource.Charge6,
		        0, 0, 0, 0, 0,
		        LRSource.SGSTPercentage, LRSource.SGSTAmount, LRSource.CGSTPercentage, LRSource.CGSTAmount, LRSource.IGSTPercentage, LRSource.IGSTAmount,
		        LRSource.GSTStateCessPercentage, LRSource.GSTStateCessAmount, LRSource.GSTCentralCessPercentage, LRSource.GSTCentralCessAmount, LRSource.GSTCentralCess,
		        0, 0, 0, 0,
		        0, 0, 0, 0, 0, 0,
		        @ProductBranchMappingId, GETUTCDATE(), @LoginId
		    );

		--Own Agency
		MERGE INTO [Z-SalesBillDetail-Z] AS LRTarget
		USING #AGENCYDATA AS LRSource ON LRTarget.SalesBillMasterId = @Id AND ISNULL(LRTarget.AgencyLRBookingId, 0) = LRSource.LRBookingId 
		WHEN MATCHED THEN
		    UPDATE SET 
		        LRTarget.FreightAmount = LRSource.FreightAmount,
		        LRTarget.Charge1 = LRSource.Charge1,
		        LRTarget.Charge2 = LRSource.Charge2,
		        LRTarget.Charge3 = LRSource.Charge3,
		        LRTarget.Charge4 = LRSource.Charge4,
		        LRTarget.Charge5 = LRSource.Charge5,
		        LRTarget.Charge6 = LRSource.Charge6,
				LRTarget.SGSTPercentage = LRSource.SGSTPercentage,
				LRTarget.SGSTAmount = LRSource.SGSTAmount,
				LRTarget.CGSTPercentage = LRSource.CGSTPercentage,
				LRTarget.CGSTAmount = LRSource.CGSTAmount,
				LRTarget.IGSTPercentage = LRSource.IGSTPercentage,
				LRTarget.IGSTAmount = LRSource.IGSTAmount,
				LRTarget.GSTStateCessPercentage = LRSource.GSTStateCessPercentage,
				LRTarget.GSTStateCessAmount = LRSource.GSTStateCessAmount,
				LRTarget.GSTCentralCessPercentage = LRSource.GSTCentralCessPercentage,
				LRTarget.GSTCentralCessAmount = LRSource.GSTCentralCessAmount,
				LRTarget.GSTCentralCess = LRSource.GSTCentralCess,
		        LRTarget.ProductBranchMappingId = @ProductBranchMappingId,
		        LRTarget.ModifiedOn = GETUTCDATE(),
		        LRTarget.ModifiedById = @LoginId
		WHEN NOT MATCHED THEN
		    INSERT (
		        SalesBillMasterId, LRBookingId, AgencyLRBookingId, BasicAmount, Rate, FreightAmount, 
				Charge1, Charge2, Charge3, Charge4, Charge5, Charge6,
		        QuantityDiscountPercentage, QuantityDiscountAmount, SpecialDiscount1, SpecialDiscount2, SpecialDiscount3,
		        SGSTPercentage, SGSTAmount, CGSTPercentage, CGSTAmount, IGSTPercentage, IGSTAmount,
		        GSTStateCessPercentage, GSTStateCessAmount, GSTCentralCessPercentage, GSTCentralCessAmount, GSTCentralCess,
		        NetRate, DiscountPercentage, DiscountAmount, OtherCharges,
		        Quantity1, Quantity2, Quantity3, Quantity4, Quantity5, Quantity6,
		        ProductBranchMappingId, AddedOn, AddedById
		    )
		    VALUES (
		        @Id, NULL, LRSource.LRBookingId, LRSource.BasicAmount, 0, LRSource.FreightAmount, 
				LRSource.Charge1, LRSource.Charge2, LRSource.Charge3, LRSource.Charge4, LRSource.Charge5, LRSource.Charge6,
		        0, 0, 0, 0, 0,
		        LRSource.SGSTPercentage, LRSource.SGSTAmount, LRSource.CGSTPercentage, LRSource.CGSTAmount, LRSource.IGSTPercentage, LRSource.IGSTAmount,
		        LRSource.GSTStateCessPercentage, LRSource.GSTStateCessAmount, LRSource.GSTCentralCessPercentage, LRSource.GSTCentralCessAmount, LRSource.GSTCentralCess,
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
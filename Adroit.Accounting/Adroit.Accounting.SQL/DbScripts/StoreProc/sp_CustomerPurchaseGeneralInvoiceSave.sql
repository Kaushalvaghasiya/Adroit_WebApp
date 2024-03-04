CREATE OR ALTER procedure [dbo].[sp_CustomerPurchaseGeneralInvoiceSave]
(
	 @LoginId INT
	,@FirmId INT
	,@BranchId INT
	,@Id INT 
	,@PurBillNo varchar(40)
	,@BillNumberFirm varchar(20)
	,@BillDate DATETIME 
	,@CityIdTo INT
	,@AccountBranchMappingId INT
	,@TransportGSTNumber varchar(15)
	,@TransportLRNumber varchar(15)
	,@TransportLRDate date
	,@TransportName nvarchar(50)
	,@TransportMode VARCHAR(25)
	,@VehicleNumber varchar(12)
	,@Header1 nvarchar(20)
	,@Header2 nvarchar(20)
	,@Header3 nvarchar(20)
	,@Header4 nvarchar(20)
	,@Header5 nvarchar(20)
	,@IRNNumber varchar(250)
	,@BrokerId INT
	,@AcknowledgementNumber varchar(50)
	,@IRNDate datetime
	,@Notes NVARCHAR(250)
	,@TaxableAmount DECIMAL(9,2)
	,@TDSAmount DECIMAL(9,2)
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
	,@RCMBillNumber INT 
	,@EwayBillNumber VARCHAR(25)
	,@BillTypeID TINYINT 
	,@SkipInGSTR bit
	,@EntryTypeName VARCHAR(25)
	,@PurchaseDetailsJson NVARCHAR(MAX) 

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

		DECLARE @TransportModeId TINYINT = (
			SELECT Id
			FROM GSTTransportMode
			WHERE GSTTransportMode.Title = @TransportMode
		);

		DECLARE @EntryTypeId INT = (
			SELECT Id
			FROM [BillEntryTypeAdmin]
			WHERE [BillEntryTypeAdmin].Code = @EntryTypeName 
			AND [BillEntryTypeAdmin].Active = 1
		);
		
		IF (@PurBillNo IS NULL OR @PurBillNo = '')
		BEGIN
			SELECT @PurBillNo = 'AUTO-' + REPLACE(CAST(NEWID() AS VARCHAR(36)), '-', '');
		END

		IF (@BillNumberFirm IS NULL OR @BillNumberFirm = '')
		SELECT @BillNumberFirm = ISNULL(MAX(ISNULL(TRY_CAST(BillNumberFirm AS INT), 0)), 0) + 1
		FROM [Z-PurchaseBillMaster-Z]
		WHERE [Z-PurchaseBillMaster-Z].FirmId = @FirmId AND [Z-PurchaseBillMaster-Z].YearId = @YearId AND [Z-PurchaseBillMaster-Z].BookBranchMappingId = @BookBranchMappingId AND [Z-PurchaseBillMaster-Z].EntryTypeId = @EntryTypeId 			

		DECLARE @AccountId INT = (
			SELECT [CustomerAccount].Id
			FROM [CustomerAccountBranchMapping]
			INNER JOIN [CustomerAccount] ON [CustomerAccount].Id = [CustomerAccountBranchMapping].AccountId AND [CustomerAccount].Active = 1 AND [CustomerAccount].Deleted = 0
			WHERE [CustomerAccountBranchMapping].Deleted = 0 AND [CustomerAccountBranchMapping].Id = @AccountBranchMappingId
		);	

		DECLARE @BillNumberBranch INT;
		SELECT @BillNumberBranch = ISNULL(MAX(BillNumberBranch),0) + 1
		FROM [Z-PurchaseBillMaster-Z]
		WHERE [Z-PurchaseBillMaster-Z].BranchId = @BranchId AND [Z-PurchaseBillMaster-Z].YearId = @YearId AND [Z-PurchaseBillMaster-Z].BookBranchMappingId = @BookBranchMappingId AND [Z-PurchaseBillMaster-Z].EntryTypeId = @EntryTypeId 		
					  
		DECLARE @LRDetails TABLE
			(
				ProductBranchMappingId int,
				Quantity1 decimal(9, 3),
				Quantity2 decimal(9, 3),
				Quantity3 decimal(9, 3),
				Quantity4 decimal(9, 3),
				Quantity5 decimal(9, 3),
				Quantity6 decimal(9, 3),
				DiscountPercentage decimal(5, 2),
				DiscountAmount decimal(9, 3),
				Rate decimal(9, 3),
				OtherCharges decimal(9, 3),
				BasicAmount decimal(9, 3),
				GSTStateCessPercentage decimal(5, 2),
				GSTCentralCess decimal(5, 0),
				BatchNumber varchar(30),
				ExpiryDate datetime,
				ItemDesc1 nvarchar(100),
				ItemDesc2 nvarchar(100),
				ItemDesc3 nvarchar(100),
				ItemDesc4 nvarchar(100),
				ItemDesc5 nvarchar(100),
				ItemDesc6 nvarchar(100),
				QuantityDiscountPercentage decimal(3, 2),
				QuantityDiscountAmount decimal(9, 3),
				SpecialDiscount1 decimal(9, 3),
				SpecialDiscount2 decimal(9, 3),
				SpecialDiscount3 decimal(9, 3),
				SalesRate decimal(9, 3),
				SalesDiscount decimal(9, 3)
			);

	    INSERT INTO @LRDetails
		SELECT
		    ProductBranchMappingId,Quantity1,Quantity2,Quantity3,Quantity4,Quantity5,Quantity6,DiscountPercentage,
			DiscountAmount,Rate,OtherCharges,BasicAmount,GSTStateCessPercentage,GSTCentralCess,BatchNumber,ExpiryDate,
			ItemDesc1,ItemDesc2,ItemDesc3,ItemDesc4,ItemDesc5,ItemDesc6,QuantityDiscountPercentage,QuantityDiscountAmount,
			SpecialDiscount1,SpecialDiscount2,SpecialDiscount3,SalesRate,SalesDiscount
		FROM OPENJSON(@PurchaseDetailsJson)
		WITH (
				ProductBranchMappingId int,
				Quantity1 decimal(9, 3),
				Quantity2 decimal(9, 3),
				Quantity3 decimal(9, 3),
				Quantity4 decimal(9, 3),
				Quantity5 decimal(9, 3),
				Quantity6 decimal(9, 3),
				DiscountPercentage decimal(5, 2),
				DiscountAmount decimal(9, 3),
				Rate decimal(9, 3),
				OtherCharges decimal(9, 3),
				BasicAmount decimal(9, 3),
				GSTStateCessPercentage decimal(5, 2),
				GSTCentralCess decimal(5, 0),
				BatchNumber varchar(30),
				ExpiryDate datetime,
				ItemDesc1 nvarchar(100),
				ItemDesc2 nvarchar(100),
				ItemDesc3 nvarchar(100),
				ItemDesc4 nvarchar(100),
				ItemDesc5 nvarchar(100),
				ItemDesc6 nvarchar(100),
				QuantityDiscountPercentage decimal(3, 2),
				QuantityDiscountAmount decimal(9, 3),
				SpecialDiscount1 decimal(9, 3),
				SpecialDiscount2 decimal(9, 3),
				SpecialDiscount3 decimal(9, 3),
				SalesRate decimal(9, 3),
				SalesDiscount decimal(9, 3)
		);	
						

		DECLARE @IdCheck INT
		SELECT @IdCheck = ID FROM [Z-PurchaseBillMaster-Z] 
							WHERE (Id = @Id) 
							OR (BranchId = @BranchId AND Deleted = 1)

		IF ISNULL(@IdCheck, 0) = 0
		BEGIN

			INSERT INTO [Z-PurchaseBillMaster-Z]
				(AccountBranchMappingId,BookBranchMappingId,BillDate,BillNumberFirm,BillNumberBranch,BillNumberTable,BillNumberBranchTable,DeliveryBranchId,IsAutoLedger,EntryTypeId,TaxableAmount,TDSPercent,TDSAmount
				,SGSTTotal,CGSTTotal,IGSTTotal,GSTStateCessTotal,GSTCentralCessTotal,TCSPercent,TCSAmount,CreditDays,RoundOff,BillAmount,Notes,EwayBillNumber,BrokerBranchMappingId,CityIdTo,AccountId,PurchaseBillNumber
				,TransportGSTNumber
				,TransportLRNumber
				,TransportLRDate
				,TransportName
				,TransportModeId
				,VehicleNumber
				,HeaderBox1
				,HeaderBox2
				,HeaderBox3
				,HeaderBox4
				,HeaderBox5
				,IRNNumber
				,AcknowledgementNumber
				,IRNDate
				,SkipInGSTR
				,RCMBillNumber,BillTypeID,AddedOn,AddedById,BranchId,YearId,FirmId)
			VALUES 
				(@AccountBranchMappingId,@BookBranchMappingId,@BillDate,@BillNumberFirm,@BillNumberBranch,'','',@BranchId,0,@EntryTypeId,@TaxableAmount,@TDSPercent,@TDSAmount
				,@SGSTTotal,@CGSTTotal,@IGSTTotal,@GSTStateCessTotal,@GSTCentralCessTotal,@TCSPercent,@TCSAmount,@CreditDays,@RoundOff,@BillAmount,@Notes,@EwayBillNumber,@BrokerId,@CityIdTo,@AccountId,@PurBillNo
				,@TransportGSTNumber
				,@TransportLRNumber
				,@TransportLRDate
				,@TransportName
				,@TransportModeId
				,@VehicleNumber
				,@Header1
				,@Header2
				,@Header3
				,@Header4
				,@Header5
				,@IRNNumber
				,@AcknowledgementNumber
				,@IRNDate
				,@SkipInGSTR
				,@RCMBillNumber,@BillTypeID,GETUTCDATE(),@LoginId,@BranchId,@YearId,@FirmId)

			SET @Id = SCOPE_IDENTITY();
			
		END
		ELSE
		BEGIN
			SET @Id = @IdCheck

			UPDATE [Z-PurchaseBillMaster-Z] SET
			AccountBranchMappingId = @AccountBranchMappingId 
			,BookBranchMappingId = @BookBranchMappingId 
			,BillNumberFirm = @BillNumberFirm 
			,EntryTypeId = @EntryTypeId 
			,BillDate = @BillDate 
			,DeliveryBranchId = @BranchId 
			,EwayBillNumber = @EwayBillNumber
			,TransportGSTNumber = @TransportGSTNumber
			,TransportLRNumber = @TransportLRNumber
			,TransportLRDate = @TransportLRDate
			,TransportName = @TransportName
			,TransportModeId = @TransportModeId
			,VehicleNumber = @VehicleNumber
			,HeaderBox1 = @Header1
			,HeaderBox2 = @Header2
			,HeaderBox3 = @Header3
			,HeaderBox4 = @Header4
			,HeaderBox5 = @Header5
			,IRNNumber = @IRNNumber
			,BrokerBranchMappingId = @BrokerId
			,CityIdTo = @CityIdTo
			,AccountId = @AccountId
			,PurchaseBillNumber = @PurBillNo
			,AcknowledgementNumber = @AcknowledgementNumber
			,IRNDate = @IRNDate
			,TaxableAmount = @TaxableAmount 
			,TDSPercent = @TDSPercent 
			,TDSAmount = @TDSAmount 
			,SGSTTotal = @SGSTTotal 
			,CGSTTotal = @CGSTTotal 
			,IGSTTotal = @IGSTTotal 
			,GSTStateCessTotal = @GSTStateCessTotal 
			,GSTCentralCessTotal = @GSTCentralCessTotal 
			,TCSPercent = @TCSPercent 
			,TCSAmount = @TCSAmount 
			,CreditDays = @CreditDays 
			,RoundOff = @RoundOff 
			,BillAmount = @BillAmount 
			,SkipInGSTR = @SkipInGSTR
			,Notes = @Notes 
			,RCMBillNumber = @RCMBillNumber 
			,BillTypeID = @BillTypeID 
			,DeletedById = NULL 
			,DeletedOn = NULL 
			,ModifiedById = @LoginId 
			,ModifiedOn = GETUTCDATE() 
			,Deleted = 0 
			,BranchId = @BranchId 
			,FirmId = @FirmId 
			,YearId = @YearId 
			WHERE Id = @Id

			UPDATE  [Z-PurchaseBillDetail-Z] SET
					DeletedById = @LoginId,
					DeletedOn = GETUTCDATE(),
					Deleted = 1
			WHERE PurchaseBillMasterId = @Id AND ProductBranchMappingId NOT IN ( SELECT ProductBranchMappingId FROM @LRDetails)

			UPDATE  [Z-PurchaseBillDetail-Z] SET
					DeletedById = NULL,
					DeletedOn = NULL,
					Deleted = 0
			WHERE PurchaseBillMasterId = @Id AND ProductBranchMappingId IN ( SELECT ProductBranchMappingId FROM @LRDetails)
		END

		MERGE INTO [dbo].[Z-PurchaseBillDetail-Z] AS LRTarget
		USING @LRDetails AS LRSource
		ON LRTarget.PurchaseBillMasterId = @Id AND LRTarget.ProductBranchMappingId = LRSource.ProductBranchMappingId
		WHEN MATCHED THEN
		    UPDATE SET 
		        LRTarget.ProductBranchMappingId = LRSource.ProductBranchMappingId,
				LRTarget.Quantity1 = LRSource.Quantity1,
				LRTarget.Quantity2 = LRSource.Quantity2,
				LRTarget.Quantity3 = LRSource.Quantity3,
				LRTarget.Quantity4 = LRSource.Quantity4,
				LRTarget.Quantity5 = LRSource.Quantity5,
				LRTarget.Quantity6 = LRSource.Quantity6,
				LRTarget.DiscountPercentage = LRSource.DiscountPercentage,
				LRTarget.DiscountAmount = LRSource.DiscountAmount,
				LRTarget.Rate = LRSource.Rate,
				LRTarget.OtherCharges = LRSource.OtherCharges,
				LRTarget.BasicAmount = LRSource.BasicAmount,
				LRTarget.GSTStateCessPercentage = LRSource.GSTStateCessPercentage,
				LRTarget.GSTCentralCess = LRSource.GSTCentralCess,
				LRTarget.BatchNumber = LRSource.BatchNumber,
				LRTarget.ExpiryDate = LRSource.ExpiryDate,
				LRTarget.ItemDesc1 = LRSource.ItemDesc1,
				LRTarget.ItemDesc2 = LRSource.ItemDesc2,
				LRTarget.ItemDesc3 = LRSource.ItemDesc3,
				LRTarget.ItemDesc4 = LRSource.ItemDesc4,
				LRTarget.ItemDesc5 = LRSource.ItemDesc5,
				LRTarget.ItemDesc6 = LRSource.ItemDesc6,
				LRTarget.QuantityDiscountPercentage = LRSource.QuantityDiscountPercentage,
				LRTarget.QuantityDiscountAmount = LRSource.QuantityDiscountAmount,
				LRTarget.SpecialDiscount1 = LRSource.SpecialDiscount1,
				LRTarget.SpecialDiscount2 = LRSource.SpecialDiscount2,
				LRTarget.SpecialDiscount3 = LRSource.SpecialDiscount3,
				LRTarget.SalesRate = LRSource.SalesRate,
				LRTarget.SalesDiscount = LRSource.SalesDiscount,
		        LRTarget.ModifiedOn = GETUTCDATE(),
		        LRTarget.ModifiedById = @LoginId
		WHEN NOT MATCHED THEN
		    INSERT (
		        PurchaseBillMasterId,ProductBranchMappingId,Quantity1,Quantity2,Quantity3,Quantity4,Quantity5,Quantity6,DiscountPercentage,
				DiscountAmount,Rate,OtherCharges,BasicAmount,GSTStateCessPercentage,GSTCentralCess,BatchNumber,ExpiryDate,
				ItemDesc1,ItemDesc2,ItemDesc3,ItemDesc4,ItemDesc5,ItemDesc6,QuantityDiscountPercentage,QuantityDiscountAmount,
				SpecialDiscount1,SpecialDiscount2,SpecialDiscount3,SalesRate,SalesDiscount, AddedOn, AddedById
		    )
		    VALUES (
		        @Id,LRSource.ProductBranchMappingId,LRSource.Quantity1,LRSource.Quantity2,LRSource.Quantity3,LRSource.Quantity4,LRSource.Quantity5,LRSource.Quantity6,
				LRSource.DiscountPercentage,LRSource.DiscountAmount,LRSource.Rate,LRSource.OtherCharges,LRSource.BasicAmount,LRSource.GSTStateCessPercentage,LRSource.GSTCentralCess,
				LRSource.BatchNumber,LRSource.ExpiryDate,LRSource.ItemDesc1,LRSource.ItemDesc2,LRSource.ItemDesc3,LRSource.ItemDesc4,LRSource.ItemDesc5,LRSource.ItemDesc6,
				LRSource.QuantityDiscountPercentage,LRSource.QuantityDiscountAmount,LRSource.SpecialDiscount1,LRSource.SpecialDiscount2,LRSource.SpecialDiscount3,
				LRSource.SalesRate,LRSource.SalesDiscount, GETUTCDATE(), @LoginId
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
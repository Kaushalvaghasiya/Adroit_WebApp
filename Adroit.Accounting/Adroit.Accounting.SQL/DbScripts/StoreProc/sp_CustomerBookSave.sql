CREATE OR ALTER   PROCEDURE [dbo].[sp_CustomerBookSave]
(
	 @loginId int
	,@FirmId int
	,@BranchId int
	,@Id int  
	,@BookAccountId int  
	,@BookTypeId tinyint  
	,@BoxLabel1 nvarchar(100)
	,@BoxLabel2 nvarchar(100)
	,@BoxLabel3 nvarchar(100)
	,@BoxLabel4 nvarchar(100)
	,@BoxLabel5 nvarchar(100)
	,@BoxLabel6 nvarchar(100)
	,@BillNoPrefix varchar(15)
	,@BillNoPostFix varchar(15)
	,@LRRequired bit
	,@BillTypeID tinyint
	,@IsGeneralPurchase bit
	,@IsItemDiscount bit
	,@IsItemDiscountSp bit
	,@IsCashPayAtBill bit
	,@ItemDesc1 nvarchar(30)
	,@ItemDesc2 nvarchar(30)
	,@ItemDesc3 nvarchar(30)
	,@ItemDesc4 nvarchar(30)
	,@ItemDesc5 nvarchar(30)
	,@ItemDesc6 nvarchar(30)
	,@ShowSalesOrderBoxNumber bit
	,@ShowPurcahseOrderBoxNumber bit
	,@ShowQuotationBoxNumber bit
	,@ShowPerformaInvoiceNumber bit
	,@SalesBillFrom char
	,@IsCalcMultiply bit
	,@BookShortName nvarchar(20)
	,@HeaderBox1 nvarchar(30)
	,@HeaderBox2 nvarchar(30)
	,@HeaderBox3 nvarchar(30)
	,@HeaderBox4 nvarchar(30)
	,@HeaderBox5 nvarchar(30)
	,@IsTDSAccount bit
	,@TDSAccountId int
	,@IsTCSAccount bit  
	,@TCSAccountId int  
	,@SGSTAccountId int  
	,@CGSTAccountId int  
	,@IGSTAccountId int  
	,@GSTStateCessAccountId int  
	,@GSTCentralCessAccountId int  
	,@RCMSGSTPayAccountId int
	,@RCMCGSTPayAccountId int
	,@RCMIGSTPayAccountId int
	,@RCMSGSTRecAccountId int
	,@RCMCGSTRecAccountId int
	,@RCMIGSTRecAccountId int
	,@RoundOffAccountId int
	,@Active bit = 1
	,@CustomerBookBranchId NVARCHAR(MAX)
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		DECLARE @CustomerId int = dbo.fn_GetCustomerId(@loginId);
		SELECT @FirmId = ( SELECT Id FROM CustomerFirm WHERE CustomerId = @CustomerId);
		DECLARE @YearId int = ( SELECT Id FROM FinanceYear WHERE FirmId = @FirmId);

		DECLARE @message VARCHAR(4000);

		IF @YearId IS NULL
		BEGIN
			SET @message = 'Year Not Found!';
			RAISERROR ('%s', 16, 1, @message);
		END

		IF EXISTS (SELECT 1 FROM CustomerBook WHERE (Id = @Id) OR (BookAccountId = @BookAccountId AND BillTypeID = @BillTypeID AND CustomerId = @CustomerId AND YearId = @YearId AND Deleted = 1))
		BEGIN

			IF ISNULL(@Id,0) <= 0
			BEGIN
				SET @Id = (SELECT Id FROM CustomerBook WHERE BookAccountId = @BookAccountId AND BillTypeID = @BillTypeID AND CustomerId = @CustomerId AND YearId = @YearId)
			END

			UPDATE CustomerBook SET
			 CustomerId = @CustomerId
			,YearId = @YearId
			,BookAccountId = @BookAccountId
			,BookTypeId = @BookTypeId
			,BoxLabel1 = @BoxLabel1
			,BoxLabel2 = @BoxLabel2
			,BoxLabel3 = @BoxLabel3
			,BoxLabel4 = @BoxLabel4
			,BoxLabel5 = @BoxLabel5
			,BoxLabel6 = @BoxLabel6
			,BillNoPrefix = @BillNoPrefix
			,BillNoPostFix = @BillNoPostFix
			,LRRequired = @LRRequired
			,BillTypeID = @BillTypeID
			,IsGeneralPurchase = @IsGeneralPurchase
			,IsItemDiscount = @IsItemDiscount
			,IsItemDiscountSp = @IsItemDiscountSp
			,IsCashPayAtBill = @IsCashPayAtBill
			,ItemDesc1 = @ItemDesc1
			,ItemDesc2 = @ItemDesc2
			,ItemDesc3 = @ItemDesc3
			,ItemDesc4 = @ItemDesc4
			,ItemDesc5 = @ItemDesc5
			,ItemDesc6 = @ItemDesc6
			,ShowSalesOrderBoxNumber = @ShowSalesOrderBoxNumber
			,ShowPurcahseOrderBoxNumber = @ShowPurcahseOrderBoxNumber
			,ShowQuotationBoxNumber = @ShowQuotationBoxNumber
			,ShowPerformaInvoiceNumber = @ShowPerformaInvoiceNumber
			,SalesBillFrom = @SalesBillFrom
			,IsCalcMultiply = @IsCalcMultiply
			,BookShortName = @BookShortName
			,HeaderBox1 = @HeaderBox1
			,HeaderBox2 = @HeaderBox2
			,HeaderBox3 = @HeaderBox3
			,HeaderBox4 = @HeaderBox4
			,HeaderBox5 = @HeaderBox5
			,IsTDSAccount = @IsTDSAccount
			,TDSAccountId = @TDSAccountId
			,IsTCSAccount = @IsTCSAccount
			,TCSAccountId = @TCSAccountId
			,SGSTAccountId = @SGSTAccountId
			,CGSTAccountId = @CGSTAccountId
			,IGSTAccountId = @IGSTAccountId
			,GSTStateCessAccountId = @GSTStateCessAccountId
			,GSTCentralCessAccountId = @GSTCentralCessAccountId
			,RcmSGSTPayAccountId = @RCMSGSTPayAccountId
			,RcmCGSTPayAccountId = @RCMCGSTPayAccountId
			,RcmIGSTPayAccountId = @RCMIGSTPayAccountId
			,RcmSGSTRecAccountId = @RCMSGSTRecAccountId
			,RcmCGSTRecAccountId = @RCMCGSTRecAccountId
			,RcmIGSTRecAccountId = @RCMIGSTRecAccountId
			,RoundOffAccountId = @RoundOffAccountId
			,OwnerBranchId = @BranchId
			,Active = @Active
			,DeletedById = NULL
			,DeletedOn = NULL
			,Deleted = 0
			WHERE Id = @Id
			
			DELETE FROM [CustomerBookBranchMapping] WHERE BookId = @Id
		END
		ELSE
		BEGIN

			INSERT INTO CustomerBook
			(CustomerId,YearId,BookAccountId,BookTypeId,BoxLabel1,BoxLabel2,BoxLabel3,BoxLabel4,BoxLabel5,BoxLabel6,BillNoPrefix,BillNoPostFix,LRRequired,BillTypeID,IsGeneralPurchase,
				IsItemDiscount,IsItemDiscountSp,IsCashPayAtBill,ItemDesc1,ItemDesc2,ItemDesc3,ItemDesc4,ItemDesc5,ItemDesc6,ShowSalesOrderBoxNumber,ShowPurcahseOrderBoxNumber,
				ShowQuotationBoxNumber,ShowPerformaInvoiceNumber,SalesBillFrom,IsCalcMultiply,BookShortName,HeaderBox1,HeaderBox2,HeaderBox3,HeaderBox4,HeaderBox5,IsTDSAccount,
				TDSAccountId,IsTCSAccount,TCSAccountId,SGSTAccountId,CGSTAccountId,IGSTAccountId,GSTStateCessAccountId,GSTCentralCessAccountId,RcmSGSTPayAccountId,
				RcmCGSTPayAccountId,RcmIGSTPayAccountId,RcmSGSTRecAccountId,RcmCGSTRecAccountId,RcmIGSTRecAccountId,RoundOffAccountId,Active,OwnerBranchId,AddedOn,AddedById)
			VALUES
			(@CustomerId,@YearId,@BookAccountId,@BookTypeId,@BoxLabel1,@BoxLabel2,@BoxLabel3,@BoxLabel4,@BoxLabel5,@BoxLabel6,@BillNoPrefix,@BillNoPostFix,@LRRequired,@BillTypeID,@IsGeneralPurchase,
				@IsItemDiscount,@IsItemDiscountSp,@IsCashPayAtBill,@ItemDesc1,@ItemDesc2,@ItemDesc3,@ItemDesc4,@ItemDesc5,@ItemDesc6,@ShowSalesOrderBoxNumber,@ShowPurcahseOrderBoxNumber,
				@ShowQuotationBoxNumber,@ShowPerformaInvoiceNumber,@SalesBillFrom,@IsCalcMultiply,@BookShortName,@HeaderBox1,@HeaderBox2,@HeaderBox3,@HeaderBox4,@HeaderBox5,
				@IsTDSAccount,@TDSAccountId,@IsTCSAccount,@TCSAccountId,@SGSTAccountId,@CGSTAccountId,@IGSTAccountId,@GSTStateCessAccountId,@GSTCentralCessAccountId,
				@RCMSGSTPayAccountId,@RCMCGSTPayAccountId,@RCMIGSTPayAccountId,@RCMSGSTRecAccountId,@RCMCGSTRecAccountId,@RCMIGSTRecAccountId,@RoundOffAccountId,@Active,@BranchId,GETUTCDATE(),@loginId)

			SET @Id = SCOPE_IDENTITY();
			
		END

		INSERT INTO [CustomerBookBranchMapping] 
				(BookId,BranchId,AddedById,AddedOn)
				Select 
				@Id,
				Id,
				@loginId,
				GETUTCDATE()
				from dbo.[fnStringToIntArray](@CustomerBookBranchId)
		
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
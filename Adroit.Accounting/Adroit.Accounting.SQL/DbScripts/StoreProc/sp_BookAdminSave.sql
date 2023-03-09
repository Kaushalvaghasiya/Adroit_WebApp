CREATE OR ALTER   PROCEDURE [dbo].[sp_BookAdminSave]
(
	@LoginId int
	,@FirmId int
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
	,@IsDeleted bit = 0
	,@IsActive bit = 1
)
AS
BEGIN
	IF EXISTS (SELECT 1 FROM BookAdmin WHERE Id = @Id)
		BEGIN
			UPDATE BookAdmin SET
			BookAccountId = @BookAccountId
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
			,RCMSGSTPayAccountId = @RCMSGSTPayAccountId
			,RCMCGSTPayAccountId = @RCMCGSTPayAccountId
			,RCMIGSTPayAccountId = @RCMIGSTPayAccountId
			,RCMSGSTRecAccountId = @RCMSGSTRecAccountId
			,RCMCGSTRecAccountId = @RCMCGSTRecAccountId
			,RCMIGSTRecAccountId = @RCMIGSTRecAccountId
			,RoundOffAccountId = @RoundOffAccountId
			,IsDeleted = @IsDeleted
			,IsActive = @IsActive
			WHERE Id = @Id
			SELECT @Id;
		END
	ELSE
		BEGIN
			INSERT INTO BookAdmin
			(BookAccountId,BookTypeId,BoxLabel1,BoxLabel2,BoxLabel3,BoxLabel4,BoxLabel5,BoxLabel6,BillNoPrefix,BillNoPostFix,LRRequired,BillTypeID,IsGeneralPurchase,
				IsItemDiscount,IsItemDiscountSp,IsCashPayAtBill,ItemDesc1,ItemDesc2,ItemDesc3,ItemDesc4,ItemDesc5,ItemDesc6,ShowSalesOrderBoxNumber,ShowPurcahseOrderBoxNumber,
				ShowQuotationBoxNumber,ShowPerformaInvoiceNumber,SalesBillFrom,IsCalcMultiply,BookShortName,HeaderBox1,HeaderBox2,HeaderBox3,HeaderBox4,HeaderBox5,IsTDSAccount,
				TDSAccountId,IsTCSAccount,TCSAccountId,SGSTAccountId,CGSTAccountId,IGSTAccountId,GSTStateCessAccountId,GSTCentralCessAccountId,RCMSGSTPayAccountId,
				RCMCGSTPayAccountId,RCMIGSTPayAccountId,RCMSGSTRecAccountId,RCMCGSTRecAccountId,RCMIGSTRecAccountId,RoundOffAccountId,IsDeleted,IsActive)
			VALUES
			(@BookAccountId,@BookTypeId,@BoxLabel1,@BoxLabel2,@BoxLabel3,@BoxLabel4,@BoxLabel5,@BoxLabel6,@BillNoPrefix,@BillNoPostFix,@LRRequired,@BillTypeID,@IsGeneralPurchase,
			 @IsItemDiscount,@IsItemDiscountSp,@IsCashPayAtBill,@ItemDesc1,@ItemDesc2,@ItemDesc3,@ItemDesc4,@ItemDesc5,@ItemDesc6,@ShowSalesOrderBoxNumber,@ShowPurcahseOrderBoxNumber,
			 @ShowQuotationBoxNumber,@ShowPerformaInvoiceNumber,@SalesBillFrom,@IsCalcMultiply,@BookShortName,@HeaderBox1,@HeaderBox2,@HeaderBox3,@HeaderBox4,@HeaderBox5,
			 @IsTDSAccount,@TDSAccountId,@IsTCSAccount,@TCSAccountId,@SGSTAccountId,@CGSTAccountId,@IGSTAccountId,@GSTStateCessAccountId,@GSTCentralCessAccountId,
			 @RCMSGSTPayAccountId,@RCMCGSTPayAccountId,@RCMIGSTPayAccountId,@RCMSGSTRecAccountId,@RCMCGSTRecAccountId,@RCMIGSTRecAccountId,@RoundOffAccountId,@IsDeleted,@IsActive)

			SET @Id = SCOPE_IDENTITY();
			SELECT @Id;
		END
END
GO
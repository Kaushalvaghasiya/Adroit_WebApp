CREATE OR ALTER PROCEDURE [dbo].[sp_ProductSave]
(
	 @Id INT,
	 @loginId INT,
	 @Title NVARCHAR(100),
	 @Code VARCHAR(20),
	 @PrintName NVARCHAR(100),
	 @TitleAlternate NVARCHAR(100),
	 @DesignNumberId INT,
	 @DesignNumber NVARCHAR(50),
	 @ColourId INT,
	 @Colour NVARCHAR(50),
	 @SizeId INT,
	 @Size NVARCHAR(50),
	 @PackingId INT,
	 @Packing NVARCHAR(50),
	 @ShadeNumberId INT,
	 @ShadeNumber NVARCHAR(50),
	 @FabricId INT,
	 @Fabric NVARCHAR(50),
	 @GroupId INT,
	 @Group NVARCHAR(40),
	 @SubGroupId INT,
	 @SubGroup NVARCHAR(50),
	 @StockTypeId INT,
	 @StockType NVARCHAR(50),
	 @QualityTypeId INT,
	 @QualityType NVARCHAR(50),
	 @UQCId INT,
	 @UQC NVARCHAR(30),
	 @HSNCode VARCHAR(8),
	 @CategoryId SMALLINT,
	 @Category NVARCHAR(30),
	 @DenierWeight DECIMAL(5, 3),
	 @RatePerMeter DECIMAL(5, 3),
	 @RateRetail DECIMAL(5, 3),
	 @Mrp DECIMAL(5, 3),
	 @DistributorRate DECIMAL(5, 3),
	 @DealerRate DECIMAL(5, 3),
	 @PurchaseRate DECIMAL(5, 3),
	 @Cut DECIMAL(4, 2),
	 @AveragePack DECIMAL(5, 2),
	 @BoxPack DECIMAL(5, 2),
	 @RolMin DECIMAL(5, 2),
	 @RolMax DECIMAL(7, 2),
	 @GSTCalculationId TINYINT,
	 @GSTCalculation NVARCHAR(30),
	 @GSTRateId TINYINT,
	 @GSTRate DECIMAL(15, 3),
	 @GstCentralCess DECIMAL(5, 2),
	 @GstStateCess DECIMAL(5, 2),
	 @AmountCalcId SMALLINT,
	 @AmountCalc NVARCHAR(25),
	 @RateUpdate BIT,
	 @Discount DECIMAL(4, 2),
	 @HSNDesc NVARCHAR(50),
	 @Remarks1 NVARCHAR(250),
	 @Remarks2 NVARCHAR(250),
	 @Active BIT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		DECLARE @CustomerId int = dbo.fn_GetCustomerId(@loginId);

		IF ((@DesignNumberId IS NULL OR @DesignNumberId <= 0) AND @DesignNumber != '')
		BEGIN
			EXEC @DesignNumberId = dbo.sp_ProductDesignNumberSave  0, @loginId, @DesignNumber , 0, @loginId, @loginId, 1
			SELECT @DesignNumberId = Id FROM ProductDesignNumber WHERE Title = @DesignNumber AND Active = 1
		END

		IF ((@ColourId IS NULL OR @ColourId <= 0) AND @Colour != '')
		BEGIN
			EXEC @ColourId = dbo.sp_ProductColorSave  0, @loginId, @Colour , 0, @loginId, @loginId, 1
			SELECT @ColourId = Id FROM ProductColor WHERE Title = @Colour AND Active = 1
		END

		IF ((@SizeId IS NULL OR @SizeId <= 0) AND @Size != '')
		BEGIN
			EXEC @SizeId = dbo.sp_ProductSizeSave  0, @loginId, @Size , 0, @loginId, @loginId, 1
			SELECT @SizeId = Id FROM ProductSize WHERE Title = @Size AND Active = 1
		END

		IF ((@PackingId IS NULL OR @PackingId <= 0) AND @Packing != '')
		BEGIN
			EXEC @PackingId = dbo.sp_ProductPackingSave  0, @loginId, @Packing , 0, @loginId, @loginId, 1
			SELECT @PackingId = Id FROM ProductPacking WHERE Title = @Packing AND Active = 1
		END

		IF ((@ShadeNumberId IS NULL OR @ShadeNumberId <= 0) AND @ShadeNumber != '')
		BEGIN
			EXEC @ShadeNumberId = dbo.sp_ProductShadeNumberSave  0, @loginId, @ShadeNumber , 0, @loginId, @loginId, 1
			SELECT @ShadeNumberId = Id FROM ProductShadeNumber WHERE Title = @ShadeNumber AND Active = 1
		END

		IF ((@FabricId IS NULL OR @FabricId <= 0) AND @Fabric != '')
		BEGIN
			EXEC @FabricId = dbo.sp_ProductFabricSave  0, @loginId, @Fabric , 0, @loginId, @loginId, 1
			SELECT @FabricId = Id FROM ProductFabric WHERE Title = @Fabric AND Active = 1
		END

		IF ((@GroupId IS NULL OR @GroupId <= 0) AND @Group != '')
		BEGIN
			EXEC @GroupId = dbo.sp_ProductGroupSave  0, @loginId, @Group , 0, @loginId, @loginId, 1
			SELECT @GroupId = Id FROM ProductGroup WHERE Title = @Group AND Active = 1
		END

		IF ((@SubGroupId IS NULL OR @SubGroupId <= 0) AND @SubGroup != '')
		BEGIN
			EXEC @SubGroupId = dbo.sp_ProductSubGroupSave  0, @loginId, @SubGroup , 0, @loginId, @loginId, 1
			SELECT @SubGroupId = Id FROM ProductSubGroup WHERE Title = @SubGroup AND Active = 1
		END
		
		IF (@StockTypeId IS NULL OR @StockTypeId <= 0)
		BEGIN
			EXEC @StockTypeId = dbo.sp_ProductStockTypeSave  0, @StockType , 0, 1
			SELECT @StockTypeId = Id FROM ProductStockType WHERE Title = @StockType AND Active = 1
		END

		IF ((@QualityTypeId IS NULL OR @QualityTypeId <= 0) AND @QualityType != '')
		BEGIN
			EXEC @QualityTypeId = dbo.sp_ProductQualityTypeSave  0, @QualityType , 0, 1
			SELECT @QualityTypeId = Id FROM ProductQualityType WHERE Title = @QualityType AND Active = 1
		END

		IF (@UQCId IS NULL OR @UQCId <= 0)
		BEGIN
			
			Declare @UQCCode NVARCHAR(50) = SUBSTRING(@UQC,0,CHARINDEX('-',@UQC))
			Declare @UQCEWayCode NVARCHAR(50) = REPLACE(RIGHT(@UQC,CHARINDEX('-',REVERSE(@UQC))),'-','') 

			EXEC @UQCId = dbo.sp_GSTUQCSave  0, @UQC, @UQCCode, @UQCEWayCode, 0, 1
			SELECT @UQCId = Id FROM GSTUQC WHERE Code = @UQCCode AND Active = 1

		END

		IF ((@CategoryId IS NULL OR @CategoryId <= 0) AND @Category != '')
		BEGIN
			EXEC @CategoryId = dbo.sp_ProductCategorySave  0, @Category , 0, 1
			SELECT @CategoryId = Id FROM ProductCategory WHERE Title = @Category AND Active = 1
		END

		IF (@GSTCalculationId IS NULL OR @GSTCalculationId <= 0)
		BEGIN
			EXEC @GSTCalculationId = dbo.sp_GSTCalculationSave  0, @GSTCalculation , 0, 1
			SELECT @GSTCalculationId = Id FROM GSTCalculation WHERE Title = @GSTCalculation AND Active = 1
		END

		IF (@GSTRateId IS NULL OR @GSTRateId <= 0)
		BEGIN
			EXEC @GSTRateId = dbo.sp_GSTRateSave  0, @GSTRate , 0, 1
			SELECT @GSTRateId = Id FROM GSTRate WHERE Rate = @GSTRate AND Active = 1
		END

		IF (@AmountCalcId IS NULL OR @AmountCalcId <= 0)
		BEGIN
			
			Declare @TmpSoftwareId int = 0 
			EXEC @TmpSoftwareId = dbo.sp_GetSoftwareIdByUserIdThroughBusinessId @loginId
			EXEC @AmountCalcId = dbo.sp_ProductAmtCalcOnSave  0, @AmountCalc, @TmpSoftwareId, 0, 1
			SELECT @AmountCalcId = Id FROM ProductAmtCalcOn WHERE Title = @AmountCalc AND Active = 1

		END

		IF EXISTS (SELECT 1 FROM Product WHERE Id = @Id)
		BEGIN
			UPDATE  Product SET
					CustomerId = @CustomerId,
					Title = @Title,
					Code = @Code,
					PrintName = @PrintName,
					TitleAlternate = @TitleAlternate,
					DesignNumberId = @DesignNumberId,
					ColourId = @ColourId,
					SizeId = @SizeId,
					PackingId = @PackingId,
					ShadeNumberId = @ShadeNumberId,
					FabricId = @FabricId,
					GroupId = @GroupId,
					SubGroupId = @SubGroupId,
					StockTypeId = @StockTypeId,
					QualityTypeId = @QualityTypeId,
					UQCId = @UQCId,
					HSNCode = @HSNCode,
					CategoryId = @CategoryId,
					DenierWeight = @DenierWeight,
					RatePerMeter = @RatePerMeter,
					RateRetail = @RateRetail,
					Mrp = @Mrp,
					DistributorRate = @DistributorRate,
					DealerRate = @DealerRate,
					PurchaseRate = @PurchaseRate,
					Cut = @Cut,
					AveragePack = @AveragePack,
					BoxPack = @BoxPack,
					RolMin = @RolMin,
					RolMax = @RolMax,
					GSTCalculationId = @GSTCalculationId,
					GSTRateId = @GSTRateId,
					GstCentralCess = @GstCentralCess,
					GstStateCess = @GstStateCess,
					AmountCalcId = @AmountCalcId,
					RateUpdate = @RateUpdate,
					Discount = @Discount,
					HSNDesc = @HSNDesc,
					Remarks1 = @Remarks1,
					Remarks2 = @Remarks2,
					Active = @Active,
					ModifiedById = @loginId, 
					ModifiedOn = GETUTCDATE()
			WHERE Id = @Id
		END
		ELSE If EXISTS (SELECT 1 FROM Product WHERE Title = @Title AND Deleted = 1)
		BEGIN
			UPDATE  Product SET
					CustomerId = @CustomerId,
					Title = @Title,
					Code = @Code,
					PrintName = @PrintName,
					TitleAlternate = @TitleAlternate,
					DesignNumberId = @DesignNumberId,
					ColourId = @ColourId,
					SizeId = @SizeId,
					PackingId = @PackingId,
					ShadeNumberId = @ShadeNumberId,
					FabricId = @FabricId,
					GroupId = @GroupId,
					SubGroupId = @SubGroupId,
					StockTypeId = @StockTypeId,
					QualityTypeId = @QualityTypeId,
					UQCId = @UQCId,
					HSNCode = @HSNCode,
					CategoryId = @CategoryId,
					DenierWeight = @DenierWeight,
					RatePerMeter = @RatePerMeter,
					RateRetail = @RateRetail,
					Mrp = @Mrp,
					DistributorRate = @DistributorRate,
					DealerRate = @DealerRate,
					PurchaseRate = @PurchaseRate,
					Cut = @Cut,
					AveragePack = @AveragePack,
					BoxPack = @BoxPack,
					RolMin = @RolMin,
					RolMax = @RolMax,
					GSTCalculationId = @GSTCalculationId,
					GSTRateId = @GSTRateId,
					GstCentralCess = @GstCentralCess,
					GstStateCess = @GstStateCess,
					AmountCalcId = @AmountCalcId,
					RateUpdate = @RateUpdate,
					Discount = @Discount,
					HSNDesc = @HSNDesc,
					Remarks1 = @Remarks1,
					Remarks2 = @Remarks2,
					Active = @Active,
					Deleted = 0
				WHERE Title = @Title

			SELECT @Id=Id FROM Product WHERE Title = @Title 
		END
		ELSE
		BEGIN
			INSERT INTO Product
				(CustomerId, Title, Code, PrintName, TitleAlternate, DesignNumberId, ColourId, SizeId, PackingId, ShadeNumberId, FabricId, GroupId, 
				SubGroupId, StockTypeId, QualityTypeId, UQCId, HSNCode, CategoryId, DenierWeight, RatePerMeter, RateRetail, Mrp, DistributorRate, 
				DealerRate, PurchaseRate, Cut, AveragePack, BoxPack, RolMin, RolMax, GSTCalculationId, GSTRateId, GstCentralCess, GstStateCess, 
				AmountCalcId, RateUpdate, Discount, HSNDesc, Remarks1, Remarks2, Active, AddedById, AddedOn)
			VALUES
				(@CustomerId, @Title, @Code, @PrintName, @TitleAlternate, @DesignNumberId, @ColourId, @SizeId, @PackingId, @ShadeNumberId, @FabricId, @GroupId, 
				@SubGroupId, @StockTypeId, @QualityTypeId, @UQCId, @HSNCode, @CategoryId, @DenierWeight, @RatePerMeter, @RateRetail, @Mrp, @DistributorRate, 
				@DealerRate, @PurchaseRate, @Cut, @AveragePack, @BoxPack, @RolMin, @RolMax, @GSTCalculationId, @GSTRateId, @GstCentralCess, @GstStateCess, 
				@AmountCalcId, @RateUpdate, @Discount, @HSNDesc, @Remarks1, @Remarks2, @Active, @loginId, GETUTCDATE())

			SET @Id = SCOPE_IDENTITY()
		END

		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		IF (@message LIKE '%Violation of UNIQUE KEY%')
		BEGIN
			SET @message = 'Product ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
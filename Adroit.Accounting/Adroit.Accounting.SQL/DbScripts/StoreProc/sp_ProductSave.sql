CREATE OR ALTER PROCEDURE [dbo].[sp_ProductSave]
(
	 @Id INT,
	 @LoginId INT,
	 @FirmId INT,
	 @SoftwareId TINYINT,
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
	 @Active BIT,
	 @ProductBranchId NVARCHAR(MAX)
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

    Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

		IF ISNULL(@DesignNumberId, 0) <= 0 AND ISNULL(@DesignNumber,'') != ''
		BEGIN
			EXEC @DesignNumberId = dbo.sp_ProductDesignNumberSave  0, @LoginId, @DesignNumber , 0, @LoginId, @LoginId, 1
			SELECT @DesignNumberId = Id FROM ProductDesignNumber WHERE Title = @DesignNumber AND Active = 1
		END

		IF ISNULL(@ColourId, 0) <= 0 AND ISNULL(@Colour,'') != '' AND @Colour NOT IN ( SELECT Title From ProductColor WHERE CustomerId = @CustomerId AND Active = 1 AND Deleted = 0 )
		BEGIN
			EXEC @ColourId = dbo.sp_ProductColorSave  0, @LoginId, @Colour , 0, @LoginId, @LoginId, 1
		END
			SELECT @ColourId = Id FROM ProductColor WHERE Title = @Colour AND Active = 1

		IF ISNULL(@SizeId, 0) <= 0 AND ISNULL(@Size,'') != '' AND @Size NOT IN ( SELECT Title From ProductSize WHERE CustomerId = @CustomerId AND Active = 1 AND Deleted = 0 )
		BEGIN
			EXEC @SizeId = dbo.sp_ProductSizeSave  0, @LoginId, @Size , 0, @LoginId, @LoginId, 1
		END
			SELECT @SizeId = Id FROM ProductSize WHERE Title = @Size AND Active = 1

		IF ISNULL(@PackingId, 0) <= 0 AND ISNULL(@Packing,'') != ''
		BEGIN
			EXEC @PackingId = dbo.sp_ProductPackingSave  0, @LoginId, @Packing , 0, @LoginId, @LoginId, 1
			SELECT @PackingId = Id FROM ProductPacking WHERE Title = @Packing AND Active = 1
		END

		IF ISNULL(@ShadeNumberId, 0) <= 0 AND ISNULL(@ShadeNumber,'') != ''
		BEGIN
			EXEC @ShadeNumberId = dbo.sp_ProductShadeNumberSave  0, @LoginId, @ShadeNumber , 0, @LoginId, @LoginId, 1
			SELECT @ShadeNumberId = Id FROM ProductShadeNumber WHERE Title = @ShadeNumber AND Active = 1
		END

		IF ISNULL(@FabricId, 0) <= 0 AND ISNULL(@Fabric,'') != ''
		BEGIN
			EXEC @FabricId = dbo.sp_ProductFabricSave  0, @LoginId, @Fabric , 0, @LoginId, @LoginId, 1
			SELECT @FabricId = Id FROM ProductFabric WHERE Title = @Fabric AND Active = 1
		END

		IF ISNULL(@GroupId, 0) <= 0 AND ISNULL(@Group,'') != ''
		BEGIN
			EXEC @GroupId = dbo.sp_ProductGroupSave  0, @LoginId, @Group , 0, @LoginId, @LoginId, 1
			SELECT @GroupId = Id FROM ProductGroup WHERE Title = @Group AND Active = 1
		END

		IF ISNULL(@SubGroupId, 0) <= 0 AND ISNULL(@SubGroup,'') != ''
		BEGIN
			EXEC @SubGroupId = dbo.sp_ProductSubGroupSave  0, @LoginId, @SubGroup , 0, @LoginId, @LoginId, 1
			SELECT @SubGroupId = Id FROM ProductSubGroup WHERE Title = @SubGroup AND Active = 1
		END
		 
		IF ISNULL(@StockTypeId, 0) <= 0 AND ISNULL(@StockType,'') != ''
		BEGIN
			EXEC @StockTypeId = dbo.sp_ProductStockTypeSave  0, @StockType , 0, 1
			SELECT @StockTypeId = Id FROM ProductStockType WHERE Title = @StockType AND Active = 1
		END
		 
		IF ISNULL(@QualityTypeId, 0) <= 0 AND ISNULL(@QualityType,'') != ''
		BEGIN
			EXEC @QualityTypeId = dbo.sp_ProductQualityTypeSave  0, @QualityType , 0, 1
			SELECT @QualityTypeId = Id FROM ProductQualityType WHERE Title = @QualityType AND Active = 1
		END

		IF ISNULL(@UQCId, 0) <= 0 AND ISNULL(@UQC,'') != ''
		BEGIN
			
			Declare @UQCCode NVARCHAR(50) = SUBSTRING(@UQC,0,CHARINDEX('-',@UQC))
			Declare @UQCEWayCode NVARCHAR(50) = REPLACE(RIGHT(@UQC,CHARINDEX('-',REVERSE(@UQC))),'-','') 

			EXEC @UQCId = dbo.sp_GSTUQCSave  0, @UQC, @UQCCode, @UQCEWayCode, 0, 1
			SELECT @UQCId = Id FROM GSTUQC WHERE Code = @UQCCode AND Active = 1

		END

		IF ISNULL(@CategoryId, 0) <= 0 AND ISNULL(@Category,'') != ''
		BEGIN
			EXEC @CategoryId = dbo.sp_ProductCategorySave  0, @Category , 0, 1
			SELECT @CategoryId = Id FROM ProductCategory WHERE Title = @Category AND Active = 1
		END

		IF ISNULL(@GSTCalculationId, 0) <= 0 AND ISNULL(@GSTCalculation,'') != ''
		BEGIN
			EXEC @GSTCalculationId = dbo.sp_GSTCalculationSave  0, @GSTCalculation , 0, 1
			SELECT @GSTCalculationId = Id FROM GSTCalculation WHERE Title = @GSTCalculation AND Active = 1
		END

		IF ISNULL(@GSTRateId, 0) <= 0 AND ISNULL(@GSTRate,'') != ''
		BEGIN
			EXEC @GSTRateId = dbo.sp_GSTRateSave  0, @GSTRate , 0, 1
			SELECT @GSTRateId = Id FROM GSTRate WHERE Rate = @GSTRate AND Active = 1
		END

		IF ISNULL(@AmountCalcId, 0) <= 0 AND ISNULL(@AmountCalc,'') != ''
		BEGIN
			
			EXEC @AmountCalcId = dbo.sp_ProductAmtCalcOnSave  0, @AmountCalc, @SoftwareId, 0, 1
			SELECT @AmountCalcId = Id FROM ProductAmtCalcOn WHERE Title = @AmountCalc AND Active = 1

		END

		DECLARE @IdCheck INT
		SELECT @IdCheck = ID FROM Product WHERE Id = @Id OR (Title = @Title AND Deleted = 1)

		IF ISNULL(@IdCheck, 0) = 0
		BEGIN
			INSERT INTO Product
				(CustomerId, Title, Code, PrintName, TitleAlternate, DesignNumberId, ColourId, SizeId, PackingId, ShadeNumberId, FabricId, GroupId, 
				SubGroupId, StockTypeId, QualityTypeId, UQCId, HSNCode, CategoryId, DenierWeight, RatePerMeter, RateRetail, Mrp, DistributorRate, 
				DealerRate, PurchaseRate, Cut, AveragePack, BoxPack, RolMin, RolMax, GSTCalculationId, GSTRateId, GstCentralCess, GstStateCess, 
				AmountCalcId, RateUpdate, Discount, HSNDesc, Remarks1, Remarks2, Active, AddedById, AddedOn)
			VALUES
				(@CustomerId, @Title, ISNULL(@Code,''), @PrintName, @TitleAlternate, @DesignNumberId, @ColourId, @SizeId, @PackingId, @ShadeNumberId, @FabricId, @GroupId, 
				@SubGroupId, @StockTypeId, @QualityTypeId, @UQCId, @HSNCode, @CategoryId, @DenierWeight, @RatePerMeter, @RateRetail, @Mrp, @DistributorRate, 
				@DealerRate, @PurchaseRate, @Cut, @AveragePack, @BoxPack, @RolMin, @RolMax, @GSTCalculationId, @GSTRateId, @GstCentralCess, @GstStateCess, 
				@AmountCalcId, @RateUpdate, @Discount, @HSNDesc, @Remarks1, @Remarks2, @Active, @LoginId, GETUTCDATE())

			SET @Id = SCOPE_IDENTITY()
		END
		ELSE
		BEGIN
			SET @Id = @IdCheck
			
			UPDATE  Product SET
					CustomerId = @CustomerId,
					Title = @Title,
					Code = ISNULL(@Code,''),
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
					ModifiedById = @LoginId, 
					ModifiedOn = GETUTCDATE(),
					DeletedById = NULL,
					DeletedOn = NULL,
					Deleted = 0
			WHERE Id = @Id

			UPDATE  ProductBranchMapping SET
					DeletedById = @LoginId,
					DeletedOn = GETUTCDATE(),
					Deleted = 1
			WHERE ProductId = @Id AND [BranchId] NOT IN ( SELECT Id FROM dbo.[fnStringToIntArray](@ProductBranchId))

			UPDATE  ProductBranchMapping SET
					DeletedById = NULL,
					DeletedOn = NULL,
					Deleted = 0
			WHERE ProductId = @Id AND [BranchId] IN ( SELECT Id FROM dbo.[fnStringToIntArray](@ProductBranchId))

		END

		INSERT INTO [ProductBranchMapping] (ProductId,BranchId,AddedById,AddedOn)
		SELECT @Id,Id,@LoginId,GETUTCDATE()
		FROM dbo.[fnStringToIntArray](@ProductBranchId)
		EXCEPT
		SELECT ProductId,BranchId,@LoginId,GETUTCDATE() 
		FROM [dbo].[ProductBranchMapping]
		WHERE [BranchId] IN ( SELECT Id FROM dbo.[fnStringToIntArray](@ProductBranchId))

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
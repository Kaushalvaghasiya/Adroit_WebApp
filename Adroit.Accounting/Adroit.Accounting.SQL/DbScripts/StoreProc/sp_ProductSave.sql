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
	 @DesignNumber NVARCHAR(50),
	 @Colour NVARCHAR(50),
	 @Size NVARCHAR(50),
	 @Packing NVARCHAR(50),
	 @ShadeNumber NVARCHAR(50),
	 @Fabric NVARCHAR(50),
	 @Group NVARCHAR(40),
	 @SubGroup NVARCHAR(50),
	 @StockType NVARCHAR(50),
	 @QualityType NVARCHAR(50),
	 @UQC NVARCHAR(30),
	 @HSNCode VARCHAR(8),
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
	 @GSTCalculation NVARCHAR(30),
	 @GSTRate DECIMAL(15, 3),
	 @GstCentralCess DECIMAL(5, 0),
	 @GstStateCess DECIMAL(5, 2),
	 @AmountCalcId SMALLINT,
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

		DECLARE @DesignNumberId INT = NULL 

		IF (isnull(@DesignNumber, '') <> '')
		BEGIN
			IF EXISTS (SELECT 1 FROM ProductDesignNumber WHERE ProductDesignNumber.CustomerId = @CustomerId AND Title = @DesignNumber AND (Deleted = 1 OR Active = 0))
			begin
				UPDATE ProductDesignNumber SET Deleted = 0, Active = 1 WHERE ProductDesignNumber.CustomerId = @CustomerId AND Title = @DesignNumber;
				SELECT @DesignNumberId = Id FROM ProductDesignNumber WHERE ProductDesignNumber.CustomerId = @CustomerId AND Title = @DesignNumber;
			end
			else
			begin
				SELECT @DesignNumberId  = Id from ProductDesignNumber WHERE ProductDesignNumber.CustomerId = @CustomerId AND Title = @DesignNumber;
				if @DesignNumberId IS NULL
				BEGIN
					EXEC @DesignNumberId = dbo.sp_ProductDesignNumberSave  0, @LoginId, @DesignNumber , 0, @LoginId, @LoginId, 1;
					SELECT @DesignNumberId = Id FROM ProductDesignNumber WHERE ProductDesignNumber.CustomerId = @CustomerId AND Title = @DesignNumber;
				END
			end
		END

		DECLARE @ColourId INT = NULL 

		IF (isnull(@Colour, '') <> '')
		BEGIN
			IF EXISTS (SELECT 1 FROM ProductColor WHERE ProductColor.CustomerId = @CustomerId AND Title = @Colour AND (Deleted = 1 OR Active = 0))
			begin
				UPDATE ProductColor SET Deleted = 0, Active = 1 WHERE ProductColor.CustomerId = @CustomerId AND Title = @Colour;
				SELECT @ColourId = Id FROM ProductColor WHERE ProductColor.CustomerId = @CustomerId AND Title = @Colour;
			end
			else
			begin
				SELECT @ColourId  = Id from ProductColor WHERE ProductColor.CustomerId = @CustomerId AND Title = @Colour
				if @ColourId IS NULL
				BEGIN
					EXEC @ColourId = dbo.sp_ProductColorSave  0, @LoginId, @Colour , 0, @LoginId, @LoginId, 1
					SELECT @ColourId = Id FROM ProductColor WHERE Title = @Colour
				END
			end
		END

		DECLARE @SizeId INT = NULL 

		IF (isnull(@Size, '') <> '')
		BEGIN
			IF EXISTS (SELECT 1 FROM ProductSize WHERE ProductSize.CustomerId = @CustomerId AND Title = @Size AND (Deleted = 1 OR Active = 0))
			begin
				UPDATE ProductSize SET Deleted = 0, Active = 1 WHERE ProductSize.CustomerId = @CustomerId AND Title = @Size;
				SELECT @SizeId = Id FROM ProductSize WHERE ProductSize.CustomerId = @CustomerId AND Title = @Size;
			end
			else
			begin
				SELECT @SizeId  = Id from ProductSize WHERE ProductSize.CustomerId = @CustomerId AND Title = @Size
				if @SizeId IS NULL
				BEGIN
					EXEC @SizeId = dbo.sp_ProductSizeSave  0, @LoginId, @Size , 0, @LoginId, @LoginId, 1
					SELECT @SizeId = Id FROM ProductSize WHERE Title = @Size
				END
			end
		END

		DECLARE @PackingId INT = NULL 

		IF (isnull(@Packing, '') <> '')
		BEGIN
			IF EXISTS (SELECT 1 FROM ProductPacking WHERE ProductPacking.CustomerId = @CustomerId AND Title = @Packing AND (Deleted = 1 OR Active = 0))
			begin
				UPDATE ProductPacking SET Deleted = 0, Active = 1 WHERE ProductPacking.CustomerId = @CustomerId AND Title = @Packing;
				SELECT @PackingId = Id FROM ProductPacking WHERE ProductPacking.CustomerId = @CustomerId AND Title = @Packing;
			end
			else
			begin
				SELECT @PackingId  = Id from ProductPacking WHERE ProductPacking.CustomerId = @CustomerId AND Title = @Packing
				if @PackingId IS NULL
				BEGIN
					EXEC @PackingId = dbo.sp_ProductPackingSave  0, @LoginId, @Packing , 0, @LoginId, @LoginId, 1
					SELECT @PackingId = Id FROM ProductPacking WHERE Title = @Packing
				END
			end
		END

		DECLARE @ShadeNumberId INT = NULL 

		IF (isnull(@ShadeNumber, '') <> '')
		BEGIN
			IF EXISTS (SELECT 1 FROM ProductShadeNumber WHERE ProductShadeNumber.CustomerId = @CustomerId AND Title = @ShadeNumber AND (Deleted = 1 OR Active = 0))
			begin
				UPDATE ProductShadeNumber SET Deleted = 0, Active = 1 WHERE ProductShadeNumber.CustomerId = @CustomerId AND Title = @ShadeNumber;
				SELECT @ShadeNumberId = Id FROM ProductShadeNumber WHERE ProductShadeNumber.CustomerId = @CustomerId AND Title = @ShadeNumber;
			end
			else
			begin
				SELECT @ShadeNumberId  = Id from ProductShadeNumber WHERE ProductShadeNumber.CustomerId = @CustomerId AND Title = @ShadeNumber
				if @ShadeNumberId IS NULL
				BEGIN
					EXEC @ShadeNumberId = dbo.sp_ProductShadeNumberSave  0, @LoginId, @ShadeNumber , 0, @LoginId, @LoginId, 1
					SELECT @ShadeNumberId = Id FROM ProductShadeNumber WHERE Title = @ShadeNumber
				END
			end
		END
		
		DECLARE @FabricId INT = NULL 

		IF (isnull(@Fabric, '') <> '')
		BEGIN
			IF EXISTS (SELECT 1 FROM ProductFabric WHERE ProductFabric.CustomerId = @CustomerId AND Title = @Fabric AND (Deleted = 1 OR Active = 0))
			begin
				UPDATE ProductFabric SET Deleted = 0, Active = 1 WHERE ProductFabric.CustomerId = @CustomerId AND Title = @Fabric;
				SELECT @FabricId = Id FROM ProductFabric WHERE ProductFabric.CustomerId = @CustomerId AND Title = @Fabric;
			end
			else
			begin
				SELECT @FabricId  = Id from ProductFabric WHERE ProductFabric.CustomerId = @CustomerId AND Title = @Fabric
				if @FabricId IS NULL
				BEGIN
					EXEC @FabricId = dbo.sp_ProductFabricSave  0, @LoginId, @Fabric , 0, @LoginId, @LoginId, 1
					SELECT @FabricId = Id FROM ProductFabric WHERE Title = @Fabric
				END
			end
		END

		DECLARE @GroupId INT = NULL 

		IF (isnull(@Group, '') <> '')
		BEGIN
			IF EXISTS (SELECT 1 FROM ProductGroup WHERE ProductGroup.CustomerId = @CustomerId AND Title = @Group AND (Deleted = 1 OR Active = 0))
			begin
				UPDATE ProductGroup SET Deleted = 0, Active = 1 WHERE ProductGroup.CustomerId = @CustomerId AND Title = @Group;
				SELECT @GroupId = Id FROM ProductGroup WHERE ProductGroup.CustomerId = @CustomerId AND Title = @Group;
			end
			else
			begin
				SELECT @GroupId  = Id from ProductGroup WHERE ProductGroup.CustomerId = @CustomerId AND Title = @Group
				if @GroupId IS NULL
				BEGIN
					EXEC @GroupId = dbo.sp_ProductGroupSave  0, @LoginId, @Group , 0, @LoginId, @LoginId, 1
					SELECT @GroupId = Id FROM ProductGroup WHERE Title = @Group
				END
			end
		END

		DECLARE @SubGroupId INT = NULL 

		IF (isnull(@SubGroup, '') <> '')
		BEGIN
			IF EXISTS (SELECT 1 FROM ProductSubGroup WHERE ProductSubGroup.CustomerId = @CustomerId AND Title = @SubGroup AND (Deleted = 1 OR Active = 0))
			begin
				UPDATE ProductSubGroup SET Deleted = 0, Active = 1 WHERE ProductSubGroup.CustomerId = @CustomerId AND Title = @SubGroup;
				SELECT @SubGroupId = Id FROM ProductSubGroup WHERE ProductSubGroup.CustomerId = @CustomerId AND Title = @SubGroup;
			end
			else
			begin
				SELECT @SubGroupId  = Id from ProductSubGroup WHERE ProductSubGroup.CustomerId = @CustomerId AND Title = @SubGroup
				if @SubGroupId IS NULL
				BEGIN
					EXEC @SubGroupId = dbo.sp_ProductSubGroupSave  0, @LoginId, @SubGroup , 0, @LoginId, @LoginId, 1
					SELECT @SubGroupId = Id FROM ProductSubGroup WHERE Title = @SubGroup
				END
			end
		END
		 
		DECLARE @StockTypeId INT = NULL 

		IF (isnull(@StockType, '') <> '')
		BEGIN
			IF EXISTS (SELECT 1 FROM ProductStockType WHERE Title = @StockType AND (Deleted = 1 OR Active = 0))
			begin
				UPDATE ProductStockType SET Deleted = 0, Active = 1 WHERE Title = @StockType;
				SELECT @StockTypeId = Id FROM ProductStockType WHERE Title = @StockType;
			end
			else
			begin
				SELECT @StockTypeId  = Id from ProductStockType WHERE Title = @StockType
				if @StockTypeId IS NULL
				BEGIN
					EXEC @StockTypeId = dbo.sp_ProductStockTypeSave  0, @LoginId, @StockType , 0, @LoginId, @LoginId, 1
					SELECT @StockTypeId = Id FROM ProductStockType WHERE Title = @StockType
				END
			end
		END
		 
		DECLARE @QualityTypeId INT = NULL 

		IF (isnull(@QualityType, '') <> '')
		BEGIN
			IF EXISTS (SELECT 1 FROM ProductQualityType WHERE Title = @QualityType AND (Deleted = 1 OR Active = 0))
			begin
				UPDATE ProductQualityType SET Deleted = 0, Active = 1 WHERE Title = @QualityType;
				SELECT @QualityTypeId = Id FROM ProductQualityType WHERE Title = @QualityType;
			end
			else
			begin
				SELECT @QualityTypeId  = Id from ProductQualityType WHERE Title = @QualityType
				if @QualityTypeId IS NULL
				BEGIN
					EXEC @QualityTypeId = dbo.sp_ProductQualityTypeSave  0, @LoginId, @QualityType , 0, @LoginId, @LoginId, 1
					SELECT @QualityTypeId = Id FROM ProductQualityType WHERE Title = @QualityType
				END
			end
		END

		DECLARE @UQCId TINYINT
		IF (isnull(@UQC, '') <> '')
		BEGIN
			Declare @UQCCode NVARCHAR(50) = LTRIM(RTRIM(SUBSTRING(@UQC, 0, CHARINDEX('-', @UQC))))
			Declare @UQCEWayCode NVARCHAR(50) = LTRIM(RTRIM(SUBSTRING(@UQC, CHARINDEX('-', @UQC) + 1, LEN(@UQC))))
			IF EXISTS (SELECT 1 FROM GSTUQC WHERE Code = @UQCCode AND (Deleted = 1 OR Active = 0))
			BEGIN
				UPDATE GSTUQC SET Deleted = 0, Active = 1 WHERE Code = @UQCCode
				SELECT @UQCId = Id FROM GSTUQC WHERE Code = @UQCCode
			END
			ELSE
			BEGIN
				SELECT @UQCId = Id FROM GSTUQC WHERE Code = @UQCCode
				IF @UQCId IS NULL
				BEGIN
					EXEC @UQCId = dbo.sp_GSTUQCSave  0, @UQC, @UQCCode, @UQCEWayCode, 0, 1
				END
			END
		END

		DECLARE @CategoryId SMALLINT = NULL 

		IF (isnull(@Category, '') <> '')
		BEGIN
			IF EXISTS (SELECT 1 FROM ProductCategory WHERE Title = @Category AND (Deleted = 1 OR Active = 0))
			begin
				UPDATE ProductCategory SET Deleted = 0, Active = 1 WHERE Title = @Category;
				SELECT @CategoryId = Id FROM ProductCategory WHERE Title = @Category;
			end
			else
			begin
				SELECT @CategoryId  = Id from ProductCategory WHERE Title = @Category
				if @CategoryId IS NULL
				BEGIN
					EXEC @CategoryId = dbo.sp_ProductCategorySave  0, @LoginId, @Category , 0, @LoginId, @LoginId, 1
					SELECT @CategoryId = Id FROM ProductCategory WHERE Title = @Category
				END
			end
		END

		DECLARE @GSTCalculationId TINYINT = NULL 

		IF (isnull(@GSTCalculation, '') <> '')
		BEGIN
			IF EXISTS (SELECT 1 FROM GSTCalculation WHERE Title = @GSTCalculation AND (Deleted = 1 OR Active = 0))
			begin
				UPDATE GSTCalculation SET Deleted = 0, Active = 1 WHERE Title = @GSTCalculation;
				SELECT @GSTCalculationId = Id FROM GSTCalculation WHERE Title = @GSTCalculation;
			end
			else
			begin
				SELECT @GSTCalculationId  = Id from GSTCalculation WHERE Title = @GSTCalculation
				if @GSTCalculationId IS NULL
				BEGIN
					EXEC @GSTCalculationId = dbo.sp_GSTCalculationSave  0, @LoginId, @GSTCalculation , 0, @LoginId, @LoginId, 1
					SELECT @GSTCalculationId = Id FROM GSTCalculation WHERE Title = @GSTCalculation
				END
			end
		END

		DECLARE @GSTRateId TINYINT = NULL 

		IF EXISTS (SELECT 1 FROM GSTRate WHERE Rate = @GSTRate AND (Deleted = 1 OR Active = 0))
		begin
			UPDATE GSTRate SET Deleted = 0, Active = 1 WHERE Rate = @GSTRate;
			SELECT @GSTRateId = Id FROM GSTRate WHERE Rate = @GSTRate;
		end
		else
		begin
			SELECT @GSTRateId  = Id from GSTRate WHERE Rate = @GSTRate;
			if @GSTRateId IS NULL
			BEGIN
				EXEC @GSTRateId = dbo.sp_GSTRateSave  0, @GSTRate , 0, 1;
				SELECT @GSTRateId = Id FROM GSTRate WHERE Rate = @GSTRate;
			END
		end

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
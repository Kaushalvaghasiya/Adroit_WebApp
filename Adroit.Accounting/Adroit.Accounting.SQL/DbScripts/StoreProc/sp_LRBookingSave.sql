CREATE OR ALTER  PROCEDURE [dbo].[sp_LRBookingSave]
(
	@LoginId INT
	,@FirmId INT 
	,@BranchId INT
	,@YearId INT 
	,@Id INT  
	,@CityIdTo INT
	,@CityIdFrom INT
	,@LRNumber INT
	,@LRDate DATETIME
	,@EwayBillNo VARCHAR(25)
	,@AccountBranchMappingId INT
	,@DeliveryAccountBranchMappingId INT
	,@LRPayTypeId INT
	,@BillAccountBranchMappingId INT
	,@Parcel INT
	,@PackingId INT = 0
	,@Packing NVARCHAR(100)
	,@DescriptionId INT = 0
	,@Description NVARCHAR(30)
	,@ActualWeight DECIMAL(18,3)
	,@ChargeWeight DECIMAL(18,3)
	,@LRRateOnId INT
	,@Rate DECIMAL(18,2)
	,@Freight DECIMAL(18,2)
	,@InvoiceNo VARCHAR(20)
	,@VehicleId INT
	,@InvoiceValue DECIMAL(18,2)
	,@LRDeliveryId INT
	,@PrivateMarka NVARCHAR(30)
	,@LRDeliveryTypeId INT
	,@Remarks NVARCHAR(100)
	,@Charges1 DECIMAL(18,2)
	,@Charges2 DECIMAL(18,2)
	,@Charges3 DECIMAL(18,2)
	,@Charges4 DECIMAL(18,2)
	,@Charges5 DECIMAL(18,2)
	,@Charges6 DECIMAL(18,2)
	,@IsSaleBilled BIT = 0
	,@IsDispatched BIT = 0
	,@ValidDateFrom DATETIME = NULL
	,@ValidDateTo DATETIME = NULL
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		exec [sp_ValidateLoginBranch] @LoginId, @BranchId, @YearId

		DECLARE @CustomerId int = dbo.[fn_GetCustomerId] (@LoginId);
		
		DECLARE @BookBranchMappingId INT = (SELECT BookingSalesBookBranchMappingId FROM CustomerFirmBranchTransportSetting WHERE BranchId = @BranchId);
		DECLARE @ProductBranchMappingId INT = (
			SELECT ProductBranchMapping.Id 
			FROM CustomerFirmTransportSetting 
				INNER JOIN ProductBranchMapping on ProductBranchMapping.ProductId = CustomerFirmTransportSetting.ProductIdForSales 
				AND ProductBranchMapping.BranchId = @BranchId
			WHERE CustomerFirmTransportSetting.FirmId = @FirmId
		);
		 
		DECLARE @message VARCHAR(4000);

		IF @YearId IS NULL
		BEGIN
			SET @message = 'Year Not Found!';
			RAISERROR ('%s', 16, 1, @message);
		END

		SET @Id = ISNULL(@Id, 0)
		SET @LRNumber = ISNULL(@LRNumber, 0)

		IF (@LRNumber = 0)
		BEGIN
			--LRDATE MUST BE >= LAST LR DATE SAVED FOR THIS BRANCH
			DECLARE @LastLRDate DATE
		    SELECT @LastLRDate = CAST(MAX(LRDate) AS DATE) FROM [Z-LRBooking-Z] WHERE BranchId = @BranchId AND Deleted = 0 
		
		    IF (@LastLRDate IS NOT NULL AND CAST(@LRDate AS DATE) < @LastLRDate)
		    BEGIN
		        SET @message = 'Please select a date on or after ' + CONVERT(VARCHAR, @LastLRDate, 103)
		        RAISERROR ('%s', 16, 1, @message)
		    END

			--GENERATE NEXT LR
			SELECT @LRNumber = MAX(LRNumber)
			FROM [Z-LRBooking-Z]
			WHERE BranchId = @BranchId;

			IF (@LRNumber IS NULL)
			BEGIN
				--Get Active LR Range
				SELECT @LRNumber = StartNumber
				FROM LRBookingRange 
				WHERE FirmId = @FirmId AND BranchId = @BranchId AND YearId = @YearId AND Active = 1 AND Deleted = 0
				IF (@LRNumber IS NULL)
				BEGIN
					SET @message = 'LR Range does not exist.';
					RAISERROR ('%s', 16, 1, @message);
				END
			END
			ELSE
			BEGIN
				SET @LRNumber = @LRNumber + 1
			END
		END
		ELSE
		BEGIN
			--Same LR number not possible in same branch
			IF EXISTS (SELECT 1 FROM [Z-LRBooking-Z] WHERE (@Id = 0 OR Id <> @Id) AND BranchId = @BranchId AND LRNumber = @LRNumber)
			BEGIN
				SET @message = 'This LR Number is already exist.';
				RAISERROR ('%s', 16, 1, @message);
			END

			DECLARE @PrevLRBookingDate DATE
		    SELECT TOP 1 @PrevLRBookingDate = CAST(LRDate AS DATE)
		    FROM [Z-LRBooking-Z]
		    WHERE [Z-LRBooking-Z].BranchId = @BranchId AND [Z-LRBooking-Z].LRNumber < @LRNumber
		    ORDER BY [Z-LRBooking-Z].LRNumber DESC;

			DECLARE @NextLRBookingDate DATE
		    SELECT TOP 1 @NextLRBookingDate = CAST(LRDate AS DATE)
		    FROM [Z-LRBooking-Z]
		    WHERE [Z-LRBooking-Z].BranchId = @BranchId AND [Z-LRBooking-Z].LRNumber > @LRNumber
		    ORDER BY [Z-LRBooking-Z].LRNumber;

		    IF NOT (CAST(@LRDate AS DATE) BETWEEN @PrevLRBookingDate AND @NextLRBookingDate)
		    BEGIN
		        SET @message = 'Please select a date between ' + CONVERT(VARCHAR, @PrevLRBookingDate, 103) + ' and ' + CONVERT(VARCHAR, @NextLRBookingDate, 103);
		        RAISERROR ('%s', 16, 1, @message);
		    END
		END
		
		DECLARE @LRNumberStartRange INT;
		DECLARE @LRNumberEndRange INT;
		SELECT 
			@LRNumberStartRange = StartNumber, 
			@LRNumberEndRange = EndNumber
		FROM LRBookingRange 
		WHERE FirmId = @FirmId AND BranchId = @BranchId AND YearId = @YearId AND Active = 1 AND Deleted = 0

		IF (@LRNumber < @LRNumberStartRange OR @LRNumber > @LRNumberEndRange) 
		BEGIN
			SET @message = 'Please renew LR Range';
			RAISERROR ('%s', 16, 1, @message);
		END

		IF NOT EXISTS (SELECT Title From TransportDesc WHERE CustomerId = @CustomerId AND Title = @Description)
		BEGIN
			EXEC @DescriptionId = dbo.sp_TransportDescSave 0, @LoginId, @Description , 0, @LoginId, @LoginId, 1
		END
		SELECT @DescriptionId = Id FROM TransportDesc WHERE CustomerId = @CustomerId AND Title = @Description AND Active = 1

		IF NOT EXISTS (SELECT Title From TransportPacking WHERE CustomerId = @CustomerId AND Title = @Packing)
		BEGIN
			EXEC @PackingId = dbo.sp_TransportPackingSave 0, @LoginId, @Packing , 1, 0, @LoginId, @LoginId
		END
		SELECT @PackingId = Id FROM TransportPacking WHERE CustomerId = @CustomerId AND Title = @Packing

		DECLARE @IdCheck INT
		SELECT @IdCheck = ID FROM [Z-LRBooking-Z] 
							WHERE (Id = @Id) 
							OR (LRNumber = @LRNumber AND BranchId = @BranchId AND Deleted = 1)

		IF ISNULL(@IdCheck, 0) = 0
		BEGIN
			INSERT INTO [Z-LRBooking-Z]
				(BranchId,YearId,ValidDateFrom,ValidDateTo,AccountBranchMappingId,BookBranchMappingId,LRNumber,LRDate,VehicleId,CityIdFrom,CityIdTo,DeliveryAccountBranchMappingId,BillAccountBranchMappingId
				,EwayBillNo,LRPayTypeId,InvoiceNo,InvoiceValue,PrivateMarka,Parcel,ActualWeight,ChargeWeight,DescriptionId,PackingId,LRRateOnId
				,Rate,Freight,Charges1,Charges2,Charges3,Charges4,Charges5,Charges6,ProductBranchMappingId,Remarks,LRDeliveryId,LRDeliveryTypeId,IsSaleBilled
				,IsDispatched,AddedById,AddedOn)
			VALUES
				(@BranchId,@YearId,@ValidDateFrom,@ValidDateTo,@AccountBranchMappingId,@BookBranchMappingId,@LRNumber,@LRDate,@VehicleId,@CityIdFrom,@CityIdTo,@DeliveryAccountBranchMappingId,@BillAccountBranchMappingId
				,@EwayBillNo,@LRPayTypeId,@InvoiceNo,@InvoiceValue,@PrivateMarka,@Parcel,@ActualWeight,@ChargeWeight,@DescriptionId,@PackingId,@LRRateOnId
				,@Rate,@Freight,@Charges1,@Charges2,@Charges3,@Charges4,@Charges5,@Charges6,@ProductBranchMappingId,@Remarks,@LRDeliveryId,@LRDeliveryTypeId,@IsSaleBilled
				,@IsDispatched,@LoginId,GETUTCDATE())

			SET @Id = SCOPE_IDENTITY();
		END
		ELSE
		BEGIN
			SET @Id = @IdCheck

			UPDATE [Z-LRBooking-Z] SET
			 BranchId = @BranchId
			,YearId = @YearId
			,ValidDateFrom = @ValidDateFrom
			,ValidDateTo = @ValidDateTo
			,AccountBranchMappingId = @AccountBranchMappingId
			,BookBranchMappingId = @BookBranchMappingId
			,LRNumber = @LRNumber
			,LRDate = @LRDate
			,VehicleId = @VehicleId
			,CityIdFrom = @CityIdFrom
			,CityIdTo = @CityIdTo
			,DeliveryAccountBranchMappingId = @DeliveryAccountBranchMappingId
			,BillAccountBranchMappingId = @BillAccountBranchMappingId
			,EwayBillNo = @EwayBillNo
			,LRPayTypeId = @LRPayTypeId
			,InvoiceNo = @InvoiceNo
			,InvoiceValue = @InvoiceValue
			,PrivateMarka = @PrivateMarka
			,Parcel = @Parcel
			,ActualWeight = @ActualWeight
			,ChargeWeight = @ChargeWeight
			,DescriptionId = @DescriptionId
			,PackingId = @PackingId
			,LRRateOnId = @LRRateOnId
			,Rate = @Rate
			,Freight = @Freight
			,Charges1 = @Charges1
			,Charges2 = @Charges2
			,Charges3 = @Charges3
			,Charges4 = @Charges4
			,Charges5 = @Charges5
			,Charges6 = @Charges6
			,ProductBranchMappingId = @ProductBranchMappingId
			,Remarks = @Remarks
			,LRDeliveryId = @LRDeliveryId
			,LRDeliveryTypeId = @LRDeliveryTypeId
			,IsSaleBilled = @IsSaleBilled
			,IsDispatched = @IsDispatched
			,DeletedById = NULL
			,DeletedOn = NULL
			,Deleted = 0
			WHERE Id = @Id

		END

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
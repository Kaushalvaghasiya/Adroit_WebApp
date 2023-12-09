CREATE OR ALTER   PROCEDURE [dbo].[sp_LRBookingSave]
(
	 @Id INT  
	,@BranchId INT
	,@LoginId INT
	,@CityIdTo INT
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
	,@InvoiceValue DECIMAL(18,0)
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

		DECLARE @CustomerId int = dbo.[fn_GetCustomerId](@LoginId);

		DECLARE @FirmId INT = (SELECT FirmId FROM CustomerFirmBranch WHERE Id = @BranchId);
		DECLARE @CityIdFrom INT = (SELECT CityId FROM CustomerFirmBranch WHERE FirmId = @FirmId AND Id = @BranchId);
		DECLARE @BookBranchMappingId INT = (SELECT BookingSalesBookBranchMappingId FROM CustomerFirmBranchTransportSetting WHERE BranchId = @BranchId);
		DECLARE @ProductBranchMappingId INT = (
			SELECT ProductBranchMapping.Id 
			FROM CustomerFirmTransportSetting 
				INNER JOIN ProductBranchMapping on ProductBranchMapping.ProductId = CustomerFirmTransportSetting.ProductIdForSales 
				AND ProductBranchMapping.BranchId = @BranchId
			WHERE CustomerFirmTransportSetting.FirmId = @FirmId
		);
		DECLARE @YearId int = dbo.fn_GetYearId(@LoginId);
		DECLARE @message VARCHAR(4000);
		DECLARE @LRNumberStartRange INT;
		DECLARE @LRNumberEndRange INT;

		IF @YearId IS NULL
		BEGIN
			SET @message = 'Year Not Found!';
			RAISERROR ('%s', 16, 1, @message);
		END

		IF ISNULL(@LRNumber, 0) = 0
		BEGIN
			SELECT @LRNumber = ISNULL(MAX(LRNumber),0) + 1
			FROM [Z-LRBooking-Z]
			WHERE BranchId = @BranchId;
		END

		SELECT @LRNumberStartRange = StartNumber,@LRNumberEndRange = EndNumber
		FROM LRBookingRange 
		WHERE BranchId = @BranchId

		IF EXISTS (SELECT 1 FROM [Z-LRBooking-Z] WHERE LRNumber = @LRNumber AND BranchId = @BranchId)
		BEGIN
			SET @message = 'This LR Number is alreay exist';
			RAISERROR ('%s', 16, 1, @message);
		END

		IF (@LRNumber < @LRNumberStartRange OR @LRNumber > @LRNumberEndRange) 
		BEGIN
			SET @message = 'Please renew LR Range';
			RAISERROR ('%s', 16, 1, @message);
		END

		IF ISNULL(@DescriptionId, 0) <= 0 AND ISNULL(@Description,'') != '' AND @Description NOT IN ( SELECT Title From TransportDesc WHERE CustomerId = @CustomerId AND Active = 1 AND Deleted = 0 )
		BEGIN
			EXEC @DescriptionId = dbo.sp_TransportDescSave 0, @LoginId, @Description , 0, @LoginId, @LoginId, 1
		END
		SELECT @DescriptionId = Id FROM TransportDesc WHERE Title = @Description AND Active = 1

		IF ISNULL(@PackingId, 0) <= 0 AND ISNULL(@Packing,'') != '' AND @Packing NOT IN ( SELECT Title From TransportPacking WHERE CustomerId = @CustomerId AND Active = 1 AND Deleted = 0 )
		BEGIN
			EXEC @PackingId = dbo.sp_TransportPackingSave 0, @LoginId, @Packing , 1, 0, @LoginId, @LoginId
		END
		SELECT @PackingId = Id FROM TransportPacking WHERE Title = @Packing AND Active = 1

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
GO
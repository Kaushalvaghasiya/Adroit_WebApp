CREATE OR ALTER   PROCEDURE [dbo].[sp_LRBookingSave]
(
	 @Id INT  
	,@branchId INT
	,@loginId INT
	,@CityIdTo INT
	,@LRNumber INT
	,@LRDate DATETIME
	,@EwayBillNo VARCHAR(25)
	,@AccountBranchMappingId INT
	,@DeliveryAccountBranchMappingId INT
	,@LRPayTypeId INT
	,@BillAccountBranchMappingId INT
	,@Parcel INT
	,@PackingId INT
	,@DescriptionId int
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

		DECLARE @FirmId INT = (SELECT FirmId FROM CustomerFirmBranch WHERE Id = @branchId);
		DECLARE @CityIdFrom INT = (SELECT CityId FROM CustomerFirmBranch WHERE FirmId = @FirmId);
		DECLARE @BookBranchMappingId INT = (SELECT BookingSalesBookBranchMappingId FROM CustomerFirmBranchTransportSetting WHERE BranchId = @branchId);
		DECLARE @ProductBranchMappingId INT = (
			SELECT ProductBranchMapping.Id 
			FROM CustomerFirmTransportSetting 
				INNER JOIN ProductBranchMapping on ProductBranchMapping.ProductId = CustomerFirmTransportSetting.ProductIdForSales 
				AND ProductBranchMapping.BranchId = @branchId
			WHERE CustomerFirmTransportSetting.FirmId = @FirmId
		);
		DECLARE @YearId int = dbo.fn_GetYearId(@FirmId,@loginId);
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
			WHERE BranchId = @branchId;
		END

		SELECT @LRNumberStartRange = StartNumber,@LRNumberEndRange = EndNumber
		FROM LRBookingRange 
		WHERE BranchId = @branchId

		IF (@LRNumber < @LRNumberStartRange OR @LRNumber > @LRNumberEndRange) AND (@LRNumber NOT IN ( SELECT LRNumber FROM [Z-LRBooking-Z] WHERE BranchId = @branchId ))
		BEGIN
			SET @message = 'Please renew LR Range';
			RAISERROR ('%s', 16, 1, @message);
		END

		DECLARE @IdCheck INT
		SELECT @IdCheck = ID FROM [Z-LRBooking-Z] 
							WHERE (Id = @Id) 
							OR (LRNumber = @LRNumber AND BranchId = @branchId AND Deleted = 1)

		IF ISNULL(@IdCheck, 0) = 0
		BEGIN

			INSERT INTO [Z-LRBooking-Z]
				(BranchId,YearId,ValidDateFrom,ValidDateTo,AccountBranchMappingId,BookBranchMappingId,LRNumber,LRDate,VehicleId,CityIdFrom,CityIdTo,DeliveryAccountBranchMappingId,BillAccountBranchMappingId
				,EwayBillNo,LRPayTypeId,InvoiceNo,InvoiceValue,PrivateMarka,Parcel,ActualWeight,ChargeWeight,DescriptionId,PackingId,LRRateOnId
				,Rate,Freight,Charges1,Charges2,Charges3,Charges4,Charges5,Charges6,ProductBranchMappingId,Remarks,LRDeliveryId,LRDeliveryTypeId,IsSaleBilled
				,IsDispatched,AddedById,AddedOn)
			VALUES
				(@branchId,@YearId,@ValidDateFrom,@ValidDateTo,@AccountBranchMappingId,@BookBranchMappingId,@LRNumber,@LRDate,@VehicleId,@CityIdFrom,@CityIdTo,@DeliveryAccountBranchMappingId,@BillAccountBranchMappingId
				,@EwayBillNo,@LRPayTypeId,@InvoiceNo,@InvoiceValue,@PrivateMarka,@Parcel,@ActualWeight,@ChargeWeight,@DescriptionId,@PackingId,@LRRateOnId
				,@Rate,@Freight,@Charges1,@Charges2,@Charges3,@Charges4,@Charges5,@Charges6,@ProductBranchMappingId,@Remarks,@LRDeliveryId,@LRDeliveryTypeId,@IsSaleBilled
				,@IsDispatched,@loginId,GETUTCDATE())

			SET @Id = SCOPE_IDENTITY();
			
		END
		ELSE
		BEGIN
			SET @Id = @IdCheck

			UPDATE [Z-LRBooking-Z] SET
			 BranchId = @branchId
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
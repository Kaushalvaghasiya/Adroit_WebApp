CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchTransportSettingSave]
(
	 @BranchId INT,
	 @PurcahseBookBranchMappingId INT,
	 @BookingSalesBookBranchMappingId INT,
	 @DeliverySalesBookBranchMappingId INT,
	 @ToPayAccountBranchMappingId INT,
	 @CrossingAmountAccountBranchMappingId INT,
	 @CrossingCommissionAccountBranchMappingId INT,
	 @CrossingHamaliAccountBranchMappingId INT,
	 @CrossingDeliveryChargeAccountBranchMappingId INT,
	 @SalesAccountBranchMappingId INT,
	 @IsAutoJvEnableForChallan BIT,
	 @IsFreightAddInToBillForDelivery BIT,
	 @LRRateOnId TINYINT,
	 @LRPayTypeId TINYINT,
	 @LoginId INT,
	 @LRCopy TINYINT,
	 @LRTemplate NVARCHAR(MAX),
	 @LRSubTitle NVARCHAR(250),
	 @LRSubject NVARCHAR(250)
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM [CustomerFirmBranchTransportSetting] WHERE [BranchId] = @BranchId)
			BEGIN
				UPDATE [CustomerFirmBranchTransportSetting] SET
						 [PurcahseBookBranchMappingId] = @PurcahseBookBranchMappingId
						,[BookingSalesBookBranchMappingId] = @BookingSalesBookBranchMappingId
						,[DeliverySalesBookBranchMappingId] = @DeliverySalesBookBranchMappingId
						,[ToPayAccountBranchMappingId] = @ToPayAccountBranchMappingId
						,[CrossingAmountAccountBranchMappingId] = @CrossingAmountAccountBranchMappingId
						,[CrossingCommissionAccountBranchMappingId] = @CrossingCommissionAccountBranchMappingId
						,[CrossingHamaliAccountBranchMappingId] = @CrossingHamaliAccountBranchMappingId
						,[CrossingDeliveryChargeAccountBranchMappingId] = @CrossingDeliveryChargeAccountBranchMappingId
						,[SalesAccountBranchMappingId] = @SalesAccountBranchMappingId
						,[IsAutoJvEnableForChallan] = @IsAutoJvEnableForChallan
						,[IsFreightAddInToBillForDelivery] = @IsFreightAddInToBillForDelivery
						,[LRRateOnId] = @LRRateOnId
						,[LRPayTypeId] = @LRPayTypeId
						,[LRCopy] = @LRCopy
						,[LRTemplate] = @LRTemplate
						,[LRSubTitle] = @LRSubTitle
						,[LRSubject] = @LRSubject
						,[ModifiedById] = @LoginId
						,[ModifiedOn] = GETUTCDATE()
				WHERE [BranchId] = @BranchId
			END
		ELSE
			BEGIN
				INSERT INTO [CustomerFirmBranchTransportSetting]
					([BranchId],[PurcahseBookBranchMappingId],[BookingSalesBookBranchMappingId],[DeliverySalesBookBranchMappingId],[ToPayAccountBranchMappingId],
					 [CrossingAmountAccountBranchMappingId],[CrossingCommissionAccountBranchMappingId],[CrossingHamaliAccountBranchMappingId],
					 [CrossingDeliveryChargeAccountBranchMappingId],[SalesAccountBranchMappingId],[IsAutoJvEnableForChallan],[IsFreightAddInToBillForDelivery],
					 [LRRateOnId],[LRPayTypeId],[AddedOn],[AddedById],[LRCopy],[LRTemplate],[LRSubTitle],[LRSubject])
				VALUES
					(@BranchId,@PurcahseBookBranchMappingId,@BookingSalesBookBranchMappingId,@DeliverySalesBookBranchMappingId,@ToPayAccountBranchMappingId,
					 @CrossingAmountAccountBranchMappingId,@CrossingCommissionAccountBranchMappingId,@CrossingHamaliAccountBranchMappingId,
					 @CrossingDeliveryChargeAccountBranchMappingId,@SalesAccountBranchMappingId,@IsAutoJvEnableForChallan,@IsFreightAddInToBillForDelivery,
					 @LRRateOnId,@LRPayTypeId,GETUTCDATE(),@LoginId,@LRCopy,@LRTemplate,@LRSubTitle,@LRSubject)

			END
		COMMIT TRAN
		SELECT @BranchId
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		IF (@message LIKE '%Violation of UNIQUE KEY%')
		BEGIN
			SET @message = 'Transport Branch Setting already exist!';
		END

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
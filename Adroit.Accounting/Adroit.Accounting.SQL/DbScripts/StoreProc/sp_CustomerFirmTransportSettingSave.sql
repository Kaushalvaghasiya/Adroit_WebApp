CREATE OR ALTER   PROCEDURE [dbo].[sp_CustomerFirmTransportSettingSave]
(
	  @loginId INT
	 ,@FirmId INT
	 ,@ProductIdForSales INT
	 ,@LRBookChargeLable1 NVARCHAR(20)
	 ,@LRBookChargeLable2 NVARCHAR(20)
	 ,@LRBookChargeLable3 NVARCHAR(20)
	 ,@LRBookChargeLable4 NVARCHAR(20)
	 ,@LRBookChargeLable5 NVARCHAR(20)
	 ,@LRBookChargeLable6 NVARCHAR(20)
	 ,@DeliveryChargeLable1 NVARCHAR(20)
	 ,@DeliveryChargeLable2	NVARCHAR(20)
	 ,@DeliveryChargeLable3	NVARCHAR(20)
	 ,@DeliveryChargeLable4	NVARCHAR(20)
	 ,@DeliveryChargeLable5	NVARCHAR(20)
	 ,@DeliveryChargeLable6	NVARCHAR(20)
	 ,@IsWeightRoundOff BIT
	 ,@IsPartyAndCityRateFromLastLR BIT
	 ,@ReverseChargeApplyForURDParty BIT
	 ,@ReverseChargeLimitForSalesGST DECIMAL(6,2)

)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		IF EXISTS (SELECT 1 FROM CustomerFirmTransportSetting WHERE FirmId = @FirmId)
		BEGIN

			UPDATE CustomerFirmTransportSetting SET
			 ProductIdForSales = @ProductIdForSales
			,LRBookChargeLable1 = @LRBookChargeLable1
			,LRBookChargeLable2 = @LRBookChargeLable2
			,LRBookChargeLable3 = @LRBookChargeLable3
			,LRBookChargeLable4 = @LRBookChargeLable4
			,LRBookChargeLable5 = @LRBookChargeLable5
			,LRBookChargeLable6 = @LRBookChargeLable6
			,DeliveryChargeLable1 = @DeliveryChargeLable1
			,DeliveryChargeLable2 = @DeliveryChargeLable2
			,DeliveryChargeLable3 = @DeliveryChargeLable3
			,DeliveryChargeLable4 = @DeliveryChargeLable4
			,DeliveryChargeLable5 = @DeliveryChargeLable5
			,DeliveryChargeLable6 = @DeliveryChargeLable6
			,IsWeightRoundOff = @IsWeightRoundOff
			,IsPartyAndCityRateFromLastLR = @IsPartyAndCityRateFromLastLR
			,ReverseChargeApplyForURDParty = @ReverseChargeApplyForURDParty
			,ReverseChargeLimitForSalesGST = @ReverseChargeLimitForSalesGST
			WHERE FirmId = @FirmId
			
		END
		ELSE
		BEGIN

			INSERT INTO CustomerFirmTransportSetting (FirmId,ProductIdForSales,LRBookChargeLable1,LRBookChargeLable2,LRBookChargeLable3
				,LRBookChargeLable4,LRBookChargeLable5,LRBookChargeLable6,DeliveryChargeLable1,DeliveryChargeLable2,DeliveryChargeLable3
				,DeliveryChargeLable4,DeliveryChargeLable5,DeliveryChargeLable6,IsWeightRoundOff,IsPartyAndCityRateFromLastLR
				,ReverseChargeApplyForURDParty,ReverseChargeLimitForSalesGST,AddedOn,AddedById)
			VALUES
				(@FirmId,@ProductIdForSales,@LRBookChargeLable1,@LRBookChargeLable2,@LRBookChargeLable3,@LRBookChargeLable4,@LRBookChargeLable5
				,@LRBookChargeLable6,@DeliveryChargeLable1,@DeliveryChargeLable2,@DeliveryChargeLable3,@DeliveryChargeLable4,@DeliveryChargeLable5
				,@DeliveryChargeLable6,@IsWeightRoundOff,@IsPartyAndCityRateFromLastLR,@ReverseChargeApplyForURDParty,@ReverseChargeLimitForSalesGST
				,GETUTCDATE(),@loginId)

			SET @FirmId = SCOPE_IDENTITY();
			
		END

		COMMIT TRAN
		SELECT @FirmId
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
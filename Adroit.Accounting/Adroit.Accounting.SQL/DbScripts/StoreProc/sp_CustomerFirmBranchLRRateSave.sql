CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchLRRateSave]
(
	 @Id int,
	 @BranchId INT,
	 @CityId int,
	 @RatePerKg decimal(9,2),
	 @RatePerParcel decimal(9,2),
	 @IsCrossingChargeApply bit,
	 @CrossingChargePercentOnFreight decimal(9,2),
	 @CrossingChargePerKg decimal(9,2),
	 @CrossingChargePerParcel decimal(9,2),
	 @IsCommissionApply bit,
	 @CommissionPercentOnFreight decimal(9,2),
	 @CommissionPerKg decimal(9,2),
	 @CommissionPerParcel decimal(9,2),
	 @AddedById INT,
	 @ModifiedById INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM CustomerFirmBranchLRRate WHERE Id = @Id)
			BEGIN
				UPDATE CustomerFirmBranchLRRate SET
					BranchId =@BranchId,
					CityId =@CityId,
					RatePerKg =@RatePerKg,
					RatePerParcel = @RatePerParcel,
					IsCrossingChargeApply = @IsCrossingChargeApply,
					CrossingChargePercentOnFreight = @CrossingChargePercentOnFreight,
					CrossingChargePerKg = @CrossingChargePerKg,
					CrossingChargePerParcel =@CrossingChargePerParcel,
					IsCommissionApply = @IsCommissionApply,
					CommissionPercentOnFreight =@CommissionPercentOnFreight,
					CommissionPerKg = @CommissionPerKg,
					CommissionPerParcel =@CommissionPerParcel,
					ModifiedById=@ModifiedById,
					ModifiedOn=GETUTCDATE()
					WHERE ID = @Id
			END
		ELSE
			BEGIN
				
				INSERT INTO CustomerFirmBranchLRRate
					(
					 BranchId,CityId,RatePerKg,RatePerParcel,IsCrossingChargeApply,CrossingChargePercentOnFreight,
					 CrossingChargePerKg,CrossingChargePerParcel,IsCommissionApply,CommissionPercentOnFreight,CommissionPerKg,
					 CommissionPerParcel,AddedById,AddedOn
					)
				VALUES
					(
					 @BranchId,@CityId,@RatePerKg,@RatePerParcel,@IsCrossingChargeApply,@CrossingChargePercentOnFreight,
					 @CrossingChargePerKg,@CrossingChargePerParcel,@IsCommissionApply,@CommissionPercentOnFreight,@CommissionPerKg,
					 @CommissionPerParcel,@AddedById,GETUTCDATE()
					)

				SET @Id = SCOPE_IDENTITY()
			END
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
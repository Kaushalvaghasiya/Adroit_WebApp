CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchTransportContractRateSettingSave]
(
	@Id INT,
	@AccountBranchMappingId	INT,
	@CityId			INT,
	@RatePerKG		DECIMAL(9, 2),
	@RatePerParcel	DECIMAL(9, 2),
	@AddedById		INT,
	@ModifiedById	INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM CustomerFirmBranchTransportContractRateSetting WHERE Id = @Id)
			BEGIN
					UPDATE CustomerFirmBranchTransportContractRateSetting SET
					AccountBranchMappingId = @AccountBranchMappingId,
					CityId = @CityId,
					RatePerKG = @RatePerKG,
					RatePerParcel = @RatePerParcel,
					ModifiedById = @ModifiedById, 
					ModifiedOn = GETUTCDATE()
					WHERE ID = @Id
			END
		ELSE
			BEGIN
				INSERT INTO [CustomerFirmBranchTransportContractRateSetting] 
					(AccountBranchMappingId, CityId, RatePerKG, RatePerParcel,AddedById,AddedOn)
				VALUES (@AccountBranchMappingId, @CityId, @RatePerKG, @RatePerParcel,@AddedById,GETUTCDATE())

				SET @Id = SCOPE_IDENTITY();
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



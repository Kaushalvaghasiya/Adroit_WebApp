CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchTransportSettingChalanSummaryTemplateUpdate]
(
	 @BranchId INT,
	 @LoginId INT,
	 @ChalanSummaryTemplate NVARCHAR(MAX)
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM [CustomerFirmBranchTransportSetting] WHERE [BranchId] = @BranchId)
			BEGIN
				UPDATE [CustomerFirmBranchTransportSetting] SET
						 [ChalanSummaryTemplate] = @ChalanSummaryTemplate
						,[ModifiedById] = @LoginId
						,[ModifiedOn] = GETUTCDATE()
				WHERE [BranchId] = @BranchId
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
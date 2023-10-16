CREATE OR ALTER procedure [dbo].[sp_CustomerFirmBranchDelete]
(
	@Id INT = NULL,
	@DeletedById INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		UPDATE CustomerFirmBranch SET 
		Active = 0,
		--DeletedById = NULL,  -- need to change fore key
		DeletedOn = GETUTCDATE(),
		Deleted = 1
		WHERE Id= @Id ;
	COMMIT TRAN
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
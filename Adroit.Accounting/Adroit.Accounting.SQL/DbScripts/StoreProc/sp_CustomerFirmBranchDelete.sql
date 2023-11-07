CREATE OR ALTER procedure [dbo].[sp_CustomerFirmBranchDelete]
(
	@Id INT = NULL,
	@LoginId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);	
	
	BEGIN TRAN
	BEGIN TRY
		UPDATE CustomerFirmBranch SET 
		Active = 0,
		DeletedById = @LoginId, 
		DeletedOn = GETUTCDATE(),
		Deleted = 1
		WHERE FirmId IN (SELECT Id FROM [CustomerFirm] WHERE [CustomerId] = @CustomerId) AND Id= @Id;
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
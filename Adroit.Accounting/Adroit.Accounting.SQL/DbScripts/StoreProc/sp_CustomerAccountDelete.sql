CREATE OR ALTER procedure [dbo].[sp_CustomerAccountDelete]
(
	@LoginId int,
	@FirmId int,
	@Id INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		UPDATE CustomerAccount SET 
		DeletedById = @LoginId,
		DeletedOn = GETUTCDATE(),
		Deleted = 1,
		Active = 0
		WHERE Id= @Id;

		UPDATE CustomerAccountBranchMapping SET 
		DeletedById = @LoginId,
		DeletedOn = GETUTCDATE(),
		Deleted = 1
		WHERE AccountId= @Id;

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
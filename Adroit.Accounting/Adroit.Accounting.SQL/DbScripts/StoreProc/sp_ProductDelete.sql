CREATE OR ALTER procedure [dbo].[sp_ProductDelete]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		UPDATE Product SET 
			Deleted = 1,
			DeletedById = @UserId,
			DeletedOn = GETUTCDATE()
		WHERE Id= @Id ;

		UPDATE ProductBranchMapping SET 
		DeletedById = @UserId,  
		DeletedOn = GETUTCDATE(),
		Deleted = 1
		WHERE ProductId= @Id;

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

CREATE OR ALTER procedure [dbo].[sp_ProductGroupDelete]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

		UPDATE ProductGroup SET 
			Deleted = 1,
			DeletedById = @CustomerId,
			DeletedOn = GETUTCDATE()
		WHERE Id= @Id And CustomerId=@CustomerId;
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



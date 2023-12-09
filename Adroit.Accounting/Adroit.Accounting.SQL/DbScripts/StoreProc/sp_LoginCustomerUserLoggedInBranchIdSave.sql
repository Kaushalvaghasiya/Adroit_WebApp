CREATE OR ALTER PROCEDURE [dbo].[sp_LoginCustomerUserLoggedInBranchIdSave]
(
	 @LoginId int,
	 @BranchId int
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

		IF EXISTS (SELECT 1 FROM CustomerUser WHERE Id = @CustomerId)
		BEGIN
			UPDATE  CustomerUser SET
					LoggedInBranchId = @BranchId
			WHERE Id = @CustomerId
		END

		COMMIT TRAN
		SELECT @CustomerId
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
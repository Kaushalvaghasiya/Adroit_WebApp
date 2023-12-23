CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerUserLoggedInYearSave]
(
	 @LoginId int,
	 @YearId int
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		IF EXISTS (SELECT 1 FROM CustomerUser WHERE Id = @LoginId)
		BEGIN
			UPDATE  CustomerUser SET
					LoggedInYear = @YearId
			WHERE Id = @LoginId
		END

		COMMIT TRAN
		SELECT @LoginId
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
CREATE OR ALTER procedure [dbo].[sp_CustomerAccountOpeningBalanceDelete]
(
	@LoginId int,
	@Id INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		Delete From CustomerAccountOpeningBalance WHERE Id= @Id;

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
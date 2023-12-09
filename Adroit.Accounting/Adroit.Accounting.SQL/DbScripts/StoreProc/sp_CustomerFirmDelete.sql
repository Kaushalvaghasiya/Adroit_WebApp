CREATE OR ALTER procedure [dbo].[sp_CustomerFirmDelete]
(
	@Id INT = NULL,
	@LoginId INT,
	@FirmId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	BEGIN TRAN
	BEGIN TRY
		UPDATE CustomerFirm SET 
			Active = 0,
			DeletedById = @LoginId, 
			DeletedOn = GETUTCDATE(),
			Deleted = 1
		WHERE CustomerId = @CustomerId AND Id= @Id

		UPDATE CustomerFirmBranch SET 
			DeletedById = @LoginId, 
			DeletedOn = GETUTCDATE(),
			Deleted = 1
		WHERE FirmId IN (SELECT ID FROM CustomerFirm WHERE CustomerId = @CustomerId AND Id= @Id )

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
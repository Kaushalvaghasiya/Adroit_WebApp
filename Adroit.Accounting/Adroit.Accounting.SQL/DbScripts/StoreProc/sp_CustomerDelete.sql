CREATE OR ALTER procedure [dbo].[sp_CustomerDelete]
(
	@Id INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		UPDATE Customer SET 
			DeletedOn = GETUTCDATE() ,
			Deleted = 1
		WHERE Id= @Id

		UPDATE CustomerFirm SET 
			DeletedOn = GETUTCDATE() ,
			Deleted = 1
		WHERE CustomerId = @Id

		UPDATE CustomerFirmBranch SET 
			DeletedOn = GETUTCDATE() ,
			Deleted = 1
		WHERE FirmId IN (SELECT ID FROM CustomerFirm WHERE CustomerId = @Id)

		UPDATE CustomerUser SET 
			DeletedOn = GETUTCDATE() ,
			Deleted = 1
		WHERE CustomerId = @Id	

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
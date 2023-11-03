CREATE OR ALTER procedure [dbo].[sp_CustomerUsersDelete]
(
	@Id INT = NULL,
	@DeletedById INT,
	@LoginId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerId(@loginId);
	
	BEGIN TRAN
	BEGIN TRY
		UPDATE CustomerUser SET 
		Active = 0,
		--DeletedById = NULL,  -- need to change fore key
		DeletedOn = GETUTCDATE(),
		Deleted = 1
		WHERE CustomerId = @CustomerId AND Id= @Id;
		
		UPDATE CustomerUserBranchMapping SET 
		--DeletedById = NULL,  -- need to change fore key
		DeletedOn = GETUTCDATE(),
		Deleted = 1
		WHERE UserId= @Id ;
	
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
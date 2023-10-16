CREATE OR ALTER PROCEDURE [dbo].[sp_UserDeactivate]
(
	@Id INT = NULL,
	@ModifiedById INT
)
AS
BEGIN
	UPDATE CustomerUser SET 
		Active = 0,
		ModifiedById = @ModifiedById, 
		ModifiedOn = GETUTCDATE()
	WHERE CustomerUser.Id = @Id
END
GO
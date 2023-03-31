CREATE OR ALTER PROCEDURE [dbo].[sp_UserActivate]
(
	@Id INT = NULL,
	@ModifiedById INT
)
AS
BEGIN
	UPDATE CustomerUser SET 
		IsDeleted = 0, 
		IsActive = 1,
		ModifiedById = @ModifiedById, 
		ModifiedOn = GETUTCDATE()
	WHERE CustomerUser.Id = @Id
END
GO
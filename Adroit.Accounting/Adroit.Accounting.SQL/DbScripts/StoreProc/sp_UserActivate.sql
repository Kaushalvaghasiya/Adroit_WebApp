CREATE OR ALTER PROCEDURE [dbo].[sp_UserActivate]
(
	@Id INT = NULL,
	@ModifiedById INT
)
AS
BEGIN
	UPDATE CustomerUser SET 
		DeletedOn = NULL, 
		Deleted = 0,
		Active = 1,
		ModifiedById = @ModifiedById, 
		ModifiedOn = GETUTCDATE()
	WHERE CustomerUser.Id = @Id
END
GO
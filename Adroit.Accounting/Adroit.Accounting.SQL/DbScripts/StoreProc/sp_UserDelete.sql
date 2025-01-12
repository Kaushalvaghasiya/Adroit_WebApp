CREATE OR ALTER PROCEDURE [dbo].[sp_UserDelete]
(
	@Id INT = NULL,
	@DeletedBy INT
)
AS
BEGIN
	UPDATE CustomerUser SET 
		Deleted = 1,
		DeletedById = @DeletedBy, 
		DeletedOn = GETUTCDATE()
	WHERE CustomerUser.Id = @Id
END
GO
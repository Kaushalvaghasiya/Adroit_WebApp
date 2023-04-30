CREATE OR ALTER PROCEDURE [dbo].[sp_UserGet]
(
	@Id INT = NULL,
	@UserId UNIQUEIDENTIFIER = NULL,
	@Email VARCHAR(100) = NULL
)
AS
BEGIN
	SELECT CustomerUser .*
	FROM CustomerUser 
	INNER JOIN aspnetusers ON CustomerUser.UserId = aspnetusers.Id
	WHERE (@Id IS NOT NULL OR @UserId IS NOT NULL OR @Email IS NOT NULL) 
		AND (@Id IS NULL OR CustomerUser.Id = @Id) 
		AND (@UserId IS NULL OR UserId = @UserId)
		AND (@Email IS NULL OR aspnetusers.UserName = @Email)
END
GO
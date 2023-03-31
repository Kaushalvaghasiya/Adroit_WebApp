CREATE OR ALTER PROCEDURE [dbo].[sp_UserList]
(
	@CustomerId INT
)
AS
BEGIN
	SELECT *
	FROM CustomerUser 
	INNER JOIN aspnetusers ON CustomerUser.UserId = aspnetusers.Id
	WHERE CustomerUser.CustomerId = @CustomerId
END
GO
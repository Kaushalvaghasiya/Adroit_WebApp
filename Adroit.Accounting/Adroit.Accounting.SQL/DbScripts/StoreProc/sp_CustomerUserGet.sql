 CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerUserGet]
(
	@userId INT
)
AS
BEGIN
	SELECT CustomerUser.*,dbo.[GetUserBranches](CustomerUser.id) as CustomerUserBranch,dbo.AspNetUsers.Email
	FROM CustomerUser
	Left JOIN dbo.AspNetUsers on CustomerUser.UserId=dbo.AspNetUsers.Id
	WHERE CustomerUser.id = @userId
END
GO
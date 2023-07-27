ALTER  PROCEDURE [dbo].[sp_CustomerUserGet]
(
	@userId INT
)
AS
BEGIN
	SELECT 
		CustomerUser.*,
		(SELECT STUFF((SELECT ',' + CAST(t1.BranchId AS VARCHAR) FROM CustomerUserBranchMapping t1
						WHERE t1.UserId = t.UserId FOR XML PATH('')),1,1,'') Concats
			FROM  CustomerUserBranchMapping t
			WHERE t.UserId = @userId GROUP BY t.UserId) AS CustomerUserBranchIds,
		AspNetUsers.Email
	FROM CustomerUser
	Left JOIN dbo.AspNetUsers on CustomerUser.UserId=dbo.AspNetUsers.Id
	WHERE CustomerUser.id = @userId
END
GO
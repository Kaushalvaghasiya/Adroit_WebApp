CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerUserGetByEmail]
(
	@Username nvarchar(256)
)
AS
BEGIN
	SELECT 
		CustomerUser.*,
		(SELECT STUFF((SELECT ',' + CAST(t1.BranchId AS VARCHAR) FROM CustomerUserBranchMapping t1
						WHERE t1.UserId = t.UserId FOR XML PATH('')),1,1,'') Concats
			FROM  CustomerUserBranchMapping t
			WHERE t.UserId = CustomerUser.Id GROUP BY t.UserId) AS CustomerUserBranchIds,
		AspNetUsers.Email
	FROM CustomerUser
	Left JOIN AspNetUsers on CustomerUser.UserId=dbo.AspNetUsers.Id
	WHERE AspNetUsers.Username = @Username
END
GO
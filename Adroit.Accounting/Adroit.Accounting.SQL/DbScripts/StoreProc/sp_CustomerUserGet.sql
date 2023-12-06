CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerUserGet]
(
	@UserId INT,
	@FirmId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirmId(@FirmId);
	
	SELECT 
		CustomerUser.*,
		(SELECT STUFF((SELECT ',' + CAST(t1.BranchId AS VARCHAR) FROM CustomerUserBranchMapping t1
						WHERE t1.UserId = t.UserId FOR XML PATH('')),1,1,'') Concats
			FROM  CustomerUserBranchMapping t
			WHERE t.UserId = @UserId GROUP BY t.UserId) AS CustomerUserBranchIds,
		AspNetUsers.Email
	FROM CustomerUser
	Left JOIN dbo.AspNetUsers on CustomerUser.UserId=dbo.AspNetUsers.Id
	WHERE CustomerUser.CustomerId = @CustomerId AND CustomerUser.id = @UserId
END
GO
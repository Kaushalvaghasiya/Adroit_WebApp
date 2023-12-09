CREATE OR ALTER PROCEDURE [dbo].[sp_GetLoggedInFirmId]
(
	@LoginId INT
)
AS
BEGIN
	SELECT TOP 1 CustomerFirmBranch.FirmId
	FROM CustomerFirmBranch 
	INNER JOIN CustomerUser ON CustomerFirmBranch.Id = CustomerUser.LoggedInBranchId
	WHERE CustomerUser.Id = @LoginId
END
GO

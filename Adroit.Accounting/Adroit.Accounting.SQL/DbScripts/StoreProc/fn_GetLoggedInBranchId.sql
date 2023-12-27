CREATE OR ALTER FUNCTION [dbo].[fn_GetLoggedInBranchId]
(
	@LoginId int
)
RETURNS int
AS
BEGIN
	DECLARE @BranchId int
	
	SELECT @BranchId = CustomerFirmBranch.Id
	FROM CustomerFirmBranch 
	INNER JOIN CustomerUser ON CustomerFirmBranch.Id = CustomerUser.LoggedInBranchId
	WHERE CustomerUser.Id = @LoginId

	RETURN @BranchId;
END
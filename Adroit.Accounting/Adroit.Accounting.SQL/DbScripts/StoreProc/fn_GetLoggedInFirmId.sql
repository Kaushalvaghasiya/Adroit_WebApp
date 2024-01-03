CREATE OR ALTER FUNCTION [dbo].[fn_GetLoggedInFirmId]
(
	@LoginId int
)
RETURNS int
AS
BEGIN
	DECLARE @FirmId int
	
	SELECT @FirmId  = CustomerFirmBranch.FirmId
	FROM CustomerFirmBranch 
	INNER JOIN CustomerUser ON CustomerFirmBranch.Id = CustomerUser.LoggedInBranchId
	WHERE CustomerUser.Id = @LoginId

	RETURN @FirmId;
END
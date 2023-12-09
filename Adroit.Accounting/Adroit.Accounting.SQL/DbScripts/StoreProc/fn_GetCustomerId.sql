CREATE OR ALTER FUNCTION [dbo].[fn_GetCustomerId]
(
	@LoginId int
)
RETURNS int
AS
BEGIN
	DECLARE @CustomerId int
	
	SELECT @CustomerId = CustomerFirm.CustomerId
	FROM CustomerFirmBranch 
	INNER JOIN CustomerFirm ON CustomerFirmBranch.FirmId = CustomerFirm.Id
	INNER JOIN CustomerUser ON CustomerFirmBranch.Id = CustomerUser.LoggedInBranchId
	WHERE CustomerUser.Id = @LoginId

	RETURN @CustomerId;
END
GO

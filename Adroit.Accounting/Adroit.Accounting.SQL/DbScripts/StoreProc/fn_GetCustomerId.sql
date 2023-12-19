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

	IF (@CustomerId IS NULL)
	BEGIN
		SELECT @CustomerId = Customer.Id
		FROM Customer
		INNER JOIN CustomerUser ON Customer.Id = CustomerUser.CustomerId
		WHERE CustomerUser.Id = @LoginId
	END

	RETURN @CustomerId;
END
GO

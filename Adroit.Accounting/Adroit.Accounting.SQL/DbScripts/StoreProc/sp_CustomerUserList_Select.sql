CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerUserList_Select]
(
	@CustomerId INT
)
AS
BEGIN
	SELECT 
		CustomerUser.Id As Value,
		ISNULL(CustomerUser.FirstName , '') + ' ' + ISNULL(CustomerUser.LastName, '') As Text
	FROM [Customer]
	INNER JOIN CustomerUser on [Customer].Id = CustomerUser.CustomerId
	WHERE [Customer].Id = @CustomerId
	AND [Customer].IsDeleted = 0
	AND CustomerUser.IsDeleted = 0
	ORDER BY CustomerUser.FirstName, CustomerUser.LastName
END
GO
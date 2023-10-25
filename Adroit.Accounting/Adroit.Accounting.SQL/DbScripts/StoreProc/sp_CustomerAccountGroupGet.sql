CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountGroupGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

	SELECT 
		CustomerAccountGroup.*,
		CustomerAccountGroupHeader.Title as CustomerAccountGroupHeaderName
	FROM CustomerAccountGroup
	INNER JOIN AccountGroupType on AccountGroupType.Id=CustomerAccountGroup.TypeId
	INNER JOIN CustomerAccountGroupHeader ON CustomerAccountGroupHeader.Id = CustomerAccountGroup.AccountGroupHeaderId 
	WHERE CustomerAccountGroup.Id = @Id And CustomerId=@CustomerId
END
GO
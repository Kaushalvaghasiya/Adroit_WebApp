CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerListByBranchiMapping_Select]
(
	@UserId INT,
	@BranchId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT CustomerAccountBranchMapping.Id As [Value], CustomerAccount.[Name] As [Text]
	From CustomerAccount
	INNER JOIN CustomerAccountBranchMapping on CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	WHERE CustomerAccount.CustomerId = @CustomerId
	AND CustomerAccountBranchMapping.BranchId =@BranchId;
END
GO
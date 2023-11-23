CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountListByBranchMappingWithGSTNo_MobileNo_Select]
(
	@UserId INT,
	@BranchId INT
)
AS
BEGIN
	DECLARE @CustomerId INT = dbo.[fn_GetCustomerId](@UserId);

	SELECT CustomerAccountBranchMapping.Id AS [Value],
			[CustomerAccount].[Name] + ' ' + [CustomerAccount].GSTNumber + ' ' + [CustomerAccount].Mobile AS [Text]
	FROM CustomerAccount
		INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	WHERE CustomerAccount.CustomerId = @CustomerId
		AND CustomerAccountBranchMapping.BranchId = @BranchId
	ORDER BY [Text];
END
GO
CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountListByBranchMappingWithGSTNo_MobileNo_Select]
(
	@loginId INT,
	@branchId INT
)
AS
BEGIN
	DECLARE @CustomerId INT = dbo.[fn_GetCustomerId](@loginId);

	SELECT CustomerAccountBranchMapping.Id AS [Value],
			CONCAT(
				[CustomerAccount].[Name],
				NULLIF(' | ' + [CustomerAccount].GSTNumber, ' | '),  
				NULLIF(' | ' + [CustomerAccount].Mobile, ' | ')     
			) AS [Text]
	FROM CustomerAccount
		INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	WHERE CustomerAccount.CustomerId = @CustomerId
		AND CustomerAccountBranchMapping.BranchId = @branchId
	ORDER BY [Text];
END
GO
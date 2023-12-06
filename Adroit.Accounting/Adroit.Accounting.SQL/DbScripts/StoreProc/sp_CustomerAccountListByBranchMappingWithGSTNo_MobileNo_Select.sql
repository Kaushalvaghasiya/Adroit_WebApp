CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountListByBranchMappingWithGSTNo_MobileNo_Select]
(
	@FirmId INT,
	@BranchId INT
)
AS
BEGIN
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirmId(@FirmId);

	SELECT CustomerAccountBranchMapping.Id AS [Value],
			CONCAT(
				[CustomerAccount].[Name],
				NULLIF(' | ' + ISNULL([CustomerAccount].GSTNumber, ''), ' | '),
				NULLIF(' | ' + ISNULL([CustomerAccount].Mobile, ''), ' | ') 
			) AS [Text]
	FROM CustomerAccount
		INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	WHERE CustomerAccount.CustomerId = @CustomerId
		AND CustomerAccountBranchMapping.BranchId = @branchId
	ORDER BY [Text];
END
GO
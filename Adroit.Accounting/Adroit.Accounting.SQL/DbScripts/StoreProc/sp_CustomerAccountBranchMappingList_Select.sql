CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountBranchMappingList_Select]
(
	@LoginId int, 
	@FirmId int,
	@BranchId int
)
AS
BEGIN
    DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT CustomerAccountBranchMapping.Id As Value,
	CONCAT(
		[CustomerAccount].[Name],
		NULLIF(' | ' + ISNULL([CustomerAccount].GSTNumber, ''), ' | '),
		NULLIF(' | ' + ISNULL([CustomerAccount].Mobile, ''), ' | ') 
	) AS [Text]
	FROM CustomerAccountBranchMapping 
	INNER JOIN [CustomerAccount] ON CustomerAccountBranchMapping.AccountId = [CustomerAccount].Id
	WHERE [CustomerAccount].CustomerId = @CustomerId AND CustomerAccountBranchMapping.BranchId = @BranchId AND CustomerAccountBranchMapping.Deleted = 0
	AND [CustomerAccount].Deleted = 0
	AND [CustomerAccount].Active = 1
	ORDER BY [CustomerAccount].[Name]
	
END
GO
CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountBranchMappingList_Select]
(
	@LoginId int, 
	@FirmId int,
	@BranchId int,
	@Code NVARCHAR(100) = ''
)
AS
BEGIN
    DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT CustomerAccountBranchMapping.Id As Value,
	CONCAT(
		COALESCE(NULLIF([CustomerAccount].PrintName, ''), [CustomerAccount].[Name]),
		NULLIF(' | ' + ISNULL([CustomerAccount].GSTNumber, ''), ' | '),
		NULLIF(' | ' + ISNULL([CustomerAccount].Mobile, ''), ' | ') 
	) AS [Text]
	FROM CustomerAccountBranchMapping 
	INNER JOIN [CustomerAccount] ON CustomerAccountBranchMapping.AccountId = [CustomerAccount].Id
	INNER JOIN [CustomerAccountGroup] ON [CustomerAccount].AccountGroupId = [CustomerAccountGroup].Id AND [CustomerAccountGroup].CustomerId = @CustomerId
	WHERE (
		(
			[CustomerAccountGroup].Code IN ( SELECT Id FROM dbo.[fnStringToIntArray](@Code))
		)
        OR 
		(
			ISNULL(@Code, '') = ''
		)
    )
	AND [CustomerAccount].CustomerId = @CustomerId AND CustomerAccountBranchMapping.BranchId = @BranchId AND CustomerAccountBranchMapping.Deleted = 0
	AND [CustomerAccount].Deleted = 0
	AND [CustomerAccount].Active = 1

	ORDER BY [Text]
	
END
GO
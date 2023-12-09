CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountBranchMappingList_Select]
(
	@LoginId int, 
	@FirmId int,
	@BranchId int
)
AS
BEGIN
    Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT CustomerAccountBranchMapping.Id As Value, [CustomerAccount].[Name] As Text
	FROM CustomerAccountBranchMapping 
	INNER JOIN [CustomerAccount] ON CustomerAccountBranchMapping.AccountId = [CustomerAccount].Id
	WHERE [CustomerAccount].CustomerId = @CustomerId AND CustomerAccountBranchMapping.BranchId = @BranchId AND CustomerAccountBranchMapping.Deleted = 0
	AND [CustomerAccount].Deleted = 0
	AND [CustomerAccount].Active = 1
	ORDER BY [CustomerAccount].[Name]
END
GO
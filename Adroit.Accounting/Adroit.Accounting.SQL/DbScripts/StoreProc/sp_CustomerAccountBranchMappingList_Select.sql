CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountBranchMappingList_Select]
(
	@LoginId int, 
	@FirmId int
)
AS
BEGIN
	SELECT CustomerAccountBranchMapping.Id As Value, [CustomerAccount].[Name] As Text
	FROM CustomerAccountBranchMapping 
	JOIN [CustomerAccount] ON CustomerAccountBranchMapping.AccountId = [CustomerAccount].Id
	WHERE CustomerAccountBranchMapping.Deleted = 0
	AND [CustomerAccount].Deleted = 0
	AND [CustomerAccount].Active = 1
	ORDER BY [CustomerAccount].[Name]
END
GO
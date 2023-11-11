CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountWithAccountGroupList_Select]
(
	@LoginId int, 
	@FirmId int
)
AS
BEGIN
	SELECT CustomerAccount.Id As Value, 
		CASE ISNULL(CustomerAccount.[PrintName], '') WHEN '' THEN CustomerAccount.[Name] ELSE CustomerAccount.[PrintName] 
		END + ' (' + [CustomerAccountGroup].Title + ' - ' + [CustomerAccountGroup].Code + ')' As Text 
	FROM CustomerAccount
	INNER JOIN [CustomerAccountGroup] on CustomerAccount.AccountGroupId = [CustomerAccountGroup].Id 
	WHERE CustomerAccount.Deleted = 0 AND CustomerAccount.Active = 1 
	ORDER BY CustomerAccount.[Name], CustomerAccount.PrintName
END
GO
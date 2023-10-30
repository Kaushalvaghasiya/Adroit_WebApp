CREATE OR ALTER   PROCEDURE [dbo].[sp_AccountAdminList_Select]
(
	@LoginId int, 
	@FirmId int
)
AS
BEGIN
	SELECT AccountAdmin.Id As Value, 
		CASE ISNULL(AccountAdmin.[PrintName], '') WHEN '' THEN AccountAdmin.[Name] ELSE AccountAdmin.[PrintName] 
		END + ' (' + [AccountGroupAdmin].Title + ' - ' + [AccountGroupAdmin].Code + ')' As Text 
	FROM AccountAdmin
			 INNER JOIN [AccountGroupAdmin] on AccountAdmin.AccountGroupId = [AccountGroupAdmin].Id 
	WHERE AccountAdmin.Deleted = 0 AND AccountAdmin.Active = 1 
	ORDER BY AccountAdmin.[Name], AccountAdmin.PrintName
END
GO
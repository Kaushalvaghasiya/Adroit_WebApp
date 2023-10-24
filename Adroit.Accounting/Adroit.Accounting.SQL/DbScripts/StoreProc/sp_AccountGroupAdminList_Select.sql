CREATE OR ALTER PROCEDURE [dbo].[sp_AccountGroupAdminList_Select]
AS
BEGIN
	SELECT [AccountGroupAdmin].Id As Value, [AccountGroupAdmin].Title + ' (' + [AccountGroupAdmin].Code + ')' As Text
	FROM [AccountGroupAdmin]
	WHERE 1=1
	AND [AccountGroupAdmin].Deleted = 0 
	AND [AccountGroupAdmin].Active = 1
	ORDER BY [AccountGroupAdmin].Title
END
GO
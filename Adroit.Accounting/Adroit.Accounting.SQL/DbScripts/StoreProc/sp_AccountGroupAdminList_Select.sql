CREATE OR ALTER   PROCEDURE [dbo].[sp_AccountGroupAdminList_Select]
AS
BEGIN
	SELECT Id As Value, Title As Text
	FROM AccountGroupAdmin 
	WHERE Deleted = 0 and Active = 1
	ORDER BY Title
END
GO
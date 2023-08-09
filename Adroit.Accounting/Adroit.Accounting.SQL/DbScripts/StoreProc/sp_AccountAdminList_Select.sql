CREATE OR ALTER   PROCEDURE [dbo].[sp_AccountAdminList_Select]
(
	@LoginId int, 
	@FirmId int
)
AS
BEGIN
	SELECT Id As Value, CASE ISNULL([PrintName], '') WHEN '' THEN [Name] ELSE [PrintName] END As Text
	FROM AccountAdmin 
	WHERE Deleted = 0 and Active = 1
	ORDER BY [Name], PrintName
END
GO
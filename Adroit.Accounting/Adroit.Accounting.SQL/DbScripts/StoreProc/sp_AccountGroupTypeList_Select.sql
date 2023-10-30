CREATE OR ALTER PROCEDURE [dbo].[sp_AccountGroupTypeList_Select]
AS
BEGIN
	SELECT [AccountGroupType].Id As Value, [AccountGroupType].Title + ' (' + [AccountGroupType].Code + ')' As Text
	FROM [AccountGroupType]
	WHERE [AccountGroupType].Deleted = 0 
	AND [AccountGroupType].Active = 1
	ORDER BY [AccountGroupType].OrderNumber
END
GO
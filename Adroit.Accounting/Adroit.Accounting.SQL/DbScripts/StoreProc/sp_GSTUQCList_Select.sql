CREATE OR ALTER PROCEDURE [dbo].[sp_GSTUQCList_Select] 
AS
BEGIN
	SELECT Id As Value,Title As Text
	FROM [GSTUQC]
	WHERE Deleted = 0 AND Active = 1
	ORDER BY Title
END
GO
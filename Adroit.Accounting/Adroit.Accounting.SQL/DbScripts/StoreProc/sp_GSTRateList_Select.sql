CREATE OR ALTER PROCEDURE [dbo].[sp_GSTRateList_Select] 
AS
BEGIN
	SELECT DISTINCT Id As Value,Rate As Text
	FROM [GSTRate]
	WHERE Deleted = 0 AND Active = 1
	ORDER BY Rate
END
GO
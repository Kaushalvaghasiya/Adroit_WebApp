CREATE OR ALTER PROCEDURE [dbo].[sp_ProductGroupList_Select] 
AS
BEGIN
	SELECT [ProductGroup].Id As Value, Title As Text
	FROM [ProductGroup]
	WHERE Deleted = 0 AND Active = 1
	ORDER BY Title
END
GO
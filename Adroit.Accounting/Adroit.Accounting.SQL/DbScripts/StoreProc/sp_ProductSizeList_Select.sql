CREATE OR ALTER PROCEDURE [dbo].[sp_ProductSizeList_Select] 
AS
BEGIN
	SELECT Id As Value, Title As Text
	FROM [ProductSize]
	WHERE Deleted = 0 AND [ProductSize].Active = 1
	ORDER BY Title
END
GO
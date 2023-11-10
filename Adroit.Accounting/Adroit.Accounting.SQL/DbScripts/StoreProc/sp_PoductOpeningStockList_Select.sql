CREATE OR ALTER PROCEDURE [dbo].[sp_PoductOpeningStockList_Select] 
AS
BEGIN
	SELECT [PoductOpeningStock].Id As Value, [Product].Title As Text
	FROM [Product]
	INNER JOIN [PoductOpeningStock] on [Product].Id = [PoductOpeningStock].Id
	WHERE [Product].Deleted = 0 
	AND [Product].Active = 1
	AND [PoductOpeningStock].Deleted = 0 
	ORDER BY [Product].Title
END
GO
CREATE OR ALTER PROCEDURE [dbo].[sp_ProductFabricList_Select] 
AS
BEGIN
	SELECT Id As Value, Title As Text
	FROM [ProductFabric]
	WHERE Deleted = 0 AND Active = 1
	ORDER BY Title
END
GO
CREATE OR ALTER PROCEDURE [dbo].[sp_BusinessList_Select]
AS
BEGIN
	SELECT Id As Value,Title As Text
	FROM Business
	WHERE Deleted = 0 AND Active = 1
	ORDER BY OrderNumber, Title
END
GO
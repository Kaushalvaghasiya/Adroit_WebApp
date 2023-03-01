CREATE OR ALTER PROCEDURE [dbo].[sp_BusinessList_Select]
AS
BEGIN
	SELECT Id,Title
	FROM Business
	ORDER BY OrderNumber
END
GO
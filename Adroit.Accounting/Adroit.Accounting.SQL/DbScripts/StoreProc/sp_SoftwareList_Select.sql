CREATE OR ALTER PROCEDURE [dbo].[sp_SoftwareList_Select]
AS
BEGIN
	SELECT Id,Title
	FROM [Software]
	ORDER BY [Software].Title
END
GO
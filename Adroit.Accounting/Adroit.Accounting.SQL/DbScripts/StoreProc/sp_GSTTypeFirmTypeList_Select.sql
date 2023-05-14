CREATE OR ALTER PROCEDURE [dbo].[sp_GSTTypeFirmTypeList_Select]
AS
BEGIN
	SELECT Id,Title
	FROM [GSTFirmType]
	ORDER BY [GSTFirmType].Title
END
GO
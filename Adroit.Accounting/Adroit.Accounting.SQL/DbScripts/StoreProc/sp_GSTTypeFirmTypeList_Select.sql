CREATE OR ALTER PROCEDURE [dbo].[sp_GSTTypeFirmTypeList_Select]
AS
BEGIN
	SELECT Id As Value,Title As Text
	FROM [GSTFirmType]
	WHERE IsDeleted = 0 AND Active = 1
	ORDER BY Title
END
GO
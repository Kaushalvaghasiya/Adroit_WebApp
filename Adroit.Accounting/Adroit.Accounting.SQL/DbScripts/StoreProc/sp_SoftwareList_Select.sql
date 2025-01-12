CREATE OR ALTER PROCEDURE [dbo].[sp_SoftwareList_Select] (@BusinessId SMALLINT = NULL)
AS
BEGIN
	SELECT Id As Value,Title As Text
	FROM [Software]
	WHERE Deleted = 0 AND Active = 1
	AND (@BusinessId IS NULL OR ID IN (SELECT SoftwareId From BusinessSoftwareMapping Where BusinessId = @BusinessId))
	ORDER BY Title
END
GO
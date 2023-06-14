CREATE OR ALTER PROCEDURE [dbo].[sp_DistrictList_Select]
	@StateId int = 0
AS
BEGIN
	SELECT Id As Value,Title As Text
	FROM District
	WHERE (@StateId = 0 OR StateId = @StateId)
	AND Active = 1
	ORDER BY Title
END
GO



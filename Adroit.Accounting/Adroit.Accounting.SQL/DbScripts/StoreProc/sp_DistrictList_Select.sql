CREATE OR ALTER PROCEDURE [dbo].[sp_DistrictList_Select]
	@StateId int = 0
AS
BEGIN
	IF @StateId > 0
	BEGIN
		SELECT Id,Title
		FROM District
		WHERE StateId = @StateId
		ORDER BY [District].Title
	END
	ELSE
	BEGIN
		SELECT Id,Title
		FROM District
		ORDER BY [District].Title
	END	
END
GO



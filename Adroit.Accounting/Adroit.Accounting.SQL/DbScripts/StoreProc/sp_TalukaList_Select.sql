CREATE OR ALTER PROCEDURE [dbo].[sp_TalukaList_Select]
	@DistrictId int = 0
AS
BEGIN
	SELECT Id AS Value,Title AS Text
	FROM Taluka
	WHERE (@DistrictId = 0 OR DistrictId = @DistrictId)
	AND Active = 1
	ORDER BY Title
END
GO
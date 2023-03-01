CREATE OR ALTER PROCEDURE [dbo].[sp_TalukaList_Select]
	@DistrictId int = 0
AS
BEGIN
	IF @DistrictId > 0
	BEGIN
		SELECT Id,Title
		FROM Taluka
		WHERE DistrictId = @DistrictId
		ORDER BY [Taluka].Title
	END
	ELSE
	BEGIN
		SELECT Id,Title
		FROM Taluka
		ORDER BY [Taluka].Title
	END	
END
GO
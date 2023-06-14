CREATE OR ALTER PROCEDURE [dbo].[sp_CityList_Select]
 @StateId int = 0,
 @TalukaId int = 0,
 @DistrictId int = 0
AS
BEGIN
	SELECT City.Id As Value,City.Title As Text
	FROM City
	JOIN Taluka on City.TalukaId = Taluka.Id
	JOIN District on Taluka.DistrictId = District.Id
	WHERE (@StateId = 0 OR District.StateId = @StateId)
	AND (@DistrictId = 0 OR Taluka.DistrictId = @DistrictId)
	AND (@TalukaId = 0 OR City.TalukaId = @TalukaId)
	AND City.Active = 1 AND Taluka.Active = 1 AND District.Active = 1
END
GO
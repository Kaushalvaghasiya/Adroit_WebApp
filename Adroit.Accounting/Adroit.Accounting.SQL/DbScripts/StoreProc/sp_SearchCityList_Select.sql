CREATE OR ALTER PROCEDURE [dbo].[sp_SearchCityList_Select]
(
 @city NVARCHAR(100)
)
AS
BEGIN

	SELECT TOP 100 City.Id As Value
	,LTRIM(RTRIM(City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title + ' | ' + Country.Title)) As Text
	FROM Country
	INNER JOIN State on State.CountryId = Country.Id AND Country.Active = 1
	INNER JOIN District on District.StateId = State.Id AND District.Active = 1
	INNER JOIN Taluka on Taluka.DistrictId = District.Id AND Taluka.Active = 1
	INNER JOIN City on City.TalukaId = Taluka.Id AND City.Active = 1
	WHERE city.title like '%'+ @city + '%' 

END
GO
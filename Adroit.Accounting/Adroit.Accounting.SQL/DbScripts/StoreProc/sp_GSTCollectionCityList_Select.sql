CREATE OR ALTER PROCEDURE [dbo].[sp_GSTCollectionCityList_Select]
AS
BEGIN
	SELECT DISTINCT 
		  CASE WHEN City.Title IS NULL THEN  GSTCollection.City 
			   ELSE City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title END AS Value,
		  CASE WHEN City.Title IS NULL THEN  GSTCollection.City 
			   ELSE City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title END AS Text	   
	FROM GSTCollection LEFT OUTER JOIN City on UPPER(City.Title) = UPPER(GSTCollection.City) AND City.Active = 1 
		 LEFT JOIN Taluka on City.TalukaId = Taluka.Id AND Taluka.Active = 1 
		 LEFT JOIN District on Taluka.DistrictId = District.Id AND District.Active = 1 
		 LEFT JOIN State on District.StateId = State.Id AND State.Active = 1 
	UNION 
	SELECT DISTINCT City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title As Value, 
	       City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title  As Text
	FROM City 
		 LEFT JOIN Taluka on City.TalukaId = Taluka.Id AND Taluka.Active = 1 
		 LEFT JOIN District on Taluka.DistrictId = District.Id AND District.Active = 1 
		 LEFT JOIN State on District.StateId = State.Id AND State.Active = 1 
	WHERE City.Active = 1 
	ORDER BY Value
END
GO
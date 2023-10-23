CREATE OR ALTER PROCEDURE [dbo].[sp_GSTCollectionGet]
(
	@Id INT
)
AS
BEGIN
	SELECT GSTCollection.Id,GSTNumber,Name,Address1,Address2,Address3,
		   CASE WHEN City.Title IS NULL THEN  GSTCollection.City 
				ELSE City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title END AS City,
		   Pincode,AddedOn,GSTCollection.Active
	FROM GSTCollection LEFT OUTER JOIN City on UPPER(City.Title) = UPPER(GSTCollection.City) AND City.Active = 1 
	LEFT JOIN Taluka on City.TalukaId = Taluka.Id AND Taluka.Active = 1 
	LEFT JOIN District on Taluka.DistrictId = District.Id AND District.Active = 1 
	LEFT JOIN State on District.StateId = State.Id AND State.Active = 1
	WHERE GSTCollection.Id = @Id
END
GO
CREATE OR ALTER PROCEDURE [dbo].[sp_TransportLRBranchCityMappingGet]
(
	@Id INT,
	@LoginId INT,
	@BranchId INT,
	@FirmId INT
)
AS
BEGIN
	SELECT City.Title + ' | ' + Taluka.Title + ' | ' + District.Title + ' | ' + State.Title + ' | ' + Country.Title As CityName
	,TransportLRBranchCityMapping.CityId
	,TransportLRBranchCityMapping.Id
	,TransportLRBranchCityMapping.BranchId
	,TransportLRBranchCityMapping.OrderNumber
	,TransportLRBranchCityMapping.Active
	FROM TransportLRBranchCityMapping 
	INNER JOIN City on City.Id = TransportLRBranchCityMapping.CityId AND City.Active = 1
	INNER JOIN Taluka on Taluka.Id = City.TalukaId AND Taluka.Active = 1
	INNER JOIN District on District.Id = Taluka.DistrictId AND District.Active = 1
	INNER JOIN State on State.Id = District.StateId AND State.Active = 1
	INNER JOIN Country on Country.Id = State.CountryId AND Country.Active = 1
	WHERE TransportLRBranchCityMapping.Id = @Id 
END

CREATE OR ALTER PROCEDURE [dbo].[sp_TransportLRBranchCityMappingList_Select] 
(
	@branchId INT,
	@loginId INT,
	@firmId INT
)
AS
BEGIN

	SELECT [TransportLRBranchCityMapping].CityId As Value,City.Title As Text
	FROM [TransportLRBranchCityMapping]
	INNER JOIN City on City.Id = [TransportLRBranchCityMapping].CityId
	WHERE [TransportLRBranchCityMapping].Deleted = 0 AND [TransportLRBranchCityMapping].Active = 1
	AND [TransportLRBranchCityMapping].BranchId = @branchId
	ORDER BY City.Title

END



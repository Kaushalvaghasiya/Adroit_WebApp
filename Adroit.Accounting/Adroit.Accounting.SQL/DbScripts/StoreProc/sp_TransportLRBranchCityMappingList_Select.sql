CREATE OR ALTER PROCEDURE [dbo].[sp_TransportLRBranchCityMappingList_Select] 
(
	@BranchId INT
)
AS
BEGIN

	SELECT [TransportLRBranchCityMapping].CityId As Value,City.Title As Text
	FROM [TransportLRBranchCityMapping]
	INNER JOIN City on City.Id = [TransportLRBranchCityMapping].CityId
	WHERE [TransportLRBranchCityMapping].Deleted = 0 AND [TransportLRBranchCityMapping].Active = 1
	AND [TransportLRBranchCityMapping].BranchId = @BranchId
	ORDER BY City.Title

END



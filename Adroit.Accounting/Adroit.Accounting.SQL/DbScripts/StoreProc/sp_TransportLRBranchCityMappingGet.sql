CREATE OR ALTER PROCEDURE [dbo].[sp_TransportLRBranchCityMappingGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM TransportLRBranchCityMapping WHERE Id = @Id
END

CREATE OR ALTER   PROCEDURE [dbo].[sp_DistrictGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		District.* 
		FROM District
	WHERE District.Id = @Id
END
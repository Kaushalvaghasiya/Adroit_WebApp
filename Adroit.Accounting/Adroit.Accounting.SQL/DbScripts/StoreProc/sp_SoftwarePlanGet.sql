CREATE OR ALTER PROCEDURE [dbo].[sp_SoftwarePlanGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		SoftwarePlan.*,
		Software.Title as SoftwareName
	FROM Software
	INNER JOIN SoftwarePlan ON Software.Id = SoftwarePlan.SoftwareId 
	WHERE SoftwarePlan.Id = @Id
END
GO
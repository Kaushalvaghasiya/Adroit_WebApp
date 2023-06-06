CREATE OR ALTER PROCEDURE [dbo].[sp_AdminSoftwarePlanGet]
(
	@Id INT
)
AS
BEGIN
	SELECT SoftwarePlan.*,Software.Title as SoftwareName
	FROM SoftwarePlan 
	left join Software ON SoftwarePlan.SoftwareId=Software.Id
	WHERE SoftwarePlan.Id = @Id
END
GO
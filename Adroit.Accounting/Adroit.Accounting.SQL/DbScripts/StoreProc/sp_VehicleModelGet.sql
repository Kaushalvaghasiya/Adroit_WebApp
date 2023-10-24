CREATE OR ALTER PROCEDURE [dbo].[sp_VehicleModelGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM VehicleModel WHERE Id = @Id
END
GO
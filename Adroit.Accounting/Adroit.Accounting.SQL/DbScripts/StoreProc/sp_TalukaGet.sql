CREATE OR ALTER PROCEDURE [dbo].[sp_TalukaGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		Taluka.*,
			Taluka.Title as DistrictName
	FROM Taluka
	INNER JOIN District ON District.Id = Taluka.DistrictId 
	WHERE District.Id = @Id
END
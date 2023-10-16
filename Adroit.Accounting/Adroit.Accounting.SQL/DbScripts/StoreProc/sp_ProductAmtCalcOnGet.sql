CREATE OR ALTER PROCEDURE [dbo].[sp_ProductAmtCalcOnGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		ProductAmtCalcOn.*,
		Software.Title as SoftwareName
	FROM Software
	INNER JOIN ProductAmtCalcOn ON Software.Id = ProductAmtCalcOn.SoftwareId 
	WHERE ProductAmtCalcOn.Id = @Id
END
GO
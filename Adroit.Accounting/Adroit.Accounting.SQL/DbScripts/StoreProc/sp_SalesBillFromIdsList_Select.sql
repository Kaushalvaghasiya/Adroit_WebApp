CREATE OR ALTER   PROCEDURE [dbo].[sp_SalesBillFromIdsList_Select]
(
	@Ids varchar(max)
)
AS
BEGIN
	SELECT Id As Value,Title As Text
	FROM SalesBillFromAdmin
	WHERE Active = 1 AND Id IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@Ids))
	ORDER BY Title
END
GO
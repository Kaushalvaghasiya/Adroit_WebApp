CREATE OR ALTER   PROCEDURE [dbo].[sp_SalesBillFromAdminList_Select]
(
	@LoginId int, 
	@FirmId int
)
AS
BEGIN
	SELECT Id As Value,Title As Text
	FROM SalesBillFromAdmin
	WHERE Active = 1
	ORDER BY Title
END
GO
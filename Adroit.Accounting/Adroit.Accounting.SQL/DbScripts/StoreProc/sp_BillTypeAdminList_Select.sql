CREATE OR ALTER   PROCEDURE [dbo].[sp_BillTypeAdminList_Select]
	@LoginId int, 
	@FirmId int
AS
BEGIN
	SELECT Id, Title
	FROM BillTypeAdmin 
	WHERE IsDeleted = 0
	ORDER BY Title
END
GO
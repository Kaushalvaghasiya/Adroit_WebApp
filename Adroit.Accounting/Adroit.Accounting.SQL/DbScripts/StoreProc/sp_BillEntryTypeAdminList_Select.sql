CREATE OR ALTER   PROCEDURE [dbo].[sp_BillEntryTypeAdminList_Select]
	@LoginId int, 
	@FirmId int
AS
BEGIN
	SELECT *
	FROM BillEntryTypeAdmin
	ORDER BY Title, Code
END
GO
CREATE OR ALTER   PROCEDURE [dbo].[sp_BillEntryTypeAdminList_Select]
	@LoginId int, 
	@FirmId int
AS
BEGIN
	SELECT Id As Value,Title As Text
	FROM BillEntryTypeAdmin
	WHERE Active = 1
	ORDER BY Title, Code
END
GO
CREATE OR ALTER   PROCEDURE [dbo].[sp_BillTypeAdminList_Select]
(
	@LoginId int, 
	@FirmId int
)
AS
BEGIN
	SELECT Id As Value,Title As Text
	FROM BillTypeAdmin 
	WHERE Deleted = 0 
	AND Active = 1
	ORDER BY Title
END
GO
CREATE OR ALTER PROCEDURE [dbo].[sp_FirmBranchTypeAdminList_Select]
AS
BEGIN
	SELECT Id,Title
	FROM FirmBranchTypeAdmin
	ORDER BY FirmBranchTypeAdmin.Title
END
GO
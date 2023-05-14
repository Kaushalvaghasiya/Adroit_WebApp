CREATE OR ALTER PROCEDURE [dbo].[sp_FirmAdminTypeList_Select]
AS
BEGIN
	SELECT Id,Title
	FROM FirmTypeAdmin
	ORDER BY FirmTypeAdmin.Title
END
GO
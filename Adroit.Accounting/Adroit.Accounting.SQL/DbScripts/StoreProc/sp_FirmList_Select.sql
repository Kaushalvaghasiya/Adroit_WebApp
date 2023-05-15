CREATE OR ALTER PROCEDURE [dbo].[sp_FirmList_Select]
AS
BEGIN
	SELECT Id,Title
	FROM CustomerFirm
	ORDER BY CustomerFirm.Title
END
GO
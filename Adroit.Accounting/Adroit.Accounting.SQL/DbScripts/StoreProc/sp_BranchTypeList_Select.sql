CREATE OR ALTER PROCEDURE [dbo].[sp_BranchTypeList_Select]
AS
BEGIN
	SELECT Id As Value,Title As Text
	FROM FirmBranchTypeAdmin
	WHERE Active = 1
	AND Deleted= 0
	ORDER BY OrderNumber, Title
END
GO
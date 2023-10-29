CREATE OR ALTER   PROCEDURE [dbo].[sp_BookTypeAdminList_Select]
(
	@LoginId int, 
	@FirmId int
)
AS
BEGIN
	SELECT [Id] As Value, [Title] As Text
	FROM [BookTypeAdmin] 
	WHERE Deleted = 0 and Active = 1
	ORDER BY [Title]
END
GO
CREATE OR ALTER PROC [dbo].sp_GetColumnData (@tablename nvarchar(100) , @columnname  nvarchar(100) )
AS BEGIN
	DECLARE @query NVARCHAR(MAX)
	SET @query = N'SELECT DISTINCT ' + @columnname + ' AS Value FROM ' + @tablename + ' WHERE ISDELETED = 0 ORDER BY ' +  @columnname
	EXEC SP_EXECUTESQL @query, N'@tablename nvarchar(max), @columnname  nvarchar(max)',@tablename, @columnname
end
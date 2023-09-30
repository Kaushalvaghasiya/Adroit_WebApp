 --exec [dbo].[sp_GetColumnData] 'SoftwarePlan','title'
CREATE OR ALTER   PROC [dbo].[sp_GetColumnData] (@tablename nvarchar(100) , @columnname  nvarchar(100) )
AS BEGIN
IF EXISTS(SELECT *
          FROM   INFORMATION_SCHEMA.COLUMNS
          WHERE  TABLE_NAME = @tablename
                 AND COLUMN_NAME = 'ISDELETED')
BEGIN

/* Column does not exist or caller does not have permission to view the object */
	DECLARE @query NVARCHAR(MAX)
	SET @query = N'SELECT DISTINCT ' + @columnname + ' AS Value FROM ' + @tablename + ' WHERE ISDELETED = 0  ORDER BY ' +  @columnname
	EXEC SP_EXECUTESQL @query, N'@tablename nvarchar(max), @columnname  nvarchar(max)',@tablename, @columnname
END else
BEGIN

	DECLARE @queryNotDeleted NVARCHAR(MAX)
	SET @queryNotDeleted = N'SELECT DISTINCT ' + @columnname + ' AS Value FROM ' + @tablename + ' ORDER BY ' +  @columnname
	EXEC SP_EXECUTESQL @queryNotDeleted, N'@tablename nvarchar(max), @columnname  nvarchar(max)',@tablename, @columnname
END
END
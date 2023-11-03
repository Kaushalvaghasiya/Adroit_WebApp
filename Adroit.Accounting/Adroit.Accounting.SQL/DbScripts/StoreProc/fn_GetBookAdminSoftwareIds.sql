CREATE OR ALTER FUNCTION [dbo].[fn_GetBookAdminSoftwareIds]
(
	@bookId int
)
RETURNS varchar(max)
AS
BEGIN
	DECLARE @ids varchar(max) = ''
	SELECT
		@ids = @ids + CAST(Software.Id AS VARCHAR) + ','
	FROM BookAdmin
	INNER JOIN BookAdminSoftwareMapping on BookAdmin.Id = BookAdminSoftwareMapping.BookId
	INNER JOIN Software ON BookAdminSoftwareMapping.SoftwareId = Software.Id
	WHERE BookAdmin.ID = @bookId

	RETURN SUBSTRING(@ids , 0, LEN(@ids ))
END
GO

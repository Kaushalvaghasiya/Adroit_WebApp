CREATE OR ALTER FUNCTION [dbo].[fn_GetBusinessSoftwareName]
(
	@businessId int
)
RETURNS varchar(max)
AS
BEGIN
	DECLARE @name varchar(max) = ''
	SELECT
		@name = @name + Software.Title + ', ' 
	FROM Business
	INNER JOIN BusinessSoftwareMapping on Business.Id = BusinessSoftwareMapping.BusinessId
	INNER JOIN Software ON BusinessSoftwareMapping.SoftwareId = Software.Id
	WHERE Business.ID = @businessId

	RETURN SUBSTRING(@name, 0, LEN(@name))
END
GO

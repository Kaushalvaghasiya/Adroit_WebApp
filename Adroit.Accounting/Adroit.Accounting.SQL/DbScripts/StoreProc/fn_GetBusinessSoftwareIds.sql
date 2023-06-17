CREATE OR ALTER FUNCTION [dbo].[fn_GetBusinessSoftwareIds]
(
	@businessId int
)
RETURNS varchar(max)
AS
BEGIN
	DECLARE @ids varchar(max) = ''
	SELECT
		@ids = @ids + CAST(Software.Id AS VARCHAR) + ','
	FROM Business
	INNER JOIN BusinessSoftwareMapping on Business.Id = BusinessSoftwareMapping.BusinessId
	INNER JOIN Software ON BusinessSoftwareMapping.SoftwareId = Software.Id
	WHERE Business.ID = @businessId

	RETURN SUBSTRING(@ids , 0, LEN(@ids ))
END
GO

CREATE OR ALTER PROCEDURE [dbo].[sp_VehicleModelList_Select] (@BusinessId SMALLINT = NULL)
AS
BEGIN
	SELECT Id As Value,Title As Text
	FROM [VehicleModel]
	WHERE Deleted = 0 AND Active = 1
	ORDER BY Title
END
GO
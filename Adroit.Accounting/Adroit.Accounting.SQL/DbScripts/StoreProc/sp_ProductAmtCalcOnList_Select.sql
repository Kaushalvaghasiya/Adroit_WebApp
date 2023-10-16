CREATE OR ALTER PROCEDURE [dbo].[sp_ProductAmtCalcOnList_Select] (@softwareId tinyint)
AS
BEGIN
	SELECT [ProductAmtCalcOn].Id As Value, [Software].Title + ' - ' + [ProductAmtCalcOn].Title As Text
	FROM [Software]
	INNER JOIN [ProductAmtCalcOn] on [Software].Id = [ProductAmtCalcOn].SoftwareId
	WHERE [Software].Id = @softwareId 
	AND [Software].IsDeleted = 0 
	AND [Software].Active = 1
	AND [ProductAmtCalcOn].IsDeleted = 0 
	AND [ProductAmtCalcOn].Active = 1
	ORDER BY [ProductAmtCalcOn].Title
END
GO
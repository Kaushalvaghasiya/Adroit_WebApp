CREATE OR ALTER PROCEDURE [dbo].[sp_AccountGroupAdminList_Select] (@softwareId tinyint)
AS
BEGIN
	SELECT [SoftwarePlan].Id As Value, [Software].Title + ' - ' + [SoftwarePlan].Title + ' (' + [SoftwarePlan].Code + ')' As Text
	FROM [Software]
	INNER JOIN [SoftwarePlan] on [Software].Id = [SoftwarePlan].SoftwareId
	WHERE [Software].Id = @softwareId 
	AND [Software].Deleted = 0 
	AND [Software].Active = 1
	AND [SoftwarePlan].Deleted = 0 
	AND [SoftwarePlan].Active = 1
	ORDER BY [SoftwarePlan].Title
END
GO
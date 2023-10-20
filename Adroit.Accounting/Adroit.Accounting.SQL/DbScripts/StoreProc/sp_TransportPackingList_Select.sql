CREATE OR ALTER PROCEDURE [dbo].[sp_TransportPackingList_Select] 
AS
BEGIN
	SELECT Id As Value,Title As Text
	FROM [TransportPacking]
	WHERE IsDeleted = 0 AND Active = 1
	ORDER BY Title
END



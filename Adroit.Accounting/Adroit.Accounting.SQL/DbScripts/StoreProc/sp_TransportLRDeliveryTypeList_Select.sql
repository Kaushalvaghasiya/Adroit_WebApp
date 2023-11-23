CREATE OR ALTER PROCEDURE [dbo].[sp_TransportLRDeliveryTypeList_Select] 
AS
BEGIN
	SELECT Id As Value, Title As Text
	FROM [TransportLRDeliveryType]
	WHERE Deleted = 0 AND Active = 1
	ORDER BY Title
END
GO
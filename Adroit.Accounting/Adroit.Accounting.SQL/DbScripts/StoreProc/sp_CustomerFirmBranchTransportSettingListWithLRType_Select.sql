CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchTransportSettingListWithLRType_Select] 
(
	@branchId INT
)
AS
BEGIN

	SELECT [TransportLRPayType].Id As Value, [TransportLRPayType].Title As Text
	FROM [TransportLRPayType]
	WHERE [TransportLRPayType].Deleted = 0 
	AND [TransportLRPayType].Active = 1
	ORDER BY [TransportLRPayType].Title

END



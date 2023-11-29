CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchTransportSettingListWithLRType_Select] 
(
	@BranchId INT
)
AS
BEGIN

	SELECT [TransportLRPayType].Id As Value, [TransportLRPayType].Title As Text
	FROM [CustomerFirmBranchTransportSetting]
	INNER JOIN [TransportLRPayType] ON [TransportLRPayType].Id = [CustomerFirmBranchTransportSetting].LRPayTypeId 
	WHERE [CustomerFirmBranchTransportSetting].BranchId = @BranchId
	AND [TransportLRPayType].Deleted = 0 
	AND [TransportLRPayType].Active = 1
	ORDER BY [TransportLRPayType].Title

END



CREATE OR ALTER   PROCEDURE [dbo].[sp_GetChalanToPayAccountValue]
(
	@BranchId INT,
	@LRNumberIds VARCHAR(MAX)
)
AS
BEGIN
	SELECT 
		SUM(L1.val) As ToPayAccountValue, 
		SUM(L2.val) As PaidValue,
		SUM(L3.val) As TBBValue
	FROM (SELECT SUM(ISNULL(LB1.NetAmount, 0)) AS val FROM [Z-LRBooking-Z] AS LB1 
			INNER JOIN TransportLRPayType AS TLRType1 ON LB1.LRPayTypeId = TLRType1.Id 
			AND TLRType1.Title = 'To Pay' 
		AND LB1.Id IN (SELECT Id FROM [dbo].[fnStringToIntArray](@LRNumberIds))
	) L1,
	(SELECT SUM(ISNULL(LB2.NetAmount, 0)) AS val FROM [Z-LRBooking-Z] AS LB2 
			INNER JOIN TransportLRPayType AS TLRType2 ON LB2.LRPayTypeId = TLRType2.Id 
			AND TLRType2.Title = 'Paid' 
		AND LB2.Id IN (SELECT Id FROM [dbo].[fnStringToIntArray](@LRNumberIds))
	) L2,
	(SELECT SUM(ISNULL(LB3.NetAmount, 0)) AS val FROM [Z-LRBooking-Z] AS LB3 
			INNER JOIN TransportLRPayType AS TLRType3 ON LB3.LRPayTypeId = TLRType3.Id 
			AND TLRType3.Title = 'TBB'
			AND LB3.Id IN (SELECT Id FROM [dbo].[fnStringToIntArray](@LRNumberIds))
	) L3			

END
GO
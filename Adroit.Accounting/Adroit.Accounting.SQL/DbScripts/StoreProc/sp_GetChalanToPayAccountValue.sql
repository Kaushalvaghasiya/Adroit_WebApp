CREATE OR ALTER   PROCEDURE [dbo].[sp_GetChalanToPayAccountValue]
(
	@BranchId INT,
	@LRNumberIds VARCHAR(MAX)
)
AS
BEGIN
	
	SELECT SUM(L1.val) As ToPayAccountValue
	,SUM(L2.val) As TBBValue
	,SUM(L3.val) As PaidValue
	FROM (SELECT SUM(LB1.InvoiceValue) AS val FROM [Z-LRBooking-Z] AS LB1 
	INNER JOIN TransportLRPayType AS TLRType1 ON LB1.LRPayTypeId = TLRType1.Id AND TLRType1.Title = 'To Pay' AND TLRType1.Deleted = 0 AND LB1.Deleted = 0 
	AND LB1.Id IN (SELECT Id FROM [dbo].[fnStringToIntArray](@LRNumberIds))
	AND LB1.BranchId = @BranchId) L1,
	(SELECT SUM(LB2.InvoiceValue) AS val FROM [Z-LRBooking-Z] AS LB2 
	INNER JOIN TransportLRPayType AS TLRType2 ON LB2.LRPayTypeId = TLRType2.Id AND TLRType2.Title = 'Paid' AND TLRType2.Deleted = 0 AND LB2.Deleted = 0
	AND LB2.Id IN (SELECT Id FROM [dbo].[fnStringToIntArray](@LRNumberIds))
	AND LB2.BranchId = @BranchId) L2,
	(SELECT SUM(LB3.InvoiceValue) AS val FROM [Z-LRBooking-Z] AS LB3 
	INNER JOIN TransportLRPayType AS TLRType3 ON LB3.LRPayTypeId = TLRType3.Id AND TLRType3.Title = 'TBB' AND TLRType3.Deleted = 0 AND LB3.Deleted = 0
	AND LB3.Id IN (SELECT Id FROM [dbo].[fnStringToIntArray](@LRNumberIds))
	AND LB3.BranchId = @BranchId) L3			

END
GO
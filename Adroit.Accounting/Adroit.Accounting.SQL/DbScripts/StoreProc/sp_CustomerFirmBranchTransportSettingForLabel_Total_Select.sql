CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchTransportSettingForLabel_Total_Select]
(
	@loginId INT,
	@branchId INT,
	@lrNumberId VARCHAR(MAX)
)
AS
BEGIN
	DECLARE @CustomerId INT = dbo.[fn_GetCustomerId](@loginId);

	SELECT CA1.[Name] AS ToPayAccountLabel
	,CA2.[Name] AS CrossingAmountLabel
	,CA3.[Name] AS CrossingCommissionLabel
	,CA4.[Name] AS CrossingHamaliLabel
	,CA5.[Name] AS CrossingDeliveryChargeLabel
	,[Z-LRBooking-Z].ToPayAccountValue As ToPayAccountValue
	FROM CustomerFirmBranchTransportSetting CFBT
	
	INNER JOIN CustomerAccountBranchMapping CABM1 ON CFBT.ToPayAccountBranchMappingId = CABM1.Id AND CABM1.Deleted = 0
	INNER JOIN CustomerAccount CA1 ON CA1.Id = CABM1.AccountId AND CA1.CustomerId = @CustomerId AND CABM1.BranchId = @branchId AND CA1.Deleted = 0 AND CA1.Active = 1

	LEFT JOIN CustomerAccountBranchMapping CABM2 ON CFBT.CrossingAmountAccountBranchMappingId = CABM2.Id AND CABM2.Deleted = 0
	LEFT JOIN CustomerAccount CA2 ON CA2.Id = CABM2.AccountId AND CA2.CustomerId = @CustomerId AND CABM2.BranchId = @branchId AND CA2.Deleted = 0 AND CA2.Active = 1

	LEFT JOIN CustomerAccountBranchMapping CABM3 ON CFBT.CrossingCommissionAccountBranchMappingId = CABM3.Id AND CABM3.Deleted = 0
	LEFT JOIN CustomerAccount CA3 ON CA3.Id = CABM3.AccountId AND CA3.CustomerId = @CustomerId AND CABM3.BranchId = @branchId AND CA3.Deleted = 0 AND CA3.Active = 1

	LEFT JOIN CustomerAccountBranchMapping CABM4 ON CFBT.CrossingHamaliAccountBranchMappingId = CABM4.Id AND CABM4.Deleted = 0
	LEFT JOIN CustomerAccount CA4 ON CA4.Id = CABM4.AccountId AND CA4.CustomerId = @CustomerId AND CABM4.BranchId = @branchId AND CA4.Deleted = 0 AND CA4.Active = 1

	LEFT JOIN CustomerAccountBranchMapping CABM5 ON CFBT.CrossingDeliveryChargeAccountBranchMappingId = CABM5.Id AND CABM5.Deleted = 0
	LEFT JOIN CustomerAccount CA5 ON CA5.Id = CABM5.AccountId AND CA5.CustomerId = @CustomerId AND CABM5.BranchId = @branchId AND CA5.Deleted = 0 AND CA5.Active = 1

	LEFT JOIN (
		SELECT [Z-LRBooking-Z].BranchId,[Z-LRBooking-Z].AccountBranchMappingId,SUM([Z-LRBooking-Z].InvoiceValue) As ToPayAccountValue
		FROM [Z-LRBooking-Z]
		LEFT JOIN CustomerAccountBranchMapping CABM ON [Z-LRBooking-Z].AccountBranchMappingId = CABM.Id AND CABM.Deleted = 0
		WHERE [Z-LRBooking-Z].Deleted = 0
		AND CAST([Z-LRBooking-Z].Id AS VARCHAR(50)) IN (SELECT * FROM [dbo].[fnStringToIntArray](@lrNumberId))
		GROUP BY [Z-LRBooking-Z].BranchId,[Z-LRBooking-Z].AccountBranchMappingId
	)[Z-LRBooking-Z] on [Z-LRBooking-Z].BranchId = @branchId
END
GO
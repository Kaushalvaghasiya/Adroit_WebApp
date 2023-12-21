CREATE OR ALTER   PROCEDURE [dbo].[sp_GetChalanLabelList]
(
	@LoginId INT,
	@BranchId INT
)
AS
BEGIN
	
	DECLARE @FirmId INT = (SELECT FirmId FROM CustomerFirmBranch WHERE Id = @BranchId);
	DECLARE @CustomerId INT = dbo.[fn_GetCustomerId](@LoginId);

	SELECT CA1.[Name] AS ToPayAccountLabel
	,CA2.[Name] AS CrossingAmountLabel
	,CA3.[Name] AS CrossingCommissionLabel
	,CA4.[Name] AS CrossingHamaliLabel
	,CA5.[Name] AS CrossingDeliveryChargeLabel
	,CFBT.SalesAccountBranchMappingId AS SalesAccountBranchMappingId
	FROM CustomerFirmBranchTransportSetting CFBT
	
	INNER JOIN CustomerAccountBranchMapping CABM1 ON CFBT.ToPayAccountBranchMappingId = CABM1.Id AND CABM1.Deleted = 0
	INNER JOIN CustomerAccount CA1 ON CA1.Id = CABM1.AccountId AND CA1.CustomerId = @CustomerId AND CABM1.BranchId = @BranchId AND CA1.Deleted = 0 AND CA1.Active = 1

	LEFT JOIN CustomerAccountBranchMapping CABM2 ON CFBT.CrossingAmountAccountBranchMappingId = CABM2.Id AND CABM2.Deleted = 0
	LEFT JOIN CustomerAccount CA2 ON CA2.Id = CABM2.AccountId AND CA2.CustomerId = @CustomerId AND CABM2.BranchId = @BranchId AND CA2.Deleted = 0 AND CA2.Active = 1

	LEFT JOIN CustomerAccountBranchMapping CABM3 ON CFBT.CrossingCommissionAccountBranchMappingId = CABM3.Id AND CABM3.Deleted = 0
	LEFT JOIN CustomerAccount CA3 ON CA3.Id = CABM3.AccountId AND CA3.CustomerId = @CustomerId AND CABM3.BranchId = @BranchId AND CA3.Deleted = 0 AND CA3.Active = 1

	LEFT JOIN CustomerAccountBranchMapping CABM4 ON CFBT.CrossingHamaliAccountBranchMappingId = CABM4.Id AND CABM4.Deleted = 0
	LEFT JOIN CustomerAccount CA4 ON CA4.Id = CABM4.AccountId AND CA4.CustomerId = @CustomerId AND CABM4.BranchId = @BranchId AND CA4.Deleted = 0 AND CA4.Active = 1

	LEFT JOIN CustomerAccountBranchMapping CABM5 ON CFBT.CrossingDeliveryChargeAccountBranchMappingId = CABM5.Id AND CABM5.Deleted = 0
	LEFT JOIN CustomerAccount CA5 ON CA5.Id = CABM5.AccountId AND CA5.CustomerId = @CustomerId AND CABM5.BranchId = @BranchId AND CA5.Deleted = 0 AND CA5.Active = 1

END
GO
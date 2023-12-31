CREATE OR ALTER   PROCEDURE [dbo].[sp_GetChalanLabelList]
(
	@LoginId INT,
	@BranchId INT
)
AS
BEGIN
	
	DECLARE @FirmId INT = (SELECT FirmId FROM CustomerFirmBranch WHERE Id = @BranchId);
	DECLARE @CustomerId INT = dbo.[fn_GetCustomerId](@LoginId);

	SELECT 
	(SELECT Name From CustomerAccount 
		INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
		WHERE CustomerAccountBranchMapping.Id = [ToPayAccountBranchMappingId]) ToPayAccountLabel,
	(SELECT Name From CustomerAccount 
		INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
		WHERE CustomerAccountBranchMapping.Id = [CrossingAmountAccountBranchMappingId]) CrossingAmountLabel,
	(SELECT Name From CustomerAccount 
		INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
		WHERE CustomerAccountBranchMapping.Id = [CrossingCommissionAccountBranchMappingId]) CrossingCommissionLabel,
	(SELECT Name From CustomerAccount 
		INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
		WHERE CustomerAccountBranchMapping.Id = [CrossingHamaliAccountBranchMappingId]) AS CrossingHamaliLabel,
	(SELECT Name From CustomerAccount 
		INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
		WHERE CustomerAccountBranchMapping.Id = [CrossingDeliveryChargeAccountBranchMappingId]) AS CrossingDeliveryChargeLabel,
	SalesAccountBranchMappingId AS SalesAccountBranchMappingId,
	ToPayAccountBranchMappingId AS ToPayAccountBranchMappingId
	FROM CustomerFirmBranchTransportSetting
	WHERE BranchId = @BranchId

END
GO
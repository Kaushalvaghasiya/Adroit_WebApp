CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerBrokerBranchMappingList_Select]
(
	@LoginId int, 
	@BranchId int
)
AS
BEGIN
	Declare @FirmId int = (SELECT FirmId FROM CustomerFirmBranch WHERE Id = @BranchId) 
    Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT [CustomerBrokerBranchMapping].Id As Value, [Broker].[Name] As Text
	FROM [CustomerBrokerBranchMapping] 
	JOIN [Broker] ON [CustomerBrokerBranchMapping].BrokerId = [Broker].Id
	WHERE [Broker].CustomerId = @CustomerId AND [CustomerBrokerBranchMapping].BranchId = @BranchId AND [CustomerBrokerBranchMapping].Deleted = 0
	AND [Broker].Deleted = 0
	AND [Broker].Active = 1
	ORDER BY [Broker].[Name]
END
GO
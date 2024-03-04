CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountGetByBranchMappingId]
(
	@CustomerAccountBranchMappingId INT,
	@BranchId INT
)
AS
BEGIN

	SELECT 
		CustomerAccount.*,
		CustomerBrokerBranchMapping.Id AS BrokerBranchMappingId
	FROM CustomerAccount
		INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
		LEFT JOIN Broker ON Broker.Id = CustomerAccount.BrokerId AND Broker.Deleted = 0 AND Broker.Active = 1
		LEFT JOIN CustomerBrokerBranchMapping ON CustomerBrokerBranchMapping.BrokerId = Broker.Id AND CustomerBrokerBranchMapping.Deleted = 0
	WHERE CustomerAccountBranchMapping.Id = @CustomerAccountBranchMappingId AND CustomerAccountBranchMapping.BranchId = @BranchId

END
GO
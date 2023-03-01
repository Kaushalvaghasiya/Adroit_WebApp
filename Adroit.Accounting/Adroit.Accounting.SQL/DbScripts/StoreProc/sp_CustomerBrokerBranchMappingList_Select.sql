CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerBrokerBranchMappingList_Select]
	@LoginId int, 
	@FirmId int
AS
BEGIN
	SELECT [CustomerBrokerBranchMapping].Id, [Broker].[Name] as BrokerName
	FROM [CustomerBrokerBranchMapping] 
	JOIN [Broker] ON [CustomerBrokerBranchMapping].BrokerId = [Broker].Id
	WHERE [CustomerBrokerBranchMapping].IsDeleted = 0
	AND [Broker].IsDeleted = 0 and [Broker].IsActive = 1
	ORDER BY [Broker].[Name]
END
GO
CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerBrokerBranchMappingList_Select]
(
	@LoginId int, 
	@FirmId int
)
AS
BEGIN
	SELECT [CustomerBrokerBranchMapping].Id As Value, [Broker].[Name] As Text
	FROM [CustomerBrokerBranchMapping] 
	JOIN [Broker] ON [CustomerBrokerBranchMapping].BrokerId = [Broker].Id
	WHERE [CustomerBrokerBranchMapping].Deleted = 0
	AND [Broker].Deleted = 0
	AND [Broker].Active = 1
	ORDER BY [Broker].[Name]
END
GO
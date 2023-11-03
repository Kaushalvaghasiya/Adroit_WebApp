CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchTransportContractRateSettingGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		CustomerFirmBranchTransportContractRateSetting.*
	FROM CustomerFirmBranchTransportContractRateSetting
	WHERE CustomerFirmBranchTransportContractRateSetting.Id = @Id
END
GO
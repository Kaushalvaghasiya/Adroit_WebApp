CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchTransportSettingGet]
(
	@BranchId INT
)
AS
BEGIN	
	SELECT 
		[CustomerFirmBranchTransportSetting].*
	FROM  [dbo].[CustomerFirmBranchTransportSetting]
	WHERE [CustomerFirmBranchTransportSetting].[BranchId] = @BranchId
END
GO
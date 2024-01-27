CREATE OR ALTER Procedure [dbo].[sp_ReportGetBranchNamesFromIds]
  @FirmId INT,  
  @BranchIds NVARCHAR(MAX)
As
Begin	
	SELECT STRING_AGG([CustomerFirmBranch].Title, ', ') AS BranchName
		FROM [CustomerFirmBranch]				
		INNER JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = [CustomerFirmBranch].FirmId
		WHERE [CustomerFirmBranch].Id IN (SELECT DISTINCT Id FROM dbo.[fnStringToIntArray](@BranchIds))
End
GO

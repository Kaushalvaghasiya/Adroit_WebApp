CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchTransportSettingList]
  @LoginId int,
  @FirmId int,  
  @BranchId int,  
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Set Nocount on;
Begin
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	
	SELECT * FROM
	(   
		SELECT  
			ROW_NUMBER() over (ORDER BY
				CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [CustomerFirm].[Title] END ASC,
				CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [CustomerFirm].[Title] END DESC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN CustomerFirmBranch.[Title] END ASC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN CustomerFirmBranch.[Title] END DESC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN dbo.fn_GetBookName(PurcahseBookBranchMappingId) END ASC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN dbo.fn_GetBookName(PurcahseBookBranchMappingId) END DESC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN dbo.fn_GetBookName(BookingSalesBookBranchMappingId) END ASC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN dbo.fn_GetBookName(BookingSalesBookBranchMappingId) END DESC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN dbo.fn_GetBookName(DeliverySalesBookBranchMappingId) END ASC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN dbo.fn_GetBookName(DeliverySalesBookBranchMappingId) END DESC,
				CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN [CustomerFirmBranchTransportSetting].[IsAutoJvEnableForChallan] END ASC,
				CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN [CustomerFirmBranchTransportSetting].[IsAutoJvEnableForChallan] END DESC,
				CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN [CustomerFirmBranchTransportSetting].[IsFreightAddInToBillForDelivery] END ASC,
				CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN [CustomerFirmBranchTransportSetting].[IsFreightAddInToBillForDelivery] END DESC
			) AS RowNum,
			Count(*) over () AS TotalCount, 
			[CustomerFirmBranchTransportSetting].*,
			[CustomerFirm].[Title] AS FirmName,
			CustomerFirmBranch.[Title] AS BranchName,
			dbo.fn_GetBookName(PurcahseBookBranchMappingId) AS PurchaseBookName,
			dbo.fn_GetBookName(BookingSalesBookBranchMappingId) AS BookingSalesBookName,
			dbo.fn_GetBookName(DeliverySalesBookBranchMappingId) AS DeliverySalesBookName,
			dbo.fn_GetBookName(GatePassBookBranchMappingId) AS GatePassBookName
		FROM [dbo].[CustomerFirmBranchTransportSetting] 		
			 INNER JOIN CustomerUserBranchMapping ON CustomerUserBranchMapping.[BranchId] = [CustomerFirmBranchTransportSetting].[BranchId] AND CustomerUserBranchMapping.[UserId] = @LoginId
			 INNER JOIN CustomerFirmBranch ON CustomerFirmBranch.Id = CustomerUserBranchMapping.[BranchId] 
			 INNER JOIN [CustomerFirm] ON [CustomerFirm].Id = CustomerFirmBranch.[FirmId]
		WHERE [CustomerFirm].Active = 1 AND [CustomerFirm].Deleted = 0
			AND CustomerFirmBranch.Active = 1 AND CustomerFirmBranch.Deleted = 0
			AND [CustomerFirm].Id = @FirmId AND [CustomerFirm].CustomerId = @CustomerId 
			AND (Coalesce(@Search,'') = '' 
			OR CustomerFirmBranch.[Title] like '%'+ @Search + '%'
			OR dbo.fn_GetBookName(PurcahseBookBranchMappingId) like '%'+ @Search + '%'
			OR dbo.fn_GetBookName(BookingSalesBookBranchMappingId) like '%'+ @Search + '%'
			OR dbo.fn_GetBookName(DeliverySalesBookBranchMappingId) like '%'+ @Search + '%'
			OR dbo.fn_GetBookName(GatePassBookBranchMappingId) like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO
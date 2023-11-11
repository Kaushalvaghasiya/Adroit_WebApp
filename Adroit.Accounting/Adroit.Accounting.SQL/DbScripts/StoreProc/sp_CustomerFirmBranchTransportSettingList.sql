CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchTransportSettingList]
  @LoginId int,
  @FirmId int,  
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Set Nocount on;
Begin
	Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	
	SELECT * FROM
	(   
		SELECT  
			ROW_NUMBER() over (ORDER BY
				CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN [CustomerFirm].[Title] END ASC,
				CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN [CustomerFirm].[Title] END DESC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN CustomerFirmBranch.[Title] END ASC,
				CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN CustomerFirmBranch.[Title] END DESC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN PBBA.[Name] END ASC,
				CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN PBBA.[Name] END DESC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN BSBBA.[Name] END ASC,
				CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN BSBBA.[Name] END DESC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN DSBBA.[Name] END ASC,
				CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN DSBBA.[Name] END DESC,
				CASE WHEN @SortColumn = 5 AND @SortOrder ='ASC' THEN [CustomerFirmBranchTransportSetting].[IsAutoJvEnableForChallan] END ASC,
				CASE WHEN @SortColumn = 5 AND @SortOrder ='DESC' THEN [CustomerFirmBranchTransportSetting].[IsAutoJvEnableForChallan] END DESC,
				CASE WHEN @SortColumn = 6 AND @SortOrder ='ASC' THEN [CustomerFirmBranchTransportSetting].[IsFreightAddInToBillForDelivery] END ASC,
				CASE WHEN @SortColumn = 6 AND @SortOrder ='DESC' THEN [CustomerFirmBranchTransportSetting].[IsFreightAddInToBillForDelivery] END DESC
			) AS RowNum,
			Count(*) over () AS TotalCount, 
			[CustomerFirmBranchTransportSetting].*,
			[CustomerFirm].[Title] AS FirmName,
			CustomerFirmBranch.[Title] AS BranchName,
			PBBA.[Name] AS PurchaseBookName,
			BSBBA.[Name] AS BkSalesBookName,
			DSBBA.[Name] AS DelSalesBookName
		FROM [dbo].[CustomerFirmBranchTransportSetting] 		
			 INNER JOIN CustomerFirmBranch ON CustomerFirmBranch.Id = [CustomerFirmBranchTransportSetting].[BranchId] 
			 INNER JOIN [CustomerFirm] ON [CustomerFirm].Id = CustomerFirmBranch.[FirmId]
			 INNER JOIN [CustomerBookBranchMapping] AS PBBM ON PBBM.[Id] = [CustomerFirmBranchTransportSetting].[PurcahseBookBranchMappingId] 
			 INNER JOIN [CustomerBook] AS PBB ON PBB.[Id] = PBBM.[BookId] 
			 INNER JOIN CustomerAccount AS PBBA ON PBBA.Id = PBB.BookAccountId  
			 INNER JOIN [CustomerBookBranchMapping] AS BSBBM ON BSBBM.[Id] = [CustomerFirmBranchTransportSetting].[BookingSalesBookBranchMappingId]  
			 INNER JOIN [CustomerBook] AS BSBB ON BSBB.[Id] = BSBBM.[BookId] 
			 INNER JOIN CustomerAccount AS BSBBA ON BSBBA.[Id] = BSBB.BookAccountId 
			 INNER JOIN [CustomerBookBranchMapping] AS DSBBM ON DSBBM.[Id] = [CustomerFirmBranchTransportSetting].[DeliverySalesBookBranchMappingId]  
			 INNER JOIN [CustomerBook] AS DSBB ON DSBB.[Id] = DSBBM.[BookId] 
			 INNER JOIN CustomerAccount AS DSBBA ON DSBBA.[Id] = DSBB.BookAccountId 
		WHERE (Coalesce(@Search,'') = '' 
			OR CustomerFirmBranch.[Title] like '%'+ @Search + '%'
			OR PBBA.[Name] like '%'+ @Search + '%'
			OR BSBBA.[Name] like '%'+ @Search + '%'
			OR DSBBA.[Name] like '%'+ @Search + '%')
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO
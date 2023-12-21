CREATE OR ALTER Procedure [dbo].[sp_CustomerFirmBranchTransportContractRateSettingList]
  @LoginId int,
  @FirmId int,  
  @Search VARCHAR(100) = '',
  @PageStart INT = 0,
  @PageSize INT = 10,
  @SortColumn INT = 0,
  @SortOrder NVARCHAR(10) = 'ASC'
As
Begin
	DECLARE @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT * FROM
	 (   
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CustomerAccount.[Name] END ASC,
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CustomerAccount.[Name] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN CustomerFirmBranch.Title END ASC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN CustomerFirmBranch.Title END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN City.Title END ASC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN City.Title END DESC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CustomerFirmBranchTransportContractRateSetting.RatePerKG END ASC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CustomerFirmBranchTransportContractRateSetting.RatePerKG END DESC,
		 CASE WHEN @SortColumn = 4 AND @SortOrder ='ASC' THEN CustomerFirmBranchTransportContractRateSetting.RatePerParcel END ASC,
		 CASE WHEN @SortColumn = 4 AND @SortOrder ='DESC' THEN CustomerFirmBranchTransportContractRateSetting.RatePerParcel END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
			CustomerFirmBranchTransportContractRateSetting.*,
			CustomerAccount.[Name] as CustomerName,
			City.Title As City,
			CustomerFirmBranch.Title AS BranchName
		From CustomerFirm 
		INNER JOIN CustomerFirmBranch ON CustomerFirm.Id = CustomerFirmBranch.FirmId 
		INNER JOIN CustomerAccountBranchMapping ON CustomerFirmBranch.Id = CustomerAccountBranchMapping.BranchId
		INNER JOIN CustomerFirmBranchTransportContractRateSetting ON CustomerAccountBranchMapping.Id = CustomerFirmBranchTransportContractRateSetting.AccountBranchMappingId
		INNER JOIN CustomerAccount ON CustomerAccountBranchMapping.AccountId = CustomerAccount.Id
		LEFT JOIN City ON CustomerFirmBranchTransportContractRateSetting.CityId = City.Id 
		WHERE CustomerFirm.CustomerId = @CustomerId
			AND (CustomerAccount.[Name] like '%'+ @Search + '%'
			OR CustomerFirmBranch.Title like '%'+ @Search + '%'
			OR City.Title like '%'+ @Search + '%'
			OR CustomerFirmBranchTransportContractRateSetting.RatePerKG like '%'+ @Search + '%'
			OR CustomerFirmBranchTransportContractRateSetting.RatePerParcel like '%'+ @Search + '%'
		)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO
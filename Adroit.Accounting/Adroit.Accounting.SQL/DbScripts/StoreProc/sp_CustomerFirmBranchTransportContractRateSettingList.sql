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
	SELECT * FROM
	 (   
	  SELECT  
	   ROW_NUMBER() over (ORDER BY
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='ASC' THEN CustomerAccount.[Name] END ASC,
		 CASE WHEN @SortColumn = 0 AND @SortOrder ='DESC' THEN CustomerAccount.[Name] END DESC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='ASC' THEN City.Title END ASC,
		 CASE WHEN @SortColumn = 1 AND @SortOrder ='DESC' THEN City.Title END DESC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='ASC' THEN CustomerFirmBranchTransportContractRateSetting.RatePerKG END ASC,
		 CASE WHEN @SortColumn = 2 AND @SortOrder ='DESC' THEN CustomerFirmBranchTransportContractRateSetting.RatePerKG END DESC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='ASC' THEN CustomerFirmBranchTransportContractRateSetting.RatePerParcel END ASC,
		 CASE WHEN @SortColumn = 3 AND @SortOrder ='DESC' THEN CustomerFirmBranchTransportContractRateSetting.RatePerParcel END DESC
		) AS RowNum,
		Count(*) over () AS TotalCount, 
			CustomerFirmBranchTransportContractRateSetting.*,
			CustomerAccount.[Name] as CustomerName,
			City.Title As City
		From CustomerFirmBranchTransportContractRateSetting
		Left Join CustomerAccountBranchMapping on CustomerFirmBranchTransportContractRateSetting.AccountBranchMappingId=CustomerAccountBranchMapping.Id
		Left Join CustomerAccount on CustomerAccountBranchMapping.AccountId = CustomerAccount.Id
		Left Join City on City.Id = CustomerFirmBranchTransportContractRateSetting.CityId
		WHERE 
		(Coalesce(@Search,'') = '' 
			OR CustomerAccount.[Name] like '%'+ @Search + '%'
			OR City.Title like '%'+ @Search + '%'
			OR CustomerFirmBranchTransportContractRateSetting.RatePerKG like '%'+ @Search + '%'
			OR CustomerFirmBranchTransportContractRateSetting.RatePerParcel like '%'+ @Search + '%'
		)
	 ) AS T   
	 WHERE (((@PageSize = -1) And 1=1) OR (T.RowNum > @PageStart AND T.RowNum < (@PageStart + (@PageSize+1))))
End
GO
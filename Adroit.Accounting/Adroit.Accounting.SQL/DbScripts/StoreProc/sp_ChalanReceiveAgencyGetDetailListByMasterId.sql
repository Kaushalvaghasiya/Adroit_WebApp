CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanReceiveAgencyGetDetailListByMasterId]
  @LoginId int,
  @BranchId int,
  @MasterId int
AS
BEGIN

	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT * FROM [Z-ChalanReceiveAgencyDetail-Z] 
	WHERE ChalanReceiveAgencyMasterId = @MasterId AND Deleted = 0 AND YearId = @YearId 
	ORDER BY SrNumber ASC
END
GO
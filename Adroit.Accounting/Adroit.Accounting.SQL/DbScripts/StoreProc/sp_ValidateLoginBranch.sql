CREATE OR ALTER PROCEDURE [dbo].[sp_ValidateLoginBranch]
(
	@LoginId INT,
	@BranchId INT,
	@YearId INT
)
AS
BEGIN	
	DECLARE @LoggedInBranchId INT = dbo.fn_GetLoggedInBranchId(@LoginId);
	IF (@LoggedInBranchId <> @BranchId)
	BEGIN
		RAISERROR ('%s', 16, 1, 'This user has signed in from another system with different branch. Please logout and login again.');
	END

	DECLARE @LoggedInYearId INT = dbo.fn_GetYearId(@LoginId);
	IF (@LoggedInYearId <> @YearId)
	BEGIN
		RAISERROR ('%s', 16, 1, 'This user has signed in from another system with different year. Please logout and login again.');
	END
END
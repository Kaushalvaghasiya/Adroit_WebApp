CREATE OR ALTER PROCEDURE [dbo].[sp_AdminCustomerBranchToBranchMappingSave]
(
	 @Id int,
	 @Branch varchar(max),
	 @SharedBranch varchar(max)
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY		
		INSERT INTO CustomerChalanBranchMapping ([Branch], [SharedBranch])
		SELECT A.ID AS [Branch], B.ID AS [SharedBranch]
		FROM dbo.fnStringToIntArray(@Branch) A
		CROSS JOIN dbo.fnStringToIntArray(@SharedBranch) B
		WHERE NOT EXISTS (
			SELECT 1
			FROM CustomerChalanBranchMapping C
			WHERE C.Branch = A.ID AND C.SharedBranch = B.ID
		);
		SET @Id = SCOPE_IDENTITY();
		COMMIT TRAN
		SELECT @Id

	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN		

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
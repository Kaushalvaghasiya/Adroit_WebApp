CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountOpeningBalanceSave]
(
	@Id INT
	,@LoginId INT
	,@AccountBranchMappingId INT
	,@OpeningDate	Datetime
	,@Credit	bit
	,@Amount decimal(18,2)
	,@AddedById	int
	,@ModifiedById int
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		Declare @YearId INT = dbo.fn_GetYearId(@LoginId);

		IF EXISTS (SELECT 1 FROM CustomerAccountOpeningBalance WHERE Id = @Id)
			BEGIN
				UPDATE  CustomerAccountOpeningBalance SET
						AccountBranchMappingId = @AccountBranchMappingId,
						OpeningDate = @OpeningDate,
						YearId = @YearId,
						[Credit] = @Credit,
						Amount = @Amount,
						ModifiedById = @ModifiedById
					WHERE ID = @Id
			END
		ELSE
			BEGIN
				INSERT INTO CustomerAccountOpeningBalance
					(AccountBranchMappingId,YearId,Amount,AddedById, Credit, OpeningDate)
				VALUES
					(@AccountBranchMappingId,@YearId,@Amount,@AddedById, @Credit, @OpeningDate)

				SET @Id = SCOPE_IDENTITY()
			END
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		IF (@message LIKE '%IX_CustomerAccountOpeningBalance%')
		BEGIN
			SET @message = 'Account opening already exist!';
		END

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
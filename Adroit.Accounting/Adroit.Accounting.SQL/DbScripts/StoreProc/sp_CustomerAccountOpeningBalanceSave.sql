CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountOpeningBalanceSave]
(
	@Id INT
	,@AccountBranchMappingId INT
	,@YearId	INT
	,@Type	char(1)
	,@Amount decimal(18,2)
	,@AddedById	int
	,@ModifiedById int
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM CustomerAccountOpeningBalance WHERE Id = @Id)
			BEGIN
				UPDATE  CustomerAccountOpeningBalance SET
						AccountBranchMappingId = @AccountBranchMappingId,
						YearId = @YearId,
						[Type] = @Type,
						Amount = @Amount,
						ModifiedById = @ModifiedById
					WHERE ID = @Id
			END
		ELSE
			BEGIN
				INSERT INTO CustomerAccountOpeningBalance
					(AccountBranchMappingId,YearId,[Type],Amount,AddedById)
				VALUES
					(@AccountBranchMappingId,@YearId,@Type,@Amount,@AddedById)

				SET @Id = SCOPE_IDENTITY()
			END
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
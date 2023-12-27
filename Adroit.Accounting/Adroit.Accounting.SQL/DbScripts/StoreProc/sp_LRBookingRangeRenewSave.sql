CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingRangeRenewSave]
(
	@Id INT,
	@BranchId INT,
	@FirmId INT,
	@NumberOfLR INT,
	@LoginId INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		DECLARE @YearId int = dbo.fn_GetYearId(@LoginId);

		DECLARE @message VARCHAR(4000);

		IF @YearId IS NULL
		BEGIN
			SET @message = 'Year Not Found!';
			RAISERROR ('%s', 16, 1, @message);
		END

		DECLARE @MaxNumber INT = (
			SELECT ISNULL(MAX(EndNumber),0) As StratNumber
			FROM [LRBookingRange]
			WHERE [LRBookingRange].YearId = @YearId
			AND [LRBookingRange].FirmId = @FirmId
			AND [LRBookingRange].Deleted = 0
		)

		DECLARE @StartNumber INT = @MaxNumber + 1
		DECLARE @EndNumber INT = @MaxNumber + @NumberOfLR 

		UPDATE [LRBookingRange]
		SET Active = 0
		WHERE YearId = @YearId
			AND FirmId = @FirmId
			AND BranchId = @BranchId
			AND Active = 1
			AND Deleted = 0;

		INSERT INTO [LRBookingRange] (BranchId,FirmId,YearId,StartNumber,EndNumber,AddedById,AddedOn,Active)
		VALUES (@BranchId,@FirmId,@YearId,@StartNumber,@EndNumber,@LoginId,GETUTCDATE(),1)
			
		SET @Id = SCOPE_IDENTITY();

		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
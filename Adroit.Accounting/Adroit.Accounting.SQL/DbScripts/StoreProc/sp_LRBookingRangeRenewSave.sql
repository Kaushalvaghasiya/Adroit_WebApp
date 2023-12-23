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

		DECLARE @StartNumber INT = (
			SELECT ISNULL(MAX(EndNumber),0) + 1 As StratNumber
			FROM [LRBookingRange]
			WHERE [LRBookingRange].YearId = @YearId
			AND [LRBookingRange].FirmId = @FirmId
			AND [LRBookingRange].Active = 1 
			AND [LRBookingRange].Deleted = 0
		)

		DECLARE @EndNumber INT = (
			SELECT ISNULL(MAX(EndNumber),0) + @NumberOfLR As EndNumber
			FROM [LRBookingRange]
			WHERE [LRBookingRange].YearId = @YearId
			AND [LRBookingRange].FirmId = @FirmId
			AND [LRBookingRange].Active = 1 
			AND [LRBookingRange].Deleted = 0
		)

		UPDATE [LRBookingRange]
		SET Active = 0
		WHERE YearId = @YearId
			AND FirmId = @FirmId
			AND BranchId = @BranchId
			AND Active = 1
			AND Deleted = 0;

		INSERT INTO [LRBookingRange] (BranchId,FirmId,YearId,NumberOfLR,StartNumber,EndNumber,AddedById,AddedOn,Active)
		VALUES (@BranchId,@FirmId,@YearId,@NumberOfLR,@StartNumber,@EndNumber,@LoginId,GETUTCDATE(),1)
			
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
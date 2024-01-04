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
			RAISERROR ('%s', 16, 1, 'Year Not Found!');
		END

		DECLARE @MaxNumber INT 
		SELECT @MaxNumber = MAX(EndNumber) FROM [LRBookingRange] 
			WHERE [LRBookingRange].FirmId = @FirmId 
			AND [LRBookingRange].YearId = @YearId
			AND [LRBookingRange].Deleted = 0

		DECLARE @StartNumber INT = @MaxNumber + 1
		DECLARE @EndNumber INT = @MaxNumber + @NumberOfLR 

		DECLARE @LastLR INT
		SELECT @LastLR = MAX(LRNumber) FROM [Z-LRBooking-Z] WHERE BranchId = @BranchId AND YearId = @YearId AND Deleted = 0

		DECLARE @CurrentRangeStart INT, @CurrentEndStart INT
		IF EXISTS (SELECT ID FROM LRBookingRange WHERE BranchId = @BranchId AND YearId = @YearId AND Deleted = 0)
		BEGIN
			IF (@Id = 0)
			BEGIN
				IF (ISNULL(@LastLR, 0) = 0 OR @LastLR < @StartNumber)
				BEGIN
					RAISERROR ('%s', 16, 1, 'Please complete existing LR range before adding new range.');
				END
			END
		END

		UPDATE [LRBookingRange]
		SET Active = 0
		WHERE FirmId = @FirmId
			AND BranchId = @BranchId
			AND YearId = @YearId
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
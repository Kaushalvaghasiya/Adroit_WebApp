CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingRangeSave]
(
	@Id	INT,
	@BranchId INT,
	@FirmId INT,
	@StartNumber INT,
	@EndNumber INT,
	@Active	BIT,
	@LoginId INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF (@StartNumber <= 0 )
		BEGIN
			RAISERROR ('%s', 16, 1, 'Start number must be greater than 0.');
		END
		IF (@EndNumber <= @StartNumber)
		BEGIN
			RAISERROR ('%s', 16, 1, 'End number must be greater than start number.');
		END

		DECLARE @YearId int = dbo.fn_GetYearId(@LoginId);

		DECLARE @message VARCHAR(4000);
		IF @YearId IS NULL
		BEGIN
			RAISERROR ('%s', 16, 1, 'Year Not Found!');
		END

		IF EXISTS (
			SELECT [LRBookingRange].Id
			FROM [LRBookingRange]
			WHERE FirmId = @FirmId 
			AND YearId = @YearId 
			AND Deleted = 0 
			AND (@Id = 0 OR Id <> @Id) 
			AND (
					(@StartNumber BETWEEN StartNumber AND EndNumber) OR 
					(@EndNumber BETWEEN StartNumber AND EndNumber) OR 
					(StartNumber BETWEEN @StartNumber AND @EndNumber) OR 
					(EndNumber BETWEEN @StartNumber AND @EndNumber)
				)  
		)
		BEGIN
			RAISERROR ('%s', 16, 1, 'This LR booking range is already exists. Please check start & end numbers.');
		END

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
			ELSE
			BEGIN
				SELECT @CurrentRangeStart = StartNumber, @CurrentEndStart = EndNumber FROM LRBookingRange WHERE BranchId = @BranchId AND YearId = @YearId AND Deleted = 0
				IF NOT (@StartNumber <= @LastLR AND @LastLR <= @EndNumber)
				BEGIN
					SET @message = 'Last LR number is ' + CAST(@LastLR  AS VARCHAR) + '. So range must contains this number.'
					RAISERROR ('%s', 16, 1, @message);
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

		IF EXISTS (SELECT 1 FROM [LRBookingRange] WHERE Id = @Id)
		BEGIN
				UPDATE [LRBookingRange] SET
				BranchId = @BranchId,
				YearId = @YearId,
				FirmId = @FirmId,
				StartNumber = @StartNumber,
				EndNumber = @EndNumber,
				Active = @Active, 
				ModifiedById = @LoginId, 
				ModifiedOn = GETUTCDATE()
				WHERE Id = @Id;
		END
		ELSE
		BEGIN
			INSERT INTO [LRBookingRange] (
				BranchId,YearId,FirmId,StartNumber,EndNumber,AddedById,AddedOn,Active
			)
			VALUES (
				@BranchId,@YearId,@FirmId,@StartNumber,@EndNumber,@LoginId,GETUTCDATE(),@Active
			)

			SET @Id = SCOPE_IDENTITY();
		END
		
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		IF (@message LIKE '%IX_LRRange%')
		BEGIN
			SET @message = 'Branch name already exist!';
		END

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
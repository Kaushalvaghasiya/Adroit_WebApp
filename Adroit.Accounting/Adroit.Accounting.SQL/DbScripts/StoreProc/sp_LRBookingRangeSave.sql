CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingRangeSave]
(
	@Id					INT,
	@BranchId			INT,
	@StartNumber		INT,
	@EndNumber			INT,
	@Active				BIT,
	@AddedById			INT,
	@ModifiedById		INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		IF EXISTS (SELECT 1 FROM [LRBookingRange] WHERE Id = @Id)
			BEGIN
					UPDATE [LRBookingRange] SET
					BranchId = @BranchId,
					StartNumber = @StartNumber,
					EndNumber = @EndNumber,
					Active = @Active, 
					ModifiedById = @ModifiedById, 
					ModifiedOn = GETUTCDATE()
					WHERE Id = @Id;
			END
		ELSE If EXISTS (SELECT 1 FROM [LRBookingRange] WHERE BranchId = @BranchId AND Deleted = 1)
			BEGIN
				UPDATE  [LRBookingRange] SET
						Active = @Active,
						Deleted = 0,
						StartNumber = @StartNumber,
						EndNumber = @EndNumber
					WHERE BranchId = @BranchId

				SELECT @Id=Id FROM [LRBookingRange] WHERE BranchId = @BranchId
			END
		ELSE
			BEGIN
				INSERT INTO [LRBookingRange] (
					BranchId,StartNumber,EndNumber,AddedById,AddedOn,Active
				)
				VALUES (
					@BranchId,@StartNumber,@EndNumber,@AddedById,GETUTCDATE(),@Active
				)

				SET @Id = SCOPE_IDENTITY();
			END
		
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
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
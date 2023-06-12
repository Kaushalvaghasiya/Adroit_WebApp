CREATE OR ALTER PROCEDURE [dbo].[sp_SoftwareSave]
(
	 @Id int,
	 @Title VARCHAR(20),
	 @IsDeleted bit,
	 @orderNumber int
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM Software WHERE Id = @Id)
			BEGIN
				UPDATE  Software SET
						Title=@Title,
						OrderNumber=@orderNumber
					WHERE ID = @Id
			END

			ELSE If EXISTS (SELECT 1 FROM Software WHERE Title = @Title)
			BEGIN
				
				UPDATE  Software SET
						OrderNumber=@orderNumber,
						IsDeleted=0
					WHERE Title = @Title

					SELECT @Id=Id FROM Software WHERE Title = @Title
				
			END
		ELSE 
			BEGIN
				INSERT INTO Software
					([Title],OrderNumber,IsDeleted
					)
				VALUES
					(
					@Title,@orderNumber,0
					)

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
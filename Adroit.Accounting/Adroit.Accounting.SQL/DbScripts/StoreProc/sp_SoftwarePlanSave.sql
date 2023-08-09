CREATE OR ALTER PROCEDURE [dbo].[sp_SoftwarePlanSave]
(
	 @Id int,
	 @Title VARCHAR(100),
	 @SoftwareId INT,
	 @Bussiness VARCHAR(20),
	 @Code VARCHAR(5),
	 @Cost decimal(16,2),
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM SoftwarePlan WHERE Id = @Id)
			BEGIN
				UPDATE  SoftwarePlan SET
						SoftwareId = @SoftwareId,
						Title = @Title,
						Business = @Bussiness,
						Code = @Code,
						Cost = @Cost,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM SoftwarePlan WHERE SoftwareId = @SoftwareId AND Title = @Title AND Deleted = 1)
			BEGIN
				UPDATE  SoftwarePlan SET
						Business = @Bussiness,
						Code = @Code,
						Cost = @Cost,
						Active = @active,
						Deleted = 0
					WHERE SoftwareId = @SoftwareId AND Title = @Title 

				SELECT @Id=Id FROM SoftwarePlan WHERE SoftwareId = @SoftwareId AND Title = @Title 
			END
		ELSE
			BEGIN
				INSERT INTO SoftwarePlan
					(SoftwareId, Title, Business, Code, Cost, Active)
				VALUES
					(@SoftwareId, @Title, @Bussiness, @Code, @Cost, @Active)

				SET @Id = SCOPE_IDENTITY()
			END
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		IF (@message LIKE '%UC_Code%')
			BEGIN
				SET @message = 'Software plan code ''' + @Code + ''' already exist!';
			END
		ELSE
			IF (@message LIKE '%UC_SoftwareId_Title%')
			BEGIN
				SET @message = 'Software plan title ''' + @Title + ''' already exist!';
			END

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
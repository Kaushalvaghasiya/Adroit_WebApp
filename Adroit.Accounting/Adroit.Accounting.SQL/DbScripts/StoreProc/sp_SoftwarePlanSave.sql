CREATE OR ALTER PROCEDURE [dbo].[sp_SoftwarePlanSave]
(
	 @Id int,
	 @Title VARCHAR(100),
	 @SoftwareId INT,
	 @bussiness VARCHAR(20),
	 @Code VARCHAR(5),
	 @Cost decimal(16,2),
	 @IsDeleted bit
	
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM SoftwarePlan WHERE Id = @Id)
			BEGIN
				UPDATE  SoftwarePlan SET
						SoftwareId=@SoftwareId,
						Title=@Title,
						Business=@bussiness,
						Code=@Code,
						Cost=@Cost
					WHERE ID = @Id
			END
		ELSE
			BEGIN
				INSERT INTO SoftwarePlan
					([SoftwareId],Title,Business,Code,Cost
					)
				VALUES
					(
					@SoftwareId,@Title,@bussiness,@Code,@Cost
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
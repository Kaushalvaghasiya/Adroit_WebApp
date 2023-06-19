CREATE OR ALTER PROCEDURE [dbo].[sp_BusinessSave]
(
	 @Id tinyint,
	 @Title VARCHAR(200),
	 @Active bit,
	 @OrderNumber tinyint,
	 @SoftwareIds VARCHAR(250)
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM Business WHERE Id = @Id)
			BEGIN
				UPDATE Business SET
					Title = @Title,
					OrderNumber = @OrderNumber,
					Active = @active
				WHERE ID = @Id

				DELETE BusinessSoftwareMapping WHERE BusinessId = @Id
				INSERT INTO BusinessSoftwareMapping (BusinessId, SoftwareId) SELECT @Id, S.Id from dbo.[fnStringToIntArray](@SoftwareIds) AS S
			END
		ELSE If EXISTS (SELECT 1 FROM Business WHERE Title = @Title AND IsDeleted = 1)
			BEGIN
				SELECT @Id=Id FROM Business WHERE Title = @Title
				UPDATE Business SET
					OrderNumber = @OrderNumber,
					Active = @Active,
					IsDeleted = 0
				WHERE Title = @Title


				DELETE BusinessSoftwareMapping WHERE BusinessId = @Id
				INSERT INTO BusinessSoftwareMapping (BusinessId, SoftwareId) SELECT @Id, S.Id from dbo.[fnStringToIntArray](@SoftwareIds) AS S
			END
		ELSE 
			BEGIN
				INSERT INTO Business
					([Title], OrderNumber, Active)
				VALUES
					(@Title, @OrderNumber, @Active)

				SET @Id = SCOPE_IDENTITY()

				INSERT INTO BusinessSoftwareMapping (BusinessId, SoftwareId) SELECT @Id, S.Id from dbo.[fnStringToIntArray](@SoftwareIds) AS S
			END

		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		IF (@message LIKE '%Violation of UNIQUE KEY%')
		BEGIN
			SET @message = 'Business ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO
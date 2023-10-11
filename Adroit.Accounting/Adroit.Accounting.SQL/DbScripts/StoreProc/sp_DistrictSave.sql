CREATE OR ALTER PROCEDURE [dbo].[sp_DistrictSave]
(
	 @Id int,
	 @Title VARCHAR(100),
	 @StateId INT,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM District WHERE Id = @Id)
			BEGIN
				UPDATE  District SET
						Title = @Title,
						StateId = @StateId,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM District WHERE Title = @Title AND StateId=@StateId)
			BEGIN
				UPDATE  District SET
						Title = @Title,
						StateId = @StateId,
						Active = @active
					WHERE StateId = @StateId AND Title = @Title 

				SELECT @Id=Id FROM District WHERE Title = @Title 
			END
		ELSE
			BEGIN
				INSERT INTO District
					(Title, StateId, Active)
				VALUES
					(@Title, @StateId, @Active)

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
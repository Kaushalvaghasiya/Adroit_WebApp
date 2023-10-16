CREATE OR ALTER PROCEDURE [dbo].[sp_TalukaSave]
(
	 @Id int,
	 @Title VARCHAR(100),
	 @DistrictId INT,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM Taluka WHERE Id = @Id)
			BEGIN
				UPDATE  Taluka SET
						Title = @Title,
						DistrictId = @DistrictId,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM Taluka WHERE Title = @Title AND DistrictId = @DistrictId)
			BEGIN
			    declare @errorMessage VARCHAR(4000);
				SET @errorMessage = 'Taluka ''' + @Title + ''' already exist!';
				RAISERROR ('%s', 16, 1,@errorMessage);
			END
		ELSE
			BEGIN
				INSERT INTO Taluka
					(Title, DistrictId, Active)
				VALUES
					(@Title, @DistrictId, @Active)

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
IF EXISTS(SELECT 1 FROM sys.procedures 
          WHERE Name = 'sp_AdminSoftwareDelete')
BEGIN
DROP PROCEDURE [dbo].[sp_AdminSoftwareDelete]
END
IF EXISTS(SELECT 1 FROM sys.procedures 
          WHERE Name = 'sp_AdminSoftwareGet')
BEGIN
DROP PROCEDURE [dbo].[sp_AdminSoftwareGet]
END
IF EXISTS(SELECT 1 FROM sys.procedures 
          WHERE Name = 'sp_AdminSoftwareList')
BEGIN
DROP PROCEDURE [dbo].[sp_AdminSoftwareList]
END
IF EXISTS(SELECT 1 FROM sys.procedures 
          WHERE Name = 'sp_AdminSoftwarePlanDelete')
BEGIN
DROP PROCEDURE [dbo].[sp_AdminSoftwarePlanDelete]
END
IF EXISTS(SELECT 1 FROM sys.procedures 
          WHERE Name = 'sp_AdminSoftwarePlanGet')
BEGIN
DROP PROCEDURE [dbo].[sp_AdminSoftwarePlanGet]
END
IF EXISTS(SELECT 1 FROM sys.procedures 
          WHERE Name = 'sp_AdminSoftwarePlanList')
BEGIN
DROP PROCEDURE [dbo].[sp_AdminSoftwarePlanList]
END
IF EXISTS(SELECT 1 FROM sys.procedures 
          WHERE Name = 'sp_AdminSoftwarePlanSave')
BEGIN
DROP PROCEDURE [dbo].[sp_AdminSoftwarePlanSave]
END
IF EXISTS(SELECT 1 FROM sys.procedures 
          WHERE Name = 'sp_AdminSoftwareSave')
BEGIN
DROP PROCEDURE [dbo].[sp_AdminSoftwareSave]
END

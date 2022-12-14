USE [Users_Managment_Development]
GO
/****** Object:  StoredProcedure [dbo].[GetUsersByProfile]    Script Date: 07/03/2013 18:08:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[GetUsersByProfile] 
@ID INT
AS
--SELECT     ID_Employee, First_name, Last_name, [User_Name] , Password, Active, Password_Change, Date_Termination, Log_in, Official_email, DOB, ID_Category, ID_card, 
--                      ID_Unit_Office
--FROM         Tbl_Users
--WHERE     ([User_Name] = @UserName)
--GO


SELECT     Tbl_Users_Applications.ID_Employee, Tbl_Applications.ID_Application, Tbl_Applications.Application, Tbl_Profiles.ID_Profile, Tbl_Profiles.Profile, 
                      Tbl_Users.First_name, Tbl_Users.Last_name, Tbl_Users.User_Name, Tbl_Users.Password, Tbl_Users.Active, Tbl_Users.Password_Change, 
                      Tbl_Users.Date_Termination, Tbl_Users.Log_in, Tbl_Users.Official_email, Tbl_Users.DOB, Tbl_Users.ID_Category, Tbl_Users.ID_card, 
                      Tbl_Users.ID_Unit_Office
FROM         Tbl_Profiles RIGHT OUTER JOIN
                      Tbl_Users_Applications ON Tbl_Profiles.ID_Profile = Tbl_Users_Applications.ID_Profile LEFT OUTER JOIN
                      Tbl_Applications ON Tbl_Users_Applications.ID_Application = Tbl_Applications.ID_Application LEFT OUTER JOIN
                      Tbl_Users ON Tbl_Users_Applications.ID_Employee = Tbl_Users.ID_Employee
WHERE     (Tbl_Users_Applications.Active = 1) AND (Tbl_Applications.ID_Application = 1006) AND (Tbl_Profiles.ID_Profile = @ID)
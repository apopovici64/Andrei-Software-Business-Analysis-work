USE [Users_Managment_Development]
GO
/****** Object:  StoredProcedure [dbo].[INSERT_UPDATE_USERNAME]    Script Date: 07/03/2013 18:09:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[INSERT_UPDATE_USERNAME]
as


INSERT INTO [dbo].[Tbl_Users]
           ([ID_Employee]
           ,[First_name]
           ,[Last_name]
           ,[User_Name]
           ,[Date_Termination]
           ,[Log_in]
		   ,[Official_email]
		   ,[DOB]
		   ,[ID_Category]
			)
select [ID_employee]
      ,[First_name]
      ,[Last_Name]
      ,[User_Name]
      ,[date_termination]
      ,[Log_in]
	  ,Official_email
	  ,dob
      ,ID_Category
from dbo.V_employees
where not exists(
select [ID_employee]
      ,[First_name]
      ,[Last_Name]
      ,[User_Name]
      ,[date_termination]
      ,[Log_in]
	  ,Official_email
	  ,dob
      ,ID_Category
 from dbo.Tbl_Users
where V_employees.ID_Employee=Tbl_Users.ID_Employee)




declare @ID_employee int
declare @User_Name 	nvarchar(60)
declare @date_termination datetime
declare @Log_in nvarchar(50)
declare @Official_email nvarchar(100)
declare @dob smalldatetime
declare @ID_Category int
DECLARE curm CURSOR FOR 

SELECT ID_employee
      ,User_Name
      ,date_termination
      ,Log_in
	  ,Official_email
	,dob
	,ID_Category
FROM dbo.V_employees

 OPEN curm

FETCH NEXT FROM curm
INTO   @ID_employee
      ,@User_Name
      ,@date_termination
      ,@Log_in
	  ,@Official_email
,@dob
,@ID_Category

WHILE @@FETCH_STATUS = 0
BEGIN

Update dbo.Tbl_Users
set 
 User_Name=@User_Name
,date_termination=@date_termination
,Log_in=@Log_in
,Official_email=@Official_email
,dob=@dob

where ID_employee=@ID_employee

FETCH NEXT FROM curm
INTO   @ID_employee
      ,@User_Name
      ,@date_termination
      ,@Log_in
	  ,@Official_email
	  ,@dob
	,@ID_Category
END
CLOSE curm
DEALLOCATE curm
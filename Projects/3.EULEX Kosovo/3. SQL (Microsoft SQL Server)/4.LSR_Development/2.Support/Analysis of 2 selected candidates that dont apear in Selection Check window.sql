USE [LSR_Development]
GO
/****** Object:  StoredProcedure [dbo].[Proc_SelectionCheck]    Script Date: 12/12/2012 16:31:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[Proc_SelectionCheck] 
 @ID_CFA INT = NULL                               --Andrei, 121212: added @ID_CFA because it is provided from the interface

as
begin
--select for the 2 candidates ( their ID_Status is 27-'Checked in' not 15-'A-Selected')

SELECT     dbo.Tbl_LSR_Candidates.ID_Candidate, dbo.Tbl_LSR_Candidates.First_name , dbo.Tbl_LSR_Candidates.Last_name, dbo.Tbl_LSR_Candidates.DOB, 
                      dbo.Tbl_LSR_L_Status.Status, dbo.Tbl_LSR_Interviews_Candidates.ID_Interview, dbo.Tbl_LSR_Users.FirstName + ' ' + dbo.Tbl_LSR_Users.LastName as 'Panel Memeber', 
                      dbo.Tbl_LSR_Panels.Panel, dbo.Tbl_LSR_Specific_Position.Specific_Position_Reference, dbo.Tbl_LSR_Specific_Position.Specific_Position_Title, 
                      dbo.Tbl_LSR_Check_Status.Check_Status, dbo.Tbl_LSR_Selection_Decision_Status.Selection_Decision_Status, 
                      dbo.Tbl_LSR_Check_Status.ID_Check_Status, dbo.Tbl_LSR_Selection_Decision_Status.ID_Selection_Decision_Status, 
                      dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted, dbo.Tbl_LSR_Specific_Position.ID_Specific_Position, dbo.Tbl_LSR_Interviews_Candidates.ID_status_Interview
FROM         dbo.Tbl_LSR_L_Status INNER JOIN
                      dbo.Tbl_LSR_Panel_Members INNER JOIN
                      dbo.Tbl_LSR_Panels ON dbo.Tbl_LSR_Panel_Members.ID_Panel = dbo.Tbl_LSR_Panels.ID_Panel INNER JOIN
                      dbo.Tbl_LSR_Interviews_Candidates ON 
                      dbo.Tbl_LSR_Panel_Members.ID_Member_Panel = dbo.Tbl_LSR_Interviews_Candidates.ID_Member_Panel ON 
                      dbo.Tbl_LSR_L_Status.ID_Status = dbo.Tbl_LSR_Interviews_Candidates.ID_Status_Interview INNER JOIN
                      dbo.Tbl_LSR_Candidates INNER JOIN
                      dbo.Tbl_LSR_Shortlisted_Candidates ON dbo.Tbl_LSR_Candidates.ID_Candidate = dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate ON 
                      dbo.Tbl_LSR_Interviews_Candidates.ID_Shortlisted = dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted INNER JOIN
                      dbo.Tbl_LSR_CFA ON dbo.Tbl_LSR_Candidates.ID_CFA = dbo.Tbl_LSR_CFA.ID_CFA INNER JOIN
                      dbo.Tbl_LSR_Users ON dbo.Tbl_LSR_Panel_Members.ID_User = dbo.Tbl_LSR_Users.UserID INNER JOIN
                      dbo.Tbl_LSR_Specific_Position ON 
                      dbo.Tbl_LSR_Shortlisted_Candidates.ID_Specific_Position = dbo.Tbl_LSR_Specific_Position.ID_Specific_Position INNER JOIN
                      dbo.Tbl_LSR_Check_Status ON dbo.Tbl_LSR_Interviews_Candidates.ID_Check = dbo.Tbl_LSR_Check_Status.ID_Check_Status INNER JOIN
                      dbo.Tbl_LSR_Selection_Decision_Status ON 
                      dbo.Tbl_LSR_Interviews_Candidates.ID_Selection_Decision_Status = dbo.Tbl_LSR_Selection_Decision_Status.ID_Selection_Decision_Status
WHERE     (dbo.Tbl_LSR_Interviews_Candidates.ID_Status_Interview in (15, 27))--or(dbo.Tbl_LSR_Interviews_Candidates.ID_Status_Interview  in (22, 23, 24, 25, 26)); Andrei, 121212: Changed the condition so it only  includes Status_ID =15 A-selected
           AND Tbl_LSR_Candidates.ID_CFA = 18 and Tbl_LSR_Candidates.ID_Candidate IN (27377,27321)
order by dbo.Tbl_LSR_Specific_Position.Specific_Position_Reference, dbo.Tbl_LSR_Specific_Position.Specific_Position_Title, dbo.Tbl_LSR_Candidates.First_name , dbo.Tbl_LSR_Candidates.Last_name
end



SELECT   * from   dbo.Tbl_LSR_Candidates
where (First_name ='Valton'and Last_name = 'Saiti') or (First_name ='Ermira' and Last_Name = 'Kryeziu')
--ID_Candidate: Ermira = 27377 , Valton = 27321 (ID_CFA = 18, ID_Status = 27)
--ID_Shortlisted: 3923, 3929
--ID_Interview: 3215,3225

select * from Tbl_LSR_Interviews_Candidates 
where ID_Status_Interview =15

select * from Tbl_LSR_Shortlisted_Candidates 
where ID_Shortlisted in (3923,3929) 
--changed ID_Status in Tbl_LSR_Shortlisted_Candidates from 27 to 15

--tables that have ID

select * from dbo.Tbl_LSR_L_Status






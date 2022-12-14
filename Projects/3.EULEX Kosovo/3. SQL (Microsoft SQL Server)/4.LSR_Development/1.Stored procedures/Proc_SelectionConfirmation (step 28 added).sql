USE [LSR_Development]
GO
/****** Object:  StoredProcedure [dbo].[Proc_SelectionConfirmation]    Script Date: 12/06/2012 09:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[Proc_SelectionConfirmation] (@CFA INT = NULL)
AS
BEGIN
	SELECT		 dbo.Tbl_LSR_Candidates.ID_Candidate
				,dbo.Tbl_LSR_Candidates.First_name 
				,dbo.Tbl_LSR_Candidates.Last_name
				,dbo.Tbl_LSR_Candidates.DOB
				,dbo.Tbl_LSR_L_Status.Status
				,dbo.Tbl_LSR_Interviews_Candidates.ID_Interview
				,dbo.Tbl_LSR_Users.FirstName + ' ' + dbo.Tbl_LSR_Users.LastName as 'Panel Memeber'
				,dbo.Tbl_LSR_Panels.Panel
				,dbo.Tbl_LSR_Specific_Position.Specific_Position_Reference
				,dbo.Tbl_LSR_Specific_Position.Specific_Position_Title
				,dbo.Tbl_LSR_Check_Status.Check_Status
				,dbo.Tbl_LSR_Selection_Decision_Status.Selection_Decision_Status
				,dbo.Tbl_LSR_Check_Status.ID_Check_Status
				,dbo.Tbl_LSR_Selection_Decision_Status.ID_Selection_Decision_Status
				,dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted
				,dbo.Tbl_LSR_Panels.ID_Panel
				,dbo.Tbl_LSR_Specific_Position.ID_Specific_Position
				,dbo.Tbl_LSR_Interviews_Candidates.ID_Status_Interview

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
	WHERE       ((dbo.Tbl_LSR_Interviews_Candidates.ID_Status_Interview = 15 AND dbo.Tbl_LSR_Interviews_Candidates.ID_Check = 3) OR (dbo.Tbl_LSR_Interviews_Candidates.ID_Status_Interview IN (13, 14, 12, 17,28)))
				AND (dbo.Tbl_LSR_CFA.ID_Status_CFA = 2) AND Tbl_LSR_CFA.ID_CFA = @CFA
END




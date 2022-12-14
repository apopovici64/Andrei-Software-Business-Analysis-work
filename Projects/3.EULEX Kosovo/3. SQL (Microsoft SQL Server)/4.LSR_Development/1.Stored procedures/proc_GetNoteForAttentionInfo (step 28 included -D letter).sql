USE [LSR_Development]
GO
/****** Object:  StoredProcedure [dbo].[proc_GetNoteForAttentionInfo]    Script Date: 12/04/2012 17:40:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[proc_GetNoteForAttentionInfo]

      (@ID_Specific_Position INT = NULL

      ,@ID_Panel INT = NULL)

AS

SELECT      Tbl_LSR_Candidates.First_name + ' ' + Tbl_LSR_Candidates.Last_name AS Candidate

            ,CASE WHEN Tbl_LSR_Interviews_Candidates.ID_Status_Interview = 15 THEN 'A'

                    WHEN Tbl_LSR_Interviews_Candidates.ID_Status_Interview = 13 THEN 'B'

                    WHEN Tbl_LSR_Interviews_Candidates.ID_Status_Interview = 14 THEN 'C'

                    WHEN Tbl_LSR_Interviews_Candidates.ID_Status_Interview IN (12, 28) THEN 'D' --Andrei 04122012: Added ID_Status = 28 under the letter 'D' as well

                    WHEN Tbl_LSR_Interviews_Candidates.ID_Status_Interview = 18 THEN 'E'

                    WHEN Tbl_LSR_Interviews_Candidates.ID_Status_Interview = 17 THEN 'F'

WHEN Tbl_LSR_Interviews_Candidates.ID_Status_Interview = 23 THEN 'Negatively checked'
WHEN Tbl_LSR_Interviews_Candidates.ID_Status_Interview = 24 THEN 'Drop Out'
WHEN Tbl_LSR_Interviews_Candidates.ID_Status_Interview = 25 THEN 'Disqualified'
WHEN Tbl_LSR_Interviews_Candidates.ID_Status_Interview = 26 THEN 'Offer Rejected'
--WHEN Tbl_LSR_Interviews_Candidates.ID_Status_Interview = 27 THEN 'Checked in'
             END AS STATUS

FROM  Tbl_LSR_Candidates LEFT OUTER JOIN

            Tbl_LSR_Shortlisted_Candidates ON Tbl_LSR_Candidates.ID_Candidate = Tbl_LSR_Shortlisted_Candidates.ID_candidate LEFT OUTER JOIN

            Tbl_LSR_Interviews_Candidates ON Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted = Tbl_LSR_Interviews_Candidates.ID_Shortlisted

WHERE Tbl_LSR_Shortlisted_Candidates.ID_Specific_Position = @ID_Specific_Position

AND         Tbl_LSR_Interviews_Candidates.ID_Status_Interview IN (12, 13, 14, 15, 17, 18,23,24,25,26, 28)--,27)

AND         Tbl_LSR_Shortlisted_Candidates.ID_Member_Panel IN (SELECT ID_Member_Panel FROM Tbl_LSR_Panel_Members WHERE ID_Panel = @ID_Panel)

 

 

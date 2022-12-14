USE [LSR_Development]
GO
/****** Object:  StoredProcedure [dbo].[proc_GetSelectionStatusReport_CFA]    Script Date: 12/04/2012 10:04:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[proc_GetSelectionStatusReport_CFA]
	(@ID_CFA INT = NULL)
AS

SELECT	(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (3, 4, 5, 18, 19, 21)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) ) AS TotalInterview, 
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (3,19, 21)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) ) AS ScheduledInterview, 
		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE (id_STATUS in (3,19,21)) AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS ScheduledInterview, 
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (4)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) )AS InvitedCandidates,
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (5)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) )AS ConfirmedInterviews,
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (18)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) )AS  NotReachable,
		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE id_STATUS = 4 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS InvitedCandidates,
		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE id_STATUS = 5 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS ConfirmedInterviews,
		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE id_STATUS = 18 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS NotReachable,

		--(SELECT	 Count(*) FROM Tbl_LSR_Interviews_Candidates WHERE ID_Status_Interview in (12,13,14,15,16,23,24,25,26,27)) AS TotalInterviewsHeld, /*in */
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN  (12,13,14,15,16,23,24,25,26,27)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) )AS  TotalInterviewsHeld,		

--(SELECT COUNT (*) FROM Tbl_LSR_Interviews_Candidates
--				INNER JOIN Tbl_LSR_Shortlisted_Candidates
--				ON		Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted = Tbl_LSR_Interviews_Candidates.ID_Shortlisted
--				INNER JOIN	Tbl_LSR_Candidates
--				ON		Tbl_LSR_Candidates.ID_Candidate = Tbl_LSR_Shortlisted_Candidates.ID_candidate 
--				WHERE	ID_Status_Interview in (12,13,14,15,16,23,24,25,26,27)
--				AND		Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalInterviewsHeld,
		 (SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (15,27)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) )AS TotalSlected,
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (13)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) )AS TotalSecondChoice,
		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE ((id_STATUS = 15 ) or (id_STATUS = 27 )) AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalSlected,
		--(SELECT	 Count(*) FROM Tbl_LSR_Interviews_Candidates WHERE ID_Status_Interview = 13) AS TotalSecondChoice,
--		(SELECT	Count(*) FROM Tbl_LSR_Interviews_Candidates 
--				INNER JOIN	Tbl_LSR_Shortlisted_Candidates
--				ON		Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted = Tbl_LSR_Interviews_Candidates.ID_Shortlisted
--				INNER JOIN	Tbl_LSR_Candidates
--				ON		Tbl_LSR_Candidates.ID_Candidate = Tbl_LSR_Shortlisted_Candidates.ID_candidate 	
--
--				WHERE	ID_Status_Interview = 13 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalSecondChoice,
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (13)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) )AS TotalSecondChoice,
		--(SELECT	 Count(*) FROM Tbl_LSR_Interviews_Candidates WHERE ID_Status_Interview = 14) AS TotalNotSelectedButPotential,
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (14)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) )AS TotalNotSelectedButPotential,
--(SELECT	Count(*) FROM Tbl_LSR_Interviews_Candidates 
--				INNER JOIN	Tbl_LSR_Shortlisted_Candidates
--				ON		Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted = Tbl_LSR_Interviews_Candidates.ID_Shortlisted
--				INNER JOIN	Tbl_LSR_Candidates
--				ON		Tbl_LSR_Candidates.ID_Candidate = Tbl_LSR_Shortlisted_Candidates.ID_candidate 
--	
--				WHERE	ID_Status_Interview = 14 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalNotSelectedButPotential,

		--(SELECT	 Count(*) FROM Tbl_LSR_Interviews_Candidates WHERE ID_Status_Interview = 12, 28) AS TotalNotSelected,
	(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (12, 28)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) )AS  TotalNotSelected,	

		--(SELECT	 Count(*) FROM Tbl_LSR_Interviews_Candidates WHERE ID_Status_Interview = 17) AS TotalDidNotShowUP,
(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (17)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) )AS  TotalDidNotShowUP,	

--(SELECT	Count(*) FROM Tbl_LSR_Interviews_Candidates 
--				INNER JOIN	Tbl_LSR_Shortlisted_Candidates
--				ON		Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted = Tbl_LSR_Interviews_Candidates.ID_Shortlisted
--				INNER JOIN	Tbl_LSR_Candidates
--				ON		Tbl_LSR_Candidates.ID_Candidate = Tbl_LSR_Shortlisted_Candidates.ID_candidate 
--				
--				WHERE ID_Status_Interview = 17 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalDidNotShowUP,

		(SELECT  SUM(Remaining) FROM Tbl_LSR_Specific_Position 
				 WHERE (Specific_Position_Reference NOT IN 
					   (SELECT Specific_Position_Reference FROM Tbl_LSR_Specific_Position AS Tbl_LSR_Specific_Position_1 WHERE (Specific_Position_Reference LIKE 'eupt%'))))AS TotalRemainingVacancies ,
		
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (15,27)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) and ( ID_Gender = 2) )AS  TotalSelectedMale,	
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (15,27)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) and ( ID_Gender = 3) )AS  TotalSelectedFemale,
		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE ((id_STATUS = 15) or (id_STATUS = 27 )) AND ID_Gender = 2 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalSelectedMale,
		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE ((id_STATUS = 15) or (id_STATUS = 27 )) AND ID_Gender = 3 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalSelectedFemale,
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (15,27)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) and ( ID_Community = 2) )AS  TotalSelectedAlbanian,
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (15,27)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) and ( ID_Community = 3) )AS TotalSelectedSerbian,
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (15,27)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) and ( ID_Community = 4) )AS TotalSelectedBosnian,
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (15,27)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) and ( ID_Community = 5) )AS TotalSelectedTurkish,
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (15,27)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) and ( ID_Community = 6) )AS TotalSelectedRoma,
		(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (15,27)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) and ( ID_Community = 7) )AS TotalSelectedGoran,
(SELECT COUNT(dbo.Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted) FROM dbo.Tbl_LSR_Shortlisted_Candidates LEFT OUTER JOIN
                      dbo.Tbl_LSR_Candidates ON dbo.Tbl_LSR_Shortlisted_Candidates.ID_candidate = dbo.Tbl_LSR_Candidates.ID_Candidate
		 WHERE   (dbo.Tbl_LSR_Shortlisted_Candidates.ID_Status IN (15,27)) AND (dbo.Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AND 
                      (dbo.Tbl_LSR_Shortlisted_Candidates.Active = 1) and ( ID_Community = 8) )AS TotalSelectedOther

		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE ((id_STATUS = 15) or (id_STATUS = 27 )) AND ID_Community = 2 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalSelectedAlbanian,
		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE ((id_STATUS = 15) or (id_STATUS = 27 )) AND ID_Community = 3 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalSelectedSerbian,
		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE ((id_STATUS = 15) or (id_STATUS = 27 )) AND ID_Community = 4 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalSelectedBosnian,
		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE ((id_STATUS = 15) or (id_STATUS = 27 )) AND ID_Community = 5 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalSelectedTurkish,
		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE ((id_STATUS = 15) or (id_STATUS = 27 )) AND ID_Community = 6 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalSelectedRoma,
		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE ((id_STATUS = 15) or (id_STATUS = 27 )) AND ID_Community = 7 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalSelectedGoran,
		--(SELECT	 Count(*) FROM Tbl_LSR_Candidates WHERE ((id_STATUS = 15) or (id_STATUS = 27 )) AND ID_Community = 8 AND Tbl_LSR_Candidates.ID_CFA = @ID_CFA) AS TotalSelectedOther
















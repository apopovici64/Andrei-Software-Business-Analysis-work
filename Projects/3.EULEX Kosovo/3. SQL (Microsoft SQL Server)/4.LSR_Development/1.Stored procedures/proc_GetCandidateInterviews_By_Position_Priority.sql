USE [LSR_Development]
GO
/****** Object:  StoredProcedure [dbo].[proc_GetCandidateInterviews_By_Position_Priority]    Script Date: 12/11/2012 16:39:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[proc_GetCandidateInterviews_By_Position_Priority]
	(@Priority INT = NULL
	,@ID_Specific_Position INT = NULL
	,@ID_Panel INT = NULL
	,@Status INT = NULL)

AS
DECLARE @Criteria VarChar (2000)
DECLARE	@SqlString NVarChar (3800)
DECLARE	@ParmeterDefinition NVarChar (500)

SET 	@Criteria = ''
SET 	@SqlString = '
SELECT DISTINCT  Tbl_LSR_Candidates.ID_Candidate
		,Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted
		,Tbl_LSR_Shortlisted_Candidates.ID_Specific_Position
		,Tbl_LSR_Shortlisted_Candidates.Priority
		,Tbl_LSR_Interviews_Candidates.ID_Interview
		,Tbl_LSR_Candidates.First_name
		,Tbl_LSR_Candidates.Last_name
		,Tbl_LSR_Candidates.DOB
		,Tbl_LSR_Candidates.City_birth
		,Tbl_LSR_Candidates.Resident_kosovo
		
		,Tbl_LSR_Interviews_Candidates.Place
		,Convert(Nvarchar(10), Tbl_LSR_Interviews_Candidates.DateTimeScheduledInterview, 103)
		,Convert(Nvarchar(5), Tbl_LSR_Interviews_Candidates.DateTimeScheduledInterview, 114)
		,Tbl_LSR_L_Status.Status
		
		,Tbl_LSR_Candidates.ID_Status
		,Tbl_LSR_Interviews_Candidates.ID_Level_General
		,Tbl_LSR_Interviews_Candidates.ID_Level_Relevant_Education
		,Tbl_LSR_Interviews_Candidates.ID_Level_RelevPrevProf_Experience
		,Tbl_LSR_Interviews_Candidates.ID_Level_TechKnowNeedPosition
		,Tbl_LSR_Interviews_Candidates.ID_Level_LangSkills
		,Tbl_LSR_Interviews_Candidates.ID_Level_CandidateMeetsTheRequirements
		,Tbl_LSR_Interview_Level.Interview_Level AS [GeneralPresentation]
		,Tbl_LSR_Interview_Level_1.Interview_Level AS [RelevantEducation]
		,Tbl_LSR_Interview_Level_2.Interview_Level AS [RelevPrevProf]
		,Tbl_LSR_Interview_Level_3.Interview_Level AS [TechKnowNeedPosition]
        ,Tbl_LSR_Interview_Level_4.Interview_Level AS [LangSkills]
        ,Tbl_LSR_L_Candidate_Requirements.CandidateMeetsRequirements AS [CandidateMeetsTheRequirements]
		,Tbl_LSR_Interviews_Candidates.Other_Related
FROM	Tbl_LSR_Candidates LEFT OUTER JOIN
	Tbl_LSR_Shortlisted_Candidates ON Tbl_LSR_Candidates.ID_Candidate = Tbl_LSR_Shortlisted_Candidates.ID_candidate LEFT OUTER JOIN
	Tbl_LSR_Panel_Members ON 
	Tbl_LSR_Shortlisted_Candidates.ID_Member_Panel = Tbl_LSR_Panel_Members.ID_Member_Panel LEFT OUTER JOIN
	Tbl_LSR_Interviews_Candidates ON 
	Tbl_LSR_Shortlisted_Candidates.ID_Shortlisted = Tbl_LSR_Interviews_Candidates.ID_Shortlisted LEFT OUTER JOIN
        Tbl_LSR_Interview_Level ON 
        Tbl_LSR_Interviews_Candidates.ID_Level_General = Tbl_LSR_Interview_Level.ID_Interview_Level LEFT OUTER JOIN
        Tbl_LSR_L_Status ON Tbl_LSR_Candidates.ID_Status = Tbl_LSR_L_Status.ID_Status LEFT OUTER JOIN
        Tbl_LSR_Interview_Level Tbl_LSR_Interview_Level_1 ON 
        Tbl_LSR_Interviews_Candidates.ID_Level_Relevant_Education = Tbl_LSR_Interview_Level_1.ID_Interview_Level LEFT OUTER JOIN
        Tbl_LSR_Interview_Level Tbl_LSR_Interview_Level_2 ON 
        Tbl_LSR_Interviews_Candidates.ID_Level_RelevPrevProf_Experience = Tbl_LSR_Interview_Level_2.ID_Interview_Level LEFT OUTER JOIN
        Tbl_LSR_Interview_Level Tbl_LSR_Interview_Level_3 ON 
        Tbl_LSR_Interviews_Candidates.ID_Level_TechKnowNeedPosition = Tbl_LSR_Interview_Level_3.ID_Interview_Level LEFT OUTER JOIN
        Tbl_LSR_Interview_Level Tbl_LSR_Interview_Level_4 ON 
        Tbl_LSR_Interviews_Candidates.ID_Level_LangSkills = Tbl_LSR_Interview_Level_4.ID_Interview_Level LEFT OUTER JOIN
	Tbl_LSR_L_Candidate_Requirements ON 
        Tbl_LSR_Interviews_Candidates.ID_Level_CandidateMeetsTheRequirements = Tbl_LSR_L_Candidate_Requirements.ID_CandidateMeetsRequirements
'
	
IF @ID_Specific_Position IS NOT NULL
	SELECT @Criteria = 'Tbl_LSR_Shortlisted_Candidates.ID_Specific_Position = @ID_Specific_Position_IN'
IF @Priority IS NOT NULL
	BEGIN
	IF @Criteria <> ''
		SELECT @Criteria = @Criteria + ' AND ' + 'Tbl_LSR_Shortlisted_Candidates.Priority = @Priority_IN'
	ELSE
		SELECT @Criteria = 'Tbl_LSR_Shortlisted_Candidates.Priority = @Priority_IN'
	END
IF @ID_Panel IS NOT NULL
	BEGIN
	IF @Criteria <> ''
		SELECT @Criteria = @Criteria + ' AND ' + 'Tbl_LSR_Shortlisted_Candidates.ID_Member_Panel IN (SELECT ID_Member_Panel FROM Tbl_LSR_Panel_Members WHERE ID_Panel = @ID_Panel_IN)'
	ELSE
		SELECT @Criteria = 'Tbl_LSR_Shortlisted_Candidates.ID_Member_Panel IN (SELECT ID_Member_Panel FROM Tbl_LSR_Panel_Members WHERE ID_Panel = @ID_Panel_IN)'
	END

IF @Status IS NOT NULL
	BEGIN
	IF @Status = 1 --interview scheduling
		BEGIN
			IF @Criteria <> ''  
				SELECT @Criteria = @Criteria + ' AND ' + 'Tbl_LSR_Interviews_Candidates.ID_Status in (2,3,4,5,16)'
			ELSE
				SELECT @Criteria = 'Tbl_LSR_Interviews_Candidates.ID_Status in (2,3,4,5,16)' 
		END
	ELSE IF @Status = 2 --interview evaluation
		BEGIN
			IF @Criteria <> ''  
				SELECT @Criteria = @Criteria + ' AND ' + 'Tbl_LSR_Interviews_Candidates.ID_Status_Interview not IN (1,2,3)'
			ELSE
				SELECT @Criteria = 'Tbl_LSR_Interviews_Candidates.ID_Status_Interview not IN (1,2,3)' 
		END
	ELSE IF @Status = 3 --selection
		BEGIN
			IF @Criteria <> ''  
				SELECT @Criteria = @Criteria + ' AND ' + 'Tbl_LSR_Interviews_Candidates.ID_Status_Interview IN (12,13, 14, 15, 16)' 
			ELSE
				SELECT @Criteria = 'Tbl_LSR_Interviews_Candidates.ID_Status_Interview IN (12,13, 14, 15, 16)' 
		END
	END


IF @Criteria <>''
	SELECT @Criteria = @Criteria + ' AND ' + 'Tbl_LSR_Shortlisted_Candidates.Active = 1'
ELSE
	SELECT @Criteria = 'Tbl_LSR_Shortlisted_Candidates.Active = 1'

IF @Criteria <> ''  
	SELECT @Criteria = @Criteria + ' AND ' + 'Tbl_LSR_Shortlisted_Candidates.ID_Status = 2'
ELSE
	SELECT @Criteria = 'Tbl_LSR_Shortlisted_Candidates.ID_Status = 2' 


IF @Criteria <>''
	SELECT @Criteria = ' WHERE ' + @Criteria

	SELECT @SQLString = @SQLString + @Criteria

SET @ParmeterDefinition = N'@Priority_IN INT = NULL
	,@ID_Specific_Position_IN INT = NULL
	,@ID_Panel_IN INT = NULL
	,@Status_IN INT = NULL'


EXEC SP_EXECUTESQL
 @SQLString
,@ParmeterDefinition

,@Priority_IN = @Priority
,@ID_Specific_Position_IN = @ID_Specific_Position
,@ID_Panel_IN = @ID_Panel
,@Status_IN = @Status


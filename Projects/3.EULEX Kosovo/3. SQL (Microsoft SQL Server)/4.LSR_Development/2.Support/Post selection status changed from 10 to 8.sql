SELECT     TOP (100) PERCENT dbo.Tbl_LSR_Candidates.ID_Candidate, dbo.Tbl_LSR_Specific_Position.Specific_Position_Reference AS 'Ref.', 
                      dbo.Tbl_LSR_Candidates.ID_Number, dbo.Tbl_LSR_Candidates.DOB, dbo.Tbl_LSR_Candidates.Contact_address, 
                      dbo.Tbl_LSR_Specific_Position.Number_Vacancies AS 'No. V', 
                      dbo.Tbl_LSR_Specific_Position.Number_Vacancies - dbo.Tbl_LSR_Specific_Position.Remaining AS 'Sel.', dbo.Tbl_LSR_Specific_Position.N_CFA_Selected, 
                      dbo.Tbl_LSR_Candidates.Last_name AS 'Last name', dbo.Tbl_LSR_Candidates.First_name AS 'First name', 
                      dbo.Tbl_LSR_Specific_Position.Specific_Position_Title AS 'Position title', dbo.Tbl_LSR_L_Status_Post_Selection.Status_Post_Selection AS 'Status', 
                      dbo.Tbl_LSR_Selected_Candidates.Date_Start AS 'Date Start', dbo.Tbl_LSR_Selected_Candidates.Date_Checkin AS 'Date Checkin', 
                      dbo.Tbl_LSR_Selected_Candidates.Date_End AS 'Date end', dbo.Tbl_LSR_Selected_Candidates.Date_Print, dbo.Tbl_LSR_Selected_Candidates.Pending, 
                      dbo.Tbl_LSR_Candidates.E_mail1, dbo.Tbl_LSR_Candidates.E_mail2, dbo.Tbl_LSR_Specific_Position.ID_Specific_Position, 
                      dbo.Tbl_LSR_L_Status_Post_Selection.ID_Status_Post_Selection, dbo.Tbl_LSR_Selected_Candidates.Reason_Disqualified, 
                      dbo.Tbl_LSR_Selected_Candidates.ID_Salary, dbo.Tbl_LSR_Candidates.Land_line, dbo.Tbl_LSR_Candidates.Mobile, dbo.Tbl_LSR_Candidates.E_mail1 AS Expr1, 
                      dbo.Tbl_LSR_Candidates.E_mail2 AS Expr2
FROM         dbo.Tbl_LSR_Candidates INNER JOIN
                      dbo.Tbl_LSR_L_Status_Post_Selection INNER JOIN
                      dbo.Tbl_LSR_Selected_Candidates ON 
                      dbo.Tbl_LSR_L_Status_Post_Selection.ID_Status_Post_Selection = dbo.Tbl_LSR_Selected_Candidates.ID_Status_Post_Selection ON 
                      dbo.Tbl_LSR_Candidates.ID_Candidate = dbo.Tbl_LSR_Selected_Candidates.ID_Candidate RIGHT OUTER JOIN
                      dbo.Tbl_LSR_Specific_Position ON dbo.Tbl_LSR_Selected_Candidates.ID_Specific_Position = dbo.Tbl_LSR_Specific_Position.ID_Specific_Position
WHERE     (dbo.Tbl_LSR_Specific_Position.Specific_Position_Reference = N'EKLS 10469/2') OR
                      (dbo.Tbl_LSR_Specific_Position.Specific_Position_Reference = N'EKLS 10514/1') OR
                      (dbo.Tbl_LSR_Specific_Position.Specific_Position_Reference = N'EKLS 10542/2') OR
                      (dbo.Tbl_LSR_Specific_Position.Specific_Position_Reference = N'EKLS 10580') OR
                      (dbo.Tbl_LSR_Specific_Position.Specific_Position_Reference = N'EKLS 10594')
ORDER BY 'Ref.', 'Last name', 'First name'

begin tran
update Tbl_LSR_Selected_Candidates set ID_Status_Post_selection = 8 
where ID_Candidate in (27328,27237,27767,27638,27279)
--rollback tran
commit

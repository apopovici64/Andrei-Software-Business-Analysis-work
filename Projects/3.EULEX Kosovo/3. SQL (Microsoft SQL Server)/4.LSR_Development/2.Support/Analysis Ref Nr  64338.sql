select * from Tbl_LSR_Candidates where ID_Candidate = 26928

select name from sys.tables where object_id in (select object_id from sys.columns where name = 'ID_Candidate')

select * from Tbl_LSR_Selected_Candidates where ID_Candidate = 26928

select name from sys.tables where object_id in (select object_id from sys.columns where name = 'ID_Specific_Position')

select * from Tbl_LSR_Specific_Position where ID_Specific_Position = 4668

select * from Tbl_LSR_Specific_Position where Specific_Position_Reference = 'EKLS 10576/2'

--Calculus
--Tbl_LSR_Specific_Position.Number_Vacancies = 1 (A)
--Tbl_LSR_Specific_Position.Remaining = ((([number_vacancies]-[N_deployed])-[N_Not_Deployed])-[N_CFA_Selected]) = ((1 -0 - 0) - 2)= -1  (B)
--A-B = 'Sel'= 1-(-1) = 2
--Why is N_CFA_Selected = 2?
select name from sys.tables where object_id in (select object_id from sys.columns where name = 'N_CFA_Selected')
--N
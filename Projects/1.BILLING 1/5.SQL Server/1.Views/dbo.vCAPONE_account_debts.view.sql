
CREATE VIEW [dbo].[vCAPONE_account_debts]
AS

-- PF
-- La inceput toate facturile (6 luni, dar nu sunt 6 luni cu PF)
-- Apoi doar facturile restante
SELECT
       '900'                                         AS COMPANY_ID
	,  'B_' + convert(VARCHAR,U.facpf_id)            as ACCOUNT_DEBT_ID 
	,  1                                             as DEBT_SUBCLASS_ID
	,  'PF' + convert(varchar, U.flt_cod_hois)      AS CLIENT_ID
	,  dbo.fn_DateLikeCapone(U.facpf_data_facturare) as DEBT_DATE
	,  ''                                            as LOCATION_ID
	,  U.facpf_Adresa                                as ADDRESS
	,  convert(varchar, U.facpf_total,0)             as AMOUNT
	,  convert(varchar, U.facpf_rest_de_plata)       as SOLD
	,  1                                             as EXCHANGE_RATE
	,  U.INVOICE_TYPE                                as INVOICE_TYPE
	,  'RON'                                         as CURRENCY
	,  convert(VARCHAR,U.facpf_numar)                AS Account_debt_number
    ,  account_ID                                    as ACCOUNT_ID
    ,  dbo.fn_DateLikeCapone(U.facpf_data_scadentei) AS DEBT_DUEDATE
FROM 
    (
        -- Toate neplatite
        SELECT facpf_id , FL.flt_cod_hois, facpf_data_facturare , facpf_Adresa, facpf_total , 
               facpf_rest_de_plata, INVOICE_TYPE , facpf_numar , cap.account_ID , facpf_data_scadentei
        FROM tbl_pf_facturi F
        INNER JOIN cap_account_id cap ON F.flt_ID = cap.flt_ID
        INNER JOIN tbl_flote FL 
        	ON F.flt_id = FL.flt_id 
           AND FL.cli_id = FL.cli_id
        LEFT JOIN cap_acc_invoice_matrix M on M.CONTRACT_TYPE = 'FG_PF'
        WHERE 1=1
          AND FL.Cli_id = 32767
          AND cap.CLIENT_TYPE  = 'PF'
          AND F.facpf_rest_de_plata >= 0.01 and f.facpf_validata_lycos=1
    UNION
        -- Toate platite din ultimele 8 luni
        SELECT facpf_id , FL.flt_cod_hois, facpf_data_facturare , facpf_Adresa, facpf_total , 
               facpf_rest_de_plata, INVOICE_TYPE , facpf_numar , cap.account_ID , facpf_data_scadentei
        FROM tbl_pf_facturi F
        INNER JOIN cap_account_id cap ON F.flt_ID = cap.flt_ID
        INNER JOIN tbl_flote FL 
        	ON F.flt_id = FL.flt_id 
           AND FL.cli_id = FL.cli_id
        LEFT JOIN cap_acc_invoice_matrix M on M.CONTRACT_TYPE = 'FG_PF'
        WHERE 1=1
          AND FL.Cli_id = 32767
          AND cap.CLIENT_TYPE  = 'PF'
          AND F.facpf_rest_de_plata < 0.01
          AND datediff(mm,getdate(), F.facpf_data_facturare) < 8 and f.facpf_validata_lycos=1
    ) u 

UNION 

SELECT
       '900'                                         AS COMPANY_ID
	,  'S_' + convert(VARCHAR,U.fac_id)              as ACCOUNT_DEBT_ID 
	,  1                                             as DEBT_SUBCLASS_ID
	,  'SME' + convert(varchar, U.cli_id)    AS CLIENT_ID
	,  dbo.fn_DateLikeCapone(U.fac_data_facturare)   as DEBT_DATE
	,  ''                                            as LOCATION_ID
	,  U.fac_Adresa_facturare                        as ADDRESS
	,  convert(varchar, U.fac_total,0)               as AMOUNT
	,  convert(varchar, U.facsme_rest_de_plata)      as SOLD
	,  1                                             as EXCHANGE_RATE
	,  U.INVOICE_TYPE                                as INVOICE_TYPE
	,  'RON'                                         as CURRENCY
	,  convert(VARCHAR,U.fac_numar)                  AS Account_debt_number
    ,  account_ID                                    as ACCOUNT_ID
    ,  dbo.fn_DateLikeCapone(U.fac_data_scadentei)   AS DEBT_DUEDATE
FROM 
(
    -- Toate neplatite
    SELECT     fac_id ,                CLI.cli_id,        fac_data_facturare , 
               fac_Adresa_facturare,   fac_total ,                facsme_rest_de_plata, 
               INVOICE_TYPE ,          fac_numar ,                cap.account_ID ,
               fac_data_scadentei
    FROM       tbl_facturi F
    INNER JOIN cap_account_id cap 
            ON F.cli_id = cap.cli_id
           AND cap.CLIENT_TYPE  = 'SME'
    INNER JOIN tbl_clienti CLI 
    	    ON F.cli_id = CLI.cli_id 
    LEFT JOIN  cap_acc_invoice_matrix M on M.CONTRACT_TYPE = 'FG_SME'
    WHERE      1=1
           AND F.Cli_id <> 32767
           AND cap.CLIENT_TYPE  = 'SME'
           AND F.facsme_rest_de_plata >= 0.01 and f.facsme_validata_lycos=1

UNION
    -- Toate platite din ultimele 8 luni
    SELECT     fac_id ,                CLI.cli_id,        fac_data_facturare , 
               fac_Adresa_facturare,   fac_total ,                facsme_rest_de_plata, 
               INVOICE_TYPE ,          fac_numar ,                cap.account_ID ,
               fac_data_scadentei
    FROM       tbl_facturi F
    INNER JOIN cap_account_id cap 
            ON F.cli_id = cap.cli_id
           AND cap.CLIENT_TYPE  = 'SME'
    INNER JOIN tbl_clienti CLI 
    	ON F.cli_id = CLI.cli_id 
    LEFT JOIN cap_acc_invoice_matrix M on M.CONTRACT_TYPE = 'FG_SME'
    WHERE 1=1
      AND F.Cli_id <> 32767
      AND cap.CLIENT_TYPE  = 'SME'
      AND F.facsme_rest_de_plata < 0.01
      AND datediff(mm,getdate(), F.fac_data_facturare) < 8 and f.facsme_validata_lycos=1
) u 





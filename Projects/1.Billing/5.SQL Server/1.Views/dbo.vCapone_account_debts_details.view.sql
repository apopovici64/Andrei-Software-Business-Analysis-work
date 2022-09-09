

CREATE VIEW dbo.vCapone_account_debts_details
AS

-- no need for group by!
SELECT 
        900                                      AS COMPANY_ID
		,	 U.faclinpf_id                       as ACCOUNT_DEBT_DETAIL_ID
		,	 'B_' + convert(VARCHAR,U.facpf_id)  as ACCOUNT_DEBT_ID
		,    U.PRODUCT_ID                        as PRODUCT_ID
		,    convert(varchar, U.faclinpf_TOTAL)  as AMOUNT
		, 'RON' as CURRENCY
		,    convert(varchar, U.faclinpf_Cantitatea) as Quantity
		,convert(varchar, U.faclinpf_UM) as UOM_Code
FROM 
    (
        -- Toate neplatite
        SELECT       FL.faclinpf_id , FL.facpf_id,  CP.PRODUCT_ID  , FL.faclinpf_TOTAL,FL.faclinpf_Cantitatea,FL.faclinpf_UM
        FROM         tbl_pf_facturi_linie FL
        INNER join   tbl_pf_facturi F
        		on   FL.facpf_id = F.facpf_id
        INNER JOIN   cap_products CP
        			 on FL.prod_id = cp.prod_id 
        WHERE		 1=1
          AND F.Cli_id = 32767
          AND F.facpf_rest_de_plata >= 0.01 and f.facpf_validata_lycos=1
    UNION
        -- Toate platite din ultimele 8 luni
        SELECT       FL.faclinpf_id , FL.facpf_id,  CP.PRODUCT_ID  , FL.faclinpf_TOTAL,FL.faclinpf_Cantitatea,FL.faclinpf_UM
        FROM         tbl_pf_facturi_linie FL
        INNER join   tbl_pf_facturi F
        		on   FL.facpf_id = F.facpf_id
        INNER JOIN   cap_products CP
        			 on FL.prod_id = cp.prod_id 
        WHERE		 1=1
          AND F.Cli_id = 32767
          AND F.facpf_rest_de_plata < 0.01
          AND datediff(mm,getdate(), F.facpf_data_facturare) < 8 and f.facpf_validata_lycos=1
    ) U

UNION
-- SME
SELECT 
        900                                    AS COMPANY_ID
		,	 U.faclin_id                       as ACCOUNT_DEBT_DETAIL_ID
		,	 'S_' + convert(VARCHAR,U.fac_id)  as ACCOUNT_DEBT_ID
		,    U.PRODUCT_ID                      as PRODUCT_ID
		,    convert(varchar, U.faclin_TOTAL)  as AMOUNT
, 'RON' as CURRENCY
		,    convert(varchar, U.faclin_Cantitatea) as Quantity
		,convert(varchar, U.faclinsme_UM) as UOM_Code
FROM 
(
    -- Toate neplatite
    SELECT     
               FL.Faclin_id,                F.fac_id ,      
               CP.PRODUCT_ID,               FL.faclin_TOTAL, FL.faclin_Cantitatea ,FL.faclinsme_UM         
    FROM       tbl_facturi F
    INNER JOIN tbl_facturi_linie FL
            on F.fac_id = FL.fac_id 
    INNER JOIN cap_account_id cap 
            ON F.cli_id = cap.cli_id
           AND cap.CLIENT_TYPE  = 'SME'
    INNER JOIN cap_products CP
    		on FL.prod_id = cp.prod_id 
    WHERE      1=1
           AND F.Cli_id <> 32767
           AND cap.CLIENT_TYPE  = 'SME'
           AND F.facsme_rest_de_plata >= 0.01 and f.facsme_validata_lycos=1

UNION
    -- Toate platite din ultimele 8 luni

    SELECT     
               FL.Faclin_id,                F.fac_id ,      
               CP.PRODUCT_ID,               FL.faclin_TOTAL , FL.faclin_Cantitatea ,FL.faclinsme_UM          
    FROM       tbl_facturi F
    INNER JOIN tbl_facturi_linie FL
            on F.fac_id = FL.fac_id 
    INNER JOIN cap_account_id cap 
            ON F.cli_id = cap.cli_id
           AND cap.CLIENT_TYPE  = 'SME'
    INNER JOIN cap_products CP
    		on FL.prod_id = cp.prod_id 
    WHERE      1=1
           AND F.Cli_id <> 32767
           AND cap.CLIENT_TYPE  = 'SME'
           AND F.facsme_rest_de_plata < 0.01
           AND datediff(mm,getdate(), F.fac_data_facturare) < 8 and f.facsme_validata_lycos=1
) U


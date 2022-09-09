

CREATE VIEW [dbo].[vCAPONE_client_contracts]
AS

-- PF
SELECT    contract_ID                                                    as CONTRACT_ID,
          A.account_id                                                   as ACCOUNT_ID,
          convert(varchar,A.account_id)                                  as CONTRACT_NO,
          isnull(convert(varchar,F.flt_pf_Data_Start_Facturare,103), '') as START_DATE,
          ''                                                             as END_DATE,
          convert(varchar,F.flt_Limita_Credit )                                           as CREDIT_LIMIT,
          convert(varchar,F.flt_pf_Termen_Plata )                                          as PAYMENT_TERM,
          'Lunar'                                                        as BILLING_TYPE,
          ''                                                             as WARNING_LIMIT,
          convert(varchar,F.flt_Procent_Penalitate )                                      as FLT_PENALTY_PERCENT,
          convert(integer ,F.flt_pf_Discount_Tip)                        as FLT_DISCOUNT_TYPE,
          ''                                                             as FLT_ASSEMBLING_COST,
          'RON'                                                          as CURRENCY_ID_ASSEMBLING,
          ''                                                             as FLT_CARD_COST,
          ''                                                             as CURRENCY_ID_CARD,
          ''                                                             as FLT_RING_RENT,
          ''                                                             as CURRENCY_ID_RENT,
          ''                                                             as FLT_FG_RENT,
          ''                                                             as CURRENCY_ID_FG,
          convert(varchar, F.flt_pf_Factura_Detailata)                   as PF_DETALIED_INVOICE,
          m01.Moneda_iso                                                 as CURRENCY_DETALIED_INVOICE,
          convert(varchar, F.flt_pf_Comision_Tranzactii)                 as PF_TRANSACTION_COMMISSION,
          convert(varchar, F.flt_pf_Taxa_Emitere_Card)                   as PF_CARD_EMISION_FEE,
          m02.Moneda_iso                                                 as CURRENCY_CARD_EMISION,
          convert(varchar, F.flt_pf_Taxa_ReEmitere_Card)                 as PF_CARD_REEMISION_FEE,
          m03.Moneda_iso                                                 as CURRENCY_CARD_REEMISION,
          convert(varchar, F.flt_pf_Taxa_ReEmitere_Pin)                  as PF_PIN_PRINTING_FEE,
          m04.Moneda_iso                                                 as CURRENCY_PIN_PRINTING,
          convert(varchar, F.flt_pf_Taxa_Intretinere_Anuala )            as PF_ANUAL_MAINTENANCE_FEE,
          m05.Moneda_iso                                                 as CURRENCY_MAINTENANCE_FEE,
          convert(varchar, F.flt_pf_Taxa_Emitere_Factura_Suplimentara)   as PF_INVOICE_REEMISION_FEE,
          m06.Moneda_iso                                                 as CURRENCY_REEMISION_FEE,
          convert(varchar, F.flt_pf_Taxa_Emitere_Factura_Detaliata)      as PF_DETALIED_INVOICE_FEE,
          ''                                                             as SALES_REPRESENTATIVE,
          ''                                                             as GUARANTEE_TYPE,
          ''                                                             as GUARANTEE_VALUE
FROM tbl_flote F
		INNER JOIN  cap_account_id A       ON A.flt_cod_hois = F.flt_cod_hois
		INNER JOIN  cap_contract_id CID    ON F.cli_ID = CID.cli_ID
										  AND F.flt_ID = CID.flt_ID
										  AND F.flt_cod_hois = CID.con_ID -- vezi ps_FIRST
		INNER JOIN  tbl_moneda M01         on F.moneda_ID_pf_Taxa_Emitere_Factura_Detaliata = M01.moneda_id 
		INNER JOIN  tbl_moneda M02         on F.moneda_ID_pf_Taxa_Emitere_Card = M02.moneda_id 
		INNER JOIN  tbl_moneda M03         on F.moneda_ID_pf_Taxa_ReEmitere_Card = M03.moneda_id 
		INNER JOIN  tbl_moneda M04         on F.moneda_ID_pf_Taxa_ReEmitere_Pin = M04.moneda_id 
		INNER JOIN  tbl_moneda M05         on F.moneda_ID_pf_Taxa_Intretinere_Anuala = M05.moneda_id 
		INNER JOIN  tbl_moneda M06         on F.moneda_ID_pf_Taxa_Emitere_Factura_Suplimentara = M06.moneda_id 
WHERE   1 = 1
		AND F.Cli_id = 32767
		AND CID.CLIENT_TYPE = 'PF'


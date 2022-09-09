
-- 2) Creare VIEW vJ_Dispozitive_Lista
CREATE VIEW vJ_Dispozitive_Lista AS
SELECT     v.cli_ID,
           v.flt_ID,
           v.veh_ID,
           vd.vehdisp_ID,
           v.dep_ID,
           vd.vehdisp_cod,

           ISNULL(vd.vehdisp_activ,0) AS vehdisp_activ,
           ISNULL(vdt.vehdisptip_Denumire,'') AS vehdisptip_Denumire,
           ISNULL(vd.vehdisp_facturabil, 0) AS vehdisp_facturabil,

           vd.vehdisp_Data_Start,
           vd.vehdisp_Data_Stop,
           c.cli_Denumire,
           f.flt_Denumire,
           v.veh_Nr_Inmatriculare,
           v.veh_activ,
           vd.vehdisp_Packaging_Number AS PackagingKey,
           vd.vehdisptip_id,
           vd.vehdisp_operator_creare,
           vehdisp_Data_Start_Chirie,

           -- Adaugare campuri pentru clientii SME
           c.cli_Tip_Client,
           CONVERT(bit,CASE WHEN c.cli_Tip_Client = '3' THEN 1 ELSE 0 END) AS Client_SME

           -- Adaugare camp vehdisp_cod_viu (Ascuns in lista, vizibil in EXCEL)
          ,IsNull(vd.vehdisp_cod_viu, '') AS vehdisp_cod_viu

FROM       tbl_Vehicule v WITH (NOLOCK)
INNER JOIN tbl_Flote    f WITH (NOLOCK) ON f.cli_ID = v.cli_ID
                                       AND f.flt_ID = v.flt_ID
                                       AND f.flt_Desincr_HOIS = 0

INNER JOIN tbl_Vehicule_Dispozitive vd WITH (NOLOCK) ON vd.cli_id = v.cli_id
                                                    AND vd.flt_id = v.flt_id
                                                    AND vd.veh_id = v.veh_id
                                      
INNER JOIN tbl_Vehicule_Dispozitiv_Tip vdt WITH (NOLOCK) ON vdt.vehdisptip_id = vd.vehdisptip_id

INNER JOIN tbl_Clienti c WITH (NOLOCK) ON c.cli_ID = v.cli_ID
                                      AND c.cli_ID = f.cli_ID
                                      AND c.cli_ID = vd.cli_ID

WHERE      1 = 1
  /* Am pus aceleasi conditii din vederea vJ_VehiculeSincronizate */
  AND      v.veh_Desincr_HOIS = 0
  AND      v.cli_ID <> 32767

/*
Ginel: 07-09-2006 (Am comentat tot acest cod datorita problemei
                   chemarii de vederi in alte vederi)

FROM       vJ_VehiculeSincronizate v
INNER JOIN vJ_FloteSincronizate f ON v.cli_ID = f.cli_ID
                                 AND v.flt_ID = f.flt_ID
INNER JOIN tbl_Vehicule_Dispozitive vd ON vd.cli_id=v.cli_id
                                      AND vd.flt_id=v.flt_id
                                      AND vd.veh_id=v.veh_id
INNER JOIN tbl_Vehicule_Dispozitiv_Tip vdt ON vdt.vehdisptip_id = vd.vehdisptip_id
INNER JOIN vJ_Clienti c ON c.cli_ID = v.cli_ID
                       AND c.cli_ID = f.cli_ID
                       AND c.cli_ID = vd.cli_ID

*/


SELECT
  DISTINCT Tbl_cTMEC_00.[Producto Terminado],
  Tbl_cTMEC_00.[FA de PT],
  Tbl_cTMEC_00.PTCap,
  Tbl_cTMEC_00.PTPar,
  Tbl_cTMEC_00.PTSub,
  Tbl_cTMEC_00.PTFra,
  Tbl_cTMEC_00.[Materia Prima],
  Tbl_cTMEC_00.UM,
  Tbl_cTMEC_00.Cantidad,
  Tbl_cTMEC_00.Descripción,
  Tbl_cTMEC_00.Precio,
  Tbl_cTMEC_00.ESN,
  Tbl_cTMEC_00.[Valor MXP],
  Tbl_cTMEC_00.[Valor USD],
  Tbl_cTMEC_00.Porcentaje,
  Tbl_cTMEC_00.[%],
  Tbl_cTMEC_00.Cum,
  Tbl_cTMEC_00.[% Cum],
  Tbl_cTMEC_00.ABC,
  Tbl_cTMEC_00.[FA de MP],
  Tbl_cTMEC_00.MPCap,
  Tbl_cTMEC_00.MPPar,
  Tbl_cTMEC_00.MPSub,
  Tbl_cTMEC_00.MPFra,
  Tbl_cTMEC_00.[Origen MP],
  Tbl_cTMEC_00.[Prueba de Origen],
  CASE
  WHEN [Tbl_cTMEC_00].[PTCap] = [Tbl_cTMEC_00].[MPCap]
  THEN 'No'
   ELSE  'Si'
  END
  AS Salto,
  [Reglas T - MEC].REGLA,
  [Reglas T - MEC].TEXTO,
  [Reglas T - MEC].NOTA,
  [Reglas T - MEC].ANEXO,
  [Reglas T - MEC].[T-MEC],
  [Reglas T - MEC].VCR,
  [Reglas T - MEC].CN
FROM sqlite_master
  (
    (
      Tbl_cTMEC_00
      LEFT JOIN tbl_temp_bom_local ON (
        Tbl_cTMEC_00.MPFra = tbl_temp_bom_local.MPFra
      )
      AND (
        Tbl_cTMEC_00.MPSub = tbl_temp_bom_local.MPSub
      )
      AND (
        Tbl_cTMEC_00.MPPar = tbl_temp_bom_local.MPPar
      )
      AND (
        Tbl_cTMEC_00.MPCap = tbl_temp_bom_local.MPCap
      )
      AND (
        Tbl_cTMEC_00.PTFra = tbl_temp_bom_local.PTFra
      )
      AND (
        Tbl_cTMEC_00.PTSub = tbl_temp_bom_local.PTSub
      )
      AND (
        Tbl_cTMEC_00.PTPar = tbl_temp_bom_local.PTPar
      )
      AND (
        Tbl_cTMEC_00.PTCap = tbl_temp_bom_local.PTCap
      )
      AND (
        Tbl_cTMEC_00.[Producto Terminado] = tbl_temp_bom_local.[Producto Terminado]
      )
      AND (
        Tbl_cTMEC_00.[FA de PT] = tbl_temp_bom_local.[FA de PT]
      )
      AND (
        Tbl_cTMEC_00.[Materia Prima] = tbl_temp_bom_local.[Materia Prima]
      )
      AND (
        Tbl_cTMEC_00.[FA de MP] = tbl_temp_bom_local.[FA de MP]
      )
      AND (
        Tbl_cTMEC_00.[Origen MP] = tbl_temp_bom_local.[Origen MP]
      )
      AND (
        Tbl_cTMEC_00.UM = tbl_temp_bom_local.UM
      )
      AND (
        Tbl_cTMEC_00.Cantidad = tbl_temp_bom_local.Cantidad
      )
      AND (
        Tbl_cTMEC_00.Descripción = tbl_temp_bom_local.Descripción
      )
      AND (
        Tbl_cTMEC_00.Precio = tbl_temp_bom_local.Precio
      )
      AND (
        Tbl_cTMEC_00.ESN = tbl_temp_bom_local.ESN
      )
      AND (
        Tbl_cTMEC_00.[Valor MXP] = tbl_temp_bom_local.[Valor MXP]
      )
      AND (
        Tbl_cTMEC_00.[Valor USD] = tbl_temp_bom_local.[Valor USD]
      )
      AND (
        Tbl_cTMEC_00.Porcentaje = tbl_temp_bom_local.Porcentaje
      )
      AND (
        Tbl_cTMEC_00.Cum = tbl_temp_bom_local.Cum
      )
      AND (
        Tbl_cTMEC_00.ABC = tbl_temp_bom_local.ABC
      )
    )
    LEFT JOIN [Reglas T - MEC] ON Tbl_cTMEC_00.PTCap = [Reglas T - MEC].RCAPITULO
  )
  LEFT JOIN temp_vigencia ON [Reglas T - MEC].Vigencia = temp_vigencia.Vigencia
WHERE
  (
    (
      ([Reglas T - MEC].[T-MEC])= 'CCCC'
    )
    AND (
      (
        tbl_temp_bom_local.[Producto Terminado]
      ) Is Null
    )
    AND (
      (temp_vigencia.Vigencia) Is Not Null
    )
  )
ORDER BY
  Tbl_cTMEC_00.[Producto Terminado],
  Tbl_cTMEC_00.[FA de PT],
  Tbl_cTMEC_00.[Materia Prima];

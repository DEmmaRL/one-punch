INSERT INTO Tbl_Temp_BOM_local (
  [Producto Terminado],
  [FA de PT],
  PTCap,
  PTPar,
  PTSub,
  PTFra,
  [Materia Prima],
  UM,
  Cantidad,
  Descripción,
  Precio,
  ESN,
  [Valor MXP],
  [Valor USD],
  Porcentaje,
  [%],
  Cum,
  [% Cum],
  ABC,
  [FA de MP],
  MPCap,
  MPPar,
  MPSub,
  MPFra,
  [Origen MP],
  [Prueba de Origen],
  [Salto Arancelario (MP)],
  Regla,
  Texto,
  Nota,
  Anexo,
  [T-MEC],
  VCR_RO,
  CN_RO
)
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
  'No' AS Salto,
  [Reglas T - MEC].REGLA,
  [Reglas T - MEC].TEXTO,
  [Reglas T - MEC].NOTA,
  [Reglas T - MEC].ANEXO,
  [Reglas T - MEC].[T-MEC],
  [Reglas T - MEC].VCR,
  [Reglas T - MEC].CN
FROM
  (
    (
      (
        (
          (
            Tbl_cTMEC_00
            LEFT JOIN Tbl_Temp_BOM_local ON (
              Tbl_cTMEC_00.PTFra = Tbl_Temp_BOM_local.PTFra
            )
            AND (
              Tbl_cTMEC_00.PTSub = Tbl_Temp_BOM_local.PTSub
            )
            AND (
              Tbl_cTMEC_00.PTPar = Tbl_Temp_BOM_local.PTPar
            )
            AND (
              Tbl_cTMEC_00.PTCap = Tbl_Temp_BOM_local.PTCap
            )
            AND (
              Tbl_cTMEC_00.ABC = Tbl_Temp_BOM_local.ABC
            )
            AND (
              Tbl_cTMEC_00.Cum = Tbl_Temp_BOM_local.Cum
            )
            AND (
              Tbl_cTMEC_00.Porcentaje = Tbl_Temp_BOM_local.Porcentaje
            )
            AND (
              Tbl_cTMEC_00.[Valor USD] = Tbl_Temp_BOM_local.[Valor USD]
            )
            AND (
              Tbl_cTMEC_00.[Valor MXP] = Tbl_Temp_BOM_local.[Valor MXP]
            )
            AND (
              Tbl_cTMEC_00.ESN = Tbl_Temp_BOM_local.ESN
            )
            AND (
              Tbl_cTMEC_00.Precio = Tbl_Temp_BOM_local.Precio
            )
            AND (
              Tbl_cTMEC_00.Descripción = Tbl_Temp_BOM_local.Descripción
            )
            AND (
              Tbl_cTMEC_00.Cantidad = Tbl_Temp_BOM_local.Cantidad
            )
            AND (
              Tbl_cTMEC_00.UM = Tbl_Temp_BOM_local.UM
            )
            AND (
              Tbl_cTMEC_00.[Producto Terminado] = Tbl_Temp_BOM_local.[Producto Terminado]
            )
            AND (
              Tbl_cTMEC_00.[FA de PT] = Tbl_Temp_BOM_local.[FA de PT]
            )
            AND (
              Tbl_cTMEC_00.[Materia Prima] = Tbl_Temp_BOM_local.[Materia Prima]
            )
            AND (
              Tbl_cTMEC_00.[FA de MP] = Tbl_Temp_BOM_local.[FA de MP]
            )
            AND (
              Tbl_cTMEC_00.[Origen MP] = Tbl_Temp_BOM_local.[Origen MP]
            )
          )
          LEFT JOIN [Reglas T - MEC] ON Tbl_cTMEC_00.PTSub = [Reglas T - MEC].RSUBPARTIDA
        )
        LEFT JOIN [Reglas T - MEC] AS [Reglas T - MEC_1] ON Tbl_cTMEC_00.MPPar = [Reglas T - MEC_1].ExceptoP
      )
      LEFT JOIN [Reglas T - MEC] AS [Reglas T - MEC_2] ON Tbl_cTMEC_00.MPSub = [Reglas T - MEC_2].ExceptoS
    )
    LEFT JOIN [Reglas T - MEC] AS [Reglas T - MEC_3] ON Tbl_cTMEC_00.MPFra = [Reglas T - MEC_3].ExceptoF
  )
  LEFT JOIN Temp_Vigencia ON [Reglas T - MEC].Vigencia = Temp_Vigencia.Vigencia
WHERE
  (
    (
      ([Reglas T - MEC].[T-MEC])= 'CSCSE'
    )
    AND (
      (
        Tbl_Temp_BOM_local.[Producto Terminado]
      ) Is Null
    )
    AND (
      ([Reglas T - MEC_1].ExceptoP)= '7408'
      Or ([Reglas T - MEC_1].ExceptoP)= '7413'
      Or ([Reglas T - MEC_1].ExceptoP)= '7605'
      Or ([Reglas T - MEC_1].ExceptoP)= '7614'
    )
    AND (
      (Temp_Vigencia.Vigencia) Is Not Null
    )
  )
  OR (
    (
      ([Reglas T - MEC].[T-MEC])= 'CSCSE'
    )
    AND (
      (
        Tbl_Temp_BOM_local.[Producto Terminado]
      ) Is Null
    )
    AND (
      (Temp_Vigencia.Vigencia) Is Not Null
    )
    AND (
      ([Reglas T - MEC_2].ExceptoS)= '852990'
      Or ([Reglas T - MEC_2].ExceptoS)= '853910'
      Or ([Reglas T - MEC_2].ExceptoS)= '853921'
      Or ([Reglas T - MEC_2].ExceptoS)= '853922'
      Or ([Reglas T - MEC_2].ExceptoS)= '853929'
      Or ([Reglas T - MEC_2].ExceptoS)= '853931'
      Or ([Reglas T - MEC_2].ExceptoS)= '853932'
      Or ([Reglas T - MEC_2].ExceptoS)= '853939'
      Or ([Reglas T - MEC_2].ExceptoS)= '853941'
      Or ([Reglas T - MEC_2].ExceptoS)= '853949'
      Or ([Reglas T - MEC_2].ExceptoS)= '852359'
      Or ([Reglas T - MEC_2].ExceptoS)= '903090'
    )
  )
  OR (
    (
      ([Reglas T - MEC].[T-MEC])= 'CSCSE'
    )
    AND (
      (
        Tbl_Temp_BOM_local.[Producto Terminado]
      ) Is Null
    )
    AND (
      (Temp_Vigencia.Vigencia) Is Not Null
    )
    AND (
      ([Reglas T - MEC_3].ExceptoF)= '85339002'
    )
  )
ORDER BY
  Tbl_cTMEC_00.[Producto Terminado],
  Tbl_cTMEC_00.[FA de PT],
  Tbl_cTMEC_00.[Materia Prima];

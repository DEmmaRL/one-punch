SELECT
  Tbl_cTMEC_00.[Producto Terminado],
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
  WHEN ([Tbl_cTMEC_00].[Prueba de Origen])<> 'NO'
      THEN 'SI'
  ELSE
    ''
  END
   AS Salto,
  'Materia prima con prueba de origen de la región' AS Regla,
  [Reglas T - MEC].CN,
  [Reglas T - MEC].VCR,
  'PO' AS [regla T - Mec]
FROM
  (
    Tbl_cTMEC_00
    LEFT JOIN [Reglas T - MEC] ON Tbl_cTMEC_00.PTSub = [Reglas T - MEC].RSUBPARTIDA
  )
  LEFT JOIN Tbl_Temp_BOM_local ON (
    Tbl_cTMEC_00.[Origen MP] = Tbl_Temp_BOM_local.[Origen MP]
  )
  AND (
    Tbl_cTMEC_00.MPFra = Tbl_Temp_BOM_local.MPFra
  )
  AND (
    Tbl_cTMEC_00.MPSub = Tbl_Temp_BOM_local.MPSub
  )
  AND (
    Tbl_cTMEC_00.MPPar = Tbl_Temp_BOM_local.MPPar
  )
  AND (
    Tbl_cTMEC_00.MPCap = Tbl_Temp_BOM_local.MPCap
  )
  AND (
    Tbl_cTMEC_00.[FA de MP] = Tbl_Temp_BOM_local.[FA de MP]
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
    Tbl_cTMEC_00.[Materia Prima] = Tbl_Temp_BOM_local.[Materia Prima]
  )
  AND (
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
    Tbl_cTMEC_00.[FA de PT] = Tbl_Temp_BOM_local.[FA de PT]
  )
  AND (
    Tbl_cTMEC_00.[Producto Terminado] = Tbl_Temp_BOM_local.[Producto Terminado]
  )
WHERE
  (
    (
      (
        Tbl_cTMEC_00.[Producto Terminado]
      )<> 'Producto Terminado'
    )
    AND (
      (Tbl_cTMEC_00.[Origen MP])= 'MX'
      Or (Tbl_cTMEC_00.[Origen MP])= 'US'
      Or (Tbl_cTMEC_00.[Origen MP])= 'CA'
    )
    AND (
      (Tbl_cTMEC_00.[Prueba de Origen])<> 'NO'
      Or (Tbl_cTMEC_00.[Prueba de Origen]) Is Not Null
    )
    AND (
      (
        CASE
  WHEN ([Tbl_cTMEC_00].[Prueba de Origen])<>'NO'
      THEN 'SI'
  ELSE
      ''
END
      )= 'SI'
    )
    AND (
      (
        Tbl_Temp_BOM_local.[Producto Terminado]
      ) Is Null
    )
  )
ORDER BY
  Tbl_cTMEC_00.[Producto Terminado],
  Tbl_cTMEC_00.[FA de PT],
  Tbl_cTMEC_00.[Materia Prima];

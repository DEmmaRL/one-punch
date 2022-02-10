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
  CASE
  WHEN [Tbl_cTMEC_00].[PTPar] = [Tbl_cTMEC_00].[MPPar]
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
FROM
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
        Tbl_cTMEC_00.[Origen MP] = Tbl_Temp_BOM_local.[Origen MP]
      )
      AND (
        Tbl_cTMEC_00.[FA de MP] = Tbl_Temp_BOM_local.[FA de MP]
      )
      AND (
        Tbl_cTMEC_00.[Materia Prima] = Tbl_Temp_BOM_local.[Materia Prima]
      )
      AND (
        Tbl_cTMEC_00.[FA de PT] = Tbl_Temp_BOM_local.[FA de PT]
      )
      AND (
        Tbl_cTMEC_00.[Producto Terminado] = Tbl_Temp_BOM_local.[Producto Terminado]
      )
    )
    LEFT JOIN [Reglas T - MEC] ON Tbl_cTMEC_00.PTFra = [Reglas T - MEC].RFRACCION
  )
  LEFT JOIN Temp_Vigencia ON [Reglas T - MEC].Vigencia = Temp_Vigencia.Vigencia
WHERE
  (
    (
      ([Reglas T - MEC].[T-MEC])= 'CFCPE'
    )
    AND (
      (
        Tbl_Temp_BOM_local.[Producto Terminado]
      ) Is Null
    )
    AND (
      (
        CASE
WHEN [Tbl_cTMEC_00].[MPCap] = [Reglas T - MEC].[ExceptoC]
THEN 0
 ELSE  1
END
      )= 1
    )
    AND (
      (
        CASE
        WHEN [Tbl_cTMEC_00].[MPPar] = [Reglas T - MEC].[ExceptoP]
        THEN 0
         ELSE  1
        END
      )= 1
    )
    AND (
      (
        CASE
WHEN [Tbl_cTMEC_00].[MPSub] = [Reglas T - MEC].[ExceptoS]
THEN 0
 ELSE  1
END
      )= 1
    )
    AND (
      (
        CASE
      WHEN [Tbl_cTMEC_00].[MPFra] = [Reglas T - MEC].[ExceptoF]
      THEN 0
       ELSE  1
      END
      )= 1
    )
    AND (
      (Temp_Vigencia.Vigencia) Is Not Null
    )
  )
ORDER BY
  Tbl_cTMEC_00.[Producto Terminado],
  Tbl_cTMEC_00.[FA de PT],
  Tbl_cTMEC_00.[Materia Prima];

INSERT INTO Tbl_cTMEC_00 (
  [Producto Terminado], [FA de PT], PTCap,
  PTPar, PTSub, PTFra, [Materia Prima],
  UM, Cantidad, Descripción, Precio,
  ESN, [Valor MXP], [Valor USD], Porcentaje,
  [%], Cum, [% Cum], ABC, [FA de MP], MPCap,
  MPPar, MPSub, MPFra, [Origen MP], [Prueba de Origen],
  F19
)
SELECT
  Tbl_Temp_BOM.F1 AS [Producto Terminado],
  Tbl_Temp_BOM.F2 AS [FA de PT],
  substr([Tbl_Temp_BOM].[F2], 1, 2) AS PTCap,
  substr([Tbl_Temp_BOM].[F2], 1, 4) AS PTPar,
  substr([Tbl_Temp_BOM].[F2], 1, 6) AS PTSub,
  substr([Tbl_Temp_BOM].[F2], 1, 8) AS PTFra,
  Tbl_Temp_BOM.F3 AS [Materia Prima],
  Tbl_Temp_BOM.F4 AS UM,
  Tbl_Temp_BOM.F5 AS Cantidad,
  Tbl_Temp_BOM.F6 AS Descripción,
  Tbl_Temp_BOM.F7 AS Precio,
  Tbl_Temp_BOM.F8 AS ESN,
  Tbl_Temp_BOM.F9 AS [Valor MXP],
  Tbl_Temp_BOM.F10 AS [Valor USD],
  Tbl_Temp_BOM.F11 AS Porcentaje,
  Tbl_Temp_BOM.F12 AS [%],
  Tbl_Temp_BOM.F13 AS Cum,
  Tbl_Temp_BOM.F14 AS [ % Cum],
  Tbl_Temp_BOM.F15 AS ABC,
  Tbl_Temp_BOM.F16 AS [FA de MP],
  substr([Tbl_Temp_BOM].[F16], 1, 2) AS MPCap,
  substr([Tbl_Temp_BOM].[F16], 1, 4) AS MPPar,
  substr([Tbl_Temp_BOM].[F16], 1, 6) AS MPSub,
  substr([Tbl_Temp_BOM].[F16], 1, 8) AS MPFra,
  Tbl_Temp_BOM.F17 AS [Origen MP],
  Tbl_Temp_BOM.F18 AS [Prueba de Origen],
  Tbl_Temp_BOM.F19
FROM
  Tbl_Temp_BOM
WHERE
  (
    (
      (Tbl_Temp_BOM.F1)<> 'Producto Terminado'
    )
  );

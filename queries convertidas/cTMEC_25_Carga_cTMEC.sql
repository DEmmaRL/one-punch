INSERT INTO Tbl_Temp_cTMEC (
  [Producto Terminado], [FA de PT], PTCap,
  PTPar, PTSub, PTFra, [Materia Prima],
  UM, Cantidad, Descripción, Precio,
  ESN, [Valor MXP], [Valor USD], Porcentaje,
  [ % ], Cum, [ % Cum], ABC, [FA de MP], MPCap,
  MPPar, MPSub, MPFra, [Origen MP], [Prueba de Origen],
  F19
)
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
  Tbl_cTMEC_00.F19
FROM
  Tbl_cTMEC_00;

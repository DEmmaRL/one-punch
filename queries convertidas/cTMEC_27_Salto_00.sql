SELECT
  Tbl_Temp_cTMEC.[Producto Terminado],
  Tbl_Temp_cTMEC.[Salto_Arancelario_(MP) ]
FROM
  Tbl_Temp_cTMEC
GROUP BY
  Tbl_Temp_cTMEC.[Producto Terminado],
  Tbl_Temp_cTMEC.[Salto_Arancelario_(MP) ]
ORDER BY
  Tbl_Temp_cTMEC.[Producto Terminado];

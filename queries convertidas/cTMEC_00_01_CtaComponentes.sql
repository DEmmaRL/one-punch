SELECT
  Tbl_cTMEC_00.[Producto Terminado],
  Count(
    Tbl_cTMEC_00.[Producto Terminado]
  ) AS [Cta Componentes]
FROM
  Tbl_cTMEC_00
GROUP BY 
  Tbl_cTMEC_00.[Producto Terminado];

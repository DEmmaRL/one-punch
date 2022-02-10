require 'rubyXL'
require 'sequel'


#TABLA DE INICIO DEL BOM

DB = Sequel.connect('sqlite://basededatos.sql')

#DB.run("CREATE TABLE `tbl_temp_bom_local` ( `Producto Terminado` TEXT NOT NULL , `FA de PT` TEXT NOT NULL , `PTCap` TEXT NOT NULL , `PTPar` TEXT NOT NULL , `PTSub` TEXT NOT NULL , `PTFra` TEXT NOT NULL , `Materia Prima` TEXT NOT NULL , `UM` TEXT NOT NULL , `Cantidad` TEXT NOT NULL , `Descripción` TEXT NOT NULL , `Precio` TEXT NOT NULL , `ESN` TEXT NOT NULL , `Valor MXP` FLOAT NOT NULL , `Valor USD` FLOAT NOT NULL , `Porcentaje` TEXT NOT NULL , `%` TEXT NOT NULL , `Cum` TEXT NOT NULL , `% Cum` TEXT NOT NULL , `ABC` TEXT NOT NULL , `FA de MP` TEXT NOT NULL , `MPCap` TEXT NOT NULL , `MPPar` TEXT NOT NULL , `MPSub` TEXT NOT NULL , `MPFra` TEXT NOT NULL , `Origen MP` TEXT NOT NULL , `Prueba de Origen` TEXT NOT NULL , `Salto Arancelario (MP)` TEXT NOT NULL , `Regla` LONGTEXT NOT NULL , `Texto` LONGTEXT NOT NULL , `Nota` LONGTEXT NOT NULL , `Anexo` LONGTEXT NOT NULL , `CN_RO` INT NOT NULL , `VCR_RO` INT NOT NULL , `VMNO` INT NOT NULL , `Costo Neto` INT NOT NULL , `VCR` INT NOT NULL , `T-MEC` TEXT NOT NULL );")

#DB.run("CREATE TABLE `Tbl_Temp_BOM_input` ( `Producto Terminado` text NOT NULL, `FA de PT` text NOT NULL, `PTCap` TEXT NOT NULL , `PTPar` TEXT NOT NULL , `PTSub` TEXT NOT NULL , `PTFra` TEXT NOT NULL ,`Materia Prima` text NOT NULL, `UM` text NOT NULL, `Cantidad` text NOT NULL, `Descripción` text NOT NULL, `Precio` text NOT NULL, `ESN` text NOT NULL, `Valor MXP` float NOT NULL, `Valor USD` float NOT NULL, `Porcentaje` text NOT NULL, `%` text NOT NULL, `Cum` text NOT NULL, `% Cum` text NOT NULL, `ABC` text NOT NULL, `FA de MP` text NOT NULL, `MPCap` TEXT NOT NULL , `MPPar` TEXT NOT NULL , `MPSub` TEXT NOT NULL , `MPFra` TEXT NOT NULL , `Origen MP` text NOT NULL, `Prueba de Origen` text NOT NULL, `Salto Arancelario (MP)` text NOT NULL);")

#DB.run("CREATE TABLE `temp_vigencia` ( `Vigencia` DATETIME NOT NULL );")

#DB.run("CREATE TABLE `Tbl_cTMEC_00` ( `Producto Terminado` TEXT NOT NULL , `FA de PT` TEXT NOT NULL , `PTCap` TEXT NOT NULL , `PTPar` TEXT NOT NULL , `PTSub` TEXT NOT NULL , `PTFra` TEXT NOT NULL , `Materia Prima` TEXT NOT NULL , `UM` TEXT NOT NULL , `Cantidad` TEXT NOT NULL , `Descripción` TEXT NOT NULL , `Precio` TEXT NOT NULL , `ESN` TEXT NOT NULL , `Valor MXP` FLOAT NOT NULL , `Valor USD` FLOAT NOT NULL , `Porcentaje` TEXT NOT NULL , `%` TEXT NOT NULL , `Cum` TEXT NOT NULL , `% Cum` TEXT NOT NULL , `ABC` TEXT NOT NULL , `FA de MP` TEXT NOT NULL , `MPCap` TEXT NOT NULL , `MPPar` TEXT NOT NULL , `MPSub` TEXT NOT NULL , `MPFra` TEXT NOT NULL , `Origen MP` TEXT NOT NULL , `Prueba de Origen` TEXT NOT NULL , `F19` TEXT NOT NULL );")

#DB.run("CREATE TABLE `Reglas T - MEC` ( `REGLA` LONGTEXT NOT NULL , `TEXTO` LONGTEXT NOT NULL , `NOTA` LONGTEXT NOT NULL , `ANEXO` LONGTEXT NOT NULL , `RCAPITULO` TEXT NOT NULL , `RPARTIDA` TEXT NOT NULL , `RSUBPARTIDA` TEXT NOT NULL , `RFRACCION` TEXT NOT NULL , `T-MEC` TEXT NOT NULL , `ExceptoC` TEXT NOT NULL , `ExceptoP` TEXT NOT NULL , `ExceptoS` TEXT NOT NULL , `ExceptoF` TEXT NOT NULL , `ExceptoOtros` TEXT NOT NULL , `VCR` INT NOT NULL , `CN` INT NOT NULL , `MINIMIS` INT NOT NULL , `Vigencia` DATETIME NOT NULL, `F19` TEXT );")

#cTMEC_011_Componentes
DB.run("
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


")

tbl_bom = DB[:tbl_bom_input]

def save_in_db (file_name)
  saved_workbook = RubyXL::Parser.parse "#{file_name}.xlsx"
  # Iteramos cada fila de la primer hoja
  saltar=false
  saved_workbook[0].each do |r|
    if saltar==true
      arreglo=[]
      iterador=0
      r.cells.each do |c|
        arreglo[iterador]=c.value
        if c.value.to_s == '8533210100'
          puts iterador
        end
        if iterador==1 || iterador==19
          string = c.value.to_s
          cap = string[0] + string[1]
          part = cap + string[2] + string[3]
          subpart = part + string[4] + string[5]
          frac = subpart + string[6] + string[7]

          iterador=iterador+1;
          arreglo[iterador]=cap
          iterador=iterador+1;
          arreglo[iterador]=part
          iterador=iterador+1;
          arreglo[iterador]=subpart
          iterador=iterador+1;
          arreglo[iterador]=frac
        end
        iterador=iterador+1;
      end
      #Aquí termina el ciclo
      DB[:Tbl_Temp_BOM_input].insert([arreglo[0], arreglo[1], arreglo[2], arreglo[3], arreglo[4], arreglo[5], arreglo[6], arreglo[7], arreglo[8], arreglo[9], arreglo[10], arreglo[11], arreglo[12], arreglo[13], arreglo[14], arreglo[15], arreglo[16], arreglo[17], arreglo[18], arreglo[19], arreglo[20], arreglo[21], arreglo[22], arreglo[23], arreglo[24], arreglo[25], arreglo[26]])
    else
      saltar=true
    end
  end
end
prueba=save_in_db("BOM")

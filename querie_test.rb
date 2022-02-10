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
  INSERT INTO Tbl_Temp_cTMEC_Minimis (
    Producto_Terminado, [FA de PT], Valor_Transacción,
    Valor_No_Salto, [%_Minimis], Minimis,
    VMNO, VCR_RO, Califica, VCR
  )
  SELECT
    DISTINCT cTMEC_28_Minimis_Valor_no_salto_00.[Producto Terminado],
    cTMEC_28_Minimis_Valor_no_salto_00.[FA de PT],
    [cTMEC_Valor de Transaccion].[Precio USD],
    cTMEC_28_Minimis_Valor_no_salto_00.Valor_no_salto,
    '10' AS [% _Minimis],
    Round(
      (
        [Valor_no_salto] / [Precio USD] * 100
      ),
      2
    ) AS Minimis,
    cTMEC_VMNO_01.VMNO,
    cTMEC_28_Minimis_Valor_no_salto_00.VCR_RO,
    CASE
  WHEN [Valor_no_salto] = 0
  THEN 'No_Minimis'
   ELSE CASE
  WHEN [Minimis] < 9.5
  THEN  'Minimis'
   ELSE  'No_Minimis'
  END

  END
    AS Califica,
    Round(
      (
        ([Precio USD] - [VMNO])/ [Precio USD]
      )* 100,
      2
    ) AS VCR
  FROM
    (
      cTMEC_28_Minimis_Valor_no_salto_00
      INNER JOIN [cTMEC_Valor de Transaccion] ON cTMEC_28_Minimis_Valor_no_salto_00.[Producto Terminado] = [cTMEC_Valor de Transaccion].[Número de Parte]
    )
    INNER JOIN cTMEC_VMNO_01 ON cTMEC_28_Minimis_Valor_no_salto_00.[Producto Terminado] = cTMEC_VMNO_01.[Producto Terminado];

")
puts "hola"

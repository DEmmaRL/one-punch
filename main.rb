require 'sequel'
require 'active_record'

puts "HELLO"
=begin
def temp_database
Sequel.connect("sqlite://storage/#{('a'..'z').to_a.sample(32).join}.db")
end
=end
DB = Sequel.connect('sqlite://basededatos.sql')

#prueba=DB[:prueba]
#DROP TABLE DB.prueba;
#DB.run("CREATE TABLE `tbl_temp_bom_local` ( `Producto Terminado` TEXT NOT NULL , `FA de PT` TEXT NOT NULL , `PTCap` TEXT NOT NULL , `PTPar` TEXT NOT NULL , `PTSub` TEXT NOT NULL , `PTFra` TEXT NOT NULL , `Materia Prima` TEXT NOT NULL , `UM` TEXT NOT NULL , `Cantidad` TEXT NOT NULL , `Descripción` TEXT NOT NULL , `Precio` TEXT NOT NULL , `ESN` TEXT NOT NULL , `Valor MXP` FLOAT NOT NULL , `Valor USD` FLOAT NOT NULL , `Porcentaje` TEXT NOT NULL , `%` TEXT NOT NULL , `Cum` TEXT NOT NULL , `% Cum` TEXT NOT NULL , `ABC` TEXT NOT NULL , `FA de MP` TEXT NOT NULL , `MPCap` TEXT NOT NULL , `MPPar` TEXT NOT NULL , `MPSub` TEXT NOT NULL , `MPFra` TEXT NOT NULL , `Origen MP` TEXT NOT NULL , `Prueba de Origen` TEXT NOT NULL , `Salto Arancelario (MP)` TEXT NOT NULL , `Regla` LONGTEXT NOT NULL , `Texto` LONGTEXT NOT NULL , `Nota` LONGTEXT NOT NULL , `Anexo` LONGTEXT NOT NULL , `CN_RO` INT NOT NULL , `VCR_RO` INT NOT NULL , `VMNO` INT NOT NULL , `Costo Neto` INT NOT NULL , `VCR` INT NOT NULL , `T-MEC` TEXT NOT NULL );")
items = DB[:items] # Create a dataset
#TABLA DE INICIO DEL BOM
#DB.run("CREATE TABLE `tbl_bom_input` ( `Producto Terminado` text NOT NULL, `FA de PT` text NOT NULL, `Materia Prima` text NOT NULL, `UM` text NOT NULL, `Cantidad` text NOT NULL, `Descripción` text NOT NULL, `Precio` text NOT NULL, `ESN` text NOT NULL, `Valor MXP` float NOT NULL, `Valor USD` float NOT NULL, `Porcentaje` text NOT NULL, `%` text NOT NULL, `Cum` text NOT NULL, `% Cum` text NOT NULL, `ABC` text NOT NULL, `FA de MP` text NOT NULL, `Origen MP` text NOT NULL, `Prueba de Origen` text NOT NULL, `Salto Arancelario (MP)` text NOT NULL);")
# Populate the table


#DB[:itemas].insert([ 'dfzed', 1])
items.insert(:name => 'abc', :price => rand * 100)
items.insert(:name => 'def', :price => rand * 100)
items.insert(:name => 'ghi', :price => rand * 100)

# Print out the number of records
puts "Item count: #{items.count}"

# Print out the average price
puts "The average price is: #{items.avg(:price)}"

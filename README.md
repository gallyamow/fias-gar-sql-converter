## FIAS-GAR-CONVERTER

Converts FIAS-GAR xml representation to SQL-dump. Конвертирует FIAS-GAR xml представление в SQL-дамп.

The utility requires XSLT 3.0 transformer, because it used the `xsl:iterate` instruction. 
This feature implemented in Saxon-PE and Saxon-EE since Saxon 9.6. For using EE and PE version you will need to get 
trial license key.

```sh
# create sql-dump to create one table
java -jar /opt/saxon/saxon-ee-10.5.jar -xsl:/work/projects/fias-gar-sql-converter/create-table.xslt -s:/work/projects/fias-gar-sql-converter/gar_schemas/AS_ADDR_OBJ_2_251_01_04_01_01.xsd -o:/work/projects/fias-gar-sql-converter/migrations/tables/AS_ADDR_OBJ_2_251_01_04_01_01.sql

# create sql-dump to create all tables from xsd files in directory
sh ./create-all-tables.sh /opt/saxon/saxon-ee-10.5.jar ./gar_schemas ./migrations/tables
OR
java -jar /opt/saxon/saxon-ee-10.5.jar -xsl:/work/projects/fias-gar-sql-converter/create-all-tables.xslt -it:main -o:/work/projects/fias-gar-sql-converter/migrations/all-tables.sql

# convert data from one file
java -jar /opt/saxon/saxon-ee-10.5.jar -xsl:/work/projects/fias-gar-sql-converter/import.xslt  -s:/work/projects/fias-gar-sql-converter/gar_xml/AS_ROOM_TYPES_20210701_7fa64522-32e9-4053-9ba0-45b3bd895f66.XML -o:/work/projects/fias-gar-sql-converter/migrations/AS_ROOM_TYPES_20210701_7fa64522-32e9-4053-9ba0-45b3bd895f66.sql
java -jar /opt/saxon/saxon-ee-10.5.jar -xsl:/work/projects/fias-gar-sql-converter/import.xslt  -s:/archive/SAVE/gar-tatar/16/AS_STEADS_PARAMS_20210701_a8a31b82-fd21-4b9e-88c4-613ed788f890.XML -o:/work/projects/fias-gar-sql-converter/migrations/big.sql

# convert data from all files in directory (insert mode)
sh ./import.sh /opt/saxon/saxon-ee-10.5.jar ./gar_xml ./migrations/data no
# convert data from all files in directory (on conflict update mode)
sh ./import.sh /opt/saxon/saxon-ee-10.5.jar ./gar_xml ./migrations/data yes
```

## IMPORT DUMP

It is very important to use `nohup` to prevent accidental stopping of the importing process.

```sh
nohup sh -c 'psql -h localhost -d your_database -U your_user -f your_file.sql' &
```

## AGREEMENTS

* table's name is as the main noun in file name
* column's name is lower-cased attr name without any change
* boolean => boolean migrations
* string with any restriction => varchar
* int (even number enumeration), long <= 10 => int
* long > 10 => bigint 
* guid => uuid

## PROBLEMS

* missing "AS_ADDHOUSE_TYPES.xsd" in gar_schemas however existing "AS_ADDHOUSE_TYPES_*.xml" with data

## SEE 

* https://www.saxonica.com/download/download_page.xml
* https://habr.com/ru/company/hflabs/blog/260601/
* http://patshaughnessy.net/2017/12/12/installing-the-postgres-ltree-extension
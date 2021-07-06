## FIAS-GAR-CONVERTER

Converts FIAS-GAR xml representation to SQL-dump.

```sh
# create one table
java -jar /opt/saxon/saxon-he-10.5.jar -xsl:/work/projects/fias-gar-importer/create-table.xslt -s:/work/projects/fias-gar-importer/gar_schemas/AS_ADDR_OBJ_2_251_01_04_01_01.xsd -o:/work/projects/fias-gar-importer/migrations/AS_ADDR_OBJ_2_251_01_04_01_01.sql

# create all tables
java -jar /opt/saxon/saxon-he-10.5.jar -xsl:/work/projects/fias-gar-importer/create-all-tables.xslt -it:main -o:/work/projects/fias-gar-importer/migrations/all-tables.sql

# import one file
java -jar /opt/saxon/saxon-he-10.5.jar -xsl:/work/projects/fias-gar-importer/import.xslt  -s:/work/projects/fias-gar-importer/gar_xml/AS_ROOMS_20210701_c076e3fe-9529-406e-aee1-93fc6f316292.XML -o:/work/projects/fias-gar-importer/migrations/AS_ROOMS_20210701_c076e3fe-9529-406e-aee1-93fc6f316292.sql
```

## AGREEMENTS

* table's name is as the main noun in file name
* column's name is lower-cased attr name without any change
* boolean => boolean migrations
* string with any restriction => varchar
* int (even number enumeration), long <= 10 => int
* long > 10 => bigint 
* guid => uuid

## Questions

* numeric(19) instead of bigint

## SEE 

* https://habr.com/ru/company/hflabs/blog/260601/

## TODO

* check up that required attr = not null column
* xs:date is date or datetime?
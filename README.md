## FIAS-GAR-CONVERTER

Converts FIAS-GAR xml representation to SQL-dump. Конвертирует FIAS-GAR xml представление в SQL-дамп.

The utility requires XSLT 3.0 transformer, because it used the `xsl:iterate` instruction. 
This feature implemented in Saxon-PE and Saxon-EE since Saxon 9.6. For using EE and PE version you will need to get 
trial license key.

## CREATE TABLES

```shell script
# create sql-dump to create all tables from xsd files in directory
sh ./create-all-tables.sh /opt/saxon/saxon-ee-10.5.jar ./gar_schemas ./gar_schemas_sql

# second way
java -jar /opt/saxon/saxon-ee-10.5.jar -xsl:./create-all-tables.xslt -it:main -o:./all-tables.sql
```

## CONVERTING DATA

```shell script
# convert data from all files in directory (insert mode)
sh ./convert.sh /opt/saxon/saxon-ee-10.5.jar ./gar_xml ./gar_xml_sql [DUMP_VERSION]

# convert data from all files in directory (delta)
# DELTA_VERSION - Must be a number that increments for each new delta file, for example 20210803
sh ./convert.sh /opt/saxon/saxon-ee-10.5.jar ./gar_xml ./gar_xml_sql [DELTA_VERSION]
```

Examples

```shell script
sh ./convert.sh /opt/saxon/saxon-ee-10.5.jar /storage/fias-2023-09-19/16 /storage/fias-2023-09-19_sql/16 20230919
```

## IMPORT DUMP

It is very important to use `nohup` to prevent accidental stopping of the importing process.

```shell script
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
* the delta-changes in the root folder has unchanged data
* binary dump should be much faster

## SEE 

* https://www.saxonica.com/download/download_page.xml
* https://habr.com/ru/company/hflabs/blog/260601/
* http://patshaughnessy.net/2017/12/12/installing-the-postgres-ltree-extension
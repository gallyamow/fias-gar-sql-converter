## FIAS-GAR-CONVERTER

**XSLT был выбран "just for fun", но оказалось что вполне неплохо все работает.**

Конвертирует FIAS-GAR xml представление в SQL-дамп.

Утилита требует XSLT 3.0 transformer, потому что использует `xsl:iterate` инструкцию. 
Этот функционал есть в Saxon-PE and Saxon-EE since Saxon 9.6.

## Генерация sql для создания таблиц

```shell script
# create sql-dump to create all tables from xsd files in directory
sh ./create-all-tables.sh /opt/saxon/saxon-ee-10.5.jar ./gar_schemas ./gar_schemas_sql

# second way
java -jar /opt/saxon/saxon-ee-10.5.jar -xsl:./create-all-tables.xslt -it:main -o:./all-tables.sql
```

## Конвертирование данных

```shell script
# конвертирует данные из всех файлов в директории (insert mode)
sh ./convert.sh /opt/saxon/saxon-ee-10.5.jar ./gar_xml ./gar_xml_sql [DUMP_VERSION]

# конвертируеть данные из всех файлов директории оформляя их как дельту
# DELTA_VERSION - Must be a number that increments for each new delta file, for example 20210803
sh ./convert.sh /opt/saxon/saxon-ee-10.5.jar ./gar_xml ./gar_xml_sql [DELTA_VERSION]
```

Примеры

```shell script
sh ./convert.sh /opt/saxon/saxon-ee-10.5.jar /storage/fias-2023-09-19/16 /storage/fias-2023-09-19_sql/16 20230919
```

## Импортирование результата в БД

Рекомендую использовать `nohup` или его аналоги:

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

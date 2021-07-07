## FIAS-GAR-CONVERTER

Converts FIAS-GAR xml representation to SQL-dump.
The utility requires XSLT 3.0 transformer, because it used the `xsl:iterate` instruction. This feature implemented in Saxon-PE and Saxon-EE since Saxon 9.6.

```sh
# create one table
java -jar /opt/saxon/saxon-ee-10.5.jar -xsl:/work/projects/fias-gar-sql-converter/create-table.xslt -s:/work/projects/fias-gar-sql-converter/gar_schemas/AS_ADDR_OBJ_2_251_01_04_01_01.xsd -o:/work/projects/fias-gar-sql-converter/migrations/AS_ADDR_OBJ_2_251_01_04_01_01.sql

# create all tables from xsd files in directory
sh ./create-all-tables.sh /opt/saxon/saxon-ee-10.5.jar ./gar_schemas ./migrations/tables
OR
java -jar /opt/saxon/saxon-ee-10.5.jar -xsl:/work/projects/fias-gar-sql-converter/create-all-tables.xslt -it:main -o:/work/projects/fias-gar-sql-converter/migrations/all-tables.sql

# import one file
java -jar /opt/saxon/saxon-ee-10.5.jar -xsl:/work/projects/fias-gar-sql-converter/import.xslt  -s:/work/projects/fias-gar-sql-converter/gar_xml/AS_ROOM_TYPES_20210701_7fa64522-32e9-4053-9ba0-45b3bd895f66.XML -o:/work/projects/fias-gar-sql-converter/migrations/AS_ROOM_TYPES_20210701_7fa64522-32e9-4053-9ba0-45b3bd895f66.sql
java -jar /opt/saxon/saxon-ee-10.5.jar -xsl:/work/projects/fias-gar-sql-converter/import.xslt  -s:/archive/SAVE/gar-tatar/16/AS_STEADS_PARAMS_20210701_a8a31b82-fd21-4b9e-88c4-613ed788f890.XML -o:/work/projects/fias-gar-sql-converter/migrations/big.sql

# import all files from directory
sh ./import.sh /opt/saxon/saxon-ee-10.5.jar ./gar_xml ./migrations/data no

# import delta files from directory
sh ./import.sh /opt/saxon/saxon-ee-10.5.jar ./gar_xml ./migrations/data yes
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

* https://www.saxonica.com/download/download_page.xml
* https://habr.com/ru/company/hflabs/blog/260601/

## Mapping

AS_ADDR_OBJ_2_251_01_04_01_01.xsd  <= AS_ADDR_OBJ_20210701_51c9c0e0-dbbd-4fcc-9a63-072fb5ae6ed9.XML
AS_ADDR_OBJ_DIVISION_2_251_19_04_01_01.xsd <= AS_ADDR_OBJ_DIVISION_20210701_dfc35635-d5a3-4543-8233-959134792bda.XML
AS_ADDR_OBJ_TYPES_2_251_03_04_01_01.xsd <= \AS_ADDR_OBJ_TYPES_20210701_0c8364d3-0437-4422-9a0f-a245e40b0741.XML
AS_ADM_HIERARCHY_2_251_04_04_01_01.xsd <= AS_ADM_HIERARCHY_20210701_0724159b-c550-43ae-94ff-284666dc68ca.XML
AS_APARTMENT_TYPES_2_251_07_04_01_01.xsd <= \AS_APARTMENT_TYPES_20210701_6f80b05b-87c8-43bd-8231-b37f5c4a724e.XML
AS_APARTMENTS_2_251_05_04_01_01.xsd <= AS_APARTMENTS_20210701_764eaf9d-538a-4401-bbb7-8fde456bdefd.XML
AS_CARPLACES_2_251_06_04_01_01.xsd <= AS_CARPLACES_20210701_7b4bab57-f22c-41b3-bb8c-a0e21add3555.XML
AS_CHANGE_HISTORY_251_21_04_01_01.xsd <= AS_CHANGE_HISTORY_20210701_3617642c-53e7-4380-8f6b-b76ed5d19230.XML
AS_HOUSE_TYPES_2_251_13_04_01_01.xsd <= \AS_HOUSE_TYPES_20210701_bc82bc16-3ee1-42c5-b066-3e9d28bfa4db.XML
AS_HOUSES_2_251_08_04_01_01.xsd <= AS_HOUSES_20210701_88a68601-9fa5-4768-9a35-4dbcdc2bb300.XML
AS_MUN_HIERARCHY_2_251_10_04_01_01.xsd <= AS_MUN_HIERARCHY_20210701_bd0d9667-daa1-4fa0-8457-ec42277ee7c3.XML
AS_NORMATIVE_DOCS_2_251_11_04_01_01.xsd <= AS_NORMATIVE_DOCS_20210701_956884d2-5c54-45f7-81bd-cad0816f995b.XML
AS_NORMATIVE_DOCS_KINDS_2_251_09_04_01_01.xsd <= \AS_NORMATIVE_DOCS_KINDS_20210701_a9d87400-250d-44e2-9b2c-f058d228d309.XML
AS_NORMATIVE_DOCS_TYPES_2_251_16_04_01_01.xsd <= \AS_NORMATIVE_DOCS_TYPES_20210701_f81f1afc-c5d9-4ac1-855d-d397fecde843.XML
AS_OBJECT_LEVELS_2_251_12_04_01_01.xsd <= \AS_OBJECT_LEVELS_20210701_d66a25a9-6141-4139-ada9-33a24cb122a1.XML
AS_OPERATION_TYPES_2_251_14_04_01_01.xsd <= \AS_OPERATION_TYPES_20210701_489dd676-e8f3-4534-9d2a-69cdb8380e45.XML
AS_PARAM_2_251_02_04_01_01.xsd <= AS_ROOMS_PARAMS_20210701_bbe21db3-2b10-4065-89d2-a3b3796c2787.XML
                                  AS_CARPLACES_PARAMS_20210701_a47c3eb3-880a-4c3a-9776-bafe07d6d538.XML
                                  AS_ADDR_OBJ_PARAMS_20210701_c825e8fc-8722-4626-a00a-802b248afebd.XML
                                  AS_APARTMENTS_PARAMS_20210701_ba384b00-aac1-4d76-b03c-17173af36182.XML
                                  AS_HOUSES_PARAMS_20210701_b3a2945c-af53-45ea-bec5-dc445503d873.XML
                                  AS_STEADS_PARAMS_20210701_a8a31b82-fd21-4b9e-88c4-613ed788f890.XML
AS_PARAM_TYPES_2_251_20_04_01_01.xsd <= \AS_PARAM_TYPES_20210701_ce641c30-d560-4e43-8b6c-bf4e611ef29b.XML
AS_REESTR_OBJECTS_2_251_22_04_01_01.xsd <= AS_REESTR_OBJECTS_20210701_481a2905-ac73-483c-bdee-7f3959cb92c9
AS_ROOM_TYPES_2_251_17_04_01_01.xsd <= \AS_ROOM_TYPES_20210701_7fa64522-32e9-4053-9ba0-45b3bd895f66.XML
AS_ROOMS_2_251_15_04_01_01.xsd <= AS_ROOMS_20210701_c076e3fe-9529-406e-aee1-93fc6f316292.XML
AS_STEADS_2_251_18_04_01_01.xsd <= AS_STEADS_20210701_b45aea6e-22d0-402b-96e3-e32a99e24e87.XML

\AS_ADDHOUSE_TYPES_20210701_e77ddf9c-e1be-413f-98a6-6a8fff9a3137.XML => ?

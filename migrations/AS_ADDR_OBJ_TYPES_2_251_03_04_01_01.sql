-- for AS_ADDR_OBJ_TYPES_2_251_03_04_01_01
create table gar.address_object_type
(
    id         int     not null primary key,
    level      int     not null,
    shortname  varchar not null,
    name       varchar not null,
    desc       varchar,
    updatedate date    not null,
    startdate  date    not null,
    enddate    date    not null,
    isactive   boolean not null

);

comment on table gar.address_object_type is 'Сведения по типам адресных объектов';

comment on column gar.address_object_type.id is 'Идентификатор записи';
comment on column gar.address_object_type.level is 'Уровень адресного объекта';
comment on column gar.address_object_type.shortname is 'Краткое наименование типа объекта';
comment on column gar.address_object_type.name is 'Полное наименование типа объекта';
comment on column gar.address_object_type.desc is 'Описание';
comment on column gar.address_object_type.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.address_object_type.startdate is 'Начало действия записи';
comment on column gar.address_object_type.enddate is 'Окончание действия записи';
comment on column gar.address_object_type.isactive is 'Статус активности';

-- <?xml version="1.0" encoding="utf-8"?>
-- <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:sch="http://purl.oclc.org/dsdl/schematron" xmlns:usch="http://www.unisoftware.ru/schematron-extensions" xmlns:sql="urn:schemas-microsoft-com:mapping-schema" elementFormDefault="qualified" attributeFormDefault="unqualified">
-- 	<xs:element name="ADDRESSOBJECTTYPES">
-- 		<xs:annotation>
-- 			<xs:documentation>Состав и структура файла со сведениями по типам адресных объектов</xs:documentation>
-- 		</xs:annotation>
-- 		<xs:complexType>
-- 			<xs:sequence>
-- 				<xs:element name="ADDRESSOBJECTTYPE" maxOccurs="unbounded">
-- 					<xs:annotation>
-- 						<xs:documentation>Сведения по типам адресных объектов</xs:documentation>
-- 					</xs:annotation>
-- 					<xs:complexType>
-- 						<xs:attribute name="ID" use="required">
-- 							<xs:annotation>
-- 								<xs:documentation>Идентификатор записи</xs:documentation>
-- 							</xs:annotation>
-- 							<xs:simpleType>
-- 								<xs:restriction base="xs:integer">
-- 									<xs:totalDigits value="10"/>
-- 								</xs:restriction>
-- 							</xs:simpleType>
-- 						</xs:attribute>
-- 						<xs:attribute name="LEVEL" use="required">
-- 							<xs:annotation>
-- 								<xs:documentation>Уровень адресного объекта</xs:documentation>
-- 							</xs:annotation>
-- 							<xs:simpleType>
-- 								<xs:restriction base="xs:integer"/>
-- 							</xs:simpleType>
-- 						</xs:attribute>
-- 						<xs:attribute name="SHORTNAME" use="required">
-- 							<xs:annotation>
-- 								<xs:documentation>Краткое наименование типа объекта</xs:documentation>
-- 							</xs:annotation>
-- 							<xs:simpleType>
-- 								<xs:restriction base="xs:string">
-- 									<xs:minLength value="1"/>
-- 									<xs:maxLength value="50"/>
-- 								</xs:restriction>
-- 							</xs:simpleType>
-- 						</xs:attribute>
-- 						<xs:attribute name="NAME" use="required">
-- 							<xs:annotation>
-- 								<xs:documentation>Полное наименование типа объекта</xs:documentation>
-- 							</xs:annotation>
-- 							<xs:simpleType>
-- 								<xs:restriction base="xs:string">
-- 									<xs:minLength value="1"/>
-- 									<xs:maxLength value="250"/>
-- 								</xs:restriction>
-- 							</xs:simpleType>
-- 						</xs:attribute>
-- 						<xs:attribute name="DESC" use="optional">
-- 							<xs:annotation>
-- 								<xs:documentation>Описание</xs:documentation>
-- 							</xs:annotation>
-- 							<xs:simpleType>
-- 								<xs:restriction base="xs:string">
-- 									<xs:minLength value="0"/>
-- 									<xs:maxLength value="250"/>
-- 								</xs:restriction>
-- 							</xs:simpleType>
-- 						</xs:attribute>
-- 						<xs:attribute name="UPDATEDATE" type="xs:date" use="required">
-- 							<xs:annotation>
-- 								<xs:documentation>Дата внесения (обновления) записи</xs:documentation>
-- 							</xs:annotation>
-- 						</xs:attribute>
-- 						<xs:attribute name="STARTDATE" type="xs:date" use="required">
-- 							<xs:annotation>
-- 								<xs:documentation>Начало действия записи</xs:documentation>
-- 							</xs:annotation>
-- 						</xs:attribute>
-- 						<xs:attribute name="ENDDATE" type="xs:date" use="required">
-- 							<xs:annotation>
-- 								<xs:documentation>Окончание действия записи</xs:documentation>
-- 							</xs:annotation>
-- 						</xs:attribute>
-- 						<xs:attribute name="ISACTIVE" type="xs:boolean" use="required">
-- 							<xs:annotation>
-- 								<xs:documentation>Статус активности</xs:documentation>
-- 							</xs:annotation>
-- 						</xs:attribute>
-- 					</xs:complexType>
-- 				</xs:element>
-- 			</xs:sequence>
-- 		</xs:complexType>
-- 	</xs:element>
-- </xs:schema>
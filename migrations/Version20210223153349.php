<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Create FIAS GAR tables
 */
final class Version20210223153349 extends AbstractMigration
{
    public function getDescription() : string
    {
        return 'Create FIAS GAR tables';
    }

    public function up(Schema $schema) : void
    {
        $this->addSql('create table fias_gar_addrobj (id numeric(19)  not null constraint fias_gar_addrobj_pkey primary key, objectid numeric(19), objectguid varchar(36) default NULL::character varying, changeid numeric(19), name   varchar(250) default NULL::character varying, typename   varchar(50)  default NULL::character varying, level   varchar(10)  default NULL::character varying, opertypeid   integer, previd  numeric(19), nextid   numeric(19), startdate date, enddate   date, updatedate date, isactive  smallint, isactual smallint)');
        $this->addSql('comment on column fias_gar_addrobj.id is \'Уникальный идентификатор записи. Ключевое поле\'');
        $this->addSql('comment on column fias_gar_addrobj.objectid is \'Глобальный уникальный идентификатор адресного объекта типа INTEGER\'');
        $this->addSql('comment on column fias_gar_addrobj.objectguid is \'Глобальный уникальный идентификатор адресного объекта типа UUID\'');
        $this->addSql('comment on column fias_gar_addrobj.changeid is \'ID изменившей транзакции\'');
        $this->addSql('comment on column fias_gar_addrobj.name is \'Наименование\'');
        $this->addSql('comment on column fias_gar_addrobj.typename is \'Краткое наименование типа объекта\'');
        $this->addSql('comment on column fias_gar_addrobj.level is \'Уровень адресного объекта\'');
        $this->addSql('comment on column fias_gar_addrobj.previd is \'Идентификатор записи связывания с предыдущей исторической записью\'');
        $this->addSql('comment on column fias_gar_addrobj.nextid is \'Идентификатор записи связывания с последующей исторической записью\'');
        $this->addSql('comment on column fias_gar_addrobj.opertypeid is \'Статус действия над записью – причина появления записи\'');
        $this->addSql('comment on column fias_gar_addrobj.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_addrobj.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_addrobj.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_addrobj.isactive is \'Признак действующего адресного объекта\'');
        $this->addSql('comment on column fias_gar_addrobj.isactual is \'Статус актуальности адресного объекта ФИАС\'');

        $this->addSql('create table fias_gar_addrobjtypes(id numeric(10)  not null constraint fias_gar_addrobjtypes_pkey primary key,level integer,shortname varchar(50) default NULL::character varying,name   varchar(250) default NULL::character varying,"desc"   varchar(250) default NULL::character varying,startdate date,enddate   date,updatedate date,isactive  boolean)');
        $this->addSql('comment on column fias_gar_addrobjtypes.id is \'Идентификатор записи\'');
        $this->addSql('comment on column fias_gar_addrobjtypes.level is \'Уровень адресного объекта\'');
        $this->addSql('comment on column fias_gar_addrobjtypes.shortname is \'Краткое наименование типа объекта\'');
        $this->addSql('comment on column fias_gar_addrobjtypes.name is \'Полное наименование типа объекта\'');
        $this->addSql('comment on column fias_gar_addrobjtypes.desc is \'Описание\'');
        $this->addSql('comment on column fias_gar_addrobjtypes.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_addrobjtypes.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_addrobjtypes.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_addrobjtypes.isactive is \'Статус активности\'');

        $this->addSql('create table fias_gar_addrobjdivision(id numeric(19)  not null constraint fias_gar_addrobjdivision_pkey primary key, parentid numeric(19), childid numeric(19), changeid numeric(19))');
        $this->addSql('comment on column fias_gar_addrobjdivision.id is \'Уникальный идентификатор записи. Ключевое поле\'');
        $this->addSql('comment on column fias_gar_addrobjdivision.parentid is \'Родительский ID\'');
        $this->addSql('comment on column fias_gar_addrobjdivision.childid is \'Дочерний ID\'');
        $this->addSql('comment on column fias_gar_addrobjdivision.changeid is \'ID изменившей транзакции\'');


        $this->addSql('create table fias_gar_admhierarchy(id numeric(19)  not null constraint fias_gar_admhierarchy_pkey primary key,objectid numeric(19),parentobjid numeric(19),changeid numeric(19),regioncode varchar(4) default NULL::character varying,areacode varchar(4) default NULL::character varying,citycode varchar(4) default NULL::character varying,placecode varchar(4) default NULL::character varying,plancode varchar(4) default NULL::character varying,streetcode varchar(4) default NULL::character varying,previd numeric(19),nextid numeric(19),updatedate date,startdate date,enddate date,isactive smallint)');
        $this->addSql('comment on column fias_gar_admhierarchy.id is \'Уникальный идентификатор записи. Ключевое поле\'');
        $this->addSql('comment on column fias_gar_admhierarchy.objectid is \'Глобальный уникальный идентификатор объекта\'');
        $this->addSql('comment on column fias_gar_admhierarchy.changeid is \'ID изменившей транзакции\'');
        $this->addSql('comment on column fias_gar_admhierarchy.regioncode is \'Код региона\'');
        $this->addSql('comment on column fias_gar_admhierarchy.areacode is \'Код района\'');
        $this->addSql('comment on column fias_gar_admhierarchy.citycode is \'Код города\'');
        $this->addSql('comment on column fias_gar_admhierarchy.placecode is \'Код населенного пункта\'');
        $this->addSql('comment on column fias_gar_admhierarchy.plancode is \'Код ЭПС\'');
        $this->addSql('comment on column fias_gar_admhierarchy.streetcode is \'Код улицы\'');
        $this->addSql('comment on column fias_gar_admhierarchy.previd is \'Идентификатор записи связывания с предыдущей исторической записью\'');
        $this->addSql('comment on column fias_gar_admhierarchy.nextid is \'Идентификатор записи связывания с последующей исторической записью\'');
        $this->addSql('comment on column fias_gar_admhierarchy.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_admhierarchy.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_admhierarchy.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_admhierarchy.isactive is \'Признак действующего адресного объекта\'');

        $this->addSql('create table fias_gar_apartmenttypes(id numeric(10)  not null constraint fias_gar_apartmenttypes_pkey primary key,name varchar(50) default NULL::character varying,shortname varchar(50) default NULL::character varying,"desc" varchar(250) default NULL::character varying,updatedate date,startdate date,enddate date,isactive boolean)');
        $this->addSql('comment on column fias_gar_apartmenttypes.id is \'Идентификатор типа (ключ)\'');
        $this->addSql('comment on column fias_gar_apartmenttypes.name is \'Наименование\'');
        $this->addSql('comment on column fias_gar_apartmenttypes.shortname is \'Краткое наименование\'');
        $this->addSql('comment on column fias_gar_apartmenttypes.desc is \'Описание\'');
        $this->addSql('comment on column fias_gar_apartmenttypes.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_apartmenttypes.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_apartmenttypes.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_apartmenttypes.isactive is \'Статус активности\'');

        $this->addSql('create table fias_gar_apartments(id numeric(19)  not null constraint fias_gar_apartments_pkey primary key,objectid numeric(19),objectguid varchar(36) default NULL::character varying,changeid numeric(19),number varchar(50) default NULL::character varying,aparttype integer,opertypeid integer,previd  numeric(19),nextid   numeric(19),startdate date,enddate   date,updatedate date,isactive  smallint,isactual smallint)');
        $this->addSql('comment on column fias_gar_apartments.id is \'Уникальный идентификатор записи. Ключевое поле\'');
        $this->addSql('comment on column fias_gar_apartments.objectid is \'Глобальный уникальный идентификатор объекта типа INTEGER\'');
        $this->addSql('comment on column fias_gar_apartments.objectguid is \'Глобальный уникальный идентификатор адресного объекта типа UUID\'');
        $this->addSql('comment on column fias_gar_apartments.changeid is \'ID изменившей транзакции\'');
        $this->addSql('comment on column fias_gar_apartments.number is \'Номер комнаты\'');
        $this->addSql('comment on column fias_gar_apartments.aparttype is \'Тип комнаты\'');
        $this->addSql('comment on column fias_gar_apartments.opertypeid is \'Статус действия над записью – причина появления записи\'');
        $this->addSql('comment on column fias_gar_apartments.previd is \'Идентификатор записи связывания с предыдущей исторической записью\'');
        $this->addSql('comment on column fias_gar_apartments.nextid is \'Идентификатор записи связывания с последующей исторической записью\'');
        $this->addSql('comment on column fias_gar_apartments.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_apartments.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_apartments.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_apartments.isactive is \'Признак действующего адресного объекта\'');
        $this->addSql('comment on column fias_gar_apartments.isactual is \'Статус актуальности адресного объекта ФИАС\'');

        $this->addSql('create table fias_gar_carplaces(id numeric(19)  not null constraint fias_gar_carplaces_pkey primary key,objectid numeric(19),objectguid varchar(36) default NULL::character varying,changeid numeric(19),number varchar(50) default NULL::character varying,opertypeid integer,previd  numeric(19),nextid   numeric(19),startdate date,enddate   date,updatedate date,isactive  smallint,isactual smallint)');
        $this->addSql('comment on column fias_gar_carplaces.id is \'Уникальный идентификатор записи. Ключевое поле\'');
        $this->addSql('comment on column fias_gar_carplaces.objectid is \'Глобальный уникальный идентификатор объекта типа INTEGER\'');
        $this->addSql('comment on column fias_gar_carplaces.objectguid is \'Глобальный уникальный идентификатор адресного объекта типа UUID\'');
        $this->addSql('comment on column fias_gar_carplaces.changeid is \'ID изменившей транзакции\'');
        $this->addSql('comment on column fias_gar_carplaces.number is \'Номер машиноместа\'');
        $this->addSql('comment on column fias_gar_carplaces.opertypeid is \'Статус действия над записью – причина появления записи\'');
        $this->addSql('comment on column fias_gar_carplaces.previd is \'Идентификатор записи связывания с предыдущей исторической записью\'');
        $this->addSql('comment on column fias_gar_carplaces.nextid is \'Идентификатор записи связывания с последующей исторической записью\'');
        $this->addSql('comment on column fias_gar_carplaces.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_carplaces.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_carplaces.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_carplaces.isactive is \'Признак действующего адресного объекта\'');
        $this->addSql('comment on column fias_gar_carplaces.isactual is \'Статус актуальности адресного объекта ФИАС\'');

        $this->addSql('create table fias_gar_changehistory(changeid numeric(19),objectid numeric(19),adrobjectid varchar(36) default NULL::character varying,opertypeid numeric(10),ndocid  numeric(19),changedate date)');
        $this->addSql('comment on column fias_gar_changehistory.changeid is \'ID изменившей транзакции\'');
        $this->addSql('comment on column fias_gar_changehistory.objectid is \'Уникальный ID объекта\'');
        $this->addSql('comment on column fias_gar_changehistory.adrobjectid is \'Уникальный ID изменившей транзакции (GUID)\'');
        $this->addSql('comment on column fias_gar_changehistory.opertypeid is \'Тип операции\'');
        $this->addSql('comment on column fias_gar_changehistory.ndocid is \'ID документа\'');
        $this->addSql('comment on column fias_gar_changehistory.changedate is \'Дата изменения\'');

        $this->addSql('create table fias_gar_housetypes(id numeric(19)  not null constraint fias_gar_housetypes_pkey primary key,name varchar(50) default NULL::character varying,shortname varchar(50) default NULL::character varying,"desc" varchar(250) default NULL::character varying,updatedate date,startdate date,enddate date,isactive boolean)');
        $this->addSql('comment on column fias_gar_housetypes.id is \'Идентификатор\'');
        $this->addSql('comment on column fias_gar_housetypes.name is \'Наименование\'');
        $this->addSql('comment on column fias_gar_housetypes.shortname is \'Краткое наименование\'');
        $this->addSql('comment on column fias_gar_housetypes.desc is \'Описание\'');
        $this->addSql('comment on column fias_gar_housetypes.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_housetypes.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_housetypes.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_housetypes.isactive is \'Статус активности\'');

        $this->addSql('create table fias_gar_addhousetypes(id numeric(19) not null constraint fias_gar_addhousetypes_pkey primary key, name varchar(50)  default NULL::character varying,shortname  varchar(50)  default NULL::character varying,"desc" varchar(250) default NULL::character varying,updatedate date,startdate  date,enddate    date,isactive   boolean)');
        $this->addSql('comment on column fias_gar_addhousetypes.id is \'Идентификатор\'');
        $this->addSql('comment on column fias_gar_addhousetypes.name is \'Наименование\'');
        $this->addSql('comment on column fias_gar_addhousetypes.shortname is \'Краткое наименование\'');
        $this->addSql('comment on column fias_gar_addhousetypes."desc" is \'Описание\'');
        $this->addSql('comment on column fias_gar_addhousetypes.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_addhousetypes.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_addhousetypes.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_addhousetypes.isactive is \'Статус активности\'');

        $this->addSql('create table fias_gar_houses(id numeric(19)  not null constraint fias_gar_houses_pkey primary key,objectid numeric(19),objectguid varchar(36) default NULL::character varying,changeid numeric(19),housenum varchar(50) default NULL::character varying,addnum1 varchar(50) default NULL::character varying,addnum2 varchar(50) default NULL::character varying,housetype integer,addtype1 integer,addtype2 integer,opertypeid integer,previd  numeric(19),nextid   numeric(19),startdate date,enddate   date,updatedate date,isactive  smallint,isactual smallint)');
        $this->addSql('comment on column fias_gar_houses.id is \'Уникальный идентификатор записи. Ключевое поле\'');
        $this->addSql('comment on column fias_gar_houses.objectid is \'Глобальный уникальный идентификатор объекта типа INTEGER\'');
        $this->addSql('comment on column fias_gar_houses.objectguid is \'Глобальный уникальный идентификатор адресного объекта типа UUID\'');
        $this->addSql('comment on column fias_gar_houses.changeid is \'ID изменившей транзакции\'');
        $this->addSql('comment on column fias_gar_houses.housenum is \'Основной номер дома\'');
        $this->addSql('comment on column fias_gar_houses.addnum1 is \'Дополнительный номер дома 1\'');
        $this->addSql('comment on column fias_gar_houses.addnum2 is \'Дополнительный номер дома 2\'');
        $this->addSql('comment on column fias_gar_houses.housetype is \'Основной тип дома\'');
        $this->addSql('comment on column fias_gar_houses.addtype1 is \'Дополнительный тип дома 1\'');
        $this->addSql('comment on column fias_gar_houses.addtype2 is \'Дополнительный тип дома 2\'');
        $this->addSql('comment on column fias_gar_houses.opertypeid is \'Статус действия над записью – причина появления записи\'');
        $this->addSql('comment on column fias_gar_houses.previd is \'Идентификатор записи связывания с предыдущей исторической записью\'');
        $this->addSql('comment on column fias_gar_houses.nextid is \'Идентификатор записи связывания с последующей исторической записью\'');
        $this->addSql('comment on column fias_gar_houses.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_houses.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_houses.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_houses.isactive is \'Признак действующего адресного объекта\'');
        $this->addSql('comment on column fias_gar_houses.isactual is \'Статус актуальности адресного объекта ФИАС\'');

        $this->addSql('create table fias_gar_munhierarchy(id numeric(19)  not null constraint fias_gar_munhierarchy_pkey primary key,objectid numeric(19),parentobjid numeric(19),changeid numeric(19),oktmo varchar(11) default NULL::character varying,previd  numeric(19),nextid   numeric(19),startdate date,enddate   date,updatedate date,isactive  smallint)');
        $this->addSql('comment on column fias_gar_munhierarchy.id is \'Уникальный идентификатор записи. Ключевое поле\'');
        $this->addSql('comment on column fias_gar_munhierarchy.objectid is \'Глобальный уникальный идентификатор адресного объекта\'');
        $this->addSql('comment on column fias_gar_munhierarchy.parentobjid is \'Идентификатор родительского объекта\'');
        $this->addSql('comment on column fias_gar_munhierarchy.changeid is \'ID изменившей транзакции\'');
        $this->addSql('comment on column fias_gar_munhierarchy.oktmo is \'Код ОКТМО\'');
        $this->addSql('comment on column fias_gar_munhierarchy.previd is \'Идентификатор записи связывания с предыдущей исторической записью\'');
        $this->addSql('comment on column fias_gar_munhierarchy.nextid is \'Идентификатор записи связывания с последующей исторической записью\'');
        $this->addSql('comment on column fias_gar_munhierarchy.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_munhierarchy.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_munhierarchy.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_munhierarchy.isactive is \'Признак действующего адресного объекта\'');

        $this->addSql('create table fias_gar_normativedocs(id numeric(19) not null constraint fias_gar_normativedocs_pkey primary key,name text,date date,number varchar(150) default NULL::character varying,type numeric(10),kind numeric(10),updatedate date,orgname varchar(255) default NULL::character varying,regnum varchar(100) default NULL::character varying,regdate date,accdate date,comment text)');
        $this->addSql('comment on column fias_gar_normativedocs.id is \'Уникальный идентификатор документа\'');
        $this->addSql('comment on column fias_gar_normativedocs.name is \'Наименование документа\'');
        $this->addSql('comment on column fias_gar_normativedocs.date is \'Дата документа\'');
        $this->addSql('comment on column fias_gar_normativedocs.number is \'Номер документа\'');
        $this->addSql('comment on column fias_gar_normativedocs.type is \'Тип документа\'');
        $this->addSql('comment on column fias_gar_normativedocs.kind is \'Вид документа\'');
        $this->addSql('comment on column fias_gar_normativedocs.updatedate is \'Дата обновления\'');
        $this->addSql('comment on column fias_gar_normativedocs.orgname is \'Наименование органа создвшего нормативный документ\'');
        $this->addSql('comment on column fias_gar_normativedocs.regnum is \'Номер государственной регистрации\'');
        $this->addSql('comment on column fias_gar_normativedocs.regdate is \'Дата государственной регистрации\'');
        $this->addSql('comment on column fias_gar_normativedocs.accdate is \'Дата вступления в силу нормативного документа\'');
        $this->addSql('comment on column fias_gar_normativedocs.comment is \'Комментарий\'');

        $this->addSql('create table fias_gar_normativedocskinds(id integer not null constraint fias_gar_normativedocskinds_pkey primary key,name text)');
        $this->addSql('comment on column fias_gar_normativedocskinds.id is \'Идентификатор записи\'');
        $this->addSql('comment on column fias_gar_normativedocskinds.name is \'Наименование\'');

        $this->addSql('create table fias_gar_normativedocstypes(id integer not null constraint fias_gar_normativedocstypes_pkey primary key,name text,startdate date,enddate   date)');
        $this->addSql('comment on column fias_gar_normativedocstypes.id is \'Идентификатор записи\'');
        $this->addSql('comment on column fias_gar_normativedocstypes.name is \'Наименование\'');
        $this->addSql('comment on column fias_gar_normativedocstypes.startdate is \'Дата начала действия записи\'');
        $this->addSql('comment on column fias_gar_normativedocstypes.enddate is \'Дата окончания действия записи\'');


        $this->addSql('create table fias_gar_objectlevels(level integer not null constraint fias_gar_objectlevels_pkey primary key,name varchar(250) default NULL::character varying,shortname varchar(50) default NULL::character varying,startdate date,enddate   date,updatedate date,isactive  boolean)');
        $this->addSql('comment on column fias_gar_objectlevels.level is \'Уникальный идентификатор записи. Ключевое поле. Номер уровня объекта\'');
        $this->addSql('comment on column fias_gar_objectlevels.name is \'Наименование\'');
        $this->addSql('comment on column fias_gar_objectlevels.shortname is \'Краткое наименование\'');
        $this->addSql('comment on column fias_gar_objectlevels.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_objectlevels.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_objectlevels.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_objectlevels.isactive is \'Признак действующего адресного объекта\'');

        $this->addSql('create table fias_gar_operationtypes(id integer not null constraint fias_gar_operationtypes_pkey primary key,name varchar(100) default NULL::character varying,shortname varchar(100) default NULL::character varying,"desc" varchar(250) default NULL::character varying,startdate date,enddate   date,updatedate date,isactive  boolean)');
        $this->addSql('comment on column fias_gar_operationtypes.id is \'Идентификатор статуса (ключ)\'');
        $this->addSql('comment on column fias_gar_operationtypes.name is \'Наименование\'');
        $this->addSql('comment on column fias_gar_operationtypes.shortname is \'Краткое наименование\'');
        $this->addSql('comment on column fias_gar_operationtypes.desc is \'Описание\'');
        $this->addSql('comment on column fias_gar_operationtypes.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_operationtypes.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_operationtypes.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_operationtypes.isactive is \'Статус активности\'');

        $this->addSql('create table fias_gar_param(id numeric(19) not null constraint fias_gar_param_pkey primary key,objectid numeric(19) not null,changeid numeric(19),changeidend numeric(19) not null,typeid integer not null,value text not null,startdate date not null,enddate   date not null,updatedate date not null)');
        $this->addSql('comment on column fias_gar_param.id is \'Идентификатор записи\'');
        $this->addSql('comment on column fias_gar_param.objectid is \'Глобальный уникальный идентификатор адресного объекта\'');
        $this->addSql('comment on column fias_gar_param.changeid is \'ID изменившей транзакции\'');
        $this->addSql('comment on column fias_gar_param.changeidend is \'ID завершившей транзакции\'');
        $this->addSql('comment on column fias_gar_param.typeid is \'Тип параметра\'');
        $this->addSql('comment on column fias_gar_param.value is \'Значение параметра\'');
        $this->addSql('comment on column fias_gar_param.startdate is \'Дата начала действия записи\'');
        $this->addSql('comment on column fias_gar_param.enddate is \'Дата окончания действия записи\'');
        $this->addSql('comment on column fias_gar_param.updatedate is \'Дата внесения (обновления) записи\'');

        $this->addSql('create table fias_gar_paramtypes(id integer not null constraint fias_gar_paramtypes_pkey primary key,name varchar(50) default NULL::character varying,code varchar(50) default NULL::character varying,"desc" varchar(120) default NULL::character varying,startdate date,enddate   date,updatedate date,isactive  boolean)');
        $this->addSql('comment on column fias_gar_paramtypes.id is \'Идентификатор записи\'');
        $this->addSql('comment on column fias_gar_paramtypes.name is \'Наименование\'');
        $this->addSql('comment on column fias_gar_paramtypes.code is \'Краткое наименование\'');
        $this->addSql('comment on column fias_gar_paramtypes.desc is \'Описание\'');
        $this->addSql('comment on column fias_gar_paramtypes.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_paramtypes.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_paramtypes.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_paramtypes.isactive is \'Статус активности\'');

        $this->addSql('create table fias_gar_reestrobjects(objectid numeric(19) not null constraint fias_gar_reestrobjects_pkey primary key,createdate date,changeid numeric(19),levelid numeric(10),updatedate date,objectguid varchar(36) default NULL::character varying,isactive  smallint)');
        $this->addSql('comment on column fias_gar_reestrobjects.objectid is \'Уникальный идентификатор объекта\'');
        $this->addSql('comment on column fias_gar_reestrobjects.createdate is \'Дата создания\'');
        $this->addSql('comment on column fias_gar_reestrobjects.changeid is \'ID изменившей транзакции\'');
        $this->addSql('comment on column fias_gar_reestrobjects.levelid is \'Уровень объекта\'');
        $this->addSql('comment on column fias_gar_reestrobjects.updatedate is \'Дата обновления\'');
        $this->addSql('comment on column fias_gar_reestrobjects.objectguid is \'GUID объекта\'');
        $this->addSql('comment on column fias_gar_reestrobjects.isactive is \'Признак действующего объекта\'');

        $this->addSql('create table fias_gar_roomtypes(id numeric(10) not null constraint fias_gar_roomtypes_pkey primary key,name varchar(100) default NULL::character varying,shortname varchar(50) default NULL::character varying,"desc" varchar(250) default NULL::character varying,startdate date,enddate   date,updatedate date,isactive  boolean)');
        $this->addSql('comment on column fias_gar_roomtypes.id is \'Идентификатор типа (ключ)\'');
        $this->addSql('comment on column fias_gar_roomtypes.name is \'Наименование\'');
        $this->addSql('comment on column fias_gar_roomtypes.shortname is \'Краткое наименование\'');
        $this->addSql('comment on column fias_gar_roomtypes.desc is \'Описание\'');
        $this->addSql('comment on column fias_gar_roomtypes.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_roomtypes.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_roomtypes.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_roomtypes.isactive is \'Статус активности\'');

        $this->addSql('create table fias_gar_rooms(id numeric(19) not null constraint fias_gar_rooms_pkey primary key,objectid numeric(19),objectguid varchar(36) default NULL::character varying,changeid numeric(19),number varchar(50) default NULL::character varying,roomtype integer,opertypeid integer,previd  numeric(19),nextid   numeric(19),startdate date,enddate   date,updatedate date,isactive  smallint,isactual smallint)');
        $this->addSql('comment on column fias_gar_rooms.id is \'Уникальный идентификатор записи. Ключевое поле\'');
        $this->addSql('comment on column fias_gar_rooms.objectid is \'Глобальный уникальный идентификатор объекта типа INTEGER\'');
        $this->addSql('comment on column fias_gar_rooms.objectguid is \'Глобальный уникальный идентификатор адресного объекта типа UUID\'');
        $this->addSql('comment on column fias_gar_rooms.changeid is \'ID изменившей транзакции\'');
        $this->addSql('comment on column fias_gar_rooms.number is \'Номер комнаты или офиса\'');
        $this->addSql('comment on column fias_gar_rooms.roomtype is \'Тип комнаты или офиса\'');
        $this->addSql('comment on column fias_gar_rooms.opertypeid is \'Статус действия над записью – причина появления записи\'');
        $this->addSql('comment on column fias_gar_rooms.previd is \'Идентификатор записи связывания с предыдущей исторической записью\'');
        $this->addSql('comment on column fias_gar_rooms.nextid is \'Идентификатор записи связывания с последующей исторической записью\'');
        $this->addSql('comment on column fias_gar_rooms.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_rooms.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_rooms.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_rooms.isactive is \'Признак действующего адресного объекта\'');
        $this->addSql('comment on column fias_gar_rooms.isactual is \'Статус актуальности адресного объекта ФИАС\'');

        $this->addSql('create table fias_gar_steads(id numeric(19) not null constraint fias_gar_steads_pkey primary key,objectid numeric(19),objectguid varchar(36) default NULL::character varying,changeid numeric(19),number varchar(250) default NULL::character varying,opertypeid integer,previd  numeric(19),nextid   numeric(19),startdate date,enddate   date,updatedate date,isactive  smallint,isactual smallint)');
        $this->addSql('comment on column fias_gar_steads.id is \'Уникальный идентификатор записи. Ключевое поле\'');
        $this->addSql('comment on column fias_gar_steads.objectid is \'Глобальный уникальный идентификатор объекта типа INTEGER\'');
        $this->addSql('comment on column fias_gar_steads.objectguid is \'Глобальный уникальный идентификатор адресного объекта типа UUID\'');
        $this->addSql('comment on column fias_gar_steads.changeid is \'ID изменившей транзакции\'');
        $this->addSql('comment on column fias_gar_steads.number is \'Номер земельного участка\'');
        $this->addSql('comment on column fias_gar_steads.opertypeid is \'Статус действия над записью – причина появления записи\'');
        $this->addSql('comment on column fias_gar_steads.previd is \'Идентификатор записи связывания с предыдущей исторической записью\'');
        $this->addSql('comment on column fias_gar_steads.nextid is \'Идентификатор записи связывания с последующей исторической записью\'');
        $this->addSql('comment on column fias_gar_steads.startdate is \'Начало действия записи\'');
        $this->addSql('comment on column fias_gar_steads.enddate is \'Окончание действия записи\'');
        $this->addSql('comment on column fias_gar_steads.updatedate is \'Дата внесения (обновления) записи\'');
        $this->addSql('comment on column fias_gar_steads.isactive is \'Признак действующего адресного объекта\'');
        $this->addSql('comment on column fias_gar_steads.isactual is \'Статус актуальности адресного объекта ФИАС\'');

    }

    public function down(Schema $schema) : void
    {
        $this->addSql('DROP TABLE fias_gar_addrobj');
        $this->addSql('DROP TABLE fias_gar_addrobjtypes');
        $this->addSql('DROP TABLE fias_gar_addrobjdivision');
        $this->addSql('DROP TABLE fias_gar_steads');
        $this->addSql('DROP TABLE fias_gar_rooms');
        $this->addSql('DROP TABLE fias_gar_roomtypes');
        $this->addSql('DROP TABLE fias_gar_reestrobjects');
        $this->addSql('DROP TABLE fias_gar_paramtypes');
        $this->addSql('DROP TABLE fias_gar_param');
        $this->addSql('DROP TABLE fias_gar_operationtypes');
        $this->addSql('DROP TABLE fias_gar_objectlevels');
        $this->addSql('DROP TABLE fias_gar_normativedocstypes');
        $this->addSql('DROP TABLE fias_gar_normativedocskinds');
        $this->addSql('DROP TABLE fias_gar_normativedocs');
        $this->addSql('DROP TABLE fias_gar_munhierarchy');
        $this->addSql('DROP TABLE fias_gar_houses');
        $this->addSql('DROP TABLE fias_gar_housetypes');
        $this->addSql('DROP TABLE fias_gar_changehistory');
        $this->addSql('DROP TABLE fias_gar_carplaces');
        $this->addSql('DROP TABLE fias_gar_apartments');
        $this->addSql('DROP TABLE fias_gar_apartmenttypes');
        $this->addSql('DROP TABLE fias_gar_admhierarchy');
    }
}



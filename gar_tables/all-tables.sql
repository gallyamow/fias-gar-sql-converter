create table gar.houses
(
    id         BIGINT  not null primary key,
    objectid   BIGINT  not null,
    objectguid UUID    not null,
    changeid   BIGINT  not null,
    housenum   TEXT,
    addnum1    TEXT,
    addnum2    TEXT,
    housetype,
    addtype1   INTEGER,
    addtype2   INTEGER,
    opertypeid INTEGER not null,
    previd     BIGINT,
    nextid     BIGINT,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactual   INTEGER not null,
    isactive   INTEGER not null

);

comment on column gar.houses.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.houses.objectid is 'Глобальный уникальный идентификатор объекта типа INTEGER';
comment on column gar.houses.objectguid is 'Глобальный уникальный идентификатор адресного объекта типа UUID';
comment on column gar.houses.changeid is 'ID изменившей транзакции';
comment on column gar.houses.housenum is 'Основной номер дома';
comment on column gar.houses.addnum1 is 'Дополнительный номер дома 1';
comment on column gar.houses.addnum2 is 'Дополнительный номер дома 1';
comment on column gar.houses.housetype is 'Основной тип дома';
comment on column gar.houses.addtype1 is 'Дополнительный тип дома 1';
comment on column gar.houses.addtype2 is 'Дополнительный тип дома 2';
comment on column gar.houses.opertypeid is 'Статус действия над записью – причина появления записи';
comment on column gar.houses.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.houses.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.houses.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.houses.startdate is 'Начало действия записи';
comment on column gar.houses.enddate is 'Окончание действия записи';
comment on column gar.houses.isactual is 'Статус актуальности адресного объекта ФИАС';
comment on column gar.houses.isactive is 'Признак действующего адресного объекта';


create table gar.change_history
(
    changeid    BIGINT  not null,
    objectid    BIGINT  not null,
    adrobjectid TEXT    not null,
    opertypeid  INTEGER not null,
    ndocid      BIGINT,
    changedate  DATE    not null

);

comment on column gar.change_history.changeid is 'ID изменившей транзакции';
comment on column gar.change_history.objectid is 'Уникальный ID объекта';
comment on column gar.change_history.adrobjectid is 'Уникальный ID изменившей транзакции (GUID)';
comment on column gar.change_history.opertypeid is 'Тип операции';
comment on column gar.change_history.ndocid is 'ID документа';
comment on column gar.change_history.changedate is 'Дата изменения';


create table gar.apartment_types
(
    id         INTEGER not null primary key,
    name       TEXT    not null,
    shortname  TEXT,
    desc       TEXT,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactive   BOOLEAN not null

);

comment on column gar.apartment_types.id is 'Идентификатор типа (ключ)';
comment on column gar.apartment_types.name is 'Наименование';
comment on column gar.apartment_types.shortname is 'Краткое наименование';
comment on column gar.apartment_types.desc is 'Описание';
comment on column gar.apartment_types.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.apartment_types.startdate is 'Начало действия записи';
comment on column gar.apartment_types.enddate is 'Окончание действия записи';
comment on column gar.apartment_types.isactive is 'Статус активности';


create table gar.operation_types
(
    id                 not null primary key,
    name       TEXT    not null,
    shortname  TEXT,
    desc       TEXT,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactive   BOOLEAN not null

);

comment on column gar.operation_types.id is 'Идентификатор статуса (ключ)';
comment on column gar.operation_types.name is 'Наименование';
comment on column gar.operation_types.shortname is 'Краткое наименование';
comment on column gar.operation_types.desc is 'Описание';
comment on column gar.operation_types.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.operation_types.startdate is 'Начало действия записи';
comment on column gar.operation_types.enddate is 'Окончание действия записи';
comment on column gar.operation_types.isactive is 'Статус активности';


create table gar.steads
(
    id         INTEGER not null primary key,
    objectid   INTEGER not null,
    objectguid UUID    not null,
    changeid   INTEGER not null,
    number     TEXT    not null,
    opertypeid TEXT    not null,
    previd     INTEGER,
    nextid     INTEGER,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactual   INTEGER not null,
    isactive   INTEGER not null

);

comment on column gar.steads.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.steads.objectid is 'Глобальный уникальный идентификатор объекта типа INTEGER';
comment on column gar.steads.objectguid is 'Глобальный уникальный идентификатор адресного объекта типа UUID';
comment on column gar.steads.changeid is 'ID изменившей транзакции';
comment on column gar.steads.number is 'Номер земельного участка';
comment on column gar.steads.opertypeid is 'Статус действия над записью – причина появления записи';
comment on column gar.steads.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.steads.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.steads.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.steads.startdate is 'Начало действия записи';
comment on column gar.steads.enddate is 'Окончание действия записи';
comment on column gar.steads.isactual is 'Статус актуальности адресного объекта ФИАС';
comment on column gar.steads.isactive is 'Признак действующего адресного объекта';


create table gar.normative_docs_types
(

);



create table gar.rooms
(
    id         BIGINT  not null primary key,
    objectid   BIGINT  not null,
    objectguid UUID    not null,
    changeid   BIGINT  not null,
    number     TEXT    not null,
    roomtype   INTEGER not null,
    opertypeid INTEGER not null,
    previd     BIGINT,
    nextid     BIGINT,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactual   INTEGER not null,
    isactive   INTEGER not null

);

comment on column gar.rooms.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.rooms.objectid is 'Глобальный уникальный идентификатор объекта типа INTEGER';
comment on column gar.rooms.objectguid is 'Глобальный уникальный идентификатор адресного объекта типа UUID';
comment on column gar.rooms.changeid is 'ID изменившей транзакции';
comment on column gar.rooms.number is 'Номер комнаты или офиса';
comment on column gar.rooms.roomtype is 'Тип комнаты или офиса';
comment on column gar.rooms.opertypeid is 'Статус действия над записью – причина появления записи';
comment on column gar.rooms.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.rooms.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.rooms.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.rooms.startdate is 'Начало действия записи';
comment on column gar.rooms.enddate is 'Окончание действия записи';
comment on column gar.rooms.isactual is 'Статус актуальности адресного объекта ФИАС';
comment on column gar.rooms.isactive is 'Признак действующего адресного объекта';


create table gar.addr_obj_types
(
    id         INTEGER not null primary key,
    level      INTEGER not null,
    shortname  TEXT    not null,
    name       TEXT    not null,
    desc       TEXT,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactive   BOOLEAN not null

);

comment on column gar.addr_obj_types.id is 'Идентификатор записи';
comment on column gar.addr_obj_types.level is 'Уровень адресного объекта';
comment on column gar.addr_obj_types.shortname is 'Краткое наименование типа объекта';
comment on column gar.addr_obj_types.name is 'Полное наименование типа объекта';
comment on column gar.addr_obj_types.desc is 'Описание';
comment on column gar.addr_obj_types.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.addr_obj_types.startdate is 'Начало действия записи';
comment on column gar.addr_obj_types.enddate is 'Окончание действия записи';
comment on column gar.addr_obj_types.isactive is 'Статус активности';


create table gar.house_types
(
    id         INTEGER not null primary key,
    name       TEXT    not null,
    shortname  TEXT,
    desc       TEXT,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactive   BOOLEAN not null

);

comment on column gar.house_types.id is 'Идентификатор';
comment on column gar.house_types.name is 'Наименование';
comment on column gar.house_types.shortname is 'Краткое наименование';
comment on column gar.house_types.desc is 'Описание';
comment on column gar.house_types.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.house_types.startdate is 'Начало действия записи';
comment on column gar.house_types.enddate is 'Окончание действия записи';
comment on column gar.house_types.isactive is 'Статус активности';


create table gar.normative_docs_kinds
(

);



create table gar.addr_obj
(
    id         BIGINT  not null primary key,
    objectid   BIGINT  not null,
    objectguid UUID    not null,
    changeid   BIGINT  not null,
    name       TEXT    not null,
    typename   TEXT    not null,
    level      TEXT    not null,
    opertypeid INTEGER not null,
    previd     BIGINT,
    nextid     BIGINT,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactual   INTEGER not null,
    isactive   INTEGER not null

);

comment on column gar.addr_obj.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.addr_obj.objectid is 'Глобальный уникальный идентификатор адресного объекта типа INTEGER';
comment on column gar.addr_obj.objectguid is 'Глобальный уникальный идентификатор адресного объекта типа UUID';
comment on column gar.addr_obj.changeid is 'ID изменившей транзакции';
comment on column gar.addr_obj.name is 'Наименование';
comment on column gar.addr_obj.typename is 'Краткое наименование типа объекта';
comment on column gar.addr_obj.level is 'Уровень адресного объекта';
comment on column gar.addr_obj.opertypeid is 'Статус действия над записью – причина появления записи';
comment on column gar.addr_obj.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.addr_obj.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.addr_obj.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.addr_obj.startdate is 'Начало действия записи';
comment on column gar.addr_obj.enddate is 'Окончание действия записи';
comment on column gar.addr_obj.isactual is 'Статус актуальности адресного объекта ФИАС';
comment on column gar.addr_obj.isactive is 'Признак действующего адресного объекта';


create table gar.carplaces
(
    id         BIGINT  not null primary key,
    objectid   BIGINT  not null,
    objectguid UUID    not null,
    changeid   BIGINT  not null,
    number     TEXT    not null,
    opertypeid INTEGER not null,
    previd     BIGINT,
    nextid     BIGINT,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactual   INTEGER not null,
    isactive   INTEGER not null

);

comment on column gar.carplaces.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.carplaces.objectid is 'Глобальный уникальный идентификатор объекта типа INTEGER';
comment on column gar.carplaces.objectguid is 'Глобальный уникальный идентификатор адресного объекта типа UUID';
comment on column gar.carplaces.changeid is 'ID изменившей транзакции';
comment on column gar.carplaces.number is 'Номер машиноместа';
comment on column gar.carplaces.opertypeid is 'Статус действия над записью – причина появления записи';
comment on column gar.carplaces.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.carplaces.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.carplaces.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.carplaces.startdate is 'Начало действия записи';
comment on column gar.carplaces.enddate is 'Окончание действия записи';
comment on column gar.carplaces.isactual is 'Статус актуальности адресного объекта ФИАС';
comment on column gar.carplaces.isactive is 'Признак действующего адресного объекта';


create table gar.addr_obj_division
(
    id       BIGINT not null primary key,
    parentid BIGINT not null,
    childid  BIGINT not null,
    changeid        not null

);

comment on column gar.addr_obj_division.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.addr_obj_division.parentid is 'Родительский ID';
comment on column gar.addr_obj_division.childid is 'Дочерний ID';
comment on column gar.addr_obj_division.changeid is 'ID изменившей транзакции';


create table gar.normative_docs
(
    id         BIGINT  not null primary key,
    name       TEXT    not null,
    date       DATE    not null,
    number     TEXT    not null,
    type       INTEGER not null,
    kind       INTEGER not null,
    updatedate DATE    not null,
    orgname    TEXT,
    regnum     TEXT,
    regdate    DATE,
    accdate    DATE,
    comment    TEXT
);

comment on column gar.normative_docs.id is 'Уникальный идентификатор документа';
comment on column gar.normative_docs.name is 'Наименование документа';
comment on column gar.normative_docs.date is 'Дата документа';
comment on column gar.normative_docs.number is 'Номер документа';
comment on column gar.normative_docs.type is 'Тип документа';
comment on column gar.normative_docs.kind is 'Вид документа';
comment on column gar.normative_docs.updatedate is 'Дата обновления';
comment on column gar.normative_docs.orgname is 'Наименование органа создвшего нормативный документ';
comment on column gar.normative_docs.regnum is 'Номер государственной регистрации';
comment on column gar.normative_docs.regdate is 'Дата государственной регистрации';
comment on column gar.normative_docs.accdate is 'Дата вступления в силу нормативного документа';
comment on column gar.normative_docs.comment is 'Комментарий';


create table gar.mun_hierarchy
(
    id          BIGINT  not null primary key,
    objectid    BIGINT  not null,
    parentobjid BIGINT,
    changeid    BIGINT  not null,
    oktmo       TEXT,
    previd      BIGINT,
    nextid      BIGINT,
    updatedate  DATE    not null,
    startdate   DATE    not null,
    enddate     DATE    not null,
    isactive    INTEGER not null

);

comment on column gar.mun_hierarchy.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.mun_hierarchy.objectid is 'Глобальный уникальный идентификатор адресного объекта ';
comment on column gar.mun_hierarchy.parentobjid is 'Идентификатор родительского объекта';
comment on column gar.mun_hierarchy.changeid is 'ID изменившей транзакции';
comment on column gar.mun_hierarchy.oktmo is 'Код ОКТМО';
comment on column gar.mun_hierarchy.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.mun_hierarchy.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.mun_hierarchy.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.mun_hierarchy.startdate is 'Начало действия записи';
comment on column gar.mun_hierarchy.enddate is 'Окончание действия записи';
comment on column gar.mun_hierarchy.isactive is 'Признак действующего адресного объекта';


create table gar.param_types
(
    id         INTEGER not null primary key,
    name       TEXT    not null,
    code       TEXT    not null,
    desc       TEXT,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactive   BOOLEAN not null

);

comment on column gar.param_types.id is 'Идентификатор типа параметра (ключ)';
comment on column gar.param_types.name is 'Наименование';
comment on column gar.param_types.code is 'Краткое наименование';
comment on column gar.param_types.desc is 'Описание';
comment on column gar.param_types.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.param_types.startdate is 'Начало действия записи';
comment on column gar.param_types.enddate is 'Окончание действия записи';
comment on column gar.param_types.isactive is 'Статус активности';


create table gar.adm_hierarchy
(
    id          BIGINT  not null primary key,
    objectid    BIGINT  not null,
    parentobjid BIGINT,
    changeid    BIGINT  not null,
    regioncode  TEXT,
    areacode    TEXT,
    citycode    TEXT,
    placecode   TEXT,
    plancode    TEXT,
    streetcode  TEXT,
    previd      BIGINT,
    nextid      BIGINT,
    updatedate  DATE    not null,
    startdate   DATE    not null,
    enddate     DATE    not null,
    isactive    INTEGER not null

);

comment on column gar.adm_hierarchy.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.adm_hierarchy.objectid is 'Глобальный уникальный идентификатор объекта';
comment on column gar.adm_hierarchy.parentobjid is 'Идентификатор родительского объекта';
comment on column gar.adm_hierarchy.changeid is 'ID изменившей транзакции';
comment on column gar.adm_hierarchy.regioncode is 'Код региона';
comment on column gar.adm_hierarchy.areacode is 'Код района';
comment on column gar.adm_hierarchy.citycode is 'Код города';
comment on column gar.adm_hierarchy.placecode is 'Код населенного пункта';
comment on column gar.adm_hierarchy.plancode is 'Код ЭПС';
comment on column gar.adm_hierarchy.streetcode is 'Код улицы';
comment on column gar.adm_hierarchy.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.adm_hierarchy.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.adm_hierarchy.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.adm_hierarchy.startdate is 'Начало действия записи';
comment on column gar.adm_hierarchy.enddate is 'Окончание действия записи';
comment on column gar.adm_hierarchy.isactive is 'Признак действующего адресного объекта';


create table gar.param
(
    id          BIGINT  not null primary key,
    objectid    BIGINT  not null,
    changeid    BIGINT,
    changeidend BIGINT  not null,
    typeid      INTEGER not null,
    value       TEXT    not null,
    updatedate  DATE    not null,
    startdate   DATE    not null,
    enddate     DATE    not null

);

comment on column gar.param.id is 'Идентификатор записи';
comment on column gar.param.objectid is 'Глобальный уникальный идентификатор адресного объекта ';
comment on column gar.param.changeid is 'ID изменившей транзакции';
comment on column gar.param.changeidend is 'ID завершившей транзакции';
comment on column gar.param.typeid is 'Тип параметра';
comment on column gar.param.value is 'Значение параметра';
comment on column gar.param.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.param.startdate is 'Дата начала действия записи';
comment on column gar.param.enddate is 'Дата окончания действия записи';


create table gar.apartments
(
    id         BIGINT  not null primary key,
    objectid   BIGINT  not null,
    objectguid UUID    not null,
    changeid   BIGINT  not null,
    number     TEXT    not null,
    aparttype  INTEGER not null,
    opertypeid BIGINT  not null,
    previd     BIGINT,
    nextid     BIGINT,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactual   INTEGER not null,
    isactive   INTEGER not null

);

comment on column gar.apartments.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.apartments.objectid is 'Глобальный уникальный идентификатор объекта типа INTEGER';
comment on column gar.apartments.objectguid is 'Глобальный уникальный идентификатор адресного объекта типа UUID';
comment on column gar.apartments.changeid is 'ID изменившей транзакции';
comment on column gar.apartments.number is 'Номер комнаты';
comment on column gar.apartments.aparttype is 'Тип комнаты';
comment on column gar.apartments.opertypeid is 'Статус действия над записью – причина появления записи';
comment on column gar.apartments.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.apartments.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.apartments.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.apartments.startdate is 'Начало действия записи';
comment on column gar.apartments.enddate is 'Окончание действия записи';
comment on column gar.apartments.isactual is 'Статус актуальности адресного объекта ФИАС';
comment on column gar.apartments.isactive is 'Признак действующего адресного объекта';


create table gar.object_levels
(
    level      INTEGER not null,
    name       TEXT    not null,
    shortname  TEXT,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactive   BOOLEAN not null

);

comment on column gar.object_levels.level is 'Уникальный идентификатор записи. Ключевое поле. Номер уровня объекта';
comment on column gar.object_levels.name is 'Наименование';
comment on column gar.object_levels.shortname is 'Краткое наименование';
comment on column gar.object_levels.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.object_levels.startdate is 'Начало действия записи';
comment on column gar.object_levels.enddate is 'Окончание действия записи';
comment on column gar.object_levels.isactive is 'Признак действующего адресного объекта';


create table gar.reestr_objects
(
    objectid   BIGINT  not null,
    createdate DATE    not null,
    changeid   BIGINT  not null,
    levelid    INTEGER not null,
    updatedate DATE    not null,
    objectguid TEXT    not null,
    isactive   INTEGER not null

);

comment on column gar.reestr_objects.objectid is 'Уникальный идентификатор объекта';
comment on column gar.reestr_objects.createdate is 'Дата создания';
comment on column gar.reestr_objects.changeid is 'ID изменившей транзакции';
comment on column gar.reestr_objects.levelid is 'Уровень объекта';
comment on column gar.reestr_objects.updatedate is 'Дата обновления';
comment on column gar.reestr_objects.objectguid is 'GUID объекта';
comment on column gar.reestr_objects.isactive is 'Признак действующего объекта (1 - действующий, 0 - не действующий)';


create table gar.room_types
(
    id         INTEGER not null primary key,
    name       TEXT    not null,
    shortname  TEXT,
    desc       TEXT,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactive   BOOLEAN not null

);

comment on column gar.room_types.id is 'Идентификатор типа (ключ)';
comment on column gar.room_types.name is 'Наименование';
comment on column gar.room_types.shortname is 'Краткое наименование';
comment on column gar.room_types.desc is 'Описание';
comment on column gar.room_types.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.room_types.startdate is 'Начало действия записи';
comment on column gar.room_types.enddate is 'Окончание действия записи';
comment on column gar.room_types.isactive is 'Статус активности';

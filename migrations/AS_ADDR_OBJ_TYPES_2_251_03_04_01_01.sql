-- for AS_ADDR_OBJ_TYPES_2_251_03_04_01_01
create table gar.addr_obj_types
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

comment on table gar.addr_obj_types is 'Сведения по типам адресных объектов';

comment on column gar.addr_obj_types.id is 'Идентификатор записи';
comment on column gar.addr_obj_types.level is 'Уровень адресного объекта';
comment on column gar.addr_obj_types.shortname is 'Краткое наименование типа объекта';
comment on column gar.addr_obj_types.name is 'Полное наименование типа объекта';
comment on column gar.addr_obj_types.desc is 'Описание';
comment on column gar.addr_obj_types.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.addr_obj_types.startdate is 'Начало действия записи';
comment on column gar.addr_obj_types.enddate is 'Окончание действия записи';
comment on column gar.addr_obj_types.isactive is 'Статус активности';
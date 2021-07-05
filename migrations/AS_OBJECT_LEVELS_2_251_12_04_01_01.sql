create table gar.object_levels
(
    level      integer not null primary key,
    name       varchar not null,
    shortname  varchar,
    updatedate date    not null,
    startdate  date    not null,
    enddate    date    not null,
    isactive   boolean not null
);

comment on table gar.object_levels is 'Сведения по уровням адресных объектов';

comment on column gar.object_levels.level is 'Уникальный идентификатор записи. Ключевое поле. Номер уровня объекта';
comment on column gar.object_levels.name is 'Наименование';
comment on column gar.object_levels.shortname is 'Краткое наименование';
comment on column gar.object_levels.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.object_levels.startdate is 'Дата начала действия записи';
comment on column gar.object_levels.enddate is 'Дата окончания действия записи';
comment on column gar.object_levels.isactive is 'Признак действующего адресного объекта';
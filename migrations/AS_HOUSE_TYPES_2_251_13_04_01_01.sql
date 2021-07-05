create table gar.house_types
(
    id         integer not null primary key,
    name       varchar not null,
    shortname  varchar,
    desc       varchar,
    updatedate date    not null,
    startdate  date    not null,
    enddate    date    not null,
    isactive   boolean not null
);

comment on table gar.house_types is 'Сведения по типам домов';

comment on column gar.house_types.id is 'Идентификатор';
comment on column gar.house_types.name is 'Наименование';
comment on column gar.house_types.shortname is 'Краткое наименование';
comment on column gar.house_types.desc is 'Описание';
comment on column gar.house_types.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.house_types.startdate is 'Начало действия записи';
comment on column gar.house_types.enddate is 'Окончание действия записи';
comment on column gar.house_types.isactive is 'Статус активности';

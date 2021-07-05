create table gar.apartment_types
(
    id         int  not null primary key,
    name       varchar not null,
    shortname  varchar,
    desc       varchar,
    updatedate date    not null,
    startdate  date    not null,
    enddate    date    not null,
    isactive   boolean not null
);

comment on table gar.apartment_types is 'Сведения по типам помещений';

comment on column gar.apartment_types.id is 'Идентификатор типа (ключ)';
comment on column gar.apartment_types.name is 'Наименование';
comment on column gar.apartment_types.shortname is 'Краткое наименование';
comment on column gar.apartment_types.desc is 'Описание';
comment on column gar.apartment_types.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.apartment_types.startdate is 'Начало действия записи';
comment on column gar.apartment_types.enddate is 'Окончание действия записи';
comment on column gar.apartment_types.isactive is 'Статус активности';
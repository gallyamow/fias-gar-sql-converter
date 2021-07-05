create table gar.room_types
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

comment on table gar.room_types is 'Сведения по типам комнат';

comment on column gar.room_types.id is 'Идентификатор типа (ключ)';
comment on column gar.room_types.name is 'Наименование';
comment on column gar.room_types.shortname is 'Краткое наименование';
comment on column gar.room_types.desc is 'Описание';
comment on column gar.room_types.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.room_types.startdate is 'Дата начала действия записи';
comment on column gar.room_types.enddate is 'Дата окончания действия записи';
comment on column gar.room_types.isactive is 'Статус активности';





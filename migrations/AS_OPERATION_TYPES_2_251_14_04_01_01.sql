create table gar.operation_types
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

comment on table gar.operation_types is 'Сведения по статусу действия';

comment on column gar.operation_types.id is 'Идентификатор статуса (ключ)';
comment on column gar.operation_types.name is 'Наименование';
comment on column gar.operation_types.shortname is 'Краткое наименование';
comment on column gar.operation_types.desc is 'Описание';
comment on column gar.operation_types.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.operation_types.startdate is 'Дата начала действия записи';
comment on column gar.operation_types.enddate is 'Дата окончания действия записи';
comment on column gar.operation_types.isactive is 'Статус активности';


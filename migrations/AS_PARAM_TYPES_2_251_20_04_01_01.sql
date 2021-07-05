create table gar.param_types
(
    id         integer not null primary key,
    name       varchar not null,
    code       varchar not null,
    desc       varchar,
    updatedate date    not null,
    startdate  date    not null,
    enddate    date    not null,
    isactive   boolean not null
);

comment on table gar.param_types is 'Сведения по типу параметра';

comment on column gar.param_types.id is 'Идентификатор типа параметра (ключ)';
comment on column gar.param_types.name is 'Наименование';
comment on column gar.param_types.code is 'Краткое наименование';
comment on column gar.param_types.desc is 'Описание';
comment on column gar.param_types.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.param_types.startdate is 'Дата начала действия записи';
comment on column gar.param_types.enddate is 'Дата окончания действия записи';
comment on column gar.param_types.isactive is 'Статус активности';


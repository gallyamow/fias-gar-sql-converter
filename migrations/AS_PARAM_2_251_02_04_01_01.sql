create table gar.param
(
    id          bigint  not null primary key,
    objectid    bigint  not null,
    changeid    bigint,
    changeidend bigint,
    typeid      integer not null,
    value       varchar not null,
    updatedate  date    not null,
    startdate   date    not null,
    enddate     date    not null
);

comment on table gar.param is 'Сведения о классификаторе параметров адресообразующих элементов и объектов недвижимости';

comment on column gar.param.id is 'Идентификатор записи';
comment on column gar.param.objectid is 'Глобальный уникальный идентификатор адресного объекта';
comment on column gar.param.changeid is 'ID изменившей транзакции';
comment on column gar.param.changeidend is 'ID завершившей транзакции';
comment on column gar.param.typeid is 'Тип параметра';
comment on column gar.param.value is 'Значение параметра';
comment on column gar.param.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.param.startdate is 'Дата начала действия записи';
comment on column gar.param.enddate is 'Дата окончания действия записи';







create table gar.steads
(
    id         bigint  not null primary key,
    objectid   bigint  not null,
    objectguid uuid    not null,
    changeid   bigint  not null,
    number     varchar not null,
    opertypeid varchar not null,
    previd     bigint,
    nextid     bigint,
    updatedate date    not null,
    startdate  date    not null,
    enddate    date    not null,
    isactual   integer not null,
    isactive   integer not null
);

comment on table gar.steads is 'Сведения по земельным участкам';

comment on column gar.steads.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.steads.objectid is 'Глобальный уникальный идентификатор объекта типа integer';
comment on column gar.steads.objectguid is 'Глобальный уникальный идентификатор адресного объекта типа UUID';
comment on column gar.steads.changeid is 'ID изменившей транзакции';
comment on column gar.steads.number is 'Номер земельного участка';
comment on column gar.steads.opertypeid is 'Статус действия над записью – причина появления записи';
comment on column gar.steads.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.steads.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.steads.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.steads.startdate is 'Дата начала действия записи';
comment on column gar.steads.enddate is 'Дата окончания действия записи';
comment on column gar.steads.isactual is 'Статус актуальности адресного объекта ФИАС';
comment on column gar.steads.isactive is 'Признак действующего адресного объекта';
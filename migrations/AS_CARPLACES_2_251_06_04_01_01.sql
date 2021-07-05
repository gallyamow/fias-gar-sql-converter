create table gar.carplaces
(
    id         bigint  not null primary key,
    objectid   bigint  not null,
    objectguid uuid    not null,
    changeid   bigint  not null,
    number     varchar not null,
    opertypeid integer not null,
    previd     bigint,
    nextid     bigint,
    updatedate date    not null,
    startdate  date    not null,
    enddate    date    not null,
    isactual   integer not null,
    isactive   integer not null
);

comment on table gar.carplaces is 'Сведения по машино-местам';

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
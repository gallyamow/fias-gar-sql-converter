create table gar.apartments
(
    id         bigint  not null primary key,
    objectid   bigint  not null,
    objectguid uuid    not null,
    changeid   bigint  not null,
    number     varchar not null,
    aparttype  integer not null,
    opertypeid integer not null,
    previd     bigint,
    nextid     bigint,
    updatedate date    not null,
    startdate  date    not null,
    enddate    date    not null,
    isactual   integer not null,
    isactive   integer not null
);

comment on table gar.apartments is 'Сведения по помещениям';

comment on column gar.apartments.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.apartments.objectid is 'Глобальный уникальный идентификатор объекта типа INTEGER';
comment on column gar.apartments.objectguid is 'Глобальный уникальный идентификатор адресного объекта типа UUID';
comment on column gar.apartments.changeid is 'ID изменившей транзакции';
comment on column gar.apartments.number is 'Номер комнаты';
comment on column gar.apartments.aparttype is 'Тип комнаты';
comment on column gar.apartments.opertypeid is 'Статус действия над записью – причина появления записи';
comment on column gar.apartments.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.apartments.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.apartments.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.apartments.startdate is 'Начало действия записи';
comment on column gar.apartments.enddate is 'Окончание действия записи';
comment on column gar.apartments.isactual is 'Статус актуальности адресного объекта ФИАС';
comment on column gar.apartments.isactive is 'Признак действующего адресного объекта';

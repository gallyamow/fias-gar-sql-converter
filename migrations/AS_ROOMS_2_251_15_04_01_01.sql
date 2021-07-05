create table gar.rooms
(
    id         bigint  not null primary key,
    objectid   bigint  not null,
    objectguid uuid    not null,
    changeid   bigint  not null,
    number     varchar not null,
    roomtype   integer not null,
    opertypeid integer not null,
    previd     bigint,
    nextid     bigint,
    updatedate date    not null,
    startdate  date    not null,
    enddate    date    not null,
    isactual   integer not null,
    isactive   integer not null
);

comment on table gar.rooms is 'Сведения по комнатам';

comment on column gar.rooms.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.rooms.objectid is 'Глобальный уникальный идентификатор объекта типа INTEGER';
comment on column gar.rooms.objectguid is 'Глобальный уникальный идентификатор адресного объекта типа UUID';
comment on column gar.rooms.changeid is 'ID изменившей транзакции';
comment on column gar.rooms.number is 'Номер комнаты или офиса';
comment on column gar.rooms.roomtype is 'Тип комнаты или офиса';
comment on column gar.rooms.opertypeid is 'Статус действия над записью – причина появления записи';
comment on column gar.rooms.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.rooms.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.rooms.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.rooms.startdate is 'Дата начала действия записи';
comment on column gar.rooms.enddate is 'Дата окончания действия записи';
comment on column gar.rooms.isactual is 'Статус актуальности адресного объекта ФИАС';
comment on column gar.rooms.isactive is 'Признак действующего адресного объекта';








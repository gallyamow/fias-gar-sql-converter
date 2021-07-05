create table gar.houses
(
    id         bigint  not null primary key,
    objectid   bigint  not null,
    objectguid uuid    not null,
    changeid   bigint  not null,
    housenum   varchar null,
    addnum1    varchar,
    addnum2    varchar,
    housetype  integer,
    addtype1   integer,
    addtype2   integer,
    opertypeid integer not null,
    previd     bigint,
    nextid     bigint,
    updatedate date    not null,
    startdate  date    not null,
    enddate    date    not null,
    isactual   integer not null,
    isactive   integer not null
);

comment on table gar.houses is 'Сведения по номерам домов улиц городов и населенных пунктов';

comment on column gar.houses.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.houses.objectid is 'Глобальный уникальный идентификатор объекта типа integer';
comment on column gar.houses.objectguid is 'Глобальный уникальный идентификатор адресного объекта типа UUID';
comment on column gar.houses.changeid is 'ID изменившей транзакции';
comment on column gar.houses.housenum is 'Основной номер дома';
comment on column gar.houses.addnum1 is 'Дополнительный номер дома 1'; -- было снова "дома 1"
comment on column gar.houses.addnum2 is 'Дополнительный номер дома 2';
comment on column gar.houses.housetype is 'Основной тип дома';
comment on column gar.houses.addtype1 is 'Дополнительный тип дома 1';
comment on column gar.houses.addtype2 is 'Дополнительный тип дома 2';
comment on column gar.houses.opertypeid is 'Статус действия над записью – причина появления записи';
comment on column gar.houses.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.houses.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.houses.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.houses.startdate is 'Начало действия записи';
comment on column gar.houses.enddate is 'Окончание действия записи';
comment on column gar.houses.isactual is 'Статус актуальности адресного объекта ФИАС';
comment on column gar.houses.isactive is 'Признак действующего адресного объекта';
create table gar.addr_obj
(
    id         BIGINT  not null primary key,
    objectid   BIGINT  not null,
    objectguid UUID    not null,
    changeid   BIGINT  not null,
    name       TEXT    not null,
    typename   TEXT    not null,
    level      TEXT    not null,
    opertypeid INTEGER not null,
    previd     BIGINT,
    nextid     BIGINT,
    updatedate DATE    not null,
    startdate  DATE    not null,
    enddate    DATE    not null,
    isactual   INTEGER not null,
    isactive   INTEGER not null

);

comment on column gar.addr_obj.id is 'Уникальный идентификатор записи. Ключевое поле';
comment on column gar.addr_obj.objectid is 'Глобальный уникальный идентификатор адресного объекта типа INTEGER';
comment on column gar.addr_obj.objectguid is 'Глобальный уникальный идентификатор адресного объекта типа UUID';
comment on column gar.addr_obj.changeid is 'ID изменившей транзакции';
comment on column gar.addr_obj.name is 'Наименование';
comment on column gar.addr_obj.typename is 'Краткое наименование типа объекта';
comment on column gar.addr_obj.level is 'Уровень адресного объекта';
comment on column gar.addr_obj.opertypeid is 'Статус действия над записью – причина появления записи';
comment on column gar.addr_obj.previd is 'Идентификатор записи связывания с предыдущей исторической записью';
comment on column gar.addr_obj.nextid is 'Идентификатор записи связывания с последующей исторической записью';
comment on column gar.addr_obj.updatedate is 'Дата внесения (обновления) записи';
comment on column gar.addr_obj.startdate is 'Начало действия записи';
comment on column gar.addr_obj.enddate is 'Окончание действия записи';
comment on column gar.addr_obj.isactual is 'Статус актуальности адресного объекта ФИАС';
comment on column gar.addr_obj.isactive is 'Признак действующего адресного объекта';

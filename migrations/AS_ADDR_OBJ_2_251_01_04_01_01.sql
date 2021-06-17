-- for AS_ADDR_OBJ_2_251_01_04_01_01.xsd
CREATE TABLE gar.addr_obj
(
    id bigint not null primary key,
    objectid bigint not null,
    objectguid uuid not null,
    changeid bigint not null,
    name varchar not null,
    typename varchar not null,
    level varchar not null,
    opertypeid integer,
    previd bigint,
    nextid bigint,
    updatedate date,
    startdate date,
    enddate date,
    isactual smallint,
    isactive smallint
);

COMMENT ON TABLE gar.addr_obj IS 'Сведения классификатора адресообразующих элементов';

COMMENT ON COLUMN gar.addr_obj.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.addr_obj.objectid IS 'Глобальный уникальный идентификатор адресного объекта типа INTEGER';
COMMENT ON COLUMN gar.addr_obj.objectguid IS 'Глобальный уникальный идентификатор адресного объекта типа UUID';
COMMENT ON COLUMN gar.addr_obj.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.addr_obj.name IS 'Наименование';
COMMENT ON COLUMN gar.addr_obj.typename IS 'Краткое наименование типа объекта';
COMMENT ON COLUMN gar.addr_obj.level IS 'Уровень адресного объекта';
COMMENT ON COLUMN gar.addr_obj.opertypeid IS 'Статус действия над записью – причина появления записи';
COMMENT ON COLUMN gar.addr_obj.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.addr_obj.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.addr_obj.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.addr_obj.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.addr_obj.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.addr_obj.isactual IS 'Статус актуальности адресного объекта ФИАС';
COMMENT ON COLUMN gar.addr_obj.isactive IS 'Признак действующего адресного объекта';
-- for AS_ADDR_OBJ_2_251_01_04_01_01.xsd
CREATE TABLE gar.objects
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

COMMENT ON TABLE gar.objects IS 'Сведения классификатора адресообразующих элементов';
COMMENT ON COLUMN gar.objects.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.objects.objectid IS 'Глобальный уникальный идентификатор адресного объекта типа INTEGER';
COMMENT ON COLUMN gar.objects.objectguid IS 'Глобальный уникальный идентификатор адресного объекта типа UUID';
COMMENT ON COLUMN gar.objects.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.objects.name IS 'Наименование';
COMMENT ON COLUMN gar.objects.typename IS 'Краткое наименование типа объекта';
COMMENT ON COLUMN gar.objects.level IS 'Уровень адресного объекта';
COMMENT ON COLUMN gar.objects.opertypeid IS 'Статус действия над записью – причина появления записи';
COMMENT ON COLUMN gar.objects.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.objects.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.objects.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.objects.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.objects.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.objects.isactual IS 'Статус актуальности адресного объекта ФИАС';
COMMENT ON COLUMN gar.objects.isactive IS 'Признак действующего адресного объекта';
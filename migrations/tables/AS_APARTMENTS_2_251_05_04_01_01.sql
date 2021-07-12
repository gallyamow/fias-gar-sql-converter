CREATE TABLE gar.apartments (
  id BIGINT NOT NULL PRIMARY KEY,
  objectid BIGINT NOT NULL,
  objectguid VARCHAR NOT NULL,
  changeid BIGINT NOT NULL,
  number VARCHAR NOT NULL,
  aparttype INTEGER NOT NULL,
  opertypeid BIGINT NOT NULL,
  previd BIGINT,
  nextid BIGINT,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactual INTEGER NOT NULL,
  isactive INTEGER NOT NULL
);
COMMENT ON TABLE gar.apartments IS 'Сведения по помещениям';
COMMENT ON COLUMN gar.apartments.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.apartments.objectid IS 'Глобальный уникальный идентификатор объекта типа INTEGER';
COMMENT ON COLUMN gar.apartments.objectguid IS 'Глобальный уникальный идентификатор адресного объекта типа UUID';
COMMENT ON COLUMN gar.apartments.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.apartments.number IS 'Номер комнаты';
COMMENT ON COLUMN gar.apartments.aparttype IS 'Тип комнаты';
COMMENT ON COLUMN gar.apartments.opertypeid IS 'Статус действия над записью – причина появления записи';
COMMENT ON COLUMN gar.apartments.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.apartments.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.apartments.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.apartments.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.apartments.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.apartments.isactual IS 'Статус актуальности адресного объекта ФИАС';
COMMENT ON COLUMN gar.apartments.isactive IS 'Признак действующего адресного объекта';


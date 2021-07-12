CREATE TABLE gar.steads (
  id INTEGER NOT NULL PRIMARY KEY,
  objectid INTEGER NOT NULL,
  objectguid VARCHAR NOT NULL,
  changeid INTEGER NOT NULL,
  number VARCHAR NOT NULL,
  opertypeid VARCHAR NOT NULL,
  previd INTEGER,
  nextid INTEGER,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactual INTEGER NOT NULL,
  isactive INTEGER NOT NULL
);
COMMENT ON TABLE gar.steads IS 'Сведения по земельным участкам';
COMMENT ON COLUMN gar.steads.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.steads.objectid IS 'Глобальный уникальный идентификатор объекта типа INTEGER';
COMMENT ON COLUMN gar.steads.objectguid IS 'Глобальный уникальный идентификатор адресного объекта типа UUID';
COMMENT ON COLUMN gar.steads.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.steads.number IS 'Номер земельного участка';
COMMENT ON COLUMN gar.steads.opertypeid IS 'Статус действия над записью – причина появления записи';
COMMENT ON COLUMN gar.steads.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.steads.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.steads.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.steads.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.steads.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.steads.isactual IS 'Статус актуальности адресного объекта ФИАС';
COMMENT ON COLUMN gar.steads.isactive IS 'Признак действующего адресного объекта';


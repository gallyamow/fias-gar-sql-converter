CREATE TABLE gar.carplaces (
  id BIGINT NOT NULL PRIMARY KEY,
  objectid BIGINT NOT NULL,
  objectguid VARCHAR NOT NULL,
  changeid BIGINT NOT NULL,
  number VARCHAR NOT NULL,
  opertypeid INTEGER NOT NULL,
  previd BIGINT,
  nextid BIGINT,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactual INTEGER NOT NULL,
  isactive INTEGER NOT NULL
);
COMMENT ON TABLE gar.carplaces IS 'Сведения по машино-местам';
COMMENT ON COLUMN gar.carplaces.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.carplaces.objectid IS 'Глобальный уникальный идентификатор объекта типа INTEGER';
COMMENT ON COLUMN gar.carplaces.objectguid IS 'Глобальный уникальный идентификатор адресного объекта типа UUID';
COMMENT ON COLUMN gar.carplaces.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.carplaces.number IS 'Номер машиноместа';
COMMENT ON COLUMN gar.carplaces.opertypeid IS 'Статус действия над записью – причина появления записи';
COMMENT ON COLUMN gar.carplaces.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.carplaces.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.carplaces.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.carplaces.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.carplaces.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.carplaces.isactual IS 'Статус актуальности адресного объекта ФИАС';
COMMENT ON COLUMN gar.carplaces.isactive IS 'Признак действующего адресного объекта';


CREATE TABLE gar.houses (
  id BIGINT NOT NULL PRIMARY KEY,
  objectid BIGINT NOT NULL,
  objectguid VARCHAR NOT NULL,
  changeid BIGINT NOT NULL,
  housenum VARCHAR,
  addnum1 VARCHAR,
  addnum2 VARCHAR,
  housetype INTEGER,
  addtype1 INTEGER,
  addtype2 INTEGER,
  opertypeid INTEGER NOT NULL,
  previd BIGINT,
  nextid BIGINT,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactual INTEGER NOT NULL,
  isactive INTEGER NOT NULL
);
COMMENT ON TABLE gar.houses IS 'Сведения по номерам домов улиц городов и населенных пунктов';
COMMENT ON COLUMN gar.houses.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.houses.objectid IS 'Глобальный уникальный идентификатор объекта типа INTEGER';
COMMENT ON COLUMN gar.houses.objectguid IS 'Глобальный уникальный идентификатор адресного объекта типа UUID';
COMMENT ON COLUMN gar.houses.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.houses.housenum IS 'Основной номер дома';
COMMENT ON COLUMN gar.houses.addnum1 IS 'Дополнительный номер дома 1';
COMMENT ON COLUMN gar.houses.addnum2 IS 'Дополнительный номер дома 1';
COMMENT ON COLUMN gar.houses.housetype IS 'Основной тип дома';
COMMENT ON COLUMN gar.houses.addtype1 IS 'Дополнительный тип дома 1';
COMMENT ON COLUMN gar.houses.addtype2 IS 'Дополнительный тип дома 2';
COMMENT ON COLUMN gar.houses.opertypeid IS 'Статус действия над записью – причина появления записи';
COMMENT ON COLUMN gar.houses.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.houses.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.houses.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.houses.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.houses.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.houses.isactual IS 'Статус актуальности адресного объекта ФИАС';
COMMENT ON COLUMN gar.houses.isactive IS 'Признак действующего адресного объекта';


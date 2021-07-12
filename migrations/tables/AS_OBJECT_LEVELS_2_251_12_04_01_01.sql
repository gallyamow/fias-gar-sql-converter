CREATE TABLE gar.object_levels (
  level INTEGER NOT NULL,
  name VARCHAR NOT NULL,
  shortname VARCHAR,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactive BOOLEAN NOT NULL
);
COMMENT ON TABLE gar.object_levels IS 'Сведения по уровням адресных объектов';
COMMENT ON COLUMN gar.object_levels.level IS 'Уникальный идентификатор записи. Ключевое поле. Номер уровня объекта';
COMMENT ON COLUMN gar.object_levels.name IS 'Наименование';
COMMENT ON COLUMN gar.object_levels.shortname IS 'Краткое наименование';
COMMENT ON COLUMN gar.object_levels.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.object_levels.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.object_levels.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.object_levels.isactive IS 'Признак действующего адресного объекта';


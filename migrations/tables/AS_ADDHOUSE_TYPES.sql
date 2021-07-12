CREATE TABLE gar.addhouse_types (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  shortname VARCHAR,
  "desc" VARCHAR,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactive BOOLEAN NOT NULL
);
COMMENT ON TABLE gar.addhouse_types IS 'Дополнительные сведения по типам домов';
COMMENT ON COLUMN gar.addhouse_types.id IS 'Идентификатор';
COMMENT ON COLUMN gar.addhouse_types.name IS 'Наименование';
COMMENT ON COLUMN gar.addhouse_types.shortname IS 'Краткое наименование';
COMMENT ON COLUMN gar.addhouse_types.desc IS 'Описание';
COMMENT ON COLUMN gar.addhouse_types.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.addhouse_types.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.addhouse_types.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.addhouse_types.isactive IS 'Статус активности';


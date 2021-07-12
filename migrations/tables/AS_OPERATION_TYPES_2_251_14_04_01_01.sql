CREATE TABLE gar.operation_types (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  shortname VARCHAR,
  "desc" VARCHAR,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactive BOOLEAN NOT NULL
);
COMMENT ON TABLE gar.operation_types IS 'Сведения по статусу действия';
COMMENT ON COLUMN gar.operation_types.id IS 'Идентификатор статуса (ключ)';
COMMENT ON COLUMN gar.operation_types.name IS 'Наименование';
COMMENT ON COLUMN gar.operation_types.shortname IS 'Краткое наименование';
COMMENT ON COLUMN gar.operation_types.desc IS 'Описание';
COMMENT ON COLUMN gar.operation_types.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.operation_types.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.operation_types.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.operation_types.isactive IS 'Статус активности';


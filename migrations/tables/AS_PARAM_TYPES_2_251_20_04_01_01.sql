CREATE TABLE gar.param_types (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  code VARCHAR NOT NULL,
  "desc" VARCHAR,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactive BOOLEAN NOT NULL
);
COMMENT ON TABLE gar.param_types IS 'Сведения по типу параметра';
COMMENT ON COLUMN gar.param_types.id IS 'Идентификатор типа параметра (ключ)';
COMMENT ON COLUMN gar.param_types.name IS 'Наименование';
COMMENT ON COLUMN gar.param_types.code IS 'Краткое наименование';
COMMENT ON COLUMN gar.param_types.desc IS 'Описание';
COMMENT ON COLUMN gar.param_types.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.param_types.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.param_types.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.param_types.isactive IS 'Статус активности';


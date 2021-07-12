CREATE TABLE gar.apartment_types (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  shortname VARCHAR,
  "desc" VARCHAR,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactive BOOLEAN NOT NULL
);
COMMENT ON TABLE gar.apartment_types IS 'Сведения по типам помещений';
COMMENT ON COLUMN gar.apartment_types.id IS 'Идентификатор типа (ключ)';
COMMENT ON COLUMN gar.apartment_types.name IS 'Наименование';
COMMENT ON COLUMN gar.apartment_types.shortname IS 'Краткое наименование';
COMMENT ON COLUMN gar.apartment_types.desc IS 'Описание';
COMMENT ON COLUMN gar.apartment_types.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.apartment_types.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.apartment_types.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.apartment_types.isactive IS 'Статус активности';


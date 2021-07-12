CREATE TABLE gar.room_types (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  shortname VARCHAR,
  "desc" VARCHAR,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactive BOOLEAN NOT NULL
);
COMMENT ON TABLE gar.room_types IS 'Сведения по типам комнат';
COMMENT ON COLUMN gar.room_types.id IS 'Идентификатор типа (ключ)';
COMMENT ON COLUMN gar.room_types.name IS 'Наименование';
COMMENT ON COLUMN gar.room_types.shortname IS 'Краткое наименование';
COMMENT ON COLUMN gar.room_types.desc IS 'Описание';
COMMENT ON COLUMN gar.room_types.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.room_types.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.room_types.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.room_types.isactive IS 'Статус активности';


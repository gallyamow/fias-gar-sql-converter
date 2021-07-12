CREATE TABLE gar.rooms (
  id BIGINT NOT NULL PRIMARY KEY,
  objectid BIGINT NOT NULL,
  objectguid VARCHAR NOT NULL,
  changeid BIGINT NOT NULL,
  number VARCHAR NOT NULL,
  roomtype INTEGER NOT NULL,
  opertypeid INTEGER NOT NULL,
  previd BIGINT,
  nextid BIGINT,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactual INTEGER NOT NULL,
  isactive INTEGER NOT NULL
);
COMMENT ON TABLE gar.rooms IS 'Сведения по комнатам';
COMMENT ON COLUMN gar.rooms.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.rooms.objectid IS 'Глобальный уникальный идентификатор объекта типа INTEGER';
COMMENT ON COLUMN gar.rooms.objectguid IS 'Глобальный уникальный идентификатор адресного объекта типа UUID';
COMMENT ON COLUMN gar.rooms.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.rooms.number IS 'Номер комнаты или офиса';
COMMENT ON COLUMN gar.rooms.roomtype IS 'Тип комнаты или офиса';
COMMENT ON COLUMN gar.rooms.opertypeid IS 'Статус действия над записью – причина появления записи';
COMMENT ON COLUMN gar.rooms.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.rooms.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.rooms.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.rooms.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.rooms.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.rooms.isactual IS 'Статус актуальности адресного объекта ФИАС';
COMMENT ON COLUMN gar.rooms.isactive IS 'Признак действующего адресного объекта';


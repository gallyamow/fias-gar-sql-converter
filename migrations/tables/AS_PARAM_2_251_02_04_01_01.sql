CREATE TABLE gar.param (
  id BIGINT NOT NULL PRIMARY KEY,
  objectid BIGINT NOT NULL,
  changeid BIGINT,
  changeidend BIGINT NOT NULL,
  typeid INTEGER NOT NULL,
  value VARCHAR NOT NULL,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL
);
COMMENT ON TABLE gar.param IS 'Сведения о классификаторе параметров адресообразующих элементов и объектов недвижимости ';
COMMENT ON COLUMN gar.param.id IS 'Идентификатор записи';
COMMENT ON COLUMN gar.param.objectid IS 'Глобальный уникальный идентификатор адресного объекта ';
COMMENT ON COLUMN gar.param.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.param.changeidend IS 'ID завершившей транзакции';
COMMENT ON COLUMN gar.param.typeid IS 'Тип параметра';
COMMENT ON COLUMN gar.param.value IS 'Значение параметра';
COMMENT ON COLUMN gar.param.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.param.startdate IS 'Дата начала действия записи';
COMMENT ON COLUMN gar.param.enddate IS 'Дата окончания действия записи';


CREATE TABLE gar.adm_hierarchy (
  id BIGINT NOT NULL PRIMARY KEY,
  objectid BIGINT NOT NULL,
  parentobjid BIGINT,
  changeid BIGINT NOT NULL,
  regioncode VARCHAR,
  areacode VARCHAR,
  citycode VARCHAR,
  placecode VARCHAR,
  plancode VARCHAR,
  streetcode VARCHAR,
  previd BIGINT,
  nextid BIGINT,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactive INTEGER NOT NULL
);
COMMENT ON TABLE gar.adm_hierarchy IS 'Сведения по иерархии в административном делении';
COMMENT ON COLUMN gar.adm_hierarchy.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.adm_hierarchy.objectid IS 'Глобальный уникальный идентификатор объекта';
COMMENT ON COLUMN gar.adm_hierarchy.parentobjid IS 'Идентификатор родительского объекта';
COMMENT ON COLUMN gar.adm_hierarchy.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.adm_hierarchy.regioncode IS 'Код региона';
COMMENT ON COLUMN gar.adm_hierarchy.areacode IS 'Код района';
COMMENT ON COLUMN gar.adm_hierarchy.citycode IS 'Код города';
COMMENT ON COLUMN gar.adm_hierarchy.placecode IS 'Код населенного пункта';
COMMENT ON COLUMN gar.adm_hierarchy.plancode IS 'Код ЭПС';
COMMENT ON COLUMN gar.adm_hierarchy.streetcode IS 'Код улицы';
COMMENT ON COLUMN gar.adm_hierarchy.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.adm_hierarchy.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.adm_hierarchy.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.adm_hierarchy.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.adm_hierarchy.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.adm_hierarchy.isactive IS 'Признак действующего адресного объекта';


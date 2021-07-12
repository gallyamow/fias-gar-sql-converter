CREATE TABLE gar.mun_hierarchy (
  id BIGINT NOT NULL PRIMARY KEY,
  objectid BIGINT NOT NULL,
  parentobjid BIGINT,
  changeid BIGINT NOT NULL,
  oktmo VARCHAR,
  previd BIGINT,
  nextid BIGINT,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactive INTEGER NOT NULL
);
COMMENT ON TABLE gar.mun_hierarchy IS 'Сведения по иерархии в муниципальном делении';
COMMENT ON COLUMN gar.mun_hierarchy.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.mun_hierarchy.objectid IS 'Глобальный уникальный идентификатор адресного объекта ';
COMMENT ON COLUMN gar.mun_hierarchy.parentobjid IS 'Идентификатор родительского объекта';
COMMENT ON COLUMN gar.mun_hierarchy.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.mun_hierarchy.oktmo IS 'Код ОКТМО';
COMMENT ON COLUMN gar.mun_hierarchy.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.mun_hierarchy.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.mun_hierarchy.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.mun_hierarchy.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.mun_hierarchy.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.mun_hierarchy.isactive IS 'Признак действующего адресного объекта';


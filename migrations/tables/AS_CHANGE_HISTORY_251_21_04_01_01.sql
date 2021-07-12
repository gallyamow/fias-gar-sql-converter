CREATE TABLE gar.change_history (
  changeid BIGINT NOT NULL,
  objectid BIGINT NOT NULL,
  adrobjectid VARCHAR NOT NULL,
  opertypeid INTEGER NOT NULL,
  ndocid BIGINT,
  changedate DATE NOT NULL
);
COMMENT ON TABLE gar.change_history IS 'Сведения по истории изменений';
COMMENT ON COLUMN gar.change_history.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.change_history.objectid IS 'Уникальный ID объекта';
COMMENT ON COLUMN gar.change_history.adrobjectid IS 'Уникальный ID изменившей транзакции (GUID)';
COMMENT ON COLUMN gar.change_history.opertypeid IS 'Тип операции';
COMMENT ON COLUMN gar.change_history.ndocid IS 'ID документа';
COMMENT ON COLUMN gar.change_history.changedate IS 'Дата изменения';


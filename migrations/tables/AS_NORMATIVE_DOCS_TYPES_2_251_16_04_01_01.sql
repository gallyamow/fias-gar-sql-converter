CREATE TABLE gar.normative_docs_types (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL
);
COMMENT ON TABLE gar.normative_docs_types IS '';
COMMENT ON COLUMN gar.normative_docs_types.id IS 'Идентификатор записи';
COMMENT ON COLUMN gar.normative_docs_types.name IS 'Наименование';
COMMENT ON COLUMN gar.normative_docs_types.startdate IS 'Дата начала действия записи';
COMMENT ON COLUMN gar.normative_docs_types.enddate IS 'Дата окончания действия записи';


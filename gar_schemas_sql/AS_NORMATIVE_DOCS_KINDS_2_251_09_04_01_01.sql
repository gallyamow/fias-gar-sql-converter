CREATE TABLE gar.normative_docs_kinds (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  delta_version INT NOT NULL DEFAULT 0
);
COMMENT ON TABLE gar.normative_docs_kinds IS '';
COMMENT ON COLUMN gar.normative_docs_kinds.id IS 'Идентификатор записи';
COMMENT ON COLUMN gar.normative_docs_kinds.name IS 'Наименование';


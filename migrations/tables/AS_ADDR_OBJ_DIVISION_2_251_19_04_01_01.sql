CREATE TABLE gar.addr_obj_division (
  id BIGINT NOT NULL PRIMARY KEY,
  parentid BIGINT NOT NULL,
  childid BIGINT NOT NULL,
  changeid BIGINT NOT NULL
);
COMMENT ON TABLE gar.addr_obj_division IS 'Сведения по операциям переподчинения';
COMMENT ON COLUMN gar.addr_obj_division.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.addr_obj_division.parentid IS 'Родительский ID';
COMMENT ON COLUMN gar.addr_obj_division.childid IS 'Дочерний ID';
COMMENT ON COLUMN gar.addr_obj_division.changeid IS 'ID изменившей транзакции';


CREATE TABLE gar.houses (
  id BIGINT NOT NULL PRIMARY KEY,
  objectid BIGINT NOT NULL,
  objectguid VARCHAR NOT NULL,
  changeid BIGINT NOT NULL,
  housenum VARCHAR,
  addnum1 VARCHAR,
  addnum2 VARCHAR,
  housetype INTEGER,
  addtype1 INTEGER,
  addtype2 INTEGER,
  opertypeid INTEGER NOT NULL,
  previd BIGINT,
  nextid BIGINT,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactual INTEGER NOT NULL,
  isactive INTEGER NOT NULL
);
COMMENT ON TABLE gar.houses IS 'Сведения по номерам домов улиц городов и населенных пунктов';
COMMENT ON COLUMN gar.houses.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.houses.objectid IS 'Глобальный уникальный идентификатор объекта типа INTEGER';
COMMENT ON COLUMN gar.houses.objectguid IS 'Глобальный уникальный идентификатор адресного объекта типа UUID';
COMMENT ON COLUMN gar.houses.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.houses.housenum IS 'Основной номер дома';
COMMENT ON COLUMN gar.houses.addnum1 IS 'Дополнительный номер дома 1';
COMMENT ON COLUMN gar.houses.addnum2 IS 'Дополнительный номер дома 1';
COMMENT ON COLUMN gar.houses.housetype IS 'Основной тип дома';
COMMENT ON COLUMN gar.houses.addtype1 IS 'Дополнительный тип дома 1';
COMMENT ON COLUMN gar.houses.addtype2 IS 'Дополнительный тип дома 2';
COMMENT ON COLUMN gar.houses.opertypeid IS 'Статус действия над записью – причина появления записи';
COMMENT ON COLUMN gar.houses.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.houses.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.houses.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.houses.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.houses.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.houses.isactual IS 'Статус актуальности адресного объекта ФИАС';
COMMENT ON COLUMN gar.houses.isactive IS 'Признак действующего адресного объекта';

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

CREATE TABLE gar.apartment_types (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  shortname VARCHAR,
  desc VARCHAR,
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

CREATE TABLE gar.operation_types (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  shortname VARCHAR,
  desc VARCHAR,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactive BOOLEAN NOT NULL
);
COMMENT ON TABLE gar.operation_types IS 'Сведения по статусу действия';
COMMENT ON COLUMN gar.operation_types.id IS 'Идентификатор статуса (ключ)';
COMMENT ON COLUMN gar.operation_types.name IS 'Наименование';
COMMENT ON COLUMN gar.operation_types.shortname IS 'Краткое наименование';
COMMENT ON COLUMN gar.operation_types.desc IS 'Описание';
COMMENT ON COLUMN gar.operation_types.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.operation_types.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.operation_types.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.operation_types.isactive IS 'Статус активности';

CREATE TABLE gar.steads (
  id INTEGER NOT NULL PRIMARY KEY,
  objectid INTEGER NOT NULL,
  objectguid VARCHAR NOT NULL,
  changeid INTEGER NOT NULL,
  number VARCHAR NOT NULL,
  opertypeid VARCHAR NOT NULL,
  previd INTEGER,
  nextid INTEGER,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactual INTEGER NOT NULL,
  isactive INTEGER NOT NULL
);
COMMENT ON TABLE gar.steads IS 'Сведения по земельным участкам';
COMMENT ON COLUMN gar.steads.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.steads.objectid IS 'Глобальный уникальный идентификатор объекта типа INTEGER';
COMMENT ON COLUMN gar.steads.objectguid IS 'Глобальный уникальный идентификатор адресного объекта типа UUID';
COMMENT ON COLUMN gar.steads.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.steads.number IS 'Номер земельного участка';
COMMENT ON COLUMN gar.steads.opertypeid IS 'Статус действия над записью – причина появления записи';
COMMENT ON COLUMN gar.steads.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.steads.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.steads.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.steads.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.steads.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.steads.isactual IS 'Статус актуальности адресного объекта ФИАС';
COMMENT ON COLUMN gar.steads.isactive IS 'Признак действующего адресного объекта';

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

CREATE TABLE gar.addr_obj_types (
  id INTEGER NOT NULL PRIMARY KEY,
  level INTEGER NOT NULL,
  shortname VARCHAR NOT NULL,
  name VARCHAR NOT NULL,
  desc VARCHAR,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactive BOOLEAN NOT NULL
);
COMMENT ON TABLE gar.addr_obj_types IS 'Сведения по типам адресных объектов';
COMMENT ON COLUMN gar.addr_obj_types.id IS 'Идентификатор записи';
COMMENT ON COLUMN gar.addr_obj_types.level IS 'Уровень адресного объекта';
COMMENT ON COLUMN gar.addr_obj_types.shortname IS 'Краткое наименование типа объекта';
COMMENT ON COLUMN gar.addr_obj_types.name IS 'Полное наименование типа объекта';
COMMENT ON COLUMN gar.addr_obj_types.desc IS 'Описание';
COMMENT ON COLUMN gar.addr_obj_types.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.addr_obj_types.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.addr_obj_types.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.addr_obj_types.isactive IS 'Статус активности';

CREATE TABLE gar.house_types (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  shortname VARCHAR,
  desc VARCHAR,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactive BOOLEAN NOT NULL
);
COMMENT ON TABLE gar.house_types IS 'Сведения по типам домов';
COMMENT ON COLUMN gar.house_types.id IS 'Идентификатор';
COMMENT ON COLUMN gar.house_types.name IS 'Наименование';
COMMENT ON COLUMN gar.house_types.shortname IS 'Краткое наименование';
COMMENT ON COLUMN gar.house_types.desc IS 'Описание';
COMMENT ON COLUMN gar.house_types.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.house_types.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.house_types.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.house_types.isactive IS 'Статус активности';

CREATE TABLE gar.normative_docs_kinds (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL
);
COMMENT ON TABLE gar.normative_docs_kinds IS '';
COMMENT ON COLUMN gar.normative_docs_kinds.id IS 'Идентификатор записи';
COMMENT ON COLUMN gar.normative_docs_kinds.name IS 'Наименование';

CREATE TABLE gar.addr_obj (
  id BIGINT NOT NULL PRIMARY KEY,
  objectid BIGINT NOT NULL,
  objectguid VARCHAR NOT NULL,
  changeid BIGINT NOT NULL,
  name VARCHAR NOT NULL,
  typename VARCHAR NOT NULL,
  level VARCHAR NOT NULL,
  opertypeid INTEGER NOT NULL,
  previd BIGINT,
  nextid BIGINT,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactual INTEGER NOT NULL,
  isactive INTEGER NOT NULL
);
COMMENT ON TABLE gar.addr_obj IS 'Сведения классификатора адресообразующих элементов';
COMMENT ON COLUMN gar.addr_obj.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.addr_obj.objectid IS 'Глобальный уникальный идентификатор адресного объекта типа INTEGER';
COMMENT ON COLUMN gar.addr_obj.objectguid IS 'Глобальный уникальный идентификатор адресного объекта типа UUID';
COMMENT ON COLUMN gar.addr_obj.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.addr_obj.name IS 'Наименование';
COMMENT ON COLUMN gar.addr_obj.typename IS 'Краткое наименование типа объекта';
COMMENT ON COLUMN gar.addr_obj.level IS 'Уровень адресного объекта';
COMMENT ON COLUMN gar.addr_obj.opertypeid IS 'Статус действия над записью – причина появления записи';
COMMENT ON COLUMN gar.addr_obj.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.addr_obj.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.addr_obj.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.addr_obj.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.addr_obj.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.addr_obj.isactual IS 'Статус актуальности адресного объекта ФИАС';
COMMENT ON COLUMN gar.addr_obj.isactive IS 'Признак действующего адресного объекта';

CREATE TABLE gar.carplaces (
  id BIGINT NOT NULL PRIMARY KEY,
  objectid BIGINT NOT NULL,
  objectguid VARCHAR NOT NULL,
  changeid BIGINT NOT NULL,
  number VARCHAR NOT NULL,
  opertypeid INTEGER NOT NULL,
  previd BIGINT,
  nextid BIGINT,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactual INTEGER NOT NULL,
  isactive INTEGER NOT NULL
);
COMMENT ON TABLE gar.carplaces IS 'Сведения по машино-местам';
COMMENT ON COLUMN gar.carplaces.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.carplaces.objectid IS 'Глобальный уникальный идентификатор объекта типа INTEGER';
COMMENT ON COLUMN gar.carplaces.objectguid IS 'Глобальный уникальный идентификатор адресного объекта типа UUID';
COMMENT ON COLUMN gar.carplaces.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.carplaces.number IS 'Номер машиноместа';
COMMENT ON COLUMN gar.carplaces.opertypeid IS 'Статус действия над записью – причина появления записи';
COMMENT ON COLUMN gar.carplaces.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.carplaces.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.carplaces.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.carplaces.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.carplaces.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.carplaces.isactual IS 'Статус актуальности адресного объекта ФИАС';
COMMENT ON COLUMN gar.carplaces.isactive IS 'Признак действующего адресного объекта';

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

CREATE TABLE gar.normative_docs (
  id BIGINT NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  date DATE NOT NULL,
  number VARCHAR NOT NULL,
  type INTEGER NOT NULL,
  kind INTEGER NOT NULL,
  updatedate DATE NOT NULL,
  orgname VARCHAR,
  regnum VARCHAR,
  regdate DATE,
  accdate DATE,
  comment VARCHAR
);
COMMENT ON TABLE gar.normative_docs IS 'Сведения о нормативном документе, являющемся основанием присвоения адресному элементу наименования';
COMMENT ON COLUMN gar.normative_docs.id IS 'Уникальный идентификатор документа';
COMMENT ON COLUMN gar.normative_docs.name IS 'Наименование документа';
COMMENT ON COLUMN gar.normative_docs.date IS 'Дата документа';
COMMENT ON COLUMN gar.normative_docs.number IS 'Номер документа';
COMMENT ON COLUMN gar.normative_docs.type IS 'Тип документа';
COMMENT ON COLUMN gar.normative_docs.kind IS 'Вид документа';
COMMENT ON COLUMN gar.normative_docs.updatedate IS 'Дата обновления';
COMMENT ON COLUMN gar.normative_docs.orgname IS 'Наименование органа создвшего нормативный документ';
COMMENT ON COLUMN gar.normative_docs.regnum IS 'Номер государственной регистрации';
COMMENT ON COLUMN gar.normative_docs.regdate IS 'Дата государственной регистрации';
COMMENT ON COLUMN gar.normative_docs.accdate IS 'Дата вступления в силу нормативного документа';
COMMENT ON COLUMN gar.normative_docs.comment IS 'Комментарий';

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

CREATE TABLE gar.param_types (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  code VARCHAR NOT NULL,
  desc VARCHAR,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactive BOOLEAN NOT NULL
);
COMMENT ON TABLE gar.param_types IS 'Сведения по типу параметра';
COMMENT ON COLUMN gar.param_types.id IS 'Идентификатор типа параметра (ключ)';
COMMENT ON COLUMN gar.param_types.name IS 'Наименование';
COMMENT ON COLUMN gar.param_types.code IS 'Краткое наименование';
COMMENT ON COLUMN gar.param_types.desc IS 'Описание';
COMMENT ON COLUMN gar.param_types.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.param_types.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.param_types.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.param_types.isactive IS 'Статус активности';

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

CREATE TABLE gar.apartments (
  id BIGINT NOT NULL PRIMARY KEY,
  objectid BIGINT NOT NULL,
  objectguid VARCHAR NOT NULL,
  changeid BIGINT NOT NULL,
  number VARCHAR NOT NULL,
  aparttype INTEGER NOT NULL,
  opertypeid BIGINT NOT NULL,
  previd BIGINT,
  nextid BIGINT,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactual INTEGER NOT NULL,
  isactive INTEGER NOT NULL
);
COMMENT ON TABLE gar.apartments IS 'Сведения по помещениям';
COMMENT ON COLUMN gar.apartments.id IS 'Уникальный идентификатор записи. Ключевое поле';
COMMENT ON COLUMN gar.apartments.objectid IS 'Глобальный уникальный идентификатор объекта типа INTEGER';
COMMENT ON COLUMN gar.apartments.objectguid IS 'Глобальный уникальный идентификатор адресного объекта типа UUID';
COMMENT ON COLUMN gar.apartments.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.apartments.number IS 'Номер комнаты';
COMMENT ON COLUMN gar.apartments.aparttype IS 'Тип комнаты';
COMMENT ON COLUMN gar.apartments.opertypeid IS 'Статус действия над записью – причина появления записи';
COMMENT ON COLUMN gar.apartments.previd IS 'Идентификатор записи связывания с предыдущей исторической записью';
COMMENT ON COLUMN gar.apartments.nextid IS 'Идентификатор записи связывания с последующей исторической записью';
COMMENT ON COLUMN gar.apartments.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.apartments.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.apartments.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.apartments.isactual IS 'Статус актуальности адресного объекта ФИАС';
COMMENT ON COLUMN gar.apartments.isactive IS 'Признак действующего адресного объекта';

CREATE TABLE gar.object_levels (
  level INTEGER NOT NULL,
  name VARCHAR NOT NULL,
  shortname VARCHAR,
  updatedate DATE NOT NULL,
  startdate DATE NOT NULL,
  enddate DATE NOT NULL,
  isactive BOOLEAN NOT NULL
);
COMMENT ON TABLE gar.object_levels IS 'Сведения по уровням адресных объектов';
COMMENT ON COLUMN gar.object_levels.level IS 'Уникальный идентификатор записи. Ключевое поле. Номер уровня объекта';
COMMENT ON COLUMN gar.object_levels.name IS 'Наименование';
COMMENT ON COLUMN gar.object_levels.shortname IS 'Краткое наименование';
COMMENT ON COLUMN gar.object_levels.updatedate IS 'Дата внесения (обновления) записи';
COMMENT ON COLUMN gar.object_levels.startdate IS 'Начало действия записи';
COMMENT ON COLUMN gar.object_levels.enddate IS 'Окончание действия записи';
COMMENT ON COLUMN gar.object_levels.isactive IS 'Признак действующего адресного объекта';

CREATE TABLE gar.reestr_objects (
  objectid BIGINT NOT NULL,
  createdate DATE NOT NULL,
  changeid BIGINT NOT NULL,
  levelid INTEGER NOT NULL,
  updatedate DATE NOT NULL,
  objectguid VARCHAR NOT NULL,
  isactive INTEGER NOT NULL
);
COMMENT ON TABLE gar.reestr_objects IS 'Сведения об адресном элементе в части его идентификаторов';
COMMENT ON COLUMN gar.reestr_objects.objectid IS 'Уникальный идентификатор объекта';
COMMENT ON COLUMN gar.reestr_objects.createdate IS 'Дата создания';
COMMENT ON COLUMN gar.reestr_objects.changeid IS 'ID изменившей транзакции';
COMMENT ON COLUMN gar.reestr_objects.levelid IS 'Уровень объекта';
COMMENT ON COLUMN gar.reestr_objects.updatedate IS 'Дата обновления';
COMMENT ON COLUMN gar.reestr_objects.objectguid IS 'GUID объекта';
COMMENT ON COLUMN gar.reestr_objects.isactive IS 'Признак действующего объекта (1 - действующий, 0 - не действующий)';

CREATE TABLE gar.room_types (
  id INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR NOT NULL,
  shortname VARCHAR,
  desc VARCHAR,
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


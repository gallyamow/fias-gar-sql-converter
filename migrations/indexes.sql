CREATE INDEX ON gar.adm_hierarchy (objectid); -- некоторые objectid дублируются (например 24317330)
--CREATE INDEX ON gar.mun_hierarchy (objectid);

CREATE INDEX ON gar.addr_obj (objectid);
CREATE INDEX ON gar.houses (objectid);
CREATE INDEX ON gar.apartments (objectid);
CREATE INDEX ON gar.carplaces (objectid);
CREATE INDEX ON gar.rooms (objectid);
CREATE INDEX ON gar.steads (objectid);

CREATE INDEX ON gar.param (objectid, typeid);
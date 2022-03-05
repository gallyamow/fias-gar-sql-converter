-- Version column can be used for determine changed rows. It can be useful for applying deltas.
ALTER TABLE gar.addhouse_types
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.addr_obj
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.addr_obj_division
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.addr_obj_types
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.adm_hierarchy
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.apartment_types
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.apartments
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.carplaces
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.change_history
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.house_types
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.houses
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.mun_hierarchy
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.normative_docs
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.normative_docs_kinds
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.normative_docs_types
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.object_levels
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.operation_types
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.param
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.param_types
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.reestr_objects
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.room_types
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.rooms
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;
ALTER TABLE gar.steads
    ADD COLUMN delta_version int NOT NULL DEFAULT 0;

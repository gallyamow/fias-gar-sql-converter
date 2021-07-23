-- tree
DROP MATERIALIZED VIEW IF EXISTS gar.v_adm_hierarchy_path;

-- возможна такая ситуация когда ест несколько путей иерархии, причем только 1 из них активный?. См. objectid=6092

CREATE MATERIALIZED VIEW gar.v_adm_hierarchy_path AS
WITH RECURSIVE nodes(path, hierarchy_id, object_id, is_active) AS ( SELECT ARRAY [hr.objectid] AS path,
                                                                           hr.id               AS hierarchy_id,
                                                                           hr.objectid         AS object_id,
                                                                           hr.isactive         AS is_active
                                                                    FROM gar.adm_hierarchy hr
                                                                    WHERE hr.parentobjid = 0
                                                                    UNION ALL
                                                                    SELECT nodes.path || hr2.objectid      AS path,
                                                                           hr2.id                          AS hierarchy_id,
                                                                           hr2.objectid                    AS object_id,
                                                                           -- это для того чтобы пометить весь путь неактивным
                                                                           nodes.is_active & hr2.isactive AS is_active
                                                                    FROM nodes,
                                                                         gar.adm_hierarchy hr2
                                                                    WHERE nodes.object_id = hr2.parentobjid )
SELECT *, array_to_string(path, '.')::ltree AS path_ltree
FROM nodes;

CREATE INDEX ON gar.v_adm_hierarchy_path (object_id); -- должен быть уникальным, но дублируется
CREATE INDEX ON gar.v_adm_hierarchy_path USING GIST (path_ltree);

-- related data
DROP MATERIALIZED VIEW IF EXISTS gar.v_adm_hierarchy_relation;

CREATE MATERIALIZED VIEW gar.v_adm_hierarchy_relation AS
SELECT t.relation_id,
       t.relation_is_active,
       t.relation_is_actual,
       CASE WHEN t.addr_obj IS NOT NULL THEN 'addr_obj'
            WHEN t.house IS NOT NULL THEN 'house'
            WHEN t.room IS NOT NULL THEN 'room'
            WHEN t.apartment IS NOT NULL THEN 'apartment'
            WHEN t.carplace IS NOT NULL THEN 'carplace'
            WHEN t.stead IS NOT NULL THEN 'stead' END                          AS relation_type,
       COALESCE(t.addr_obj, t.house, t.room, t.apartment, t.carplace, t.stead) AS relation_data,
       t.id                                                                    AS hierarchy_id,
       t.objectid                                                              AS object_id
FROM ( SELECT hr.id,
              hr.objectid,
              row_to_json(addr_obj)                                                              AS addr_obj,
              row_to_json(houses)                                                                AS house,
              row_to_json(rooms)                                                                 AS room,
              row_to_json(apartments)                                                            AS apartment,
              row_to_json(carplaces)                                                             AS carplace,
              row_to_json(steads)                                                                AS stead,
              COALESCE(addr_obj.id, houses.id, rooms.id, apartments.id, carplaces.id, steads.id) AS relation_id,
              COALESCE(addr_obj.isactive, houses.isactive, rooms.isactive, apartments.isactive, carplaces.isactive,
                       steads.isactive)                                                          AS relation_is_active,
              COALESCE(addr_obj.isactual, houses.isactual, rooms.isactual, apartments.isactual, carplaces.isactual,
                       steads.isactual)                                                          AS relation_is_actual
       FROM gar.adm_hierarchy hr
                LEFT JOIN gar.addr_obj ON addr_obj.objectid = hr.objectid
                LEFT JOIN gar.houses ON houses.objectid = hr.objectid
                LEFT JOIN gar.rooms ON rooms.objectid = hr.objectid
                LEFT JOIN gar.apartments ON apartments.objectid = hr.objectid
                LEFT JOIN gar.carplaces ON carplaces.objectid = hr.objectid
                LEFT JOIN gar.steads ON steads.objectid = hr.objectid ) AS t;

CREATE INDEX ON gar.v_adm_hierarchy_relation (object_id); -- не уникальный

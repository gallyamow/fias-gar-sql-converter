CREATE VIEW gar.v_normalized_addr_obj AS
SELECT ao.objectid,
       ao.objectguid,
       ao.name,
       ao.typename       AS type,
       atp.name          AS fulltype,
       ao.level::integer AS level,
       ao.updatedate,
       hr.parentobjid
FROM gar.addr_obj ao
         JOIN gar.adm_hierarchy hr ON hr.objectid = ao.objectid
         LEFT JOIN gar.addr_obj_types atp
                   ON atp.isactive = TRUE AND atp.level = ao.level::integer AND atp.shortname::text = ao.typename::text;



--
-- this view created to implement materialized path for the table adm_hierarchy
-- it uses ltree extension
--
DROP MATERIALIZED VIEW IF EXISTS gar.v_adm_hierarchy_ltree;

CREATE MATERIALIZED VIEW gar.v_adm_hierarchy_ltree AS
WITH RECURSIVE nodes(tree_path, tree_data, id, objectid, parentobjid, addr_obj, houses, rooms, apartments, carplaces,
                     steads) AS ( SELECT ARRAY [hr.objectid]                           AS tree_path,
                                         ('[' ||
                                          COALESCE(row_to_json(addr_obj), row_to_json(houses), row_to_json(rooms),
                                                   row_to_json(apartments), row_to_json(carplaces),
                                                   row_to_json(steads)) || ']')::jsonb AS tree_data,
                                         hr.id,
                                         hr.objectid,
                                         hr.parentobjid,
                                         row_to_json(addr_obj)                         AS addr_obj,
                                         row_to_json(houses)                           AS houses,
                                         row_to_json(rooms)                            AS rooms,
                                         row_to_json(apartments)                       AS apartments,
                                         row_to_json(carplaces)                        AS carplaces,
                                         row_to_json(steads)                           AS steads
                                  FROM gar.adm_hierarchy hr
                                           LEFT JOIN gar.addr_obj ON addr_obj.objectid = hr.objectid
                                           LEFT JOIN gar.houses ON houses.objectid = hr.objectid
                                           LEFT JOIN gar.rooms ON rooms.objectid = hr.objectid
                                           LEFT JOIN gar.apartments ON apartments.objectid = hr.objectid
                                           LEFT JOIN gar.carplaces ON carplaces.objectid = hr.objectid
                                           LEFT JOIN gar.steads ON steads.objectid = hr.objectid
                                  WHERE hr.parentobjid = 0
                                  UNION ALL
                                  SELECT nodes.tree_path || hr2.objectid AS tree_path,
                                         nodes.tree_data || ('[' ||
                                                             COALESCE(row_to_json(addr_obj2), row_to_json(houses2),
                                                                      row_to_json(rooms2), row_to_json(apartments2),
                                                                      row_to_json(carplaces2), row_to_json(steads2)) ||
                                                             ']')::jsonb AS tree_data,
                                         hr2.id,
                                         hr2.objectid,
                                         hr2.parentobjid,
                                         row_to_json(addr_obj2)          AS addr_obj,
                                         row_to_json(houses2)            AS houses,
                                         row_to_json(rooms2)             AS rooms,
                                         row_to_json(apartments2)        AS apartments,
                                         row_to_json(carplaces2)         AS carplaces,
                                         row_to_json(steads2)            AS steads
                                  FROM nodes,
                                       gar.adm_hierarchy hr2
                                           LEFT JOIN gar.addr_obj AS addr_obj2 ON addr_obj2.objectid = hr2.objectid
                                           LEFT JOIN gar.houses AS houses2 ON houses2.objectid = hr2.objectid
                                           LEFT JOIN gar.rooms AS rooms2 ON rooms2.objectid = hr2.objectid
                                           LEFT JOIN gar.apartments AS apartments2 ON apartments2.objectid = hr2.objectid
                                           LEFT JOIN gar.carplaces AS carplaces2 ON carplaces2.objectid = hr2.objectid
                                           LEFT JOIN gar.steads AS steads2 ON steads2.objectid = hr2.objectid
                                  WHERE nodes.objectid = hr2.parentobjid )
SELECT id,
       objectid,
       array_to_string(tree_path, '.')::ltree AS tree_path,
       tree_data                              AS tree_data,
       addr_obj,
       houses,
       rooms,
       apartments,
       carplaces,
       steads
FROM nodes AS t;

CREATE INDEX ON gar.v_adm_hierarchy_ltree USING GIST (tree_path);
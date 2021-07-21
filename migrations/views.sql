--
-- this view created to implement materialized path for the table adm_hierarchy
-- it uses ltree extension
--
DROP MATERIALIZED VIEW IF EXISTS gar.v_adm_hierarchy_ltree;

CREATE MATERIALIZED VIEW gar.v_adm_hierarchy_ltree AS
WITH RECURSIVE nodes(path, id, objectid, parentobjid) AS ( SELECT ARRAY [hr.objectid] AS path,
                                                                  hr.id,
                                                                  hr.objectid,
                                                                  hr.parentobjid
                                                           FROM gar.adm_hierarchy hr
                                                           WHERE hr.parentobjid = 0
                                                           UNION
                                                           SELECT nodes.path || hr2.objectid AS path,
                                                                  hr2.id,
                                                                  hr2.objectid,
                                                                  hr2.parentobjid
                                                           FROM nodes,
                                                                gar.adm_hierarchy hr2
                                                           WHERE nodes.objectid = hr2.parentobjid )
SELECT id, objectid, array_to_string(path, '.')::ltree AS path
FROM nodes AS t;

CREATE INDEX ON gar.v_adm_hierarchy_ltree USING GIST (path);
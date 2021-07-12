-- noinspection SqlNoDataSourceInspectionForFile

SELECT ao.objectid,
       ao.objectguid,
       ao.name,
       ao.typename       AS type,
       ao.level::integer AS level,
       ao.updatedate,
       hr.parentobjid
FROM gar.addr_obj ao
         JOIN gar.adm_hierarchy hr ON hr.isactive = 1 AND hr.objectid = ao.objectid
WHERE ao.isactive = 1
  AND ao.isactual = 1
LIMIT 1;

WITH RECURSIVE child_to_parents(objectid, objectguid, name, typename, level, updatedate, parentobjid)
                   AS ( SELECT ao.objectid,
                               ao.objectguid,
                               ao.name,
                               ao.typename,
                               ao.level::integer AS level,
                               ao.updatedate,
                               hr.parentobjid
                        FROM gar.addr_obj ao
                                 JOIN gar.adm_hierarchy hr ON hr.isactive = 1 AND hr.objectid = ao.objectid
                        WHERE ao.isactive = 1
                          AND ao.isactual = 1
                        UNION ALL
                        SELECT ao.objectid,
                               ao.objectguid,
                               ao.name,
                               ao.typename,
                               ao.level::integer AS level,
                               ao.updatedate,
                               hr.parentobjid
                        FROM gar.addr_obj ao,
                             child_to_parents
                                 JOIN gar.adm_hierarchy hr ON hr.isactive = 1 AND hr.objectid = ao.objectid
                        WHERE ao.objectid = child_to_parents.parentobjid
                          AND ao.isactive = 1
                          AND ao.isactual = 1 )
SELECT *
FROM child_to_parents
ORDER BY level
LIMIT 10;


SELECT gar.addr_obj.*
FROM addr_obj
WHERE aoid = '51f21baa-c804-4737-9d5f-9da7a3bb1598'
UNION ALL
SELECT addr_obj.*
FROM gar.addr_obj,
     child_to_parents
WHERE addr_obj.aoguid = child_to_parents.parentguid
  AND addr_obj.currstatus = 0 )
SELECT *
FROM child_to_parents
ORDER BY aolevel;



CREATE VIEW gar.v_addr_obj_adm AS
SELECT ao.objectid,
       ao.objectguid,
       ao.name,
       ao.typename       AS type,
       atp.name          AS fulltype,
       ao.level::integer AS level,
       ao.updatedate,
       hr.parentobjid,
       pao.objectguid    AS parentobjguid,
       pao.name          AS parentname,
       pao.typename      AS parenttype,
       patp.name         AS parentfulltype
FROM gar.addr_obj ao
         JOIN gar.adm_hierarchy hr ON hr.isactive = 1 AND hr.objectid = ao.objectid
         LEFT JOIN gar.addr_obj pao ON pao.isactive = 1 AND pao.isactual = 1 AND pao.objectid = hr.parentobjid
    -- можно было использовать ao.typename, но здесь похоже для нормализации используется addr_obj_types
         LEFT JOIN gar.addr_obj_types atp
                   ON atp.isactive = TRUE AND atp.level = ao.level::integer AND atp.shortname::text = ao.typename::text
    -- можно было использовать ao.typename, но здесь похоже для нормализации используется addr_obj_types
         LEFT JOIN gar.addr_obj_types patp
                   ON patp.isactive = TRUE AND patp.level = pao.level::integer AND patp.shortname::text = pao.typename::text
WHERE ao.isactive = 1
  AND ao.isactual = 1;

CREATE VIEW gar.v_addr_obj_mun AS
SELECT ao.objectid,
       ao.objectguid,
       ao.name,
       ao.typename       AS type,
       atp.name          AS fulltype,
       ao.level::integer AS level,
       ao.updatedate,
       hr.parentobjid,
       pao.objectguid    AS parentobjguid,
       pao.name          AS parentname,
       pao.typename      AS parenttype,
       patp.name         AS parentfulltype
FROM gar.addr_obj ao
         JOIN gar.mun_hierarchy hr ON hr.isactive = 1 AND hr.objectid = ao.objectid
         LEFT JOIN gar.addr_obj pao ON pao.isactive = 1 AND pao.isactual = 1 AND pao.objectid = hr.parentobjid
         LEFT JOIN gar.addr_obj_types atp
                   ON atp.isactive = TRUE AND atp.level = ao.level::integer AND atp.shortname::text = ao.typename::text
         LEFT JOIN gar.addr_obj_types patp
                   ON patp.isactive = TRUE AND patp.level = pao.level::integer AND patp.shortname::text = pao.typename::text
WHERE ao.isactive = 1
  AND ao.isactual = 1;

CREATE VIEW gar.v_house_adm AS
SELECT h.objectid,
       h.objectguid,
       CASE WHEN h.addnum1 IS NOT NULL AND h.addnum2 IS NOT NULL THEN concat(h.housenum, ' ', ahtp1.shortname,
                                                                             h.addnum1, ' ', ahtp2.shortname, h.addnum2)
            WHEN h.addnum1 IS NOT NULL AND h.addnum2 IS NULL THEN concat(h.housenum, ' ', ahtp1.shortname, h.addnum1)
            WHEN h.addnum1 IS NULL AND h.addnum2 IS NOT NULL THEN concat(h.housenum, ' ', ahtp2.shortname, h.addnum2)
            ELSE h.housenum END AS name,
       htp.shortname            AS type,
       htp.name                 AS fulltype,
       h.updatedate,
       hr.parentobjid,
       pao.objectguid           AS parentobjguid,
       pao.name                 AS parentname,
       pao.typename             AS parenttype,
       patp.name                AS parentfulltype
FROM gar.houses h
         INNER JOIN gar.adm_hierarchy hr ON hr.isactive = 1 AND hr.objectid = h.objectid
         LEFT JOIN gar.addhouse_types ahtp1 ON ahtp1.id = h.addtype1
         LEFT JOIN gar.addhouse_types ahtp2 ON ahtp2.id = h.addtype2
         LEFT JOIN gar.addr_obj pao ON pao.isactive = 1 AND pao.isactual = 1 AND pao.objectid = hr.parentobjid
         LEFT JOIN gar.house_types htp ON htp.id = h.housetype
         LEFT JOIN gar.addr_obj_types patp
                   ON patp.isactive = TRUE AND patp.level = pao.level::integer AND patp.shortname::text = pao.typename::text
WHERE h.isactive = 1
  AND h.isactual = 1;

CREATE VIEW gar.v_house_mun AS
SELECT h.objectid,
       h.objectguid,
       CASE WHEN h.addnum1 IS NOT NULL AND h.addnum2 IS NOT NULL THEN concat(h.housenum, ' ', ahtp1.shortname,
                                                                             h.addnum1, ' ', ahtp2.shortname, h.addnum2)
            WHEN h.addnum1 IS NOT NULL AND h.addnum2 IS NULL THEN concat(h.housenum, ' ', ahtp1.shortname, h.addnum1)
            WHEN h.addnum1 IS NULL AND h.addnum2 IS NOT NULL THEN concat(h.housenum, ' ', ahtp2.shortname, h.addnum2)
            ELSE h.housenum END AS name,
       htp.shortname            AS type,
       htp.name                 AS fulltype,
       h.updatedate,
       hr.parentobjid,
       pao.objectguid           AS parentobjguid,
       pao.name                 AS parentname,
       pao.typename             AS parenttype,
       patp.name                AS parentfulltype
FROM gar.houses h
         INNER JOIN gar.mun_hierarchy hr ON hr.isactive = 1 AND hr.objectid = h.objectid

         LEFT JOIN gar.addhouse_types ahtp1 ON ahtp1.id = h.addtype1
         LEFT JOIN gar.addhouse_types ahtp2 ON ahtp2.id = h.addtype2
         LEFT JOIN gar.addr_obj pao ON pao.isactive = 1 AND pao.isactual = 1 AND pao.objectid = hr.parentobjid
         LEFT JOIN gar.house_types htp ON htp.id = h.housetype
         LEFT JOIN gar.addr_obj_types patp
                   ON patp.isactive = TRUE AND patp.level = pao.level::integer AND patp.shortname::text = pao.typename::text
WHERE h.isactive = 1
  AND h.isactual = 1;
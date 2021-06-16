<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210226154923 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        $this->addSql(<<<SQL
CREATE MATERIALIZED VIEW v_house_adm AS
SELECT h.objectid,
       h.objectguid,
       CASE
           WHEN h.addnum1 IS NOT NULL AND h.addnum2 IS NOT NULL THEN concat(h.housenum, ' ', ahtp1.shortname, h.addnum1, ' ', ahtp2.shortname, h.addnum2)
           WHEN h.addnum1 IS NOT NULL AND h.addnum2 IS NULL THEN concat(h.housenum, ' ', ahtp1.shortname, h.addnum1)
           WHEN h.addnum1 IS NULL AND h.addnum2 IS NOT NULL THEN concat(h.housenum, ' ', ahtp2.shortname, h.addnum2)
           ELSE h.housenum
       END as name,
       htp.shortname as type,
       htp.name AS fulltype,
       h.updatedate,
       hr.parentobjid,
       pao.objectguid as parentobjguid,
       pao.name as parentname,
       pao.typename as parenttype,
       patp.name AS parentfulltype
FROM fias_gar_houses h
         INNER JOIN fias_gar_admhierarchy hr ON hr.isactive = 1 AND hr.objectid = h.objectid

         LEFT JOIN fias_gar_addhousetypes ahtp1 ON ahtp1.id = h.addtype1
         LEFT JOIN fias_gar_addhousetypes ahtp2 ON ahtp2.id = h.addtype2
         LEFT JOIN fias_gar_addrobj pao ON pao.isactive = 1 AND pao.isactual = 1 AND pao.objectid = hr.parentobjid
         LEFT JOIN fias_gar_housetypes htp ON htp.id = h.housetype
         LEFT JOIN fias_gar_addrobjtypes patp ON patp.isactive = true AND patp.level = pao.level::integer AND
                                                 patp.shortname::text = pao.typename::text
WHERE h.isactive = 1
  AND h.isactual = 1
SQL
        );

        $this->addSql(<<<SQL
CREATE MATERIALIZED VIEW v_house_mun AS
SELECT h.objectid,
       h.objectguid,
       CASE
           WHEN h.addnum1 IS NOT NULL AND h.addnum2 IS NOT NULL THEN concat(h.housenum, ' ', ahtp1.shortname, h.addnum1, ' ', ahtp2.shortname, h.addnum2)
           WHEN h.addnum1 IS NOT NULL AND h.addnum2 IS NULL THEN concat(h.housenum, ' ', ahtp1.shortname, h.addnum1)
           WHEN h.addnum1 IS NULL AND h.addnum2 IS NOT NULL THEN concat(h.housenum, ' ', ahtp2.shortname, h.addnum2)
           ELSE h.housenum
       END as name,
       htp.shortname as type,
       htp.name AS fulltype,
       h.updatedate,
       hr.parentobjid,
       pao.objectguid as parentobjguid,
       pao.name as parentname,
       pao.typename as parenttype,
       patp.name AS parentfulltype
FROM fias_gar_houses h
         INNER JOIN fias_gar_munhierarchy hr ON hr.isactive = 1 AND hr.objectid = h.objectid

         LEFT JOIN fias_gar_addhousetypes ahtp1 ON ahtp1.id = h.addtype1
         LEFT JOIN fias_gar_addhousetypes ahtp2 ON ahtp2.id = h.addtype2
         LEFT JOIN fias_gar_addrobj pao ON pao.isactive = 1 AND pao.isactual = 1 AND pao.objectid = hr.parentobjid
         LEFT JOIN fias_gar_housetypes htp ON htp.id = h.housetype
         LEFT JOIN fias_gar_addrobjtypes patp ON patp.isactive = true AND patp.level = pao.level::integer AND
                                                 patp.shortname::text = pao.typename::text
WHERE h.isactive = 1
  AND h.isactual = 1
SQL
        );
    }

    public function down(Schema $schema) : void
    {
        $this->addSql('DROP MATERIALIZED VIEW v_house_adm');
        $this->addSql('DROP MATERIALIZED VIEW v_house_mun');
    }
}

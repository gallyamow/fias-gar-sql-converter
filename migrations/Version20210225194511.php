<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210225194511 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        $this->addSql(<<<SQL
CREATE MATERIALIZED VIEW v_addrobj_adm AS
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
FROM fias_gar_addrobj ao
         JOIN fias_gar_admhierarchy hr ON hr.isactive = 1 AND hr.objectid = ao.objectid
         LEFT JOIN fias_gar_addrobj pao ON pao.isactive = 1 AND pao.isactual = 1 AND pao.objectid = hr.parentobjid
         LEFT JOIN fias_gar_addrobjtypes atp
                   ON atp.isactive = true AND atp.level = ao.level::integer AND atp.shortname::text = ao.typename::text
         LEFT JOIN fias_gar_addrobjtypes patp
                   ON patp.isactive = true AND patp.level = pao.level::integer AND patp.shortname::text = pao.typename::text
WHERE ao.isactive = 1
  AND ao.isactual = 1
SQL
);

        $this->addSql(<<<SQL
CREATE MATERIALIZED VIEW v_addrobj_mun AS
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
FROM fias_gar_addrobj ao
         JOIN fias_gar_munhierarchy hr ON hr.isactive = 1 AND hr.objectid = ao.objectid
         LEFT JOIN fias_gar_addrobj pao ON pao.isactive = 1 AND pao.isactual = 1 AND pao.objectid = hr.parentobjid
         LEFT JOIN fias_gar_addrobjtypes atp
                   ON atp.isactive = true AND atp.level = ao.level::integer AND atp.shortname::text = ao.typename::text
         LEFT JOIN fias_gar_addrobjtypes patp
                   ON patp.isactive = true AND patp.level = pao.level::integer AND patp.shortname::text = pao.typename::text
WHERE ao.isactive = 1
  AND ao.isactual = 1
SQL
        );
    }

    public function down(Schema $schema) : void
    {
        $this->addSql('DROP MATERIALIZED VIEW v_addrobj_adm');
        $this->addSql('DROP MATERIALIZED VIEW v_addrobj_mun');
    }
}

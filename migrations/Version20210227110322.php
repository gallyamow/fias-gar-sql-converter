<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210227110322 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        $this->addSql('CREATE INDEX v_addrobj_mun__objectid__ind ON v_addrobj_mun (objectid)');
        $this->addSql('CREATE INDEX v_addrobj_mun__parentobjid__ind ON v_addrobj_mun (parentobjid)');
        $this->addSql('CREATE INDEX v_addrobj_mun__objectguid__ind ON v_addrobj_mun (objectguid)');
    }

    public function down(Schema $schema) : void
    {
        $this->addSql('DROP INDEX v_addrobj_mun__objectid__ind');
        $this->addSql('DROP INDEX v_addrobj_mun__parentobjid__ind');
        $this->addSql('DROP INDEX v_addrobj_mun__objectguid__ind');
    }
}

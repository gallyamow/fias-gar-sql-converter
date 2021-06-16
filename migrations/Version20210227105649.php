<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210227105649 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        $this->addSql('CREATE INDEX v_addrobj_adm__objectid__ind ON v_addrobj_adm (objectid)');
        $this->addSql('CREATE INDEX v_addrobj_adm__parentobjid__ind ON v_addrobj_adm (parentobjid)');
        $this->addSql('CREATE INDEX v_addrobj_adm__objectguid__ind ON v_addrobj_adm (objectguid)');
    }

    public function down(Schema $schema) : void
    {
        $this->addSql('DROP INDEX v_addrobj_adm__objectid__ind');
        $this->addSql('DROP INDEX v_addrobj_adm__parentobjid__ind');
        $this->addSql('DROP INDEX v_addrobj_adm__objectguid__ind');
    }
}

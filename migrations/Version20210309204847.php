<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210309204847 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('COMMENT ON COLUMN ext_addrobj.precision IS \'Код точности координат\'');
        $this->addSql('ALTER TABLE ext_addrobj_synonym ALTER name SET NOT NULL');
        $this->addSql('COMMENT ON COLUMN ext_house.precision IS \'Код точности координат\'');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('COMMENT ON COLUMN ext_house."precision" IS \'Код точности координат: 0 — точные координаты, 1 — ближайший дом, 2 — улица, 3 — населенный пункт, 4 — город, 5 — координаты не определены\'');
        $this->addSql('ALTER TABLE ext_addrobj_synonym ALTER name DROP NOT NULL');
        $this->addSql('COMMENT ON COLUMN ext_addrobj."precision" IS \'Код точности координат: 0 — точные координаты, 1 — ближайший дом, 2 — улица, 3 — населенный пункт, 4 — город, 5 — координаты не определены\'');
    }
}

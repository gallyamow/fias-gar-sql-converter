<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20210226191943 extends AbstractMigration
{
    public function getDescription() : string
    {
        return '';
    }

    public function up(Schema $schema) : void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE SEQUENCE ext_addrobj_point_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE SEQUENCE ext_addrobj_synonym_id_seq INCREMENT BY 1 MINVALUE 1 START 1');
        $this->addSql('CREATE TABLE ext_addrobj (objectid BIGINT NOT NULL, objectguid VARCHAR(36) DEFAULT NULL, precision SMALLINT DEFAULT NULL, latitude NUMERIC(14, 11) DEFAULT NULL, longitude NUMERIC(14, 11) DEFAULT NULL, zoom SMALLINT DEFAULT NULL, alias VARCHAR(255) DEFAULT NULL, anglicism VARCHAR(255) DEFAULT NULL, nominative VARCHAR(255) DEFAULT NULL, genitive VARCHAR(255) DEFAULT NULL, dative VARCHAR(255) DEFAULT NULL, accusative VARCHAR(255) DEFAULT NULL, ablative VARCHAR(255) DEFAULT NULL, prepositive VARCHAR(255) DEFAULT NULL, locative VARCHAR(255) DEFAULT NULL, created_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, updated_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, PRIMARY KEY(objectid))');
        $this->addSql('CREATE INDEX ext_addrobj__objectid__ind ON ext_addrobj (objectid)');
        $this->addSql('COMMENT ON COLUMN ext_addrobj.precision IS \'Код точности координат: 0 — точные координаты, 1 — ближайший дом, 2 — улица, 3 — населенный пункт, 4 — город, 5 — координаты не определены\'');
        $this->addSql('COMMENT ON COLUMN ext_addrobj.latitude IS \'Координаты: широта\'');
        $this->addSql('COMMENT ON COLUMN ext_addrobj.longitude IS \'Координаты: долгота\'');
        $this->addSql('COMMENT ON COLUMN ext_addrobj.alias IS \'Транслит для URL\'');
        $this->addSql('COMMENT ON COLUMN ext_addrobj.anglicism IS \'Англицизм\'');
        $this->addSql('COMMENT ON COLUMN ext_addrobj.nominative IS \'Именительный падеж\'');
        $this->addSql('COMMENT ON COLUMN ext_addrobj.genitive IS \'Родительный падеж\'');
        $this->addSql('COMMENT ON COLUMN ext_addrobj.dative IS \'Дательный падеж\'');
        $this->addSql('COMMENT ON COLUMN ext_addrobj.accusative IS \'Винительный падеж\'');
        $this->addSql('COMMENT ON COLUMN ext_addrobj.ablative IS \'Творительный падеж\'');
        $this->addSql('COMMENT ON COLUMN ext_addrobj.prepositive IS \'Предложный падеж\'');
        $this->addSql('COMMENT ON COLUMN ext_addrobj.locative IS \'Локатив\'');
        $this->addSql('CREATE TABLE ext_addrobj_point (id INT NOT NULL, objectid BIGINT DEFAULT NULL, latitude NUMERIC(14, 11) DEFAULT NULL, longitude NUMERIC(14, 11) DEFAULT NULL, created_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, updated_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX ext_addrobj_point__id__ind ON ext_addrobj_point (id)');
        $this->addSql('CREATE INDEX ext_addrobj_point__objectid__ind ON ext_addrobj_point (objectid)');
        $this->addSql('COMMENT ON COLUMN ext_addrobj_point.latitude IS \'Координаты: широта\'');
        $this->addSql('COMMENT ON COLUMN ext_addrobj_point.longitude IS \'Координаты: долгота\'');
        $this->addSql('CREATE TABLE ext_addrobj_synonym (id INT NOT NULL, objectid BIGINT DEFAULT NULL, name VARCHAR(255) DEFAULT NULL, created_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, updated_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, PRIMARY KEY(id))');
        $this->addSql('CREATE INDEX ext_addrobj_synonym__id__ind ON ext_addrobj_synonym (id)');
        $this->addSql('CREATE INDEX ext_addrobj_synonym__objectid__ind ON ext_addrobj_synonym (objectid)');
        $this->addSql('CREATE TABLE ext_house (objectid BIGINT NOT NULL, objectguid VARCHAR(36) DEFAULT NULL, precision SMALLINT DEFAULT NULL, latitude NUMERIC(14, 11) DEFAULT NULL, longitude NUMERIC(14, 11) DEFAULT NULL, zoom SMALLINT DEFAULT NULL, created_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, updated_at TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL, PRIMARY KEY(objectid))');
        $this->addSql('CREATE INDEX ext_house__objectid__ind ON ext_house (objectid)');
        $this->addSql('COMMENT ON COLUMN ext_house.precision IS \'Код точности координат: 0 — точные координаты, 1 — ближайший дом, 2 — улица, 3 — населенный пункт, 4 — город, 5 — координаты не определены\'');
        $this->addSql('COMMENT ON COLUMN ext_house.latitude IS \'Координаты: широта\'');
        $this->addSql('COMMENT ON COLUMN ext_house.longitude IS \'Координаты: долгота\'');
        $this->addSql('ALTER TABLE ext_addrobj_point ADD CONSTRAINT ext_addrobj_point__objectid__fk FOREIGN KEY (objectid) REFERENCES ext_addrobj (objectid) NOT DEFERRABLE INITIALLY IMMEDIATE');
        $this->addSql('ALTER TABLE ext_addrobj_synonym ADD CONSTRAINT ext_addrobj_synonym__objectid__fk FOREIGN KEY (objectid) REFERENCES ext_addrobj (objectid) NOT DEFERRABLE INITIALLY IMMEDIATE');
    }

    public function down(Schema $schema) : void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE ext_addrobj_point DROP CONSTRAINT ext_addrobj_point__objectid__fk');
        $this->addSql('ALTER TABLE ext_addrobj_synonym DROP CONSTRAINT ext_addrobj_synonym__objectid__fk');
        $this->addSql('DROP SEQUENCE ext_addrobj_point_id_seq CASCADE');
        $this->addSql('DROP SEQUENCE ext_addrobj_synonym_id_seq CASCADE');
        $this->addSql('DROP TABLE ext_addrobj');
        $this->addSql('DROP TABLE ext_addrobj_point');
        $this->addSql('DROP TABLE ext_addrobj_synonym');
        $this->addSql('DROP TABLE ext_house');
    }
}

<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>

    <xsl:param name="scheme">gar.</xsl:param>

    <xsl:template match="/">
        <xsl:variable name="file_name" select="tokenize(tokenize(base-uri(.), '/')[last()],'\.')[1]"/>
        <xsl:variable name="entity_name" select="lower-case(substring(replace($file_name, '_\d+', ''), 4))"/>
        <xsl:choose>
            <!-- some xsd files has the different structure -->
            <xsl:when test="$entity_name ='normative_docs_kinds' or $entity_name ='normative_docs_types'">
                <xsl:apply-templates select="/xs:schema/xs:element[2]">
                    <xsl:with-param name="entity_name" select="$entity_name"/>
                </xsl:apply-templates>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="/xs:schema/xs:element[1]/xs:complexType[1]/xs:sequence[1]/xs:element[1]">
                    <xsl:with-param name="entity_name" select="$entity_name"/>
                </xsl:apply-templates>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="xs:element" name="table">
        <xsl:param name="entity_name"/>
        <xsl:variable name="table_name" select="concat($scheme, $entity_name)"/>
        <!-- some entity has primary key different from ID -->
        <xsl:variable name="table_primary_key">
            <xsl:choose>
                <xsl:when
                        test="$entity_name = 'change_history'">
                    <xsl:text>changeid</xsl:text>
                </xsl:when>
                <xsl:when
                        test="$entity_name = 'object_levels'">
                    <xsl:text>level</xsl:text>
                </xsl:when>
                <xsl:when
                        test="$entity_name = 'reestr_objects'">
                    <xsl:text>objectid</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:text>id</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:text>CREATE TABLE </xsl:text>
        <xsl:value-of select="$table_name"/><xsl:text> (&#xa;</xsl:text>
        <xsl:apply-templates select="xs:complexType">
            <xsl:with-param name="table_primary_key" select="$table_primary_key"/>
        </xsl:apply-templates>
        <xsl:text>&#xa;);&#xa;</xsl:text>
        <xsl:text>COMMENT ON TABLE </xsl:text><xsl:value-of
            select="$table_name"/><xsl:text> IS '</xsl:text><xsl:value-of
            select="xs:annotation/xs:documentation"/><xsl:text>';&#xa;</xsl:text>
        <xsl:for-each
                select="xs:complexType[1]/xs:attribute">
            <xsl:text>COMMENT ON COLUMN </xsl:text><xsl:value-of select="$table_name"/><xsl:text>.</xsl:text><xsl:value-of
                select="lower-case(@name)"/><xsl:text> IS '</xsl:text><xsl:value-of
                select="xs:annotation/xs:documentation"/><xsl:text>';&#xa;</xsl:text>
        </xsl:for-each>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>

    <xsl:template match="xs:complexType" name="attrs">
        <xsl:param name="table_primary_key"/>

        <xsl:for-each select="xs:attribute">
            <xsl:variable name="attr_name" select="lower-case(@name)"/>
            <xsl:variable name="field_name">
                <xsl:choose>
                    <!-- some field requires to be quoted -->
                    <xsl:when test="$attr_name ='desc'">
                        <xsl:text>"</xsl:text><xsl:value-of select="$attr_name"/><xsl:text>"</xsl:text>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$attr_name"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <a>
                <xsl:text>  </xsl:text>
                <xsl:value-of select="$field_name"/>
                <xsl:text> </xsl:text>
                <xsl:choose>
                    <!--type mapping for restriction -->
                    <xsl:when test="xs:simpleType/xs:restriction/@base='xs:string'">VARCHAR</xsl:when>
                    <xsl:when test="xs:simpleType/xs:restriction/@base='xs:integer'">INTEGER</xsl:when>
                    <xsl:when test="xs:simpleType/xs:restriction/@base='xs:long'">BIGINT</xsl:when>
                    <xsl:when test="xs:simpleType/xs:restriction/@base='xs:date'">DATE</xsl:when>
                    <xsl:when test="xs:simpleType/xs:restriction/@base='xs:boolean'">BOOLEAN</xsl:when>

                    <!-- type mapping without restriction -->
                    <xsl:when test="@type='xs:string'">VARCHAR</xsl:when>
                    <xsl:when test="@type='xs:integer'">INTEGER</xsl:when>
                    <xsl:when test="@type='xs:long'">BIGINT</xsl:when>
                    <xsl:when test="@type='xs:date'">DATE</xsl:when>
                    <xsl:when test="@type='xs:boolean'">BOOLEAN</xsl:when>

                    <xsl:when test="contains(lower-case(xs:annotation/xs:documentation),'uuid')">UUID</xsl:when>

                    <!-- PATH field does not have any type description, so we use VARCHAR -->
                    <xsl:when test="@name = 'PATH'">VARCHAR</xsl:when>
                </xsl:choose>
                <xsl:if test="@use = 'required'">
                    <xsl:text> NOT NULL</xsl:text>
                </xsl:if>
                <xsl:if test="$attr_name = $table_primary_key">
                    <xsl:text> PRIMARY KEY</xsl:text>
                </xsl:if>
                <xsl:text>,&#xa;</xsl:text>
            </a>
        </xsl:for-each>
        <xsl:text>  </xsl:text>
        <xsl:text>delta_version INT NOT NULL DEFAULT 0</xsl:text>
    </xsl:template>
</xsl:stylesheet>
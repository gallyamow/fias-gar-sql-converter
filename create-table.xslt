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
                <xsl:apply-templates select="/xs:schema/xs:element[2]"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:apply-templates select="/xs:schema/xs:element[1]/xs:complexType[1]/xs:sequence[1]/xs:element[1]"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="xs:element" name="table">
        <!-- pass from parent template -->
        <xsl:variable name="file_name" select="tokenize(tokenize(base-uri(.), '/')[last()],'\.')[1]"/>
        <!-- I need to find a more proper way to get the entity name -->
        <xsl:variable name="entity_name" select="lower-case(substring(replace($file_name, '_\d+', ''), 4))"/>
        <xsl:variable name="table_name" select="concat($scheme, $entity_name)"/>

        <xsl:text>CREATE TABLE </xsl:text>
        <xsl:value-of select="$table_name"/><xsl:text> (&#xa;</xsl:text>
        <xsl:apply-templates select="xs:complexType"/>
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
                </xsl:choose>
                <xsl:if test="@use='required'">
                    <xsl:text> NOT NULL</xsl:text>
                </xsl:if>
                <xsl:if test="@name='ID'">
                    <xsl:text> PRIMARY KEY</xsl:text>
                </xsl:if>
                <xsl:if test="position()!=last()">,&#xa;</xsl:if>
            </a>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
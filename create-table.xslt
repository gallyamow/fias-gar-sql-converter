<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>

    <xsl:param name="scheme">gar.</xsl:param>

    <xsl:template match="/">
        <xsl:param name="file_name" select="tokenize(tokenize(base-uri(.), '/')[last()],'\.')[1]"/>
        <xsl:param name="table_name" select="lower-case(substring(replace($file_name, '_\d+', ''), 4))"/>

        <!-- some entities described in second element -->
        <xsl:variable name="entity_el_num">
            <xsl:choose>
                <xsl:when test="$table_name ='normative_docs_kinds' or $table_name ='normative_docs_types'">
                    <xsl:value-of select="2"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="1"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:text>CREATE TABLE </xsl:text>
        <xsl:value-of select="concat($scheme, $table_name)"/><xsl:text> (&#xa;</xsl:text>
        <xsl:for-each
                select="/xs:schema/xs:element[$entity_el_num]/xs:complexType[1]/xs:sequence[1]/xs:element[1]/xs:complexType[1]/xs:attribute">
            <a>
                <xsl:text>  </xsl:text><xsl:value-of select="lower-case(@name)"/><xsl:text> </xsl:text>
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
        <xsl:text>&#xa;);&#xa;</xsl:text>
        <xsl:text>COMMENT ON TABLE </xsl:text><xsl:value-of
            select="concat($scheme, $table_name)"/><xsl:text> IS </xsl:text>'<xsl:value-of
            select="/xs:schema/xs:element[$entity_el_num]/xs:complexType[1]/xs:sequence[1]/xs:element[1]/xs:annotation/xs:documentation"/>'<xsl:text>;&#xa;</xsl:text>
        <xsl:for-each
                select="/xs:schema/xs:element[$entity_el_num]/xs:complexType[1]/xs:sequence[1]/xs:element[1]/xs:complexType[1]/xs:attribute">
            <xsl:text>COMMENT ON COLUMN </xsl:text><xsl:value-of select="concat($scheme, $table_name)"/><xsl:text>.</xsl:text><xsl:value-of
                select="lower-case(@name)"/><xsl:text> IS </xsl:text>'<xsl:value-of
                select="xs:annotation/xs:documentation"/>'<xsl:text>;&#xa;</xsl:text>
        </xsl:for-each>
        <xsl:text>&#xa;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
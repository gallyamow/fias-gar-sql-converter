<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="no"/>
    <!-- psql scheme name, empty it if you don't use any scheme -->
    <xsl:param name="scheme">gar.</xsl:param>

    <xsl:template match="/" name="separate-table">
        <xsl:variable name="file_name" select="lower-case(tokenize(tokenize(base-uri(.), '/')[last()],'\.')[1])"/>
        <xsl:variable name="table_name" select="substring(replace($file_name, '_\d+', ''), 4)"/>

        CREATE TABLE
        <xsl:value-of select="concat($scheme, $table_name)"/> (
        <xsl:for-each
                select="/xs:schema/xs:element[1]/xs:complexType[1]/xs:sequence[1]/xs:element[1]/xs:complexType[1]/xs:attribute">
            <a>
                <xsl:text>  </xsl:text><xsl:value-of select="lower-case(@name)"/><xsl:text> </xsl:text>
                <xsl:choose>
                    <!--type mapping -->
                    <xsl:when test="xs:simpleType/xs:restriction/@base='xs:long'">BIGINT</xsl:when>
                    <xsl:when test="xs:simpleType/xs:restriction/@base='xs:integer'">INTEGER</xsl:when>
                    <xsl:when test="xs:simpleType/xs:restriction/@base='xs:byte'">INTEGER</xsl:when>
                    <xsl:when test="@type='xs:date'">DATE</xsl:when>
                    <xsl:when test="@type='xs:boolean'">BOOLEAN</xsl:when>
                    <xsl:when test="contains(lower-case(xs:annotation/xs:documentation),'uuid')">
                        UUID
                    </xsl:when>
                    <!-- TEXT instead of VARCHAR for supporting mysql -->
                    <xsl:when test="xs:simpleType/xs:restriction/@base='xs:string'">TEXT</xsl:when>
                </xsl:choose>
                <xsl:if test="@use='required'"><xsl:text> </xsl:text>NOT NULL
                </xsl:if>
                <xsl:if test="@name='ID'"><xsl:text> </xsl:text>PRIMARY KEY
                </xsl:if>
                <xsl:if test="position()!=last()">,&#xa;</xsl:if>
            </a>
        </xsl:for-each>
        );

        <xsl:for-each
                select="/xs:schema/xs:element[1]/xs:complexType[1]/xs:sequence[1]/xs:element[1]/xs:complexType[1]/xs:attribute">
            <a>COMMENT ON COLUMN <xsl:value-of select="concat($scheme, $table_name)"/>.<xsl:value-of
                    select="lower-case(@name)"/> IS<xsl:text> </xsl:text>
                '<xsl:value-of select="xs:annotation/xs:documentation"/>'
            </a>
            <xsl:text>;&#xa;</xsl:text>
        </xsl:for-each>

    </xsl:template>
</xsl:stylesheet>
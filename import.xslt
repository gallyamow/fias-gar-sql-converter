<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>

    <xsl:param name="scheme">gar.</xsl:param>
    <xsl:param name="upsert">yes</xsl:param>

    <xsl:template match="*">
        <xsl:param name="file_name" select="tokenize(tokenize(base-uri(.), '/')[last()],'\.')[1]"/>
        <xsl:param name="table_name"
                   select="lower-case(substring(replace(replace($file_name, '[a-z0-9-]', ''), '_+', ''), 3))"/>

        <xsl:for-each select="./*">
            <xsl:text>INSERT INTO </xsl:text><xsl:value-of select="concat($scheme, $table_name)"/> (
            <xsl:for-each select="@*">
                <xsl:value-of select="name()"/>
                <xsl:if test="position()!=last()">,</xsl:if>
            </xsl:for-each>
            <xsl:text>) VALUES (</xsl:text>
            <xsl:for-each select="@*">
                '<xsl:value-of select="."/>'
                <xsl:if test="position()!=last()">,</xsl:if>
            </xsl:for-each>
            )
            <xsl:if test="$upsert='yes'">
                <xsl:text>ON CONFLICT DO UPDATE SET</xsl:text>
                <xsl:for-each select="@*">
                    <xsl:value-of select="name()"/>='<xsl:value-of select="."/>'
                    <xsl:if test="position()!=last()">,</xsl:if>
                </xsl:for-each>
            </xsl:if>
            ;
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
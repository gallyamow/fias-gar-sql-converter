<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>

    <xsl:param name="scheme">gar.</xsl:param>
    <xsl:param name="upsert">yes</xsl:param>
    <xsl:param name="param_table_name">param</xsl:param>

    <xsl:template match="*">
        <xsl:param name="file_name" select="tokenize(tokenize(base-uri(.), '/')[last()],'\.')[1]"/>
        <!-- I need to find a more proper way to get the entity name -->
        <xsl:param name="entity_name"
                   select="lower-case(substring(replace(replace($file_name, '[a-z0-9-]', ''), '_{2,}', ''), 4))"/>
        <xsl:param name="table_name">
            <xsl:choose>
                <!-- some xml file names do not match table name  -->
                <xsl:when
                        test="$entity_name ='rooms_params' or $entity_name ='carplaces_params'
                    or $entity_name ='addr_obj_params' or $entity_name ='apartments_params'
                    or $entity_name ='houses_params' or $entity_name ='steads_params'">
                    <xsl:value-of select="concat($scheme, $param_table_name)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat($scheme, $entity_name)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:param>

        <xsl:for-each select="./*">
            <xsl:text>INSERT INTO </xsl:text><xsl:value-of select="$table_name"/><xsl:text> (</xsl:text>
            <xsl:for-each select="@*">
                <xsl:value-of select="name()"/>
                <xsl:if test="position()!=last()">,</xsl:if>
            </xsl:for-each>
            <xsl:text>) VALUES (</xsl:text>
            <xsl:for-each select="@*">
                <xsl:text>'</xsl:text><xsl:value-of select="."/><xsl:text>'</xsl:text>
                <xsl:if test="position()!=last()">,</xsl:if>
            </xsl:for-each>
            <xsl:text>)</xsl:text>
            <xsl:if test="$upsert='yes'">
                <xsl:text> ON CONFLICT DO UPDATE SET </xsl:text>
                <xsl:for-each select="@*">
                    <xsl:value-of select="name()"/><xsl:text>='</xsl:text><xsl:value-of select="."/><xsl:text>'</xsl:text>
                    <xsl:if test="position()!=last()">,</xsl:if>
                </xsl:for-each>
            </xsl:if>
            <xsl:text>;&#xa;</xsl:text>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>
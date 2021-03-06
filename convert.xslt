<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="3.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>
    <xsl:mode streamable="yes"/>

    <xsl:param name="scheme">gar.</xsl:param>
    <xsl:param name="deltaVersion">0</xsl:param>
    <xsl:param name="param_table_name">param</xsl:param>

    <xsl:template match="/">
        <xsl:variable name="file_name" select="tokenize(tokenize(base-uri(.), '/')[last()],'\.')[1]"/>
        <!-- I need to find a more proper way to get the entity name -->
        <xsl:variable name="entity_name"
                      select="lower-case(substring(replace(replace($file_name, '[a-z0-9-]', ''), '_{2,}', ''), 4))"/>
        <xsl:variable name="table_name">
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
        </xsl:variable>

        <!-- some entity has primary key different from ID -->
        <xsl:variable name="table_primary_key">
            <xsl:choose>
                <xsl:when
                        test="$entity_name = 'change_history'">
                    <xsl:text>NONE</xsl:text>
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

        <!--<xsl:for-each select="./*">-->
        <xsl:iterate select="/*/*/copy-of()">
            <xsl:text>INSERT INTO </xsl:text>
            <xsl:value-of select="$table_name"/>
            <xsl:text>(</xsl:text>
            <xsl:for-each select="@*">
                <xsl:variable name="attr_name" select="lower-case(name())"/>
                <xsl:variable name="field_name">
                    <xsl:choose>
                        <!-- some field requires to be quoted -->
                        <xsl:when test="$attr_name ='desc'">
                            <xsl:text>"</xsl:text>
                            <xsl:value-of select="$attr_name"/>
                            <xsl:text>"</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$attr_name"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:value-of select="$field_name"/>
                <xsl:text>,</xsl:text>
            </xsl:for-each>
            <xsl:text>delta_version</xsl:text>
            <xsl:text>) VALUES (</xsl:text>
            <xsl:for-each select="@*">
                <xsl:text>'</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>'</xsl:text>
                <xsl:text>,</xsl:text>
            </xsl:for-each>
            <xsl:value-of select="$deltaVersion"/>
            <xsl:text>)</xsl:text>
            <xsl:if test="$deltaVersion != 0 and $table_primary_key != 'NONE'">
                <xsl:text>ON CONFLICT (</xsl:text>
                <xsl:value-of select="$table_primary_key"/>
                <xsl:text>) DO UPDATE SET </xsl:text>
                <xsl:for-each select="@*">
                    <xsl:variable name="attr_name" select="lower-case(name())"/>
                    <xsl:variable name="field_name">
                        <xsl:choose>
                            <!-- some field requires to be quoted -->
                            <xsl:when test="$attr_name ='desc'">
                                <xsl:text>"</xsl:text>
                                <xsl:value-of select="$attr_name"/>
                                <xsl:text>"</xsl:text>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$attr_name"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <xsl:value-of select="$field_name"/>
                    <xsl:text>='</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>'</xsl:text>
                    <xsl:text>,</xsl:text>
                </xsl:for-each>
                <xsl:text>delta_version=</xsl:text>
                <xsl:value-of select="$deltaVersion"/>
            </xsl:if>
            <xsl:text>;&#xa;</xsl:text>
        </xsl:iterate>
    </xsl:template>
</xsl:stylesheet>
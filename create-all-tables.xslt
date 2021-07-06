<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="text" encoding="UTF-8" indent="yes"/>

    <xsl:param name="schemas_dir">./gar_schemas</xsl:param>

    <!--  saxon only stuff -->
    <xsl:template name="main">
        <testsuites>
            <xsl:apply-templates
                    select="collection(concat($schemas_dir, '?select=AS*.xsd;recurse=no'))"/>
        </testsuites>
    </xsl:template>

    <xsl:include href="create-table.xslt"/>
</xsl:stylesheet>
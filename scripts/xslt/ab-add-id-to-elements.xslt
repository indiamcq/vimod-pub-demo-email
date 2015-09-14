<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         	ab-add-id-to-elements.xslt
    # Purpose:		add id to elements defined by $header array.
    # Part of:      	Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       	Ian McQuay <ian_mcquay@sil.org>
    # Created:      	2015-09-14
    # Copyright:    	(c) 2015 SIL International
    # Licence:      	<LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="yes" indent="yes"/>
      <xsl:include href="project.xslt"/>
      <xsl:include href="inc-copy-anything.xslt"/>
      <xsl:template match="*[local-name() = $header]">
            <xsl:element name="{local-name()}">
                  <xsl:apply-templates select="@*"/>
                  <xsl:attribute name="id">
                        <xsl:text>lk</xsl:text>
                        <xsl:value-of select="count(preceding::*[local-name() = $header]) +1"/>
                  </xsl:attribute>
                  <xsl:apply-templates select="node()"/>
            </xsl:element>
      </xsl:template>
</xsl:stylesheet>

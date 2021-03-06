<?xml version="1.0" encoding="utf-8"?>
<!--
    #############################################################
    # Name:         ab-toc.xslt
    # Purpose:		create a toc from a partial html
    # Part of:      Vimod Pub - http://projects.palaso.org/projects/vimod-pub
    # Author:       Ian McQuay <ian_mcquay@sil.org>
    # Created:      2015- -
    # Copyright:    (c) 2015 SIL International
    # Licence:      <LGPL>
    ################################################################ -->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:f="myfunctions">
      <xsl:output method="xml" version="1.0" encoding="utf-8" omit-xml-declaration="no" indent="yes"/>
      <xsl:strip-space elements="*"/>
      <xsl:include href="project.xslt"/>
      <xsl:template match="/*">
            <ul>
                  <xsl:for-each select="//*[local-name() = $header]">
                        <xsl:sort/>
                        <li class="{local-name()}">
                              <a href="#{@id}">
                                    <xsl:value-of select="text()[1]"/>
                              </a>
                        </li>
                  </xsl:for-each>
            </ul>
      </xsl:template>
</xsl:stylesheet>

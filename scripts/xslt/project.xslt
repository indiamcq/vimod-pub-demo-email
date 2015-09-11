<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:variable name="projectpath"
                 select="'C:\vimod-spinoff-project\vimod-DemoEmail\data\DemoEmail\2015-09'"/>
   <xsl:variable name="cd" select="'C:\vimod-spinoff-project\vimod-DemoEmail'"/>
   <xsl:variable name="true" select="tokenize('true yes on 1','\s+')"/>
   <xsl:variable name="comment1" select="'# project.tasks'"/>
   <xsl:variable name="comment2">define project name                               </xsl:variable>
   <xsl:param name="pcode" select="'DemoEmail'"/>
   <xsl:variable name="comment3">define list of headers to include in index        </xsl:variable>
   <xsl:param name="header_list" select="'h1 h2'"/>
   <xsl:variable name="header" select="tokenize($header_list,'\s+')"/>
   <xsl:variable name="comment5"
                 select="'make project.xslt from the above variables        ;projectxslt'"/>
</xsl:stylesheet>
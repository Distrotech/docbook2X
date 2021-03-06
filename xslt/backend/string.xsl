<?xml version='1.0'?>
<!-- vim: sw=2 sta et
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:doc="http://nwalsh.com/xsl/documentation/1.0"
                exclude-result-prefixes="doc"
                version='1.0'
                xml:lang="en">

<!-- ********************************************************************
     $Id: string.xsl,v 1.1 2004/07/17 20:40:15 stevecheng Exp $
     ********************************************************************

     (C) 2003-2004 Steve Cheng <stevecheng@users.sourceforge.net>

     Part of docbook2X.  String utility functions.

     See ../../COPYING for the copyright status of this software.

     ******************************************************************** -->

<xsl:template name="string-subst">
  <xsl:param name="content" select="''"/>
  <xsl:param name="replace" select="''"/>
  <xsl:param name="with" select="''"/>
  <xsl:choose>
    <xsl:when test="not(contains($content,$replace))">
      <xsl:value-of select="$content"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:value-of select="substring-before($content,$replace)"/>
      <xsl:value-of select="$with"/>
      <xsl:call-template name="string-subst">
        <xsl:with-param name="content"
             select="substring-after($content,$replace)"/>
        <xsl:with-param name="replace" select="$replace"/>
        <xsl:with-param name="with" select="$with"/>
      </xsl:call-template>
    </xsl:otherwise>
  </xsl:choose>
</xsl:template>

</xsl:stylesheet>

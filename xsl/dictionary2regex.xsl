<?xml version="1.0" encoding="utf-8"?>
<!--
	This file is part of the Spelling and Grammar Checker project.
	See the accompanying LICENSE file for applicable licenses.
-->
<xsl:stylesheet version="2.0" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="PREFIX">(^|\W)(</xsl:param>
	<xsl:param name="POSTFIX">)($|\W)</xsl:param>
	<xsl:output indent="no" method="text" omit-xml-declaration="yes"/>
	<xsl:template match="/">
		<xsl:value-of select="$PREFIX"/>
		<xsl:value-of select="//entry/mistake" separator="|"/>
		<xsl:value-of select="$POSTFIX"/>
	</xsl:template>
</xsl:stylesheet>
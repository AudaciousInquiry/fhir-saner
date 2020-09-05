<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:s="https://github.com/FHIR/sushi"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:function name="s:name">
        <xsl:param name="f"/>
        <xsl:param name="v"/>
        <xsl:variable name="lastPart" select="translate(tokenize(string-join($f),'\.')[last()],'[]0123456789','')"/>
        <xsl:text>* </xsl:text>
        <xsl:value-of select="string-join($f, '')"/>
        <xsl:text> = </xsl:text>
        <xsl:value-of select="string-join($v, '')"/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:function>

    <xsl:function name="s:string">
        <xsl:param name="f"/>
        <xsl:param name="v"/>
        <xsl:variable name="lastPart" select="translate(tokenize(string-join($f),'\.')[last()],'[]0123456789','')"/>
        <xsl:text>* </xsl:text>
        <xsl:value-of select="string-join($f, '')"/>
        <xsl:text> = "</xsl:text>
        <xsl:if test="contains(string-join($v, ''),'&#xA;')">""</xsl:if>
        <xsl:value-of select="string-join($v, '')"/>
        <xsl:if test="contains(string-join($v, ''),'&#xA;')">""</xsl:if>
        <xsl:text>"&#xA;</xsl:text>
    </xsl:function>
    <xsl:function name="s:code">
        <xsl:param name="f"/>
        <xsl:param name="c"/>
        <xsl:param name="s"/>
        <xsl:variable name="lastPart" select="translate(tokenize(string-join($f),'\.')[last()],'[]0123456789','')"/>
        <xsl:text>* </xsl:text><xsl:value-of select="string-join($f, '')"/><xsl:text> = </xsl:text>
        <xsl:value-of select="$s"/>#<xsl:value-of select="string-join($c, '')"/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:function>
    <xsl:function name="s:def">
        <xsl:param name="n"/>
        <xsl:param name="v"/>
        <xsl:variable name="lastPart" select="translate(tokenize(string-join($n),'\.')[last()],'[]0123456789','')"/>
        <xsl:value-of select="concat(string-join($n, ''), ': ',string-join($v, ''),'&#xA;')"/>
    </xsl:function>
    <xsl:function name="s:instance">
        <xsl:param name="n"/>
        <xsl:param name="t"/>
        <xsl:param name="d"/>
        <xsl:param name="m"/>
        <xsl:param name="body"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:value-of select="s:def('Instance', $n)"/>
        <xsl:value-of select="s:def('InstanceOf', $t)"/>
        <xsl:if test='contains($t,"CapabilityStatement") or contains($t,"OperationDefinition") or contains($t,"SearchParameter")'>
            <xsl:value-of select="s:def('Usage','#definition')"/>
        </xsl:if>
        <xsl:value-of select="concat('Description: &quot;',string-join($d, ''),'&quot;&#xA;')"/>
        <xsl:for-each select="$m">
            <xsl:value-of select="concat('* insert ',.,'&#xA;')"/>
        </xsl:for-each>
        <xsl:copy-of select="$body"/>
    </xsl:function>
</xsl:stylesheet>
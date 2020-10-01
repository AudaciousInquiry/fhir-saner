<?xml version="1.0" encoding="UTF-8"?>
<!--
    This stylesheet generates the introduction for a measure.
    It must be run after the XML resource content for the measure is created by
    the ig-publisher, requiring a manual step for the publication process.

    Run SUSHI
    Generate the XML from the SUSHI provided JSON file.
    Write the updated measure intro HTML file.

 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ig="http://ainq.com/ig-definition"
    xmlns:fhir="http://hl7.org/fhir"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:html="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs ig fhir html"
    version="2.0">
    <xsl:output omit-xml-declaration="yes" method="xhtml"/>
    <xsl:variable name='periods'>
        <period code='a'>year</period>
        <period code='mo'>month</period>
        <period code='wk'>week</period>
        <period code='d'>day</period>
        <period code='h'>hour</period>
    </xsl:variable>
    
    <xsl:template match='html:dl' mode="markdown">
        <xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="*|text()" mode="markdown"/>
    </xsl:template>
    <xsl:template match="html:dt" mode="markdown">
        <xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="*|text()" mode="markdown"/>
    </xsl:template>
    <xsl:template match="html:dd" mode="markdown">
        <xsl:text>&#xA;:</xsl:text>
        <xsl:apply-templates select="*|text()" mode="markdown"/>
    </xsl:template>
    
    <xsl:template match="html:h1|html:h2|html:h3|html:h4|html:h5|html:h6" mode="markdown">
        <xsl:text>&#xA;</xsl:text>
        <xsl:choose>
            <xsl:when test="local-name()='h1'"># </xsl:when>
            <xsl:when test="local-name()='h2'">## </xsl:when>
            <xsl:when test="local-name()='h3'">### </xsl:when>
            <xsl:when test="local-name()='h4'">#### </xsl:when>
            <xsl:when test="local-name()='h5'">##### </xsl:when>
            <xsl:when test="local-name()='h6'">###### </xsl:when>
        </xsl:choose>        
        <xsl:apply-templates select="*|text()" mode="markdown"/>
        <xsl:text>&#xA;&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="html:a" mode="markdown">
        <xsl:text>[</xsl:text><xsl:value-of select="text()"/>]
        <xsl:text>(</xsl:text><xsl:value-of select="@href"/>
        <xsl:if test='@title'> "<xsl:value-of select="@title"/>"</xsl:if>
        <xsl:text>)</xsl:text>
    </xsl:template>
    
    <xsl:template match="html:ul" mode="markdown">
        <xsl:text>&#xA;* </xsl:text>
    </xsl:template>
    
    <xsl:template match="html:li" mode="markdown">
        <xsl:text>&#xA;* </xsl:text>
        <xsl:apply-templates select="*|text()" mode="markdown"/>
    </xsl:template>
    
    <xsl:template match="html:pre" mode="markdown">
        <xsl:text>&#xA;```&#xA;</xsl:text>
        <xsl:apply-templates select="*|text()" mode="markdown"/>
        <xsl:text>&#xA;```&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="html:code" mode="markdown">
        <xsl:text> `</xsl:text><xsl:apply-templates select="*|text()" mode="markdown"/><xsl:text>` </xsl:text>
    </xsl:template>
    
    <xsl:template match="/">
        <xsl:text>RuleSet: </xsl:text><xsl:value-of select="fhir:Measure/fhir:id/@value"/><xsl:text>Text&#xA;</xsl:text>
        <xsl:text>* text.status = #generated&#xA;</xsl:text>
        <xsl:text>* text.div = """&#xA;</xsl:text>
        <div xmlns="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="/fhir:Measure"/>
        </div>
        <xsl:text>"""&#xA;</xsl:text>
    </xsl:template>
    
    <xsl:template match="@*|node()" mode="copy">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="copy"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:template match="/fhir:Measure/fhir:id" mode="copy">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" mode="copy"/>
        </xsl:copy>
    </xsl:template>

    <xsl:template match='fhir:Measure'>
        <h3><xsl:value-of select="fhir:title/@value"/></h3>
        <p>The url for this measure is <code><xsl:value-of select='fhir:url/@value'/></code>.</p>
        <p><xsl:value-of select='fhir:description/@value' disable-output-escaping="yes"/></p>
        <dl>
            <dt>Frequency</dt>
            <xsl:variable name='ext' select='fhir:extension[contains(@url,"/ReportingPeriod")]/fhir:valueTiming/fhir:repeat'/>
            <dd>This measure is expected to be reported every <xsl:value-of select='$ext/fhir:period/@value'/>
                <xsl:text> </xsl:text>
                <xsl:value-of select='$periods/*:period[@code=$ext/fhir:periodUnit/@value]'/>
                <xsl:if test='$ext/fhir:period/@value!="1"'>s</xsl:if>.</dd>
            <dt>Publisher</dt>
            <dd><xsl:value-of select='fhir:publisher/@value'/></dd>
            <xsl:if test='fhir:contact'>
            <dt>Contact<xsl:if test='count(fhir:contact)&gt;1'>s</xsl:if></dt>
            <xsl:for-each select='fhir:contact'>
                <dd><xsl:value-of select='fhir:name/@value'/> (<xsl:if test='fhir:telecom'><xsl:value-of select='fhir:telecom/fhir:value/@value'/></xsl:if>)</dd>
            </xsl:for-each>
            </xsl:if>
            <dt>Status</dt>
            <dd><xsl:value-of select='fhir:status/@value'/></dd>
            <xsl:if test='fhir:date'>
                <dt>Date</dt>
                <dd><xsl:value-of select='substring(fhir:date/@value,1,10)'/></dd>
            </xsl:if>
        </dl>
        <xsl:if test='fhir:definition'>
            <h4>Definitions</h4>
            <xsl:value-of select="fhir:definition/@value" disable-output-escaping="yes"/>
        </xsl:if>
        <xsl:for-each select='fhir:group'>
            <xsl:call-template name='heading'>
                <xsl:with-param name="level">h4</xsl:with-param>
                <xsl:with-param name="text">Group</xsl:with-param>
            </xsl:call-template>
            <xsl:variable name='atts' select='fhir:extension[@url="http://hl7.org/fhir/us/saner/StructureDefinition/MeasureGroupAttributes"]/fhir:extension'/>
            <dl>
            <xsl:for-each select='$atts/fhir:valueCodeableConcept'>
                <xsl:variable name="attName" select="(fhir:text,fhir:coding/fhir:display,fhir:coding/fhir:code)[1]"/>
                <dt><xsl:value-of select="../@url"/></dt>
                <dd><xsl:value-of select="$attName/@value"/>
                    <xsl:apply-templates select='fhir:valueCodeableConcept' mode='code'/>                        
                </dd>
            </xsl:for-each>
            </dl>
            <xsl:apply-templates select="fhir:criteria"/>

            <xsl:for-each select='fhir:population'>
            <xsl:call-template name='heading'>
                <xsl:with-param name="level">h5</xsl:with-param>
                <xsl:with-param name="text">Population</xsl:with-param>
            </xsl:call-template>
            
            <xsl:apply-templates select="fhir:criteria"/>
            </xsl:for-each>
            
            <xsl:for-each select="fhir:stratifier">
                <xsl:call-template name='heading'>
                    <xsl:with-param name="level">h5</xsl:with-param>
                    <xsl:with-param name="text">Stratifier</xsl:with-param>
                </xsl:call-template>
                
                <xsl:apply-templates select="fhir:criteria"/>
            </xsl:for-each>
        </xsl:for-each>
        <h5>References</h5><xsl:text>&#xA;&#xA;</xsl:text>
        <ul>
            <xsl:for-each select='fhir:relatedArtifact'>
                <li>
                <a href='' title=''><xsl:if test='fhir:display/@value'><xsl:attribute name='title'><xsl:value-of select='fhir:display/@value'/></xsl:attribute></xsl:if
                    ><xsl:value-of select='(fhir:label/@value,fhir:display/@value,fhir:url/@value)[1]'/></a></li>
            </xsl:for-each>
        </ul>
    </xsl:template>
    
    <xsl:template match='fhir:coding'>
        <ul>
            <li>
                <xsl:value-of select="fhir:system/@value"/>#<xsl:value-of select="fhir:code/@value"/>
                <xsl:text> </xsl:text><xsl:value-of select="fhir:display/@value"/>
            </li>
        </ul>
    </xsl:template>
    
    <xsl:template name='name'>
        <xsl:value-of select="(fhir:code/fhir:text,fhir:text,fhir:code/fhir:coding/fhir:display, fhir:coding/fhir:display,fhir:coding/fhir:display, fhir:display, fhir:coding/fhir:code, fhir:code)[1]/@value"/>
    </xsl:template>
    
    <xsl:template match='fhir:criteria'>
        <h5>Expression<xsl:if test='fhir:name'>: <xsl:value-of select="fhir:name/@value"/></xsl:if></h5>
        <xsl:if test='fhir:description'>
        <p><xsl:value-of select='fhir:description/@value' disable-output-escaping="yes"/></p>
        </xsl:if>
        <xsl:if test='fhir:language'>
        <dl>
            <dt>Language</dt>
            <dd><xsl:value-of select='fhir:language/@value'/></dd>
        </dl>
        </xsl:if>
        <pre>
<xsl:value-of select="fhir:expression/@value" />            
        </pre>
    </xsl:template>
    
    <xsl:template name="heading">
        <xsl:param name="level" required="yes"/>
        <xsl:param name="text"/>
        <xsl:element name="{$level}">
            <xsl:value-of select='$text'/>: <xsl:for-each select='fhir:code'><xsl:call-template name='name'/></xsl:for-each>
        </xsl:element>
        <p><xsl:value-of select='fhir:description/@value' disable-output-escaping="yes"/></p>
        <xsl:if test='fhir:code/fhir:coding'>
            <dl>
                <dt>Codes</dt>
                <dd><xsl:apply-templates select="fhir:code/fhir:coding"/></dd>
            </dl>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
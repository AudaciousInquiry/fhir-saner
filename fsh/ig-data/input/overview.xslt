<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ig="http://ainq.com/ig-definition"
    xmlns="http://ainq.com/ig-definition"
    xmlns:html="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs ig"
    version="2.0">

    <xsl:include href="utility.xslt"/>
    <xsl:param name="org" select="/ig:profile/ig:domain/ig:org"/>
    <!-- Preserve spaces in markdown content elements -->
    <xsl:preserve-space elements="ig:description ig:overview"/>

    <!-- This template is overridden in generate.xsl.  It appears
        here to test JUST the generation of the index file.
    -->
    <xsl:template match="/">
        <xsl:call-template name="overview"/>
    </xsl:template>

    <xsl:template name="overview" match="/" mode="overview">
        <xsl:param name="dest" select="'pagecontent/overview.md'"/>
        <xsl:result-document href="pagecontent/overview.md" method="text">
<xsl:apply-templates select="/ig:profile/ig:description|/ig:profile/ig:overview"/>

<xsl:if test="/ig:profile/ig:usecase">
<xsl:result-document href="pagecontent/use_cases.md">
The sections below describe the use cases supported by the
<xsl:value-of select="string-join(($org, /ig:profile/@id),' ')"/> Implementation Guide.

<xsl:apply-templates select="/ig:profile/ig:usecase" mode="overview"/>
<xsl:apply-templates select="/ig:profile/ig:usecase" mode="process-flow-diagram"/>
</xsl:result-document>
</xsl:if>

**Footnotes**
        </xsl:result-document>
    </xsl:template>

    <xsl:template match="ig:usecase" mode="overview">
        <xsl:variable name="title">Use Case <xsl:value-of select="position()"/>: <xsl:value-of select="ig:name"/></xsl:variable>

        <xsl:text>&#xA;### </xsl:text><xsl:value-of select="$title"/><xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="ig:description"/>
        <xsl:text>&#xA;This use case is supported by the following&#xA;</xsl:text>

        <xsl:variable name='implied-actors' select="/ig:profile/ig:transaction[@id=tokenize(current()/@transactions,' ')]/ig:message/(@from|@to)"/>
        <xsl:variable name='implied-content' select="/ig:profile/ig:transaction[@id=tokenize(current()/@transactions,' ')]/ig:message/(@content)"/>
        <xsl:call-template name="list-items">
            <xsl:with-param name="title">Actors</xsl:with-param>
            <xsl:with-param name="items" select="distinct-values(/ig:profile/ig:actor[@id=tokenize(current()/@actors,' ')]/@id|$implied-actors)"/>
        </xsl:call-template>
        <xsl:call-template name="list-items">
            <xsl:with-param name="title">Transactions</xsl:with-param>
            <xsl:with-param name="items" select="tokenize(@transactions,' ')"/>
        </xsl:call-template>
        <xsl:call-template name="list-items">
            <xsl:with-param name="title">Content</xsl:with-param>
            <xsl:with-param name="items" select="distinct-values(/ig:profile/ig:content[@id=tokenize(current()/@content,' ')]/@id|$implied-content)"/>
        </xsl:call-template>

        <xsl:text>&#xA;#### </xsl:text>
        <xsl:value-of select="$title"/>
        <xsl:text> Process Flow &#xA;</xsl:text>
        <xsl:apply-templates select="ig:overview"/>

        <xsl:call-template name="figureLink">
            <xsl:with-param name="name"><xsl:value-of select="$title"/><xsl:text> Process Flow</xsl:text></xsl:with-param>
            <xsl:with-param name="file"><xsl:text>usecase</xsl:text><xsl:value-of select="position()"/><xsl:text>-processflow.svg</xsl:text></xsl:with-param>
            <xsl:with-param name="number">2.3.1.<xsl:value-of select="position()"/>-1</xsl:with-param>
        </xsl:call-template>

        <xsl:for-each select=".//(ig:step|ig:return)">
            <xsl:text>&#xA;1. </xsl:text>
            <html:span id='{@id}'><xsl:value-of select="ig:name"/></html:span>
            <xsl:text>&#xA;</xsl:text>
            <xsl:apply-templates select="ig:description|ig:overview">
                <xsl:with-param name="indent"><xsl:text>   </xsl:text></xsl:with-param>
            </xsl:apply-templates>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="ig:usecase" mode="process-flow-diagram">
        <!-- This is an ugly hack to work around the limits in Saxon HE implementation of result-document() -->
        <xsl:choose>
            <xsl:when test="position()=1">
                <xsl:result-document href="images-source/usecase1-processflow.txt" method="text">
                    <xsl:call-template name="process-flow2"/>
                </xsl:result-document>
            </xsl:when>
            <xsl:when test="position()=2">
                <xsl:result-document href="images-source/usecase2-processflow.txt" method="text">
                    <xsl:call-template name="process-flow2"/>
                </xsl:result-document>
            </xsl:when>
            <xsl:when test="position()=3">
                <xsl:result-document href="images-source/usecase3-processflow.txt" method="text">
                    <xsl:call-template name="process-flow2"/>
                </xsl:result-document>
            </xsl:when>
            <xsl:when test="position()=4">
                <xsl:result-document href="images-source/usecase4-processflow.txt" method="text">
                    <xsl:call-template name="process-flow2"/>
                </xsl:result-document>
            </xsl:when>
            <xsl:when test="position()=5">
                <xsl:result-document href="images-source/usecase5-processflow.txt" method="text">
                    <xsl:call-template name="process-flow2"/>
                </xsl:result-document>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="process-flow2">
        <xsl:variable name="actors" select="/ig:profile/ig:actor"/>
        <xsl:text>@startuml&#xA;</xsl:text>
        <xsl:text>hide footbox&#xA;</xsl:text>
        <xsl:for-each select="distinct-values(.//ig:step/@from|.//ig:step/@to)">
            <!-- List actors in order of appearance -->
            <xsl:choose>
                <!-- If it's an actor in the profile use a box -->
                <xsl:when test="$actors/@id = .">
                    <xsl:text>participant "</xsl:text>
                    <xsl:value-of select="$actors[@id = current()]/ig:name"/>
                    <xsl:text>" as </xsl:text><xsl:value-of select="."/>
                    <xsl:text>&#xA;</xsl:text>
                </xsl:when>
                <!-- If it's not an actor in the profile use the stick figure -->
                <xsl:otherwise>
                    <xsl:text>actor "</xsl:text>
                    <xsl:value-of select="."/>
                    <xsl:text>"&#xA;</xsl:text>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
        <xsl:apply-templates select="ig:step|ig:return" mode="process-flow-diagram"/>
        <xsl:text>@enduml&#xA;</xsl:text>
    </xsl:template>

    <xsl:template match="ig:step" mode="process-flow-diagram">
        <xsl:variable name="number"
            select="count(preceding::ig:step|preceding::ig:return|ancestor-or-self::ig:step|self::ig:return)
            - count(ancestor::ig:usecase/preceding-sibling::ig:usecase//ig:step|ancestor::ig:usecase/preceding-sibling::ig:usecase//ig:return)"/>
        <xsl:text>"</xsl:text>
        <xsl:value-of select="@from"/>
        <xsl:text>" -> "</xsl:text>
        <xsl:value-of select="@to"/>
        <xsl:text>" : </xsl:text>
        <xsl:value-of select="concat($number,'. ', string-join(tokenize(ig:name,'&#xA;'),'\n'))"/>
        <xsl:text>&#xA;</xsl:text>

        <xsl:if test="not(../self::ig:step)">activate "<xsl:value-of select="@from"/>"&#xA;</xsl:if>
        <xsl:text>activate "</xsl:text>
        <xsl:value-of select="@to"/>
        <xsl:text>"&#xA;</xsl:text>
        <xsl:apply-templates select="ig:step|ig:return" mode="process-flow-diagram"/>
            <xsl:if test="not(ig:return) and (string(@from) != string(@to))">return&#xA;</xsl:if>
            <xsl:if test="not(../self::ig:step)">deactivate "<xsl:value-of select="@from"/>"&#xA;</xsl:if>
            <xsl:text>deactivate "</xsl:text>
            <xsl:value-of select="@to"/>
            <xsl:text>"&#xA;</xsl:text>
    </xsl:template>

    <xsl:template match="ig:return" mode="process-flow-diagram">
        <xsl:variable name="number"
            select="count(preceding::ig:step|preceding::ig:return|ancestor-or-self::ig:step|self::ig:return)
            - count(ancestor::ig:usecase/preceding-sibling::ig:usecase//ig:step|ancestor::ig:usecase/preceding-sibling::ig:usecase//ig:return)"/>
        <xsl:text>"</xsl:text>
        <xsl:value-of select="../@to"/>
        <xsl:text>" --> "</xsl:text>
        <xsl:value-of select="../@from"/>
        <xsl:text>" : </xsl:text>
        <xsl:value-of select="concat($number,'. ',ig:name)"/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
</xsl:stylesheet>
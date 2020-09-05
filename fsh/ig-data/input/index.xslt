<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ig="http://ainq.com/ig-definition"
    xmlns="http://ainq.com/ig-definition"
    xmlns:html="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:include href="utility.xslt"/>
    <xsl:param name="org" select="/ig:profile/ig:domain/ig:org"/>
    <!-- Preserve spaces in markdown content elements -->
    <xsl:preserve-space elements="ig:description ig:overview"/>

    <!-- This template is overridden in generate.xsl.  It appears
        here to test JUST the generation of the index file.
    -->
    <xsl:template match="/">
        <xsl:call-template name="index"/>
    </xsl:template>

    <xsl:template name="index" match="/" mode="index">
        <xsl:param name="dest" select="pagecontent/index.md"/>
        <xsl:result-document href="pagecontent/index.md" method="text">
<xsl:apply-templates select="/ig:profile/ig:description"/>

### About This Guide
This is a draft implementation guide to promote discussion with leaders in the Health
IT industry, and very much a work in progress.  All content in this guide is subject
to discussion and change.

The goal of publishing this guide is to encourage the creation of a community interested
in extremely rapid development of interfaces that can support communication Bed and other
resourcees to Public Health in this time of crisis.

This implementation guide provides the FHIR Implementation materials associated with
the SANER project.

### Organization of This Guide
This guide is organized into four main sections:

1. Volume I: [Overview](overview.html) - Provides an overview of the challenges this effort is trying to address.
   1. [Technology Environment](technology_environment.html) - Describes the technology environment for uninitiated.
   2. [Architecture](architecture.html) - Illustrates the Microservice Architecture
   3. [Security Considerations](security_considerations.html) - Documents security concerns and mitigations
   4. [Use Cases](use_cases.html) - Illustrates key use cases
   5. [Actors](actors.html) - Provides an overview of technical components
   6. [Measures used for Reporting](measures.html) - Defines measures used by CDC and FEMA as FHIR Measure resources
   7. [Using Group Resources (deprecated)](using_group_resources.html) - Explains the use of group in this guide
<xsl:if test="/ig:profile/ig:transaction">
2. Volume II: [Transactions](transactions.html)
<xsl:for-each select="/ig:profile/ig:transaction">
    <xsl:text>   </xsl:text><xsl:value-of select='position()'/><xsl:text>. [</xsl:text>
    <xsl:value-of select="ig:name"/>
    <xsl:text> [</xsl:text>
    <xsl:value-of select="@id"/>
    <xsl:text>]](transaction-</xsl:text>
    <xsl:value-of select="position()"/>
    <xsl:text>.html)&#xA;</xsl:text>
</xsl:for-each>
</xsl:if>
<xsl:if test="/ig:profile/ig:transaction">
3. Volume III: Content Profiles
<xsl:for-each select="/ig:profile/ig:content">
    <xsl:text>   </xsl:text><xsl:value-of select="position()"/>. [<xsl:value-of select="ig:name"/>](StructureDefinition-<xsl:value-of select="lower-case(/ig:profile/@id)"/>-<xsl:value-of select="@id"/>.html)
</xsl:for-each>
4. Volume IV: Terminology
<xsl:for-each select="tokenize(/ig:profile/@codingsystems, ' ')">
    <xsl:text>   </xsl:text><xsl:value-of select="position()"/>. [<xsl:value-of select="."/> Coding System](CodeSystem-<xsl:value-of select="."/>.html)
</xsl:for-each>
<xsl:variable name='count' select="count(tokenize(/ig:profile/@valuesets, ' '))"/>
<xsl:for-each select="tokenize(/ig:profile/@valuesets, ' ')">
    <xsl:text>   </xsl:text><xsl:value-of select="position()+$count"/>. [<xsl:value-of select="."/> Value Set](ValueSet-<xsl:value-of select="."/>.html)
</xsl:for-each>

&#xA;
</xsl:if>
Click on any of the links above, head on over the [table of contents](toc.html), or
if you are looking for a specific artifact, check out the [index](artifacts.html).

You can also download:

* [this entire guide](full-ig.zip),
* the definition resources in [json](definitions.json.zip), [xml](definitions.xml.zip), [ttl](definitions.ttl.zip), or [csv](csvs.zip) format, or
* the example resources in [json](examples.json.zip), [xml](examples.xml.zip) or [ttl](examples.ttl.zip) format.

The source code for this Implementation Guide can be found on
[https://github.com/AudaciousInquiry/saner-ig](https://github.com/AudaciousInquiry/saner-ig).

### About Audacious Inquiry ###
[Audacious Inquiry](https://ainq.com) (Ai) is an industry-shaping health information technology and
policy company that provides bold solutions for connected healthcare. Nationally recognized for its
work to facilitate health data interoperability, Ai is a trusted partner to CMS, ONC, state Hospital
Associations and Medicaid agencies across the country. The company delivers a cloud-based software as
a service platform that is the catalyst for secure and smart health information exchange among
physicians, hospitals, health plans, ACOs, MCOs, and public health agencies across 12 US states.
Ai is raising the bar for how health data is shared, managed, and protected.

        </xsl:result-document>
    </xsl:template>
</xsl:stylesheet>
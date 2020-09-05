<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:ig="http://ainq.com/ig-definition"
    xmlns:s="https://github.com/FHIR/sushi"
    xmlns:html="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xs"
    version="2.0">

    <xsl:include href="utility.xslt"/>

    <!-- Include FSH Support Functions -->
    <xsl:include href="fsh.xslt"/>

    <xsl:param name="org" select="/ig:profile/ig:domain/ig:org"/>
    <xsl:variable name='base' select='/ig:profile/@base'/>

    <!-- Preserve spaces in markdown content elements -->

    <xsl:preserve-space elements="ig:description ig:overview"/>
    <!-- This template is overridden in generate.xsl.  It appears
        here to test JUST the generation of the index file.
    -->
    <xsl:template match="/">
        <xsl:call-template name="actorsandtransactions"/>
    </xsl:template>

    <xsl:template name="actorsandtransactions" match="/" mode="actorsandtransactions">
        <xsl:param name="dest" select="'pagecontent/actors.md'"/>
        <xsl:result-document href="pagecontent/actors.md" method="text">
This section defines the actors in this implementation guide.

Figure <xsl:value-of select="/ig:profile/@chapter"/>.1-1 below shows the actors directly
involved in the <xsl:value-of select="/ig:profile/@id"/>
Profile and the relevant transactions between them.&#xA;

<xsl:call-template name="actor-transaction-diagram"/>
            <xsl:call-template name="figureLink">
                <xsl:with-param name="name"><xsl:value-of select="/ig:profile/@id"/> Actor Diagram</xsl:with-param>
                <xsl:with-param name="file">ActorsAndTransactions.svg</xsl:with-param>
                <xsl:with-param name="number">3-1</xsl:with-param>
            </xsl:call-template>

            <xsl:call-template name="actor-transaction-table"/>

            <xsl:call-template name="actor-descriptions"/>

            <xsl:call-template name="actor-options"/>

        </xsl:result-document>
        <xsl:result-document href="pagecontent/transactions.md" method="text">
            <xsl:call-template name="transaction-descriptions"/>
        </xsl:result-document>
        <xsl:apply-templates select="/ig:profile/ig:transaction" mode="transaction"/>
        <!-- Produce Actor CapabilityStatements -->
        <xsl:for-each select="//ig:actor">
            <xsl:variable name="actor" select="@id"/>
            <xsl:variable name="tx" select="//ig:transaction[$actor = .//ig:message/(@from|@to)]"/>
            <xsl:call-template name="transaction-capability">
                <xsl:with-param name="trans" select="$tx"/>
                <xsl:with-param name="isActor" select="."/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="ig:transaction" mode="transaction">
        <xsl:result-document href="pagecontent/transaction-{position()}.md" method="text">
            <xsl:call-template name="transaction2"/>
        </xsl:result-document>
        <xsl:result-document href="images-source/transaction-{position()}-uc.txt" method="text">
            <xsl:call-template name="transaction-uc"/>
        </xsl:result-document>
        <xsl:result-document href="images-source/transaction-{position()}-seq.txt" method="text">
            <xsl:call-template name="transaction-seq"/>
        </xsl:result-document>
        <xsl:call-template name="transaction-capability"/>
    </xsl:template>

    <xsl:template name="transaction-uc">
        <xsl:text>@startuml&#xA;</xsl:text>
        <xsl:variable name='actorids' select="distinct-values(.//ig:message/(@from|@to))"/>
        <xsl:for-each select="//ig:actor[@id = $actorids]">
            <xsl:text>&#xA;agent "</xsl:text>
            <xsl:value-of select="ig:name"/>
            <xsl:text>" as </xsl:text>
            <xsl:value-of select="@id"/>
            <xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
        <xsl:text>usecase (</xsl:text>
        <xsl:value-of select="ig:name"/>
        <xsl:text>) as (</xsl:text>
        <xsl:value-of select="@id"/>
        <xsl:text>)&#xA;</xsl:text>
        <xsl:variable name='name' select="@id"/>
        <xsl:for-each select="//ig:actor[@id = $actorids]">
            <xsl:value-of select="@id"/>
            <xsl:text> --> (</xsl:text>
            <xsl:value-of select="$name"/>
            <xsl:text>)&#xA;</xsl:text>
        </xsl:for-each>
        <xsl:text>@enduml&#xA;</xsl:text>
    </xsl:template>

    <xsl:template name='transaction2'>
        <xsl:variable name="tx" select="."/>
        <xsl:variable name='section' select="concat('2.',position())"/>
        <xsl:text>This section describes the </xsl:text>
        <xsl:value-of select='@id'/>
        <xsl:text> of this guide. This transaction is used by the </xsl:text>
        <xsl:variable name='actorids' select="distinct-values(.//ig:message/(@from|@to))"/>
        <xsl:for-each select="//ig:actor[@id = $actorids]">
            <xsl:choose>
                <xsl:when test="position() = 1"></xsl:when>
                <xsl:when test="position() = last()"><xsl:text> and </xsl:text></xsl:when>
                <xsl:otherwise><xsl:text>, </xsl:text></xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="ig:name"/>
        </xsl:for-each>
        <xsl:text> actors.&#xA;</xsl:text>

        <xsl:text>&#xA;### Scope&#xA;</xsl:text>
        <xsl:apply-templates select="ig:description|ig:overview"/>

        <xsl:text>&#xA;### Actors Roles&#xA;</xsl:text>
        <xsl:call-template name="figureLink">
            <xsl:with-param name="name"><xsl:value-of select="ig:name"/> Use Case Diagram</xsl:with-param>
            <xsl:with-param name="file">transaction-<xsl:value-of select="position()"/>-uc.svg</xsl:with-param>
            <xsl:with-param name="number">2.<xsl:value-of select="position()"/>-1</xsl:with-param>
        </xsl:call-template>

        <xsl:text>&lt;table border='1' borderspacing='0'>
&lt;caption>&lt;b>Table </xsl:text>
        <xsl:value-of select="$section"/>
        <xsl:text>-1: Actor Roles&lt;/b>&lt;/caption>
&lt;thead>&lt;tr>&lt;th>Actor&lt;/th>&lt;th>Role&lt;/th>&lt;/tr>&lt;/thead>
&lt;tbody></xsl:text>
        <xsl:for-each select="//ig:actor[@id = $actorids]">
            <xsl:text>&lt;tr>&lt;td>&lt;a href="actors.html#</xsl:text>
            <xsl:value-of select="translate(lower-case(ig:name),' ', '-')"/>"><xsl:value-of select="ig:name"/>
            <xsl:text>&lt;/a>&lt;/td>
&lt;td></xsl:text><xsl:value-of select='(ig:supports-tx|ig:requires-tx)[@transaction=$tx/@id]/ig:role'/>&lt;/td>
&lt;/tr>
        </xsl:for-each>
        <xsl:text>&#xA;&lt;/tbody>
&lt;/table>&#xA;</xsl:text>
    <xsl:call-template name="referenced-standards">
        <xsl:with-param name="tx" select="$tx"/>
    </xsl:call-template>
    <xsl:text>
### Interactions
        </xsl:text>
        <xsl:call-template name="figureLink">
            <xsl:with-param name="name"><xsl:value-of select="ig:name"/> Interactions</xsl:with-param>
            <xsl:with-param name="file">transaction-<xsl:value-of select="position()"/>-seq.svg</xsl:with-param>
            <xsl:with-param name="number">2.<xsl:value-of select="position()"/>-2</xsl:with-param>
        </xsl:call-template>


        <xsl:for-each select=".//(ig:message|ig:result)">
            <xsl:text>&#xA;#### </xsl:text><xsl:value-of select="ig:name"/><xsl:text>&#xA;</xsl:text>
            <xsl:text>&#xA;</xsl:text>
            <xsl:apply-templates select="ig:description|ig:overview"/>

            <xsl:text>&#xA;##### Trigger Event - </xsl:text><xsl:value-of select="ig:trigger/ig:name"/><xsl:text>&#xA;</xsl:text>
            <xsl:apply-templates select="ig:trigger/ig:description|ig:trigger/ig:overview"/>

            <xsl:text>&#xA;##### Message Semantics&#xA;</xsl:text>
            <xsl:apply-templates select="ig:semantics/ig:description|ig:semantics/ig:overview"/>

            <xsl:if test='ig:semantics/ig:interaction/ig:group'>
                <xsl:text>&#xA;The following are general requirements of the interaction.&#xA;</xsl:text>
                <xsl:text>&#xA;&lt;ol>&#xA;</xsl:text>
                <xsl:apply-templates select="ig:semantics/ig:interaction/ig:group"/>
                <xsl:text>&#xA;&lt;/ol>&#xA;</xsl:text>
                <xsl:apply-templates select="ig:semantics/ig:interaction/ig:operation"/>
            </xsl:if>
            <xsl:text>&#xA;##### Expected Actions&#xA;</xsl:text>
            <xsl:for-each select="ig:action">
                <xsl:text>&#xA;###### </xsl:text><xsl:value-of select="ig:name"/><xsl:text>&#xA;</xsl:text>
                <xsl:apply-templates select="ig:description|ig:overview"/>
            </xsl:for-each>
        </xsl:for-each>

### Conformance
See the following CapabilityStatement resources for conformance requirements:

        <xsl:call-template name='transaction-capability'>
            <xsl:with-param name='isCapabilityLink' select='true()'/>
        </xsl:call-template>

    </xsl:template>

    <xsl:template match="ig:group">
        <xsl:text>&#xA;&lt;li>&#xA;</xsl:text>
        <xsl:value-of select="ig:name"/>
        <xsl:text>&#xA;&lt;div>&#xA;</xsl:text>
        <xsl:apply-templates select="ig:description|ig:overview"/>
        <xsl:text>&#xA;&lt;/div>&#xA;</xsl:text>
        <xsl:call-template name="parameters"/>
        <xsl:text>&#xA;&lt;/li>&#xA;</xsl:text>
    </xsl:template>
    <xsl:template match='@expect|@client'>
        <xsl:text>&lt;b></xsl:text><xsl:value-of select='upper-case(translate(.,"-"," "))'/><xsl:text>&lt;/b></xsl:text>
    </xsl:template>
    <xsl:template match="ig:operation">
        <xsl:text>&#xA;###### </xsl:text><xsl:value-of select="ig:name"/><xsl:text>&#xA;</xsl:text>
        <xsl:apply-templates select="ig:description|ig:overview"/>
        <xsl:if test="@client">
            <xsl:text>The </xsl:text><xsl:value-of select='ancestor::ig:message[1]/@from'/>
            <xsl:text> </xsl:text><xsl:apply-templates select="@client"/>
            <xsl:text> demonstrate the FHIR </xsl:text><xsl:value-of select="@name"/>
            <xsl:text> operation on </xsl:text>
            <xsl:apply-templates select="@resources"/>
            <xsl:if test='ig:parameter|ig:group'>
                <xsl:text> with the following parameters</xsl:text>
            </xsl:if>
            <xsl:text>.&#xA;</xsl:text>
        </xsl:if>
        <xsl:text>The </xsl:text><xsl:value-of select='ancestor::ig:message[1]/@to'/>
        <xsl:text> </xsl:text><xsl:apply-templates select="@expect"/>
        <xsl:text> demonstrate the FHIR </xsl:text><xsl:value-of select="@name"/><xsl:text> operation on </xsl:text>
        <xsl:apply-templates select="@resources"/>
        <xsl:if test='ig:parameter|ig:group'>
            <xsl:text> with the following parameters</xsl:text>
        </xsl:if>
        <xsl:text>.&#xA;</xsl:text>
        <xsl:if test='ig:group'>
        <xsl:text>&#xA;&lt;ol>&#xA;</xsl:text>
        <xsl:apply-templates select="ig:group"/>
        <xsl:text>&#xA;&lt;/ol>&#xA;</xsl:text>
        </xsl:if>
        <xsl:call-template name="parameters"/>
    </xsl:template>
    <xsl:template match="@resources">
        <xsl:variable name='res' select='tokenize(.,"\s+")'/>
        <xsl:choose>
            <xsl:when test="count($res) = 1"> the <xsl:value-of select="$res"/> resource</xsl:when>
            <xsl:otherwise> the <xsl:value-of select='string-join($res[position() != last()],", ")'/> and <xsl:value-of select="$res[position() = last()]"/> resources</xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name='parameters'>
        <xsl:if test='ig:parameter'>
&#xA;&lt;table class='grid'>
&#xA;&lt;thead>&lt;tr>
&#xA;&lt;th>Parameter&lt;/th>&lt;th>Cardinality&lt;/th>&lt;th>
<xsl:value-of select='//ig:actor[@id = current()/ancestor::ig:message/@to]/ig:name'/> Expectation&lt;/th>&lt;th>
<xsl:value-of select='//ig:actor[@id = current()/ancestor::ig:message/@from]/ig:name'/> Expectation&lt;/th>
&#xA;&lt;/tr>&lt;/thead>
&#xA;&lt;tbody>
<xsl:for-each select="ig:parameter">
&#xA;&lt;tr>
&#xA;&lt;td>&#xA;
<xsl:value-of select='@name'/>
<xsl:if test='@values'>
<xsl:text>=</xsl:text>
<xsl:value-of select="string-join(tokenize(@values|@comp,'\s+'),'|')"/>
<xsl:if test='@comp'>
&lt;i>value&lt;/i>
</xsl:if>
</xsl:if>
&#xA;&lt;/td>
&#xA;&lt;td>&#xA;
<xsl:if test='@min or @max'>
<xsl:value-of select="@min"/>
<xsl:text>..</xsl:text>
<xsl:value-of select="@max"/>
</xsl:if>
&lt;/td>
&lt;td>&#xA;
<xsl:apply-templates select="@expect"/>
&#xA;&lt;/td>
&lt;td>&#xA;
<xsl:apply-templates select="if (@client) then (@client) else (@expect)"/>
&#xA;&lt;/td>
&lt;/tr>
</xsl:for-each>
&lt;/tbody>
&lt;/table>&#xA;
        </xsl:if>
    </xsl:template>
    <xsl:template name="referenced-standards">
        <xsl:param name="tx"/>
        <xsl:text>&#xA;### Referenced Standards&#xA;
&lt;table border='1' borderspacing='0'>
&lt;caption>&lt;b>Table 3.71.3-1: Referenced Standards&lt;/b>&lt;/caption>
&lt;thead>&lt;tr>&lt;th>Standard&lt;/th>&lt;th>Name&lt;/th>&lt;/tr>&lt;/thead>
&lt;tbody></xsl:text>
        <xsl:for-each select="/ig:profile/ig:standard[@id=tokenize($tx/@standards)]">
            &lt;tr>&lt;td><xsl:value-of select="@id"/>&lt;/td>&lt;td>&lt;a href='<xsl:value-of select="ig:url"/>'><xsl:value-of select="ig:name"/>&lt;/a>&lt;/td>&lt;/tr>
        </xsl:for-each><xsl:text>
&lt;/tbody>
&lt;/table>&#xA;</xsl:text>
    </xsl:template>

    <xsl:template name="transaction-seq">
        <xsl:variable name='actorids' select="distinct-values(.//ig:message/(@from|@to))"/>
        <xsl:variable name="actors" select="//ig:actor[@id = $actorids]"/>
        <xsl:text>@startuml&#xA;</xsl:text>
        <xsl:text>hide footbox&#xA;</xsl:text>
        <xsl:for-each select="distinct-values(.//ig:message/(@from|@to))">
            <xsl:text>participant "</xsl:text>
            <xsl:value-of select="$actors[@id = current()]/ig:name"/>
            <xsl:text>" as </xsl:text><xsl:value-of select="."/>
            <xsl:text>&#xA;</xsl:text>
        </xsl:for-each>
        <xsl:apply-templates select="ig:message|ig:result" mode="interaction-diagram"/>
        <xsl:text>@enduml&#xA;</xsl:text>
    </xsl:template>

    <xsl:template match="ig:message" mode="interaction-diagram">
        <xsl:variable name="number"
            select="count(preceding::ig:message|preceding::ig:result|ancestor-or-self::ig:message|self::ig:result)
            - count(ancestor::ig:transaction/preceding-sibling::ig:transaction//ig:message|ancestor::ig:transaction/preceding-sibling::ig:transaction//ig:result)"/>

        <xsl:text>"</xsl:text>
        <xsl:value-of select="@from"/>
        <xsl:text>" -> "</xsl:text>
        <xsl:value-of select="@to"/>
        <xsl:text>" : </xsl:text>
        <xsl:value-of select="concat($number,'. ',ig:name)"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:if test="not(../self::ig:message)">activate "<xsl:value-of select="@from"/>"&#xA;</xsl:if>
        <xsl:if test="not(string(@from) = string(@to))">
            <xsl:text>activate "</xsl:text><xsl:value-of select="@to"/><xsl:text>"&#xA;</xsl:text>
        </xsl:if>


        <xsl:apply-templates select="ig:messsage|ig:result" mode="interaction-diagram"/>
        <xsl:if test="not(ig:result) and not(string(@from) = string(@to))">return&#xA;</xsl:if>
        <xsl:if test="not(../self::ig:message)">deactivate "<xsl:value-of select="@from"/>"&#xA;</xsl:if>
        <xsl:if test="not(string(@from) = string(@to))">
            <xsl:text>deactivate "</xsl:text><xsl:value-of select="@to"/><xsl:text>"&#xA;</xsl:text>
        </xsl:if>
    </xsl:template>

    <xsl:template match="ig:result" mode="interaction-diagram">
        <xsl:variable name="number"
            select="count(preceding::ig:message|preceding::ig:result|ancestor-or-self::ig:message|self::ig:result)
            - count(ancestor::ig:transaction/preceding-sibling::ig:transaction//ig:message|ancestor::ig:transaction/preceding-sibling::ig:transaction//ig:result)"/>
        <xsl:text>"</xsl:text>
        <xsl:value-of select="../@to"/>
        <xsl:text>" --> "</xsl:text>
        <xsl:value-of select="../@from"/>
        <xsl:text>" : </xsl:text>
        <xsl:value-of select="concat($number,'. ',ig:name)"/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:template>
    <xsl:template match="text()" mode="interaction-diagram"/>

    <xsl:template name="actor-transaction-diagram">
        <xsl:result-document href="images-source/ActorsAndTransactions.txt" method="text">
            <xsl:text>@startuml
skinparam FolderBorderColor white
skinparam FolderFontColor white
skinparam Shadowing false
folder Actors {&#xA;</xsl:text>
            <xsl:variable name="actors" select="/ig:profile/ig:actor"/>
            <!-- For each actor generate a line of the form:
                agent "Actor-Name" as Actor-id
                -->
            <xsl:for-each select="$actors[not(@groups)]">
                <xsl:text>agent "</xsl:text>
                <xsl:value-of select="ig:name"/>
                <xsl:text>" as </xsl:text>
                <xsl:value-of select="@id"/>
                <xsl:text>&#xA;</xsl:text>
            </xsl:for-each>
            <!-- For each pair of actors, create the necessary communications link between them -->
            <xsl:for-each select="$actors/@id">
                <xsl:variable name="A" select="."/>
                <xsl:for-each select=".|../following-sibling::ig:actor/@id">
                    <xsl:variable name="B" select="."/>
                    <!-- a link is necessary if there is a message from a to b or b to a -->
                    <xsl:if test="//ig:message[(@from = $A and @to = $B) or (@from = $B and @to = $A)]">
                        <xsl:value-of select="$A"/>
                        <xsl:text> -- </xsl:text>
                        <xsl:value-of select="$B"/>
                        <xsl:text> : "</xsl:text>
                        <!-- for each tranaction -->
                        <xsl:variable name="txnames">
                            <xsl:for-each select="/ig:profile/ig:transaction">
                                <xsl:variable name="arrow">
                                    <xsl:choose>
                                        <!-- if there a message (or return) from A to B and also from B to A -->
                                        <xsl:when test="(.//ig:message[@from = $A and @to = $B] and .//ig:message[@from = $B and @to = $A])">
                                            <xsl:value-of select="$udarr"/>
                                        </xsl:when>
                                        <!-- if there a message or return from only A to B -->
                                        <xsl:when test=".//ig:message[@from = $A and @to = $B]">
                                            <xsl:value-of select="$darr"/>
                                        </xsl:when>
                                        <!-- if there a message or return from only B to A -->
                                        <xsl:when test=".//ig:message[@from = $B and @to = $A]">
                                            <xsl:value-of select="$uarr"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </xsl:variable>
                                <!-- If no arrow is selected, the transaction doesn't apply -->
                                <xsl:if test="$arrow != ''">
                                    <xsl:value-of select="ig:name"/>
                                    <xsl:text> [</xsl:text>
                                    <xsl:value-of select="@id"/>
                                    <xsl:text>] </xsl:text>
                                    <xsl:value-of select="$arrow"/>
                                    <xsl:text>\n</xsl:text>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:variable>
                        <!-- Strip the terminal newline (the last two characters) -->
                        <xsl:value-of select="substring($txnames,1,string-length($txnames)-2)"/>
                        <xsl:text>"&#xA;</xsl:text>
                    </xsl:if>
                </xsl:for-each>
            </xsl:for-each>
            <xsl:text>}&#xA;</xsl:text>

            <xsl:for-each select="$actors[@groups]">
                <xsl:text>rectangle "</xsl:text>
                <xsl:value-of select="ig:name"/>
                <xsl:text>" as </xsl:text>
                <xsl:value-of select="@id"/>
                <xsl:text> { &#xA;</xsl:text>
                <xsl:variable name='grouper' select='.'/>
                <xsl:for-each select='$actors[@id=tokenize(current()/@groups)]'>
	                <xsl:text>agent "</xsl:text>
	                <xsl:value-of select="ig:name"/>
	                <xsl:text>" as </xsl:text>
	                <xsl:value-of select="@id"/><xsl:value-of select='generate-id($grouper)'/>
	                <xsl:text>&#xA;</xsl:text>
                </xsl:for-each>
                <xsl:text>}&#xA;</xsl:text>
            </xsl:for-each>

            <xsl:if test='count($actors[@groups]) &gt; 1'>
	            <xsl:for-each select="1 to count($actors[@groups])-1">
                  <xsl:variable name='index' select='.'/>
	              <xsl:variable name='g1' select='$actors[@groups][$index]'/>
                  <xsl:variable name='g2' select='$actors[@groups][$index+1]'/>
	              <xsl:value-of select="$g1/@id"/> -[hidden]- <xsl:value-of select="$g2/@id"/>
	              <xsl:text>&#xA;</xsl:text>
	            </xsl:for-each>
            </xsl:if>
            <xsl:text>@enduml&#xA;</xsl:text>
        </xsl:result-document>
    </xsl:template>

    <xsl:template name="actor-transaction-table">
        <xsl:text>Table 3-1 lists the transactions for each actor directly involved in the </xsl:text>
        <xsl:value-of select="/ig:profile/@id"/>
        <xsl:text> Implementation Guide. To claim compliance with this guide, an actor shall
support all required transactions (labeled "R") and may support the
optional transactions (labeled "O").&#xA;</xsl:text>

&lt;table border="1" borderspacing="0" style='border: 1px solid black; border-collapse: collapse'>
&lt;caption>
&lt;b>
<xsl:text>Table 3-1: </xsl:text>
<xsl:value-of select="/ig:profile/@id"/>
<xsl:text> Implementation Guide - Actors and Transactions</xsl:text>
&lt;/b>
&lt;/caption>
&lt;thead>
&lt;tr class="odd" style='background: gray;'>
&lt;th>Actors&lt;/th>
&lt;th>Transactions&lt;/th>
&lt;th>Optionality&lt;/th>
&lt;/tr>
&lt;/thead>
&lt;tbody>
                <xsl:for-each select="/ig:profile/ig:actor">
                    <xsl:variable name="actor" select="."/>
                    <xsl:variable name="all-tx" select="ig:requires-tx|ig:supports-tx|(//ig:actor[@id=tokenize(current()/@groups,' ')])/(ig:requires-tx|ig:supports-tx)"/>
                    <xsl:for-each select="$all-tx">
                        <xsl:variable name="tx" select="."/>
                        <xsl:variable name="trans" select="/ig:profile/ig:transaction[@id = $tx/@transaction]"/>
&lt;tr>
                        <xsl:if test="position()=1">
&lt;td rowspan="<xsl:value-of select="count($all-tx)"/>">
&lt;a href="#<xsl:value-of select="translate(lower-case($actor/ig:name),' ', '-')"/>"><xsl:value-of select="$actor/ig:name"/>&lt;/a>
&lt;/td>
                        </xsl:if>
&lt;td>
&lt;a href='transaction-<xsl:value-of select="count($trans/preceding::ig:transaction)+1"/>.html'>
                        <xsl:value-of select="$trans/ig:name"/>
                        <xsl:text> [</xsl:text>
                        <xsl:value-of select="$trans/@id"/>
                        <xsl:text>]&lt;/a></xsl:text>
                        <xsl:if test='$actor/@groups'>
                            <xsl:text>&lt;br/>&lt;i>As </xsl:text><xsl:value-of select="../ig:name"/><xsl:text>&lt;/i></xsl:text>
                        </xsl:if>
&lt;/td>
&lt;td align='center'>
                        <xsl:choose>
                            <xsl:when test="$tx/local-name() = 'requires-tx'">R</xsl:when>
                            <xsl:when test="$tx/local-name() = 'supports-tx' and $tx/@required-with-options">
                                <xsl:text>C</xsl:text>
<!-- generate superscript for when notes -->
                                &lt;sup> <xsl:value-of select='count(preceding::*/@required-with-options) + 1'/>&lt;/sup>
                            </xsl:when>
                            <xsl:otherwise>O</xsl:otherwise>
                        </xsl:choose>
&lt;/td>
&lt;/tr>
                    </xsl:for-each>
                </xsl:for-each>
&lt;/tbody>
&lt;/table>
        <!-- report condition notes -->
        <xsl:for-each select=".//@required-with-options">
            <xsl:if test='position() = 1'>
                <xsl:text>&#xA;**Notes:**&#xA;</xsl:text>
            </xsl:if>
            <xsl:text>&#xA;</xsl:text>
            <xsl:value-of select="position()"/>
            <xsl:text>. This transaction is required when the </xsl:text>
            <xsl:value-of select="ancestor::ig:actor/ig:name"/>
            <xsl:text> implements the </xsl:text>
            <xsl:variable name="options" select="//ig:option[@id=tokenize(current(),' ')]"/>
            <xsl:for-each select="$options">
                <xsl:choose>
                    <xsl:when test="position() = 1"/>
                    <xsl:when test='position() != last()'>
                        <xsl:text>, </xsl:text>
                    </xsl:when>
                    <xsl:otherwise><!--position()=last()-->
                        <xsl:text>, or </xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>[</xsl:text><xsl:value-of select="ig:name"/><xsl:text>](</xsl:text>
                <xsl:value-of select="concat('#',lower-case(translate(ig:name,' ','-')))"/>
                <xsl:text>)</xsl:text>
            </xsl:for-each>
            <xsl:text>.&#xA;</xsl:text>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name='actor-descriptions'>
        <xsl:text>&#xA;### Actors&#xA;</xsl:text>
        <xsl:text>The actors in this profile are described in more detail in the sections below.&#xA;</xsl:text>
        <xsl:for-each select="/ig:profile/ig:actor">
            <xsl:call-template name="generate-gherkin"/>
            <xsl:text>&#xA;#### </xsl:text>
            <xsl:value-of select="ig:name"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:apply-templates select="ig:description|ig:overview"/>
            <xsl:if test="ig:requires">
                <xsl:text>&#xA;##### </xsl:text>
                <xsl:value-of select="ig:name"/>
                <xsl:text> Requirements&#xA;</xsl:text>
                <xsl:apply-templates select="ig:requires"/>
            </xsl:if>
            <xsl:text>&#xA;&#xA;##### </xsl:text>
            <xsl:value-of select="ig:name"/>
            <xsl:text> Conformance

See the following CapabilityStatement resources for conformance requirements:</xsl:text>
            <xsl:variable name="actor" select="@id"/>
            <xsl:call-template name='transaction-capability'>
                <xsl:with-param name='isCapabilityLink' select='true()'/>
                <xsl:with-param name='isActor' select='.'/>
                <xsl:with-param name="trans" select="//ig:transaction[$actor = .//ig:message/(@from|@to)]"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name='actor-options'>
        <xsl:text>&#xA;### Actor Options&#xA;</xsl:text>
Options that may be selected for each actor in this guide, are listed in Table 3.2-1 below. Dependencies
between options when applicable are specified in notes.

&lt;table border="1" style="border: 1px solid black; border-collapse: collapse">
    &lt;caption>&lt;b>Table 3.2-1 Actor Options&lt;/b>&lt;/caption>
    &lt;thead>
        &lt;tr style="background: gray;" class="odd">
            &lt;td>Actor&lt;/td>
            &lt;td>Option Name&lt;/td>
        &lt;/tr>
    &lt;/thead>
    &lt;tbody>
        <xsl:for-each select='//ig:actor'>
            <xsl:variable name='actor' select='.'/>
            <xsl:for-each select="//ig:option[ig:participant/@actor = current()/@id]">
                &lt;tr>
                <xsl:if test="position() = 1">
                    &lt;td rowspan='<xsl:value-of select='last()'/>'><xsl:value-of select="$actor/ig:name"/>&lt;/td>
                </xsl:if>
                &lt;td>&lt;a href="#<xsl:value-of select="lower-case(translate(ig:name,' ','-'))"/>"><xsl:value-of select="ig:name"/>&lt;/a>&lt;/td>
                &lt;/tr>
            </xsl:for-each>
            <xsl:if test="count(//ig:option/ig:participant[@actor = $actor/@id])=0">
                &lt;tr>&lt;td><xsl:value-of select="ig:name"/>&lt;/td>
                &lt;td>&lt;i>No Options Defined&lt;/i>&lt;/td>&lt;/tr>
            </xsl:if>
        </xsl:for-each>
    &lt;/tbody>
&lt;/table>

        <xsl:text>&#xA;The options in this guide are describe in more detail the sections below.&#xA;</xsl:text>
        <xsl:for-each select="//ig:option">
            <xsl:text>&#xA;#### </xsl:text>
            <xsl:value-of select="ig:name"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:apply-templates select="ig:description|ig:overview"/>
            <xsl:text>This option applies to the actors as described below.&#xA;</xsl:text>
            <xsl:for-each select="ig:participant">
                <xsl:variable name="actor" select="//ig:actor[@id=current()/@actor]"/>
                <xsl:text>&#xA;##### </xsl:text>
                <xsl:value-of select="$actor/ig:name"/>
                <xsl:text>&#xA;</xsl:text>
                <xsl:apply-templates select="ig:description|ig:overview"/>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name='transaction-descriptions'>
        <xsl:text>The transactions in this profile are summarized in the sections below.&#xA;</xsl:text>
        <xsl:for-each select="/ig:profile/ig:transaction">
            <xsl:text>&#xA;### </xsl:text>
            <xsl:value-of select="ig:name"/>
            <xsl:text>&#xA;</xsl:text>
            <xsl:apply-templates select="ig:description|ig:overview"/>
            <xsl:text>&#xA;For more details see the detailed [transaction description](transaction-</xsl:text><xsl:value-of select="position()"/><xsl:text>.html)&#xA;</xsl:text>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="ig:requires">
        <xsl:text>&#xA;</xsl:text>
        <xsl:value-of select='position()'/>
        <xsl:text>. </xsl:text>
        <xsl:value-of select="ig:description"/>
        <xsl:if test="ig:overview">
            <xsl:text>&lt;br/></xsl:text><xsl:value-of select="ig:overview"/>
            <xsl:text>&#xA;</xsl:text>
        </xsl:if>
        <xsl:apply-templates select="ig:test"/>
    </xsl:template>

    <xsl:template match="ig:test">
        <!--  This is what we want to generate.  It's tricky b/c of XML whitespace processing,
            AND markdown whitespace handling.

   * **Scenario: Test name 1**<br/>
   _Test description_<br/>
   An overview can also contain markdown<br/>
   **GIVEN** A = B<br/>
   **WHEN ** B = C<br/>
   **THEN **  A = C<br/>
   **AND  **  C = A<br/>
            -->
        <xsl:text>&#xA;   * **Scenario: </xsl:text>
        <xsl:value-of select="ig:name"/>
        <xsl:text>**&lt;br/>&#xA;</xsl:text>
        <xsl:if test="ig:description">
            <xsl:text>   _</xsl:text><xsl:value-of select="ig:description"/>
            <xsl:text>_&lt;br/>&#xA;</xsl:text>
        </xsl:if>
        <xsl:if test="ig:overview">
            <xsl:text>   </xsl:text><xsl:value-of select="ig:overview"/>
            <xsl:text>&lt;br/>&#xA;</xsl:text>
        </xsl:if>

        <xsl:apply-templates select="ig:given"/>
        <xsl:apply-templates select="ig:when"/>
        <xsl:apply-templates select="ig:then|ig:and|ig:but"/>
    </xsl:template>

    <xsl:template match="ig:given|ig:when|ig:then|ig:and|ig:but">
        <xsl:value-of select="
            concat('   **',
            upper-case(local-name()),
            substring('**      ', 1, 8 - string-length(local-name())),
            text(),'&lt;br/>&#xA;')"/>
    </xsl:template>

    <xsl:template match="ig:given|ig:when|ig:then|ig:and|ig:but" mode="gherkin">
        <xsl:value-of select="concat(upper-case(local-name()),
            substring('      ', 1, 6 - string-length(local-name())),
            text(),'&#xA;')"/>
    </xsl:template>

    <xsl:template name="generate-gherkin">
        <xsl:result-document href="feature/actor-{@id}.feature" method="text">
            <xsl:text>&#xA;# </xsl:text>
            <xsl:value-of select="/ig:profile/@id"/>
            <xsl:text> </xsl:text>
            <xsl:value-of select="ig:name"/>
            <xsl:text> Actor Requirements&#xA;</xsl:text>
            <xsl:text>@</xsl:text>
            <xsl:value-of select="/ig:profile/@id"/>
            <xsl:text> @</xsl:text>
            <xsl:value-of select="/ig:profile/@id"/>-<xsl:value-of select="@id"/>
            <xsl:text>&#xA;</xsl:text>

            <xsl:for-each select="ig:requires">
                <xsl:text>&#xA;Feature: </xsl:text>
                <xsl:value-of select="concat(../@id,'-',position(),' ', ig:description)"/>
                <xsl:apply-templates select="ig:overview"/>
                <xsl:for-each select="ig:test">
                    <xsl:text>&#xA;Scenario: </xsl:text>
                    <xsl:value-of select="ig:name"/>
                    <xsl:text>&#xA;</xsl:text>
                    <xsl:apply-templates select="ig:description|ig:overview"/>

                    <xsl:apply-templates select="ig:given" mode="gherkin"/>
                    <xsl:apply-templates select="ig:when" mode="gherkin"/>
                    <xsl:apply-templates select="ig:then|ig:and|ig:but" mode="gherkin"/>
                    <xsl:text>&#xA;</xsl:text>
                </xsl:for-each>
            </xsl:for-each>
        </xsl:result-document>
    </xsl:template>


    <xsl:template name="not-done">
        ## ACDC Required Actor Groupings
        {: style="--heading-prefix: '15.3'"}
        {if Profile.grouping[required=true] exists }
        <table border='1' style="border: 1px solid black; border-collapse: collapse">
            <caption><b>Table {Profile.chapter}.3-1: {Profile.id} - Required Actor Groupings</b></caption>
            <thead>
                <tr class="odd" style="background: gray">
                    <th>ACDC Actor</th>
                    <th>Actor to be grouped with</th>
                </tr>
            </thead>
            <tbody>
                {for-each Profile.actors A where A.grouping.required == true }
                {for-each A.grouping G}
                {case position() == 1}
                <tr class="odd">
                    {if position() == 1}
                    <td rowspan="{A.grouping.count}">{A.name}</td>
                    {end-if}
                    <td>[{G.profile} {G.profile-actor}](crossprofileconsiderations.html#{A.id}-{filename(G.profile-actor)})</td>
                </tr>
                {end-for-each}
                {end-for-each}
            </tbody>
        </table>
        {else}
        None
        {endif}
    </xsl:template>

    <xsl:function name='s:combine'>
        <xsl:param name='values'/>
        <xsl:choose>
            <xsl:when test="count($values)=0">
                <xsl:sequence select="''"/>
            </xsl:when>
            <xsl:when test="count($values)=1">
                <xsl:sequence select="$values[1], ''"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:variable name='rest' select='s:combine($values[position() != 1])'/>
                <xsl:for-each select="$rest">
                    <xsl:sequence select="string-join(($values[1], .), ' '), ."/>
                </xsl:for-each>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:function>

    <xsl:template name='transaction-capability'>
        <xsl:param name='isCapabilityLink' select='false()'/>
        <xsl:param name="trans" select="."/>
        <xsl:param name='isActor' select="false()"/>
        <!-- identify the set of options -->
        <xsl:variable name="options" select="distinct-values(tokenize(string-join($trans/descendant-or-self::*/@options,' '),'\s+'))"/>
        <xsl:variable name="options2">
            <xsl:for-each select="$options">
                <xsl:sort select="string(.)"/>
                <xsl:sequence select="."/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name='combination' select='s:combine(tokenize($options2,"\s+"))'/>
        <xsl:for-each select="$combination">
            <xsl:sort select="."/>
            <xsl:variable name='opts' select='tokenize(normalize-space(.), "\s+")'/>
            <!-- Create the transaction content with this combination of options -->
            <xsl:variable name='tx'>
                <xsl:apply-templates select='$trans' mode="copy-with-options">
                    <xsl:with-param name="options" select="$opts"/>
                </xsl:apply-templates>
            </xsl:variable>
            <!-- If there is an operation to be performed -->
            <xsl:variable name="options" select="normalize-space(.)"/>
            <!-- Handle requirements of client first -->
            <xsl:choose>
                <xsl:when test='$isCapabilityLink'>
                    <xsl:variable name='actor' select="if ($isActor) then $isActor/@id else ''"/>
                    <xsl:if test='$tx//ig:message[$actor=(@from|@to)]//ig:operation/@resources'>
                        <xsl:call-template name='rest-resource-capability-link'>
                            <xsl:with-param name="options" select="$options"/>
                            <xsl:with-param name="isActor" select="$isActor"/>
                            <xsl:with-param name="tx" select="$tx[.//ig:interaction]"/>
                        </xsl:call-template>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name='rest-resource-capability'>
                        <xsl:with-param name="options" select="$options"/>
                        <xsl:with-param name="isActor" select="$isActor"/>
                        <xsl:with-param name="tx" select="$tx[.//ig:interaction]"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>

    <!-- Copy the content of an interaction or parameter or operation depending on the value
        of it's options -->
    <xsl:template match="ig:*" mode="copy-with-options">
        <xsl:param name='options'/>
        <xsl:copy>
            <xsl:copy-of select="@*"/>
            <xsl:apply-templates select="ig:*|text()" mode="copy-with-options">
                <xsl:with-param name="options" select="$options"/>
            </xsl:apply-templates>
        </xsl:copy>
    </xsl:template>
    <xsl:template match="ig:interaction" mode="copy-with-options">
        <!-- The set of applicable options -->
        <xsl:param name='options'/>
        <xsl:variable name="optionSet" select="distinct-values(tokenize(string-join(./descendant-or-self::*/@options|ancestor-or-self::*/@options,' '),'\s+'))"/>
        <!-- Include an interaction if it supports all options directly, or within subordinate operations -->
        <xsl:if test="count($optionSet) = 0 or count($optionSet[.=$options]) = count($options)">
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:apply-templates select="ig:*|text()" mode="copy-with-options">
                    <xsl:with-param name="options" select="$options"/>
                </xsl:apply-templates>
            </xsl:copy>
        </xsl:if>
    </xsl:template>
    <xsl:template match="ig:operation" mode="copy-with-options">
        <!-- The set of applicable options -->
        <xsl:param name='options'/>
        <xsl:variable name="optionSet" select="distinct-values(tokenize(string-join(./descendant-or-self::*/@options|ancestor-or-self::*/@options,' '),'\s+'))"/>
        <!-- Include an operation if it supports only the specified options -->
        <xsl:if test="count($optionSet) = 0 or
            (count($optionSet[.=$options]) = count($options) and count($optionSet) = count($options))">
            <xsl:copy>
                <xsl:copy-of select="@*"/>
                <xsl:apply-templates select="ig:*|text()" mode="copy-with-options">
                    <xsl:with-param name="options" select="$options"/>
                </xsl:apply-templates>
            </xsl:copy>
        </xsl:if>
    </xsl:template>
    <xsl:function name="s:expect">
        <xsl:param name='f'/>
        <xsl:param name='e'/>
        <xsl:value-of select="s:string(($f,'.extension.url'),'http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation')"/>
        <xsl:value-of select="s:code(($f,'.extension.valueCode'),upper-case($e),'')"/>
    </xsl:function>
    <xsl:function name="s:client">
        <xsl:param name="mode"/>
        <xsl:param name="op"/>
        <xsl:value-of select="if ($mode='client') then (if ($op/@client) then ($op/@client[1]) else (if ($op/@min = 0) then 'may' else $op/@expect[1])) else ($op/@expect[1])"/>
    </xsl:function>
    <xsl:function name="s:combo">
        <xsl:param name="f"/>
        <xsl:param name="r"/>
        <xsl:param name="v"/>
        <!-- xsl:value-of select="s:string(($f,'[',$r,']'),$v)"/ -->
        <xsl:value-of select="s:string(($f,'.url'),$r)"/>
        <xsl:value-of select="s:string(($f,'.valueString'),$v)"/>
    </xsl:function>
    <xsl:function name='s:comment'>
        <xsl:param name='c'/>
        <xsl:text>&#xA;// </xsl:text>
        <xsl:value-of select='$c'/>
        <xsl:text>&#xA;</xsl:text>
    </xsl:function>
    <xsl:function name='s:slice'>
        <xsl:param name='b'/>
        <xsl:param name='f'/>
        <xsl:param name='v'/>
        <!-- xsl:text>* </xsl:text>
        <xsl:value-of select="$b"/>
        <xsl:text> contains </xsl:text>
        <xsl:value-of select="string-join($v, ' and ')"/>
        <xsl:text>&#xA;</xsl:text>
        <xsl:text>* </xsl:text>
        <xsl:value-of select="$b"/>
        <xsl:text> ^slicing.discriminator.type = #pattern&#xA;* </xsl:text>
        <xsl:value-of select="$b"/>
        <xsl:text> ^slicing.discriminator.path = "</xsl:text>
        <xsl:value-of select="$f"/>
        <xsl:text>"&#xA;* </xsl:text>
        <xsl:value-of select="$b"/>
        <xsl:text> ^slicing.rules = #open&#xA;* </xsl:text>
        <xsl:value-of select="$b"/>
        <xsl:text> ^slicing.description = "Slice based on the </xsl:text>
        <xsl:value-of select="string-join(($b,$f),'.')"/>
        <xsl:text> pattern"&#xA;</xsl:text -->
    </xsl:function>
    <xsl:function name="s:where">
        <xsl:param name='e'/>
        <xsl:if test='$e/.. != $e/.'>
            <xsl:value-of select="s:where($e/..)"/>
            <xsl:text>/</xsl:text>
        </xsl:if>
        <xsl:value-of select="concat(local-name($e),'[',count($e/preceding-sibling::*[local-name()=local-name($e)])+1,']')"/>
    </xsl:function>
    <xsl:function name='s:optionlist'>
        <xsl:param name='options'/>
        <xsl:for-each select='tokenize($options,"\s+")'>
            <xsl:value-of select='$base/..//ig:option[current()=@id]/ig:name'/>
            <xsl:choose>
                <xsl:when test='position()=last()'>
                    <xsl:text>.</xsl:text>
                </xsl:when>
                <xsl:when test='last()=2 and position() = 1'>
                    <xsl:text> and the </xsl:text>
                </xsl:when>
                <xsl:when test='position()+1=last()'>
                    <xsl:text>, and the </xsl:text>
                </xsl:when>
                <xsl:otherwise>, the </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:function>
    <xsl:template name="rest-resource-capability">
        <xsl:param name="options"/><!-- Applicable options -->
        <xsl:param name="tx" select="ancestor-or-self::ig:transaction|.//ig:transaction"/>
        <xsl:param name="isActor" select="false()"/>
        <xsl:variable name='optionset' select='if (string-length($options)=0) then "" else concat("-",translate(normalize-space($options)," ","-"))'/>
        <xsl:variable name='optionlist' select='string-join(s:optionlist($options))'/>

        <xsl:variable name="fromActors" select='$tx//ig:message/@from'/>
        <xsl:variable name="toActors" select='$tx//ig:message/@to'/>
        <xsl:variable name="hasOperations" select="$tx//ig:operation/@resources"/>
        <xsl:for-each select="$base/..//ig:actor[(@id=$fromActors or @id=$toActors) and $hasOperations][not($isActor) or .=$isActor]">
            <xsl:variable name="actor" select="."/>
            <xsl:variable name="name">
                <xsl:value-of select="$actor/@id"/>
                <xsl:if test='not($isActor)'>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="translate($tx/ig:transaction/ig:name,' ','')"/>
                </xsl:if>
                <xsl:value-of select="$optionset"/>
            </xsl:variable>
            <xsl:variable name="desc">
                <xsl:choose>
                    <xsl:when test="$isActor and not($options)">
                        <xsl:value-of select="concat('Defines the requirements for the ', $actor/ig:name,'.')"/>
                    </xsl:when>
                    <xsl:when test="$isActor">
                        <xsl:value-of select="concat('Defines the additional requirements for the ', $actor/ig:name, ' implementing the ', $optionlist)"/>
                    </xsl:when>
                    <xsl:when test='not($options)'>
                        <xsl:value-of select="concat('Defines the requirements for the ', $actor/ig:name, ' implementing the ', $tx/ig:transaction/ig:name, ' transaction.')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('Defines the additional requirements for the ', $actor/ig:name, ' implementing the ', $tx/ig:transaction/ig:name, ' transaction with the ', $optionlist)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:if test='$tx//ig:message[$actor/@id=(@from, @to)]//ig:operation/@resources'>
	            <xsl:result-document href="../../CapabilityStatement-{$name}.fsh" method="text">
	                <xsl:value-of select="s:instance($name, 'CapabilityStatementWithSlices',$desc, 'SanerDefinitionContent', null)"/>
	                <xsl:value-of select="s:string('name',translate($name,'-','_'))"/>
	                <xsl:value-of select="s:string('title', substring-after($desc, 'for the '))"/>
	                <xsl:value-of select="s:string('date',current-dateTime())"/>
	                <xsl:value-of select="s:code('kind', 'requirements', null)"/>
	                <xsl:value-of select="s:string('description', $desc)"/>
	                <xsl:value-of select="s:code('format[0]', 'xml', null)"/>
	                <!-- xsl:value-of select="s:expect(('format[0]'), if ($mode='client') then ('may') else ('shall'))"/ -->
	                <xsl:value-of select="s:code('format[1]', 'json', null)"/>
	                <!-- xsl:value-of select="s:expect(('format[1]'), if ($mode='client') then ('may') else ('shall'))"/ -->
	                <xsl:value-of select="s:code('fhirVersion', '4.0.1', null)"/>
	                <xsl:value-of select="s:slice('rest','mode',('clientSlice 0..1','serverSlice 0..1'))"/>
	                <xsl:if test="$actor/@id = $fromActors">
	                    <xsl:call-template name='rest-resource-requirements'>
	                        <xsl:with-param name="tx" select="$tx"/>
	                        <xsl:with-param name="actor" select="$actor"/>
	                        <xsl:with-param name="mode">client</xsl:with-param>
	                    </xsl:call-template>
	                </xsl:if>
	                <xsl:if test="$actor/@id = $toActors">
	                    <xsl:call-template name='rest-resource-requirements'>
	                        <xsl:with-param name="tx" select="$tx"/>
	                        <xsl:with-param name="actor" select="$actor"/>
	                        <xsl:with-param name="mode">server</xsl:with-param>
	                        <xsl:with-param name="isActor" select="$isActor"/>
	                    </xsl:call-template>
	                </xsl:if>
	            </xsl:result-document>
	        </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name='rest-resource-requirements'>
        <xsl:param name="tx"/>
        <xsl:param name="actor"/>
        <xsl:param name="mode"/>
        <xsl:param name="isActor" select="false()"/>
        <xsl:variable name="index" select="concat($mode,'Slice')"/>
        <xsl:variable name='resourceNames'
            select="distinct-values(tokenize(string-join($tx//ig:message[$actor/@id=(if ($mode='client') then @from else @to)]//ig:operation/@resources,' '),'\s+'))"/>
        <xsl:value-of select="s:slice('rest','mode',('clientSlice 0..1','serverSlice 0..1'))"/>
        <xsl:variable name='resourceSlices'>
            <xsl:for-each select='$resourceNames'>
                <xsl:sequence select="concat(.,'0..1')"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:for-each select="$resourceNames">
            <xsl:variable name="r" select="."/>
            <xsl:variable name='res' select="concat('rest[',$index,'].resource[',$r,'Slice]')"/>

            <xsl:if test='position() = 1'>
                <xsl:text>&#xA;</xsl:text>
                <xsl:value-of select="s:code(('rest[',$index,'].mode'), $mode, '')"/>
                <xsl:value-of select="s:slice(concat('rest[',$index,'].resource'),'type', $resourceSlices)"/>
            </xsl:if>

            <xsl:variable name='operations' select='$tx//ig:message[$actor/@id=(if ($mode="client") then @from else @to)]//ig:operation[tokenize(@resources,"\s+")=$r]'/>
            <xsl:variable name='content'  select='$tx//ig:result//ig:content/@profiles'/>

            <xsl:text>&#xA;</xsl:text>
            <xsl:value-of select="s:code(($res,'.type'), $r, '')"/>
            <!-- xsl:value-of select="s:expect(($res), s:client($mode, $operations[1]))"/-->
            <xsl:for-each select="tokenize($content,'\s+')[ends-with(lower-case(.), lower-case($r))]">
                <xsl:variable name='url' select="if (contains(.,':')) then . else concat($base,'/StructureDefinition/',.)"/>
                <xsl:value-of select="s:string(($res,'.supportedProfile[',position()-1,']'),$url)"/>
            </xsl:for-each>
            <!-- Generate interactions -->
            <xsl:for-each select="distinct-values($operations/@name)[not(starts-with(.,'$'))]">
                <xsl:variable name='op' select="$operations[@name=current()]"/>
                <xsl:text>&#xA;</xsl:text>
                <xsl:value-of select="s:code(($res,'.interaction[',position()-1,'].code'),if (. = 'search') then 'search-type' else .,'')"/>
                <xsl:value-of select="s:expect(($res,'.interaction[',position()-1,']'), s:client($mode, $op[1]))"/>
            </xsl:for-each>
            <!-- Generate operations -->
            <xsl:for-each select="distinct-values($operations/@name)[starts-with(.,'$')]">
                <xsl:variable name='op' select="$operations[@name=current()]"/>
                <xsl:text>&#xA;</xsl:text>
                <xsl:value-of select="s:string(($res,'.operation[',position()-1,'].name'),substring($op[1]/@name,2))"/>
                <xsl:value-of select="s:string(($res,'.operation[',position()-1,'].definition'),
                    concat($base,'/OperationDefinition/',
                        translate($op[1]/ancestor-or-self::ig:transaction/ig:name,' ',''),'-',substring($op[1]/@name,2)))"/>
                <xsl:value-of select="s:string(($res,'.operation[',position()-1,'].documentation'),$op[1]/ig:name)"/>
                <!-- Expect not supported here, though it should be -->
                <!-- xsl:value-of select="s:expect(($res,'.operation[',position()-1,']'), s:client($mode, $op[1]))"/ -->
            </xsl:for-each>
            <xsl:if test='$isActor'>
                <xsl:call-template name="rest-operation-capability">
                    <xsl:with-param name="operations" select="$operations"/>
                    <xsl:with-param name="mode" select="$mode"/>
                </xsl:call-template>
            </xsl:if>
            <!-- Generate search parameters -->
            <xsl:for-each select='distinct-values($operations[@name="search"]//ig:parameter/@name)'>
                <xsl:variable name='op' select="$operations[@name='search']//ig:parameter[@name=current()]"/>
                <xsl:text>&#xA;</xsl:text>
                <xsl:value-of select="s:string(($res,'.searchParam[',position()-1,'].name'),.)"/>
                <xsl:value-of select="s:code(($res,'.searchParam[',position()-1,'].type'),$op[1]/@type,'')"/>
                <xsl:value-of select="s:expect(($res,'.searchParam[',position()-1,']'), s:client($mode, $op))"/>
            </xsl:for-each>
            <!-- Check for _include values -->
            <xsl:for-each select='tokenize(string-join($operations[@name="search"]/ancestor::ig:interaction//ig:parameter[@name="_include"]/@values, " "), "\s+")'>
                <xsl:variable name="op" select='$operations[@name="search"]/ancestor::ig:interaction//ig:parameter[@name="_include"][1]'/>
                <xsl:text>&#xA;</xsl:text>
                <xsl:value-of select="s:string(($res,'.searchInclude[',position()-1,']'),.)"/>
                <xsl:value-of select="s:expect(($res,'.searchInclude[',position()-1,']'), s:client($mode, $op))"/>
            </xsl:for-each>
            <!-- Generate search operations based on groups -->
            <xsl:variable name='groups' select='$operations[@name="search"]/ig:group'/>
            <xsl:for-each select='$groups'>
                <!--
                            Position is the number of preceding groups having
                                ig:parameter[@min!=0] +
                                number of parameters in groups not having ig:parameter[@min!=0]
                        -->
                <xsl:variable name="cur" select="position()"/>
                <xsl:variable name='pos' select='count($groups[position() &lt; $cur][ig:parameter/@min != 0]) +
                    count($groups[position() &lt; $cur][not(ig:parameter/@min != 0)]/ig:parameter)'/>
                <xsl:choose>
                    <xsl:when test='count(ig:parameter[@min!=0])=0'>
                        <xsl:for-each select='ig:parameter'>
                            <xsl:variable name='ext' select='concat($res,".extension[", $pos + position() - 1, "]")'/>
                            <xsl:text>&#xA;</xsl:text>
                            <xsl:value-of select="s:string(($ext,'.url'),
                                'http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination')"/>
                            <xsl:value-of select="s:combo(($ext,'.extension[0]'),'required', @name)"/>
                            <xsl:for-each select="following-sibling::ig:parameter">
                                <xsl:value-of select="s:combo(($ext,'.extension[',position(),']'), 'optional', @name)"/>
                            </xsl:for-each>
                        </xsl:for-each>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:variable name='ext' select='concat($res,".extension[", $pos, "]")'/>
                        <xsl:text>&#xA;</xsl:text>
                        <xsl:value-of select="s:string(($ext,'.url'),
                            'http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination')"/>
                        <xsl:for-each select="ig:parameter[@min!=0]">
                            <xsl:value-of select="s:combo(($ext,'.extension[',position()-1,']'),'required',@name)"/>
                        </xsl:for-each>
                        <xsl:variable name='offset' select="count(ig:parameter[@min!=0])-1"/>
                        <xsl:for-each select="ig:parameter[@min=0]">
                            <xsl:value-of select="s:combo(($ext,'.extension[',position() + $offset,']'), 'optional', @name)"/>
                        </xsl:for-each>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name='rest-operation-capability'>
        <xsl:param name='operations'/>
        <xsl:param name='mode'/>
        <xsl:for-each select="$operations[starts-with(@name,'$') and $mode='server']">
            <xsl:variable name='op' select="."/>
            <xsl:variable name='name'
                select="concat(translate($op/ancestor-or-self::ig:transaction/ig:name,' ',''),'-',
                substring($op/@name,2))"/>
            <xsl:result-document href="../../OperationDefinition-{$name}.fsh" method="text">
                <xsl:value-of select="s:instance($name, 'OperationDefinition', $op/ig:description, 'SanerDefinitionContent', '')"/>
                <xsl:text>&#xA;</xsl:text>
                <xsl:value-of select="s:code('status','draft','')"/>
                <xsl:value-of select="s:code('kind','operation','')"/>
                <xsl:value-of select="s:code('code',substring($op/@name,2),'')"/>
                <xsl:for-each select="tokenize($op/@resources,'\s+')">
                    <xsl:value-of select="s:code(('resource[',position()-1,']'),.,'')"/>
                </xsl:for-each>
                <xsl:for-each select="('system','type','instance')">
                    <xsl:value-of select="s:name(.,contains($op/@invoke,.))"/>
                </xsl:for-each>
                <xsl:value-of select="s:string('name',translate($op/ig:name,' ',''))"/>
                <xsl:value-of select="s:string('title',$op/ig:name)"/>
                <xsl:value-of select="s:string('description',$op/ig:description)"/>
                <xsl:value-of select="s:string('url',concat($base,'/OperationDefinition/',
                    translate($op/ancestor-or-self::ig:transaction/ig:name,' ',''),'-',substring($op[1]/@name,2)))"/>
                <xsl:for-each select="$op//ig:parameter">
                    <xsl:sort select="@use"/>
                    <xsl:sort select="@name"/>
                    <xsl:text>&#xA;</xsl:text>
                    <xsl:variable name='param' select="concat('parameter[',position()-1,']')"/>
                    <xsl:value-of select="s:code(($param,'.name'),@name,'')"/>
                    <xsl:value-of select="s:code(($param,'.use'), if (not(@use)) then 'in' else @use,'')"/>
                    <xsl:value-of select="s:name(($param,'.min'), @min)"/>
                    <xsl:value-of select="s:string(($param,'.max'), @max)"/>
                    <xsl:if test='ig:description'>
                        <xsl:value-of select="s:string(($param,'.documentation'),ig:description)"/>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="lower-case(substring(@type,1))=substring(@type,1)">
                            <xsl:value-of select="s:code(($param,'.searchType'),@type,'')"/>
                            <xsl:value-of select="s:code(($param,'.type'),'string','')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="s:code(($param,'.type'),@type,'')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="rest-resource-capability-link">
        <xsl:param name="mode"/><!-- client or server -->
        <xsl:param name="options"/><!-- Applicable options -->
        <xsl:param name="isActor" select="false()"/>
        <xsl:param name='tx' select='ancestor-or-self::ig:transaction|.//ig:transaction'/>
        <xsl:variable name='optionset' select='if (string-length($options)=0) then "" else concat("-",translate(normalize-space($options)," ","-"))'/>
        <xsl:variable name='optionlist' select='string-join(s:optionlist($options))'/>

        <xsl:variable name="fromActors" select='$tx//ig:message/@from'/>
        <xsl:variable name="toActors" select='$tx//ig:message/@to'/>
        <xsl:variable name="hasOperations" select="$tx//ig:operation/@resources"/>


        <xsl:for-each select="$base/..//ig:actor[(@id=$fromActors or @id=$toActors) and $hasOperations][not($isActor) or .=$isActor]">
            <xsl:variable name="actor" select="."/>
            <xsl:variable name="name">
                <xsl:value-of select="$actor/@id"/>
                <xsl:if test='not($isActor)'>
                    <xsl:text>-</xsl:text>
                    <xsl:value-of select="translate($tx/ig:transaction/ig:name,' ','')"/>
                </xsl:if>
                <xsl:value-of select="$optionset"/>
            </xsl:variable>
            <xsl:variable name="desc">
                <xsl:choose>
                    <xsl:when test="$isActor and not($options)">
                        <xsl:value-of select="concat('Defines the requirements for the ', $actor/ig:name,'.')"/>
                    </xsl:when>
                    <xsl:when test="$isActor">
                        <xsl:value-of select="concat('Defines the additional requirements for the ', $actor/ig:name, ' implementing the ', $optionlist)"/>
                    </xsl:when>
                    <xsl:when test='not($options)'>
                        <xsl:value-of select="concat('Defines the requirements for the ', $actor/ig:name, ' implementing the ', $tx/ig:transaction/ig:name, ' transaction.')"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="concat('Defines the additional requirements for the ', $actor/ig:name, ' implementing the ', $tx/ig:transaction/ig:name, ' transaction with the ', $optionlist)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:text>&#xA;* [CapabilityStatement-</xsl:text>
            <xsl:value-of select='$name'/>
            <xsl:text>](CapabilityStatement-</xsl:text>
            <xsl:value-of select='$name'/>
            <xsl:text>.html) </xsl:text>
            <xsl:value-of select="$desc"/>
        </xsl:for-each>
     </xsl:template>

</xsl:stylesheet>